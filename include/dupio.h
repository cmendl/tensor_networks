/// \file dupio.h
/// \brief Header file duplicating standard output to a log file

#ifndef DUPIO_H
#define DUPIO_H

#include <stdio.h>


extern FILE *fd_log;

void duprintf(char const *fmt, ...);



#endif
