/// \file mpo.h
/// \brief Matrix product operators (MPO)

#ifndef MPO_H
#define MPO_H

#include "tensor.h"
#include "bond_info.h"


//________________________________________________________________________________________________________________________
///
/// \brief Matrix product operator (MPO) in one dimension
///
typedef struct
{
	tensor_t *A;    //!< tensors associated with sites, with dimensions d[0] x d[1] x D_i x D_{i+1}; array of length L
	size_t d[2];    //!< physical dimensions of each site
	int L;          //!< lattice size
}
mpo_t;


void AllocateMPO(const int L, const size_t d[2], const size_t *D, mpo_t *restrict mpo);

void DeleteMPO(mpo_t *mpo);


void CopyMPO(const mpo_t *restrict src, mpo_t *restrict dst);


void CreateIdentityMPO(const int L, const size_t d, mpo_t *restrict mpo);


//________________________________________________________________________________________________________________________
//


void ConjugateMPO(mpo_t *restrict mpo);

void TransposeMPO(const mpo_t *restrict mpo, mpo_t *restrict mpoT);

void ConjugateTransposeMPO(const mpo_t *restrict mpo, mpo_t *restrict mpoH);


//________________________________________________________________________________________________________________________
//


void MergeMPOTensorPair(const tensor_t *restrict A0, const tensor_t *restrict A1, tensor_t *restrict A);

void MergeMPOFull(const mpo_t *restrict mpo, tensor_t *restrict A);


//________________________________________________________________________________________________________________________
//


MKL_Complex16 MPOTrace(const mpo_t *restrict X);


void MPOTraceProductTensorReduce(const tensor_t *restrict A, const tensor_t *restrict B, tensor_t *restrict R);

MKL_Complex16 MPOTraceProduct(const mpo_t *restrict X, const mpo_t *restrict Y);

double MPOFrobeniusNorm(const mpo_t *X);


//________________________________________________________________________________________________________________________
//


MKL_Complex16 MPOTraceQuadProduct(const mpo_t *restrict X, const mpo_t *restrict Y, const mpo_t *restrict Z, const mpo_t *restrict W);


//________________________________________________________________________________________________________________________
//


void ApplySingleSiteTopOperator(tensor_t *restrict A, const tensor_t *restrict opT);

void ApplySingleSiteBottomOperator(tensor_t *restrict A, const tensor_t *restrict opB);


trunc_info_t ApplyTwoSiteOperator(tensor_t *restrict A0, tensor_t *restrict A1, const tensor_t *restrict opT, const tensor_t *restrict opB, const svd_distr_t svd_distr, const double tol, const size_t maxD);

trunc_info_t ApplyTwoSiteTopOperator(tensor_t *restrict A0, tensor_t *restrict A1, const tensor_t *restrict opT, const svd_distr_t svd_distr, const double tol, const size_t maxD);

trunc_info_t ApplyTwoSiteBottomOperator(tensor_t *restrict A0, tensor_t *restrict A1, const tensor_t *restrict opB, const svd_distr_t svd_distr, const double tol, const size_t maxD);


//________________________________________________________________________________________________________________________
//


trunc_info_t OrthonormalizeMPOTensorPair(tensor_t *restrict A0, tensor_t *restrict A1, const svd_distr_t svd_distr, const double tol, const size_t maxD);

trunc_info_t OrthonormalizeMPO(const double tol, const size_t maxD, mpo_t *restrict mpo);



#endif
