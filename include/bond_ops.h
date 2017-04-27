/// \file bond_ops.h
/// \brief Auxiliary data structures and functions concerning virtual bonds (taking quantum numbers into account)

#ifndef BOND_OPS_H
#define BOND_OPS_H

#include "tensor.h"
#include "qnumber.h"


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


//________________________________________________________________________________________________________________________
///
/// \brief Bond operation parameters
///
typedef struct
{
	double tol;         //!< tolerance (truncation weight)
	size_t maxD;        //!< largest allowed virtual bond dimension
	bool renormalize;   //!< whether to renormalize the retained singular values
}
bond_op_params_t;


//________________________________________________________________________________________________________________________
//


double VonNeumannEntropy(const size_t n, const double *restrict lambda);


//________________________________________________________________________________________________________________________
//


void QRDecomposition(const tensor_t *restrict A, const qnumber_t *restrict q0, const qnumber_t *restrict q1, tensor_t *restrict Q, tensor_t *restrict R, qnumber_t *restrict *qinterm);


//________________________________________________________________________________________________________________________
//


trunc_info_t TruncatedBondIndices(const size_t n, const double *restrict sigma, const double tol, const size_t maxD, size_t *restrict *indtr, size_t *restrict ntr);


trunc_info_t SplitMatrix(const tensor_t *restrict A, const qnumber_t *restrict q0, const qnumber_t *restrict q1,
	const svd_distr_t svd_distr, const bond_op_params_t *restrict params,
	tensor_t *restrict A0, tensor_t *restrict A1, qnumber_t *restrict *qbond);


trunc_info_t CompressVirtualBonds(tensor_t *restrict A0, tensor_t *restrict A1,
	const qnumber_t *restrict q0, const qnumber_t *restrict q1, const qnumber_t *restrict q2,
	const svd_distr_t svd_distr, const bond_op_params_t *restrict params, qnumber_t *restrict *q1compr);



#endif
