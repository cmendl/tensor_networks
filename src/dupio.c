/// \file dupio.c
/// \brief Duplicate standard output to a log file

#include "dupio.h"
#include <stdarg.h>


/// \brief File descriptor of log file
FILE *fd_log = NULL;


//________________________________________________________________________________________________________________________
///
/// \brief Duplicate printf(): print both to standard output and log file
///
void duprintf(char const *fmt, ...)
{
	va_list ap;

	// standard printf()
	va_start(ap, fmt);
	vprintf(fmt, ap);
	fflush(stdout);
	va_end(ap);

	// write same output to file specified by 'fd_log'
	if (fd_log != NULL)
	{
		va_start(ap, fmt);
		vfprintf(fd_log, fmt, ap);
		fflush(fd_log);
		va_end(ap);
	}
}
