/// \file mpo.h
/// \brief Matrix product operators (MPO)

#ifndef MPO_H
#define MPO_H

#include "tensor.h"
#include "bond_ops.h"


//________________________________________________________________________________________________________________________
///
/// \brief Matrix product operator (MPO) in one dimension
///
/// Set all quantum numbers to zero to effectively disable quantum number conservation
///
typedef struct
{
	tensor_t *A;        //!< tensors associated with sites, with dimensions d[0] x d[1] x D_i x D_{i+1}; array of length L
	size_t d[2];        //!< physical dimensions of each site
	qnumber_t  *qd[2];  //!< physical quantum numbers at each site
	qnumber_t **qD;     //!< quantum numbers of virtual bonds; array of size L+1
	int L;              //!< lattice size
}
mpo_t;


void AllocateMPO(const int L, const size_t d[2], const size_t *D, mpo_t *restrict mpo);

void DeleteMPO(mpo_t *mpo);


void CopyMPO(const mpo_t *restrict src, mpo_t *restrict dst);


void CreateIdentityMPO(const int L, const size_t d, mpo_t *restrict mpo);


//________________________________________________________________________________________________________________________
///
/// \brief Dimension of i-th virtual bond
///
static inline size_t MPOBondDim(const mpo_t *restrict mpo, const int i)
{
	const int L = mpo->L;

	assert(0 <= i && i <= L);

	return (i < L ? mpo->A[i].dim[2] : mpo->A[L-1].dim[3]);
}

//________________________________________________________________________________________________________________________
///
/// \brief Extract all virtual bond dimensions
///
static inline void MPOBondDims(const mpo_t *restrict mpo, size_t *D)
{
	const int L = mpo->L;

	int i;
	for (i = 0; i < L; i++)
	{
		assert(mpo->A[i].ndim == 4);
		assert(i < L - 1 ? mpo->A[i].dim[3] == mpo->A[i+1].dim[2] : true);
		D[i] = mpo->A[i].dim[2];
	}
	D[L] = mpo->A[L-1].dim[3];
}


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


void MPOAdd(const mpo_t *restrict X, const mpo_t *restrict Y, mpo_t *restrict Z);


//________________________________________________________________________________________________________________________
//


trunc_info_t SplitMPOTensor(const tensor_t *restrict A, const qnumber_t *restrict qA0, const qnumber_t *restrict qA2,
	const size_t d0, const size_t d1, const qnumber_t *restrict qd0, const qnumber_t *restrict qd1,
	const svd_distr_t svd_distr, const double tol, const size_t maxD, const bool renormalize,
	tensor_t *restrict A0, tensor_t *restrict A1, qnumber_t *restrict *qbond);


trunc_info_t CompressMPOTensors(tensor_t *restrict A0, tensor_t *restrict A1,
	const qnumber_t *restrict qA0, const qnumber_t *restrict qA1, const qnumber_t *restrict qA2,
	const qnumber_t *restrict qd0, const qnumber_t *restrict qd1,
	const svd_distr_t svd_distr, const double tol, const size_t maxD, const bool renormalize,
	qnumber_t *restrict *qA1compr);


//________________________________________________________________________________________________________________________
//


trunc_info_t ComposeMPOTensorPairs(
	const tensor_t *restrict A0, const tensor_t *restrict A1, const qnumber_t *restrict qA0, const qnumber_t *restrict qA1, const qnumber_t *restrict qA2,
	const tensor_t *restrict B0, const tensor_t *restrict B1, const qnumber_t *restrict qB0, const qnumber_t *restrict qB1, const qnumber_t *restrict qB2,
	const qnumber_t *restrict qd0, const qnumber_t *restrict qd1,
	const svd_distr_t svd_distr, const double tol, const size_t maxD, const bool renormalize,
	tensor_t *restrict R0, tensor_t *restrict R1, qnumber_t *restrict *qR0, qnumber_t *restrict *qR1, qnumber_t *restrict *qR2);


void MPOComposition(const mpo_t *restrict X, const mpo_t *restrict Y, mpo_t *restrict ret);


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
