/// \file sim_params.c
/// \brief Parse parameter text file containing simulation parameters

#include "sim_params.h"
#include "dupio.h"
#include <string.h>


//_______________________________________________________________________________________________________________________
///
/// \brief Parse parameter text file containing simulation parameters; parameters not set in the file remain unchanged
///
int ParseParameterFile(const char *filename, sim_params_t *params)
{
	FILE *fd = fopen(filename, "r");
	if (fd == NULL) {
		duprintf("Cannot open parameter file '%s'.\n", filename);
		return -1;
	}

	// read file line by line
	char line[1024];
	while (fgets(line, sizeof(line), fd) != NULL)
	{
		// skip text after a comment character
		char *csharp = strchr(line, '#');
		if (csharp != NULL)
		{
			// replace '#' by '\0';
			*csharp = '\0';
		}

		// delimiter characters
		const char *delim = " =:\t\r\n";

		// parameter name
		char *name = strtok(line, delim);
		if (name == NULL) {
			continue;
		}

		// parameter value
		char *value = strtok(NULL, delim);
		if (value == NULL)
		{
			duprintf("Missing value for parameter '%s' in file '%s'.\n", name, filename);
			return -1;
		}

		if (strcmp(name, "L") == 0) {
			params->L = atoi(value);
		}
		else if (strcmp(name, "d") == 0) {
			params->d = atoi(value);
		}
		else if (strcmp(name, "t") == 0) {
			params->t = atof(value);
		}
		else if (strcmp(name, "U") == 0) {
			params->U = atof(value);
		}
		else if (strcmp(name, "mu") == 0) {
			params->mu = atof(value);
		}
		else if (strcmp(name, "Jx") == 0) {
			params->Jx = atof(value);
		}
		else if (strcmp(name, "Jy") == 0) {
			params->Jy = atof(value);
		}
		else if (strcmp(name, "Jz") == 0) {
			params->Jz = atof(value);
		}
		else if (strcmp(name, "J") == 0) {
			params->J = atof(value);
		}
		else if (strcmp(name, "hext") == 0) {
			params->hext = atof(value);
		}
		else if (strcmp(name, "gext") == 0) {
			params->gext = atof(value);
		}
		else if (strcmp(name, "beta") == 0) {
			params->beta = atof(value);
		}
		else if (strcmp(name, "dbeta") == 0) {
			params->dbeta = atof(value);
		}
		else if (strcmp(name, "tmax") == 0) {
			params->tmax = atof(value);
		}
		else if (strcmp(name, "dt") == 0) {
			params->dt = atof(value);
		}
		else if (strcmp(name, "tol") == 0) {
			params->tol = atof(value);
		}
		else if (strcmp(name, "maxD") == 0) {
			params->maxD = atoi(value);
		}
		else if (strcmp(name, "save_tensors") == 0)
		{
			if (strcmp(value, "true") == 0) {
				params->save_tensors = true;
			}
			else if (strcmp(value, "false") == 0) {
				params->save_tensors = false;
			}
			else {
				duprintf("Warning: unrecognized value '%s' for parameter 'save_tensors' in file '%s', must be true or false.\n", value, filename);
			}
		}
		else {
			duprintf("Warning: unrecognized parameter '%s' in file '%s'.\n", name, filename);
		}
	}

	fclose(fd);

	return 0;
}
