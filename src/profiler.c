/// \file profiler.c
/// \brief Performance profiler

#ifdef PROFILER_ENABLE

#include "profiler.h"
#include "util.h"
#include "dupio.h"
#ifdef _OPENMP
#include <omp.h>
#endif
#include <memory.h>


//________________________________________________________________________________________________________________________
///
/// \brief Corresponding tag strings
///
static const char *tag_strings[NUM_PROFILE_TAGS] = {
	"SVD basic",
	"SVD standard",
	"QR decomposition",
	"split matrix",
	"split reassemble",
	"allocate tensor",
	"transpose tensor",
	"ctranspose tensor",
	"multiply tensor",
	"split MPO tensor"
};


//________________________________________________________________________________________________________________________
///
/// \brief Initialize profiler
///
void InitProfiler(profiler_t *profiler)
{
	memset(profiler->table, 0, sizeof(profiler->table));
	profiler->main_start_tick = GetTimeTicks();
}


//________________________________________________________________________________________________________________________
///
/// \brief Start a profiling block
///
void StartProfilingBlock(profiler_t *profiler, const profile_tag_t tag)
{
	#ifdef _OPENMP

	int thread_num = omp_get_thread_num();
	if (thread_num >= MAX_PROFILE_THREADS)
	{
		duprintf("Warning: in 'StartProfilingBlock()': capping actual thread number %i to %i\n", thread_num, MAX_PROFILE_THREADS - 1);
		thread_num = MAX_PROFILE_THREADS - 1;
	}

	#pragma omp critical(profiler_critical)
	{
		profile_entry_t *p = &profiler->table[tag][thread_num];

		if (p->start_tick == 0)
		{
			p->ncalls++;
			p->start_tick = GetTimeTicks();
		}
		else
		{
			duprintf("Warning: in 'StartProfilingBlock()': nested function call for profiling tag '%s' and thread %i\n", tag_strings[tag], thread_num);
		}
	}

	#else

	profile_entry_t *p = &profiler->table[tag];
	if (p->start_tick == 0)
	{
		p->ncalls++;
		p->start_tick = GetTimeTicks();
	}
	else
	{
		duprintf("Warning: in 'StartProfilingBlock()': nested function call for profiling tag '%s'\n", tag_strings[tag]);
	}

	#endif
}


//________________________________________________________________________________________________________________________
///
/// \brief End a profiling block
///
void EndProfilingBlock(profiler_t *profiler, const profile_tag_t tag)
{
	#ifdef _OPENMP

	int thread_num = omp_get_thread_num();
	if (thread_num >= MAX_PROFILE_THREADS)
	{
		duprintf("Warning: in 'EndProfilingBlock()': capping actual thread number %i to %i\n", thread_num, MAX_PROFILE_THREADS - 1);
		thread_num = MAX_PROFILE_THREADS - 1;
	}

	#pragma omp critical(profiler_critical)
	{
		profile_entry_t *p = &profiler->table[tag][thread_num];

		if (p->start_tick != 0)
		{
			p->total += GetTimeTicks() - p->start_tick;
			p->start_tick = 0;  // reset to 0 to indicate completion of a profiling block
		}
		else
		{
			duprintf("Warning: in 'EndProfilingBlock()': profile entry inactive for profiling tag '%s' and thread %i; EndProfilingBlock() called before StartProfilingBlock()?\n", tag_strings[tag], thread_num);
		}
	}

	#else

	profile_entry_t *p = &profiler->table[tag];

	if (p->start_tick != 0)
	{
		p->total += GetTimeTicks() - p->start_tick;
		p->start_tick = 0;  // reset to 0 to indicate completion of a profiling block
	}
	else
	{
		duprintf("Warning: in 'EndProfilingBlock()': profile entry inactive for profiling tag '%s'; EndProfilingBlock() called before StartProfilingBlock()?\n", tag_strings[tag]);
	}

	#endif  // _OPENMP
}


//________________________________________________________________________________________________________________________
///
/// \brief Extended profile entry (temporary structure used for report)
///
typedef struct
{
	int64_t total;      //!< total time ticks
	int ncalls;         //!< number of calls
	profile_tag_t tag;  //!< profile tag
	#ifdef _OPENMP
	int thread_num;     //!< thread number
	#endif
}
profile_entry_ext_t;


//________________________________________________________________________________________________________________________
///
/// \brief Sort profile entries by total time
///
// 
static int CompareProfileEntries(const void *a, const void *b)
{
	const profile_entry_ext_t *pa = (profile_entry_ext_t *)a;
	const profile_entry_ext_t *pb = (profile_entry_ext_t *)b;
	int64_t diff = pb->total - pa->total;
	return (diff > 0) ? 1 : ((diff < 0) ? -1 : 0);
}


//________________________________________________________________________________________________________________________
///
/// \brief Print profiler report
///
void PrintProfilerReport(const profiler_t *profiler)
{
	// get total wall time
	const int64_t main_total = GetTimeTicks() - profiler->main_start_tick;

	// get the tick resolution
	const double ticks_per_sec = (double)GetTimeResolution();

	#ifdef _OPENMP

	// collect extended profile entries and sort by clock time
	profile_entry_ext_t entries[NUM_PROFILE_TAGS * MAX_PROFILE_THREADS];
	int n = 0;
	profile_tag_t tag;
	for (tag = (profile_tag_t)0; tag < NUM_PROFILE_TAGS; tag++)
	{
		int j;
		for (j = 0; j < MAX_PROFILE_THREADS; j++)
		{
			if (profiler->table[tag][j].ncalls > 0)
			{
				if (profiler->table[tag][j].start_tick != 0)
				{
					duprintf("Warning: in 'PrintProfilerReport()': start_tick non-zero for tag '%s' and thread number %i\n", tag_strings[tag], j);
				}
				entries[n].total  = profiler->table[tag][j].total;
				entries[n].ncalls = profiler->table[tag][j].ncalls;
				entries[n].tag = tag;
				entries[n].thread_num = j;
				n++;
			}
		}
	}
	qsort(entries, n, sizeof(profile_entry_ext_t), CompareProfileEntries);

	// print report
	duprintf("_______________________________________________________________________________\n");
	duprintf("Profiling report:\n");
	duprintf("%-20s%-7s%-8s%-10s%s\n", "name", "thread", "ncalls", "% of wall", "time per call (us)");
	int i;
	for (i = 0; i < n; i++)
	{
		duprintf("%-20s%-7d%-8d%-10g%-g\n",
				tag_strings[entries[i].tag],
				entries[i].thread_num,
				entries[i].ncalls,
				(100.0 * entries[i].total) / main_total,
				entries[i].total / (ticks_per_sec / 1000000.0 * entries[i].ncalls));
	}
	duprintf("\n");
	duprintf("Wall clock time: %g seconds\n", main_total / ticks_per_sec);
	duprintf("_______________________________________________________________________________\n");

	#else   // _OPENMP

	// collect extended profile entries and sort by clock time
	profile_entry_ext_t entries[NUM_PROFILE_TAGS];
	int n = 0;
	profile_tag_t tag;
	for (tag = (profile_tag_t)0; tag < NUM_PROFILE_TAGS; tag++)
	{
		if (profiler->table[tag].ncalls > 0)
		{
			if (profiler->table[tag].start_tick != 0)
			{
				duprintf("Warning: in 'PrintProfilerReport()': start_tick non-zero for tag '%s'\n", tag_strings[tag]);
			}
			entries[n].total  = profiler->table[tag].total;
			entries[n].ncalls = profiler->table[tag].ncalls;
			entries[n].tag = tag;
			n++;
		}
	}
	qsort(entries, n, sizeof(profile_entry_ext_t), CompareProfileEntries);

	// print report
	duprintf("_______________________________________________________________________________\n");
	duprintf("Profiling report:\n");
	duprintf("%-20s%-8s%-10s%s\n", "name", "ncalls", "% of wall", "time per call (us)");
	int i;
	for (i = 0; i < n; i++)
	{
		duprintf("%-20s%-8d%-10g%-g\n",
			tag_strings[entries[i].tag],
			entries[i].ncalls,
			(100.0 * entries[i].total) / main_total,
			entries[i].total / (ticks_per_sec / 1000000.0 * entries[i].ncalls));
	}
	duprintf("\n");
	duprintf("Wall clock time: %g seconds\n", main_total / ticks_per_sec);
	duprintf("_______________________________________________________________________________\n");

	#endif
}


/// \brief Global standard profiler
profiler_t std_profiler;


#endif  // PROFILER_ENABLE
