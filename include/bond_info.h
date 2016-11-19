/// \file bond_info.h
/// \brief Auxiliary data structures and functions concerning virtual bonds

#ifndef BOND_INFO_H
#define BOND_INFO_H

#include <stdlib.h>


//________________________________________________________________________________________________________________________
///
/// \brief Enumeration type controlling the distribution of singular values to the left or right site
///
typedef enum
{
	SVD_DISTR_LEFT  = 0,    //!< distribute singular values to the left tensor
	SVD_DISTR_RIGHT = 1,    //!< distribute singular values to the right tensor
	SVD_DISTR_SQRT  = 2,    //!< distribute square root of singular values both to the left and right tensor
	SVD_DISTR_NUM   = 3     //!< number of distribution modes
}
svd_distr_t;


//________________________________________________________________________________________________________________________
///
/// \brief Singular value truncation information relevant for two-site MPS and MPO operations
///
typedef struct
{
	double nsigma;      //!< norm of the retained singular values
	double entropy;     //!< von Neumann entropy
	double tol_eff;     //!< tolerance (truncation weight), can be larger than input tolerance due to maximum bond dimension
}
trunc_info_t;


double VonNeumannEntropy(const size_t n, const double *restrict lambda);



#endif
