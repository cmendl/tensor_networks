/// \file mps.h
/// \brief Matrix product state (MPS)

#ifndef MPS_H
#define MPS_H

#include "tensor.h"
#include "bond_ops.h"


//________________________________________________________________________________________________________________________
///
/// \brief Matrix product state (MPS) in one dimension
///
/// Set all quantum numbers to zero to effectively disable quantum number conservation
///
typedef struct
{
	tensor_t *A;        //!< tensors associated with sites, with dimensions d x D_i x D_{i+1}; array of length L
	size_t d;           //!< physical dimension of each site
	qnumber_t  *qd;     //!< physical quantum numbers at each site
	qnumber_t **qD;     //!< quantum numbers of virtual bonds; array of size L+1
	int L;              //!< lattice size
}
mps_t;


void AllocateMPS(const int L, const size_t d, const size_t *D, mps_t *restrict mps);

void DeleteMPS(mps_t *restrict mps);


void CopyMPS(const mps_t *restrict src, mps_t *restrict dst);


//________________________________________________________________________________________________________________________
///
/// \brief Dimension of i-th virtual bond
///
static inline size_t MPSBondDim(const mps_t *restrict mps, const int i)
{
	const int L = mps->L;

	assert(0 <= i && i <= L);

	return (i < L ? mps->A[i].dim[1] : mps->A[L-1].dim[2]);
}

//________________________________________________________________________________________________________________________
///
/// \brief Extract all virtual bond dimensions
///
static inline void MPSBondDims(const mps_t *restrict mps, size_t *D)
{
	const int L = mps->L;

	int i;
	for (i = 0; i < L; i++)
	{
		assert(mps->A[i].ndim == 3);
		assert(i < L - 1 ? mps->A[i].dim[2] == mps->A[i+1].dim[1] : true);
		D[i] = mps->A[i].dim[1];
	}
	D[L] = mps->A[L-1].dim[2];
}


//________________________________________________________________________________________________________________________
//


void MPSUnitaryLeftProjection(tensor_t *restrict A, tensor_t *restrict Anext);

void MPSUnitaryRightProjection(tensor_t *restrict A, tensor_t *restrict Aprev);


//________________________________________________________________________________________________________________________
//


void MergeMPSTensorPair(const tensor_t *restrict A0, const tensor_t *restrict A1, tensor_t *restrict A);

void MergeMPSFull(const mps_t *restrict mps, tensor_t *restrict A);


//________________________________________________________________________________________________________________________
//


trunc_info_t SplitMPSTensor(const tensor_t *restrict A, const qnumber_t *restrict qA0, const qnumber_t *restrict qA2,
	const size_t d0, const size_t d1, const qnumber_t *restrict qd0, const qnumber_t *restrict qd1,
	const svd_distr_t svd_distr, const bond_op_params_t *restrict params,
	tensor_t *restrict A0, tensor_t *restrict A1, qnumber_t *restrict *qbond);


trunc_info_t CompressMPSTensors(tensor_t *restrict A0, tensor_t *restrict A1,
	const qnumber_t *restrict qA0, const qnumber_t *restrict qA1, const qnumber_t *restrict qA2,
	const qnumber_t *restrict qd0, const qnumber_t *restrict qd1,
	const svd_distr_t svd_distr, const bond_op_params_t *restrict params,
	qnumber_t *restrict *qA1compr);


//________________________________________________________________________________________________________________________
//


void ContractionStepLeft(const tensor_t *restrict A, const tensor_t *restrict L, tensor_t *restrict Lnext);

void ContractionOperatorStepLeft(const tensor_t *restrict A, const tensor_t *restrict W, const tensor_t *restrict L, tensor_t *restrict Lnext);


void ContractionStepRight(const tensor_t *restrict A, const tensor_t *restrict R, tensor_t *restrict Rnext);

void ContractionOperatorStepRight(const tensor_t *restrict A, const tensor_t *restrict W, const tensor_t *restrict R, tensor_t *restrict Rnext);


//________________________________________________________________________________________________________________________
//


double CalculateMPSNorm(const mps_t *restrict mps);



#endif
