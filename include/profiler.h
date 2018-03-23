/// \file profiler.h
/// \brief Performance profiler

#ifndef PROFILER_H
#define PROFILER_H

#ifdef PROFILER_ENABLE

#include <stdint.h>


//________________________________________________________________________________________________________________________
///
/// \brief Profile entry
///
typedef struct
{
	int64_t start_tick; //!< start tick for currently active block
	int64_t total;      //!< total time ticks
	int ncalls;         //!< number of calls
}
profile_entry_t;


//________________________________________________________________________________________________________________________
///
/// \brief Profile tags
///
/// (Keep synchronized with tag strings in profiler.c)
///
typedef enum
{
	PROFILE_SVD_BASIC = 0,
	PROFILE_SVD_STANDARD,
	PROFILE_QR,
	PROFILE_SPLIT_MATRIX,
	PROFILE_SPLIT_REASSEMBLE,
	PROFILE_ALLOCATE_TENSOR,
	PROFILE_TRANSPOSE_TENSOR,
	PROFILE_CTRANSPOSE_TENSOR,
	PROFILE_MULTIPLY_TENSOR,
	PROFILE_SPLIT_MPO_TENSOR,
	NUM_PROFILE_TAGS
}
profile_tag_t;


//________________________________________________________________________________________________________________________
//


#ifdef _OPENMP
#define MAX_PROFILE_THREADS 128
#endif


//________________________________________________________________________________________________________________________
///
/// \brief Basic performance profiler (based on code blocks and wall time recording)
///
typedef struct
{
	#ifdef _OPENMP
	profile_entry_t table[NUM_PROFILE_TAGS][MAX_PROFILE_THREADS];       //!< table of profile entries
	#else
	profile_entry_t table[NUM_PROFILE_TAGS];                            //!< table of profile entries
	#endif
	int64_t main_start_tick;                                            //!< program start tick for total wall time calculation
}
profiler_t;


void InitProfiler(profiler_t *profiler);

void StartProfilingBlock(profiler_t *profiler, const profile_tag_t tag);

void EndProfilingBlock(profiler_t *profiler, const profile_tag_t tag);

void PrintProfilerReport(const profiler_t *profiler);


extern profiler_t std_profiler;


#else


// dummy function declarations
#define InitProfiler(p)
#define StartProfilingBlock(p, t)
#define EndProfilingBlock(p, t)
#define PrintProfilerReport(p)


#endif  // PROFILER_ENABLE



#endif
