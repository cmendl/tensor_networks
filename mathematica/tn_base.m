(* ::Package:: *)

(* :Name: Tensor Networks *)

(* :Author: Christian B. Mendl
	http://christian.mendl.net *)

(* :Copyright:
	Copyright (C) 2013-2017, Christian B. Mendl
	All rights reserved.
	This program is free software; you can redistribute it and/or
	modify it under the terms of the Simplified BSD License
	http://www.opensource.org/licenses/bsd-license.php *)

(* :Summary:
	Quantum tensor network operations, specifically for
	matrix product states (MPS) and matrix product operators (MPO),
	including real and imaginary time evolution *)

(* :References:
	1. U. Schollw\[ODoubleDot]ck  
	   The density-matrix renormalization group in the age of matrix product states  
	   Ann. Phys. 326, 96-192 (2011) [arXiv:1008.3477](http://arxiv.org/abs/1008.3477), [DOI](http://dx.doi.org/10.1016/j.aop.2010.09.012)
	2. T. Barthel  
	   Precise evaluation of thermal response functions by optimized density matrix renormalization group schemes  
	   New J. Phys. 15, 073010 (2013) [arXiv:1301.2246](http://arxiv.org/abs/1301.2246), [DOI](http://dx.doi.org/10.1088/1367-2630/15/7/073010)
	3. F. Verstraete, V. Murg, J. I. Cirac  
	   Matrix product states, projected entangled pair states, and variational renormalization group methods for quantum spin systems  
	   Adv. Phys. 57, 143-224 (2008) [arXiv:0907.2796](http://arxiv.org/abs/0907.2796), [DOI](http://dx.doi.org/10.1080/14789940801912366) *)


(* Utility functions *)

EconomicalSVD[m_,dmax_:\[Infinity]]:=Module[{u,w,v,i},
	{u,w,v}=SingularValueDecomposition[m];
	w=Diagonal[w];
	i=Max[1,Min[dmax,First[FirstPosition[w,x_/;x==0(* works also for 0. *),{Length[w]+1}]]-1]];
	{u[[;;,1;;i]],w[[1;;i]],v[[;;,1;;i]]}]

DistributeEntries[A_,len_,ind_]:=Module[{dim=Dimensions[A],B},dim[[1]]=len;B=ConstantArray[0,dim];B[[ind]]=A;B]

TruncatedBondIndices[S_,tol_]:=Module[{rw},
	If[Total[S^2]===0,{},
		rw=S^2/Total[S^2];
		Flatten[Position[Accumulate[Sort[rw]][[Ordering[Ordering[rw]]]],x_/;x>tol,1]]]]

(* Split a matrix 'A' by singular value decompositions, taking
   quantum numbers 'q0' and 'q2' of first and second dimension into account *)
SplitMatrix[A_,{q0_,q2_},tol_]:=Module[{
	iq=Intersection[q0,q2],i0,i2,a0,a1,s,A0=ConstantArray[{},Length[q0]],A1=ConstantArray[{},Length[q2]],S={},qS={},indtr},
	Assert[Dimensions[A]=={Length[q0],Length[q2]}];
	Function[qn,
		i0=Flatten[Position[q0,qn]];
		i2=Flatten[Position[q2,qn]];
		{a0,s,a1}=FullSimplify[EconomicalSVD[A[[i0,i2]]]];
		a1=Conjugate[a1];
		A0=Join[A0,DistributeEntries[a0,Length[q0],i0],2];
		A1=Join[A1,DistributeEntries[a1,Length[q2],i2],2];
		S=Join[S,s];
		qS=Join[qS,ConstantArray[qn,Length[s]]]]/@iq;
	indtr=TruncatedBondIndices[S,tol];
	If[indtr=={},
		{ConstantArray[0,{Length[q0],1}],ConstantArray[0,{1,Length[q2]}],{0},{0}},
		{A0[[;;,indtr]],Transpose[A1[[;;,indtr]]],S[[indtr]],qS[[indtr]]}]]

(* "Compress" shared dimension in matrix product A0.A1, taking quantum numbers into account *)
CompressVirtualBonds[A0_,A1_,{q0_,q1_,q2_},tol_]:=Module[{A=ConstantArray[0,{Length[q0],Length[q2]}],iq=Intersection[q0,q1,q2],i0,i1,i2,j},
	For[j=1,j<=Length[iq],j++,
		i0=Flatten[Position[q0,iq[[j]]]];
		i1=Flatten[Position[q1,iq[[j]]]];
		i2=Flatten[Position[q2,iq[[j]]]];
		A[[i0,i2]]=FullSimplify[A0[[i0,i1]].A1[[i1,i2]]]];
	(* for efficiency, could mask quantum numbers in q0 and q2 which are not in q1 *)
	SplitMatrix[A,{q0,q2},tol]]

NeumannEntropy[S_]:=If[Norm[S]==0,0,Module[{Ssq=Select[(S/Norm[S])^2,#>0&]},-Ssq.Log[Ssq]]]


(* MPS tensor operations

   Convention for a MPS tensor A:
   Dimensions[A] \[Equal] {d,D1,D2} with d the physical operator dimensions and
   D1,D2 the virtual bond dimensions to the left and right, respectively

   Several functions expect MPS tensor inputs in the form {A,qA0,qA1},
   with qA0 and qA1 the respective quantum numbers of the left and right virtual bonds
*)

(* Merge two neighboring MPS tensors *)
MPSMergeTensors[A0_,A1_]:=Module[{A},
	A=A0.Transpose[A1,{2,1,3}];
	(* pair original physical dimensions of A0 and A1 *)
	A=Transpose[A,{1,3,2,4}];
	(* combine original physical dimensions of A0 and A1 *)
	Flatten[A,{{1,2},{3},{4}}]]

(* Merge all tensors of a MPS to obtain the vector representation on the full Hilbert space
   (only use for small number of lattice sites!) *)
MPSMergeFull[A_List]:=Flatten[Fold[MPSMergeTensors,First[A],Rest[A]]]

(* Return 0 if MPS 'A' has expected block structure determined by quantum numbers *)
MPSBlockStructureError[{A_,qA0_,qA1_},qd_]:=Norm[Flatten[A Outer[If[#1+#2-#3!=0,1,0]&,qd,qA0,qA1]]]

(* Split a MPS tensor with dimension d\[Times]D1\[Times]D2 into two MPS tensors;
   qd0,qd1 are the physical quantum numbers of the two sites such that d\[Equal]Length[qd0]Length[qd1] *)
MPSSplitTensor[{A_,qA0_,qA2_},{qd0_,qd1_},tol_:0]:=Module[{T,dim,A0,A1,S,qS,
	q0=Flatten[Outer[#1+#2&,qd0,qA0]],
	q2=Flatten[Outer[#2-#1&,qd1,qA2]]},
	T=Transpose[ArrayReshape[A,{Length[qd0],Length[qd1],Length[qA0],Length[qA2]}],{1,3,2,4}];
	dim=Dimensions[T];
	T=ArrayReshape[T,{Times@@dim[[1;;2]],Times@@dim[[3;;4]]}];
	{A0,A1,S,qS}=SplitMatrix[T,{q0,q2},tol];
	A0=ArrayReshape[A0,{dim[[1]],dim[[2]],Length[S]}];
	A1=ArrayReshape[A1,{Length[S],dim[[3]],dim[[4]]}];
	A1=Transpose[A1,{2,1,3}];
	{{A0,qA0,qS},{A1,qS,qA2},S}]

(* Compress virtual bonds between tensors A0 and A1;
   qd0,qd1 are the physical quantum numbers of the two sites *)
MPSCompressTensors[{A0_,qA0_,qA1_},{A1_,qA1_,qA2_},{qd0_,qd1_},tol_:0]:=Module[{
	B0=ArrayReshape[A0,{Times@@Dimensions[A0][[1;;2]],Dimensions[A0][[3]]}],
	B1=ArrayReshape[Transpose[A1,{2,1,3}],{Dimensions[A1][[2]],Dimensions[A1][[1]]Dimensions[A1][[3]]}],
	q0=Flatten[Outer[#1+#2&,qd0,qA0]],
	q2=Flatten[Outer[#2-#1&,qd1,qA2]],
	S,qS},
	{B0,B1,S,qS}=CompressVirtualBonds[B0,B1,{q0,qA1,q2},tol];
	B0=ArrayReshape[B0,{Dimensions[A0][[1]],Dimensions[A0][[2]],Length[S]}];
	B1=ArrayReshape[B1,{Length[S],Dimensions[A1][[1]],Dimensions[A1][[3]]}];
	B1=Transpose[B1,{2,1,3}];
	{{B0,qA0,qS},{B1,qS,qA2},S}]


(* MPO tensor operations

   Convention for a MPO tensor A:
   Dimensions[A] \[Equal] {d1,d2,D1,D2} with d1,d2 the physical operator dimensions and
   D1,D2 the virtual bond dimensions to the left and right, respectively

   Several functions expect MPO tensor inputs in the form {A,qA0,qA1},
   with qA0 and qA1 the respective quantum numbers of the left and right virtual bonds
*)

(* Merge two neighboring MPO tensors *)
MPOMergeTensors[A0_,A1_]:=Module[{A},
	A=A0.Transpose[A1,{2,3,1,4}];
	(* pair original physical dimensions of A0 and A1 *)
	A=Transpose[A,{1,3,5,2,4,6}];
	(* combine original physical dimensions of A0 and A1 *)
	Flatten[A,{{1,2},{3,4},{5},{6}}]]

(* Merge all tensors of a MPO to obtain the matrix representation on the full Hilbert space
   (only use for small number of lattice sites!) *)
MPOMergeFull[A_List]:=ArrayFlatten[Fold[MPOMergeTensors,First[A],Rest[A]]]

(* Reduction by one lattice site for computing the trace of a MPO product Tr[Y.X]
   with X consisting of 'A' tensors and Y of 'B' tensors *)
MPOTraceProductTensorReduce[A_,B_,R_]:=Module[{T},
	(* flip physical dimensions and move to the end *)
	T=Transpose[B,{4,3,1,2}];
	(* multiply both physical dimensions together *)
	T=Flatten[T,{{1},{2},{3,4}}].Flatten[A,{{1,2},{3},{4}}];
	(* flip bond dimensions *)
	T=Transpose[T,{1,3,2,4}];
	(* multiply with right clamp to obtain new right clamp *)
	Flatten[T,{{1},{2},{3,4}}].Flatten[R]]

MPOTraceProduct[A_List,B_List]:=
	Tr[Fold[MPOTraceProductTensorReduce[First[#2],Last[#2],#1]&,{{1}},Reverse[Transpose[{A,B}]]]]

MPOFrobeniusNorm[A_List]:=Sqrt[Re[MPOTraceProduct[A,ConjugateTranspose/@A]]]

(* Return 0 if MPO 'A' has expected block structure determined by quantum numbers *)
MPOBlockStructureError[{A_,qA0_,qA1_},qd_]:=Norm[Flatten[A Outer[If[#1-#2+#3-#4!=0,1,0]&,qd,qd,qA0,qA1]]]

(* Split a MPO tensor with dimension d\[Times]d\[Times]D1\[Times]D2 into two MPO tensors;
   qd0,qd1 are the physical quantum numbers of the two sites such that d\[Equal]Length[qd0]Length[qd1] *)
MPOSplitTensor[{A_,qA0_,qA2_},{qd0_,qd1_},tol_:0]:=Module[{T,dim,A0,A1,S,qS,
	q0=Flatten[Outer[#1-#2+#3&,qd0,qd0,qA0]],
	q2=Flatten[Outer[#3-#1+#2&,qd1,qd1,qA2]]},
	T=Transpose[ArrayReshape[A,{Length[qd0],Length[qd1],Length[qd0],Length[qd1],Length[qA0],Length[qA2]}],{1,4,2,5,3,6}];
	dim=Dimensions[T];
	T=ArrayReshape[T,{Times@@dim[[1;;3]],Times@@dim[[4;;6]]}];
	{A0,A1,S,qS}=SplitMatrix[T,{q0,q2},tol];
	A0=ArrayReshape[A0,{dim[[1]],dim[[2]],dim[[3]],Length[S]}];
	A1=ArrayReshape[A1,{Length[S],dim[[4]],dim[[5]],dim[[6]]}];
	A1=Transpose[A1,{3,1,2,4}];
	{{A0,qA0,qS},{A1,qS,qA2},S}]

(* Compress virtual bonds between tensors A0 and A1;
   qd0,qd1 are the physical quantum numbers of the two sites *)
MPOCompressTensors[{A0_,qA0_,qA1_},{A1_,qA1_,qA2_},{qd0_,qd1_},tol_:0]:=Module[{
	B0=ArrayReshape[A0,{Times@@Dimensions[A0][[1;;3]],Dimensions[A0][[4]]}],
	B1=ArrayReshape[Transpose[A1,{2,3,1,4}],{Dimensions[A1][[3]],Times@@Dimensions[A1][[{1,2,4}]]}],
	q0=Flatten[Outer[#1-#2+#3&,qd0,qd0,qA0]],
	q2=Flatten[Outer[#3-#1+#2&,qd1,qd1,qA2]],
	S,qS},
	{B0,B1,S,qS}=CompressVirtualBonds[B0,B1,{q0,qA1,q2},tol];
	B0=ArrayReshape[B0,{Dimensions[A0][[1]],Dimensions[A0][[2]],Dimensions[A0][[3]],Length[S]}];
	B1=ArrayReshape[B1,{Length[S],Dimensions[A1][[1]],Dimensions[A1][[2]],Dimensions[A1][[4]]}];
	B1=Transpose[B1,{3,1,2,4}];
	{{B0,qA0,qS},{B1,qS,qA2},S}]

(* Composition of MPOs 'A' and 'B' along physical dimension;
   assuming that physical quantum numbers remain fixed *)
MPOComposition[{A_,qA0_,qA1_},{B_,qB0_,qB1_}]:=Module[{C,q0,q1},
	(* multiply physical dimensions *)
	C=Transpose[A,{1,4,2,3}].B;
	(* reorder dimensions and combine virtual bonds *)
	C=Flatten[Transpose[C,{1,3,5,2,4,6}],{{1},{2},{3,4},{5,6}}];
	(* add corresponding quantum numbers *)
	q0=Flatten[Outer[#1+#2&,qA0,qB0]];
	q1=Flatten[Outer[#1+#2&,qA1,qB1]];
	{C,q0,q1}]
MPOComposition[A_,B_,C_]:=MPOComposition[MPOComposition[A,B],C]

(* Composition of MPO pairs (A0,A1) with pairs (B0,B1) along physical dimension;
   assuming that physical quantum numbers remain fixed *)
MPOPairComposition[A0_,A1_,B0_,B1_,{qd0_,qd1_},tol_:0]:=MPOCompressTensors[MPOComposition[A0,B0],MPOComposition[A1,B1],{qd0,qd1},tol]
MPOPairComposition[A0_,A1_,B0_,B1_,C0_,C1_,{qd0_,qd1_},tol_:0]:=MPOCompressTensors[MPOComposition[A0,B0,C0],MPOComposition[A1,B1,C1],{qd0,qd1},tol]

(* Distribute singular values to the left or right tensors *)
MPODistributeSingularValuesLeft [{A0_,qA0_,qA1_},{A1_,qA1_,qA2_},S_]:={{A0.DiagonalMatrix[S],      qA0,qA1},{A1,                                                                  qA1,qA2}}
MPODistributeSingularValuesRight[{A0_,qA0_,qA1_},{A1_,qA1_,qA2_},S_]:={{A0,                        qA0,qA1},{Transpose[DiagonalMatrix[S]      .Transpose[A1,{2,3,1,4}],{3,1,2,4}],qA1,qA2}}
MPODistributeSingularValuesSqrt [{A0_,qA0_,qA1_},{A1_,qA1_,qA2_},S_]:={{A0.DiagonalMatrix[Sqrt[S]],qA0,qA1},{Transpose[DiagonalMatrix[Sqrt[S]].Transpose[A1,{2,3,1,4}],{3,1,2,4}],qA1,qA2}}
MPODistributeSingularValues["left"] :=MPODistributeSingularValuesLeft
MPODistributeSingularValues["right"]:=MPODistributeSingularValuesRight
MPODistributeSingularValues["sqrt"] :=MPODistributeSingularValuesSqrt


(* Matrix exponential and time evolution *)

MPOLatticeTwoSiteTopSweep[A_List,op_List,qd_,direction_,tol_]:=Module[{B=A,j},
	If[direction==1,
		For[j=1,j<=Length[A]-1,j++,{B[[j]],B[[j+1]]}=MPODistributeSingularValuesRight@@MPOPairComposition[op[[j,1]],op[[j,2]],B[[j]],B[[j+1]],{qd,qd},tol]],
		For[j=Length[A]-1,j>=1,j--,{B[[j]],B[[j+1]]}=MPODistributeSingularValuesLeft @@MPOPairComposition[op[[j,1]],op[[j,2]],B[[j]],B[[j+1]],{qd,qd},tol]]];
	B]

MPOLatticeTwoSiteSweep[A_List,opT_List,opB_List,qd_,direction_,tol_]:=Module[{B=A,j},
	If[direction==1,
		For[j=1,j<=Length[A]-1,j++,{B[[j]],B[[j+1]]}=MPODistributeSingularValuesRight@@MPOPairComposition[opT[[j,1]],opT[[j,2]],B[[j]],B[[j+1]],opB[[j,1]],opB[[j,2]],{qd,qd},tol]],
		For[j=Length[A]-1,j>=1,j--,{B[[j]],B[[j+1]]}=MPODistributeSingularValuesLeft @@MPOPairComposition[opT[[j,1]],opT[[j,2]],B[[j]],B[[j+1]],opB[[j,1]],opB[[j,2]],{qd,qd},tol]]];
	B]

MPOStrangEvolution[A0_List,h2_List,qd_,t_,nsteps_,tol_]:=Module[{dt=t/nsteps,expdt2H},
	(* represent matrix exponential of local two-site operators as MPOs *)
	expdt2H=(MPODistributeSingularValuesSqrt@@MPOSplitTensor[{ArrayReshape[MatrixExp[-dt #/2],Join[Dimensions[#],{1,1}]],{0},{0}},{qd,qd}])&/@h2;
	(* repeatedly apply time evolution steps *)
	Nest[Function[A,MPOLatticeTwoSiteTopSweep[MPOLatticeTwoSiteTopSweep[A,expdt2H,qd,1,tol],expdt2H,qd,-1,tol]],A0,nsteps]]

MPOStrangLiouvilleEvolution[A0_List,h2_List,qd_,t_,nsteps_,tol_]:=Module[{dt=t/nsteps,expdt2H,expndt2H},
	(* represent matrix exponential of local two-site operators as MPOs *)
	expdt2H =(MPODistributeSingularValuesSqrt@@MPOSplitTensor[{ArrayReshape[MatrixExp[-dt #/2],Join[Dimensions[#],{1,1}]],{0},{0}},{qd,qd}])&/@h2;
	expndt2H=(MPODistributeSingularValuesSqrt@@MPOSplitTensor[{ArrayReshape[MatrixExp[ dt #/2],Join[Dimensions[#],{1,1}]],{0},{0}},{qd,qd}])&/@h2;
	(* repeatedly apply time evolution steps *)
	Nest[Function[A,MPOLatticeTwoSiteSweep[MPOLatticeTwoSiteSweep[A,expdt2H,expndt2H,qd,1,tol],expdt2H,expndt2H,qd,-1,tol]],A0,nsteps]]

MPOEvenOddTopUpdate[A_List,op_List,qd_,jstart_,svdDistr_,tol_]:=Module[{B=A},
	Table[{B[[j]],B[[j+1]]}=MPODistributeSingularValues[svdDistr]@@MPOPairComposition[op[[j,1]],op[[j,2]],A[[j]],A[[j+1]],{qd,qd},tol],{j,jstart,Length[A]-1,2}];B]

MPOEvenOddUpdate[A_List,opT_List,opB_List,qd_,jstart_,svdDistr_,tol_]:=Module[{B=A},
	Table[{B[[j]],B[[j+1]]}=MPODistributeSingularValues[svdDistr]@@MPOPairComposition[opT[[j,1]],opT[[j,2]],A[[j]],A[[j+1]],opB[[j,1]],opB[[j,2]],{qd,qd},tol],{j,jstart,Length[A]-1,2}];B]

MPOSRKNb6Step[A_List,expdtHa_List,expdtHb_List,qd_,tol_]:=Fold[
	MPOEvenOddTopUpdate[#1,If[OddQ[#2],expdtHb[[(#2+1)/2]],expdtHa[[#2/2]]],qd,Mod[#2,2,1],"sqrt",tol]&,
	A,Range[13]]

MPOSRKNb6LiouvilleStep[A_List,expdtHa_List,expdtHb_List,qd_,tol_]:=Fold[
	MPOEvenOddUpdate[#1,
		If[OddQ[#2],expdtHb[[(#2+1)/2,1]],expdtHa[[#2/2,1]]],
		If[OddQ[#2],expdtHb[[(#2+1)/2,2]],expdtHa[[#2/2,2]]],
		qd,Mod[#2,2,1],"sqrt",tol]&,
	A,Range[13]]

MPOSRKNb6Evolution[A0_List,h2_List,qd_,t_,0,tol_]:=A0
MPOSRKNb6Evolution[A0_List,h2_List,qd_,t_,nsteps_,tol_]:=Module[{dt=t/nsteps,expdtHa,expdtHb,
	ca={0.245298957184271,0.604872665711080,-0.350171622895351,-0.350171622895351,0.604872665711080,0.245298957184271},
	cb={0.08298440641740515,0.396309801498368,-0.03905630492234859,0.11952419401315084,-0.03905630492234859,0.396309801498368,0.08298440641740515}},
	(* represent matrix exponential of local two-site operators as MPOs *)
	expdtHa=Outer[MPODistributeSingularValuesSqrt@@MPOSplitTensor[{ArrayReshape[MatrixExp[-dt #1 #2],Join[Dimensions[#2],{1,1}]],{0},{0}},{qd,qd}]&,ca,h2,1];
	expdtHb=Outer[MPODistributeSingularValuesSqrt@@MPOSplitTensor[{ArrayReshape[MatrixExp[-dt #1 #2],Join[Dimensions[#2],{1,1}]],{0},{0}},{qd,qd}]&,cb,h2,1];
	Nest[MPOSRKNb6Step[#,expdtHa,expdtHb,qd,tol]&,A0,nsteps]]

MPOSRKNb6LiouvilleEvolution[A0_List,h2_List,qd_,t_,0,tol_]:=A0
MPOSRKNb6LiouvilleEvolution[A0_List,h2_List,qd_,t_,nsteps_,tol_]:=Module[{dt=t/nsteps,expdtHa,expdtHb,
	ca={0.245298957184271,0.604872665711080,-0.350171622895351,-0.350171622895351,0.604872665711080,0.245298957184271},
	cb={0.08298440641740515,0.396309801498368,-0.03905630492234859,0.11952419401315084,-0.03905630492234859,0.396309801498368,0.08298440641740515}},
	(* represent matrix exponential of local two-site operators as MPOs *)
	expdtHa=Outer[MPODistributeSingularValuesSqrt@@MPOSplitTensor[{ArrayReshape[MatrixExp[-dt #1 #2 #3],Join[Dimensions[#3],{1,1}]],{0},{0}},{qd,qd}]&,ca,{1,-1},h2,1];
	expdtHb=Outer[MPODistributeSingularValuesSqrt@@MPOSplitTensor[{ArrayReshape[MatrixExp[-dt #1 #2 #3],Join[Dimensions[#3],{1,1}]],{0},{0}},{qd,qd}]&,cb,{1,-1},h2,1];
	Nest[MPOSRKNb6LiouvilleStep[#,expdtHa,expdtHb,qd,tol]&,A0,nsteps]]
