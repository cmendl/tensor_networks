/// \file peps.h
/// \brief Projected entangled-pair state (PEPS) in two dimensions

#ifndef PEPS_H
#define PEPS_H

#include "tensor.h"


//________________________________________________________________________________________________________________________
///
/// \brief Projected entangled-pair state (PEPS) in two dimensions
///
///             up
///             |
///     left <-   -> right    x-direction
///             |
///            down
///        y-direction
///
/// Tensors A_xy, arranged in "transposed" matrix convention
///
///      A_00  ...  A_30
///       .   .      .
///       .      .   .
///      A_03  ...  A_33
///
/// Ordering of virtual levels is left, right, up, down (omitting directions for border states)
///
typedef struct
{
	tensor_t *A;    //!< tensors associated with sites, array of dimension L^2
	size_t d;       //!< physical dimension of each site
	size_t D;       //!< virtual dimension
	int L;          //!< lattice size, L^2 sites in total
}
peps2D_t;


void AllocatePEPS2D(const int L, const size_t d, const size_t D, peps2D_t *psi);

void DeletePEPS2D(peps2D_t *psi);


//________________________________________________________________________________________________________________________
//


void ConstructETensor(const tensor_t *restrict A, tensor_t *restrict E);

void ConstructPEPS2DMatrixProductStateOp(const peps2D_t *psi, const int y, tensor_t *mp);



#endif
