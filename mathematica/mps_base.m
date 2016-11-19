(* ::Package:: *)

(* convention for a MPO tensor A:
   Dimensions[A] \[Equal] {d1,d2,D1,D2} with d1,d2 the physical operator dimensions and
   D1,D2 the virtual bond dimensions to the left and right, respectively
*)


(* Utility functions *)

EconomicalSVD[m_,dmax_:\[Infinity]]:=Module[{u,w,v,i},
	{u,w,v}=SingularValueDecomposition[m];
	i=Min[Dimensions[w],dmax];
	{u[[;;,1;;i]],Diagonal[w][[1;;i]],v[[;;,1;;i]]}]


(* Basic MPS tensor operations *)

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

(* split a two-site tensor with dimension d1\[Times]d2\[Times]D1\[Times]D2 into two MPS tensors *)
MPSSplitTensor[A_,dmax_:\[Infinity]]:=Module[{T,dim,A0,A1,S},
	T=Transpose[A,{1,3,2,4}];
	dim=Dimensions[T];
	T=ArrayReshape[T,{Times@@dim[[1;;2]],Times@@dim[[3;;4]]}];
	{A0,S,A1}=EconomicalSVD[T,dmax];
	A1=ConjugateTranspose[A1];
	A0=ArrayReshape[A0,{dim[[1]],dim[[2]],Length[S]}];
	A1=ArrayReshape[A1,{Length[S],dim[[3]],dim[[4]]}];
	A1=Transpose[A1,{2,1,3}];
	{A0,A1,S}]


(* Basic MPO tensor operations *)

MPOSingleSiteTopUpdate[A_List,j_,op_]:=Module[{B=A},B[[j]]=op.A[[j]];B]
MPOSingleSiteBottomUpdate[A_List,j_,op_]:=Module[{B=A},B[[j]]=Transpose[Transpose[A[[j]],{1,4,2,3}].op,{1,3,4,2}];B]

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

(* split a two-site (d1,d2)\[Times](d3,d4) operator into two MPO tensors *)
MPOSplitOperator[op_,dmax_:\[Infinity]]:=Module[{op2,dim,A0,A1,S},
	op2=Transpose[op,{1,3,2,4}];
	dim=Dimensions[op2];
	op2=ArrayReshape[op2,{Times@@dim[[1;;2]],Times@@dim[[3;;4]]}];
	{A0,S,A1}=EconomicalSVD[op2,dmax];
	A1=ConjugateTranspose[A1];
	A0=ArrayReshape[A0,{dim[[1]],dim[[2]],1,Length[S]}];
	A1=ArrayReshape[A1,{Length[S],1,dim[[3]],dim[[4]]}];
	A1=Transpose[A1,{3,4,1,2}];
	{A0,A1,S}]

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

(* Local MPO update by two-site operator 'opT' from the top and 'opB' from the bottom;
   assuming that A0 is a tensor of dimension d\[Times]d\[Times]D\[Times]D' and
                 A1 is a tensor of dimension d\[Times]d\[Times]D'\[Times]D'';
   the operators 'opT' and 'opB' are matrices of dimension d^2\[Times]d^2 *)
ApplyTwoSiteOperator[A0_,A1_,opT_,opB_,tol_]:=Module[{A,dim,B0,S,B1,imax},
	(* combine A0 and A1 by contracting the shared bond of dimension D';
	   A has dimension d\[Times]d\[Times]D\[Times]d\[Times]d\[Times]D'' *)
	A=A0.Transpose[A1,{2,3,1,4}];
	dim=Dimensions[A];
	(* bring outgoing physical dimensions to the front and incoming physical dimensions to the back *)
	A=Transpose[A,{1,5,3,2,6,4}];
	(* apply operator opT to leading d\[Times]d dimensions and opB to trailing d\[Times]d dimensions *)
	A=ArrayReshape[opT.Flatten[A,{{1,2},{3},{4},{5,6}}].opB,dim[[{1,4,3,6,2,5}]]];
	(* revert reordering of physical dimensions *)
	A=Transpose[A,{1,4,3,6,2,5}];
	(* use SVD to separate the two sites again *)
	{B0,S,B1}=SingularValueDecomposition[ArrayReshape[A,{Times@@dim[[1;;3]],Times@@dim[[4;;6]]}]];
	B1=ConjugateTranspose[B1];
	S=Diagonal[S];
	(* truncate small singular values *)
	imax=First[FirstPosition[Reverse[Accumulate[Reverse[S^2]]]/Total[S^2],x_/;x<tol,{Length[S]+1}]]-1;
	imax=Clip[imax,{1,Length[S]}];
	S=S[[1;;imax]];
	B0=B0[[;;,1;;imax]];
	B1=B1[[1;;imax,;;]];
	(* restore original dimensions (except that shared bond dimension might have changed) *)
	B0=ArrayReshape[B0,Append[dim[[1;;3]],Length[S]]];
	B1=ArrayReshape[B1,Prepend[dim[[4;;6]],Length[S]]];
	(* reorder virtual bond dimension *)
	B1=Transpose[B1,{3,1,2,4}];
	{B0,B1,S}]

(* Distribute square root of singular values to left and right tensors *)
ApplyTwoSiteOperatorStdForm[A0_,A1_,opT_,opB_,svdDistr_,tol_]:=Module[{B0,B1,S},
	{B0,B1,S}=ApplyTwoSiteOperator[A0,A1,opT,opB,tol];
	Switch[svdDistr,
		"left", S=DiagonalMatrix[S];      {B0.S,B1},
		"right",S=DiagonalMatrix[S];      {B0,  Transpose[S.Transpose[B1,{2,3,1,4}],{3,1,2,4}]},
		"sqrt", S=DiagonalMatrix[Sqrt[S]];{B0.S,Transpose[S.Transpose[B1,{2,3,1,4}],{3,1,2,4}]}
	]]

ApplyTwoSiteTopOperatorStdForm[A0_,A1_,op_,svdDistr_,tol_]:=
	ApplyTwoSiteOperatorStdForm[A0,A1,op,IdentityMatrix[Dimensions[A0][[2]]Dimensions[A1][[2]]],svdDistr,tol]


(* Matrix exponential and time evolution *)

MPOLatticeTwoSiteSweep[A_List,opT_List,opB_List,direction_,tol_]:=Module[{B=A,j},
	If[direction==1,
		For[j=1,j<=Length[A]-1,j++,{B[[j]],B[[j+1]]}=ApplyTwoSiteOperatorStdForm[B[[j]],B[[j+1]],opT[[j]],opB[[j]],"right",tol]],
		For[j=Length[A]-1,j>=1,j--,{B[[j]],B[[j+1]]}=ApplyTwoSiteOperatorStdForm[B[[j]],B[[j+1]],opT[[j]],opB[[j]],"left", tol]]];
	B]

MPOLatticeTwoSiteTopSweep[A_List,opT_List,direction_,tol_]:=Module[{B=A,j},
	If[direction==1,
		For[j=1,j<=Length[A]-1,j++,{B[[j]],B[[j+1]]}=ApplyTwoSiteTopOperatorStdForm[B[[j]],B[[j+1]],opT[[j]],"right",tol]],
		For[j=Length[A]-1,j>=1,j--,{B[[j]],B[[j+1]]}=ApplyTwoSiteTopOperatorStdForm[B[[j]],B[[j+1]],opT[[j]],"left", tol]]];
	B]

MPOStrangStep[A_List,h2_List,dt_,tol_]:=Module[{expdt2H=MatrixExp[-dt #/2]&/@h2},
	MPOLatticeTwoSiteTopSweep[MPOLatticeTwoSiteTopSweep[A,expdt2H,1,tol],expdt2H,-1,tol]]

MPOStrangLiouvilleStep[A_List,h2_List,dt_,tol_]:=Module[{
	expdt2H=MatrixExp[-dt #/2]&/@h2,
	expndt2H=MatrixExp[dt #/2]&/@h2},
	MPOLatticeTwoSiteSweep[MPOLatticeTwoSiteSweep[A,expdt2H,expndt2H,1,tol],expdt2H,expndt2H,-1,tol]]

MPOEvenOddUpdate[A_List,opT_List,opB_List,jstart_,svdDistr_,tol_]:=Module[{B=A},
	Table[{B[[j]],B[[j+1]]}=ApplyTwoSiteOperatorStdForm[A[[j]],A[[j+1]],opT[[j]],opB[[j]],svdDistr,tol],{j,jstart,Length[A]-1,2}];B]

MPOEvenOddTopUpdate[A_List,op_List,jstart_,svdDistr_,tol_]:=Module[{B=A},
	Table[{B[[j]],B[[j+1]]}=ApplyTwoSiteTopOperatorStdForm[A[[j]],A[[j+1]],op[[j]],svdDistr,tol],{j,jstart,Length[A]-1,2}];B]

MPOSRKNb6Step[A_List,h2_List,dt_,tol_]:=Module[{
	ca={0.245298957184271,0.604872665711080,-0.350171622895351,-0.350171622895351,0.604872665711080,0.245298957184271},
	cb={0.08298440641740515,0.396309801498368,-0.03905630492234859,0.11952419401315084,-0.03905630492234859,0.396309801498368,0.08298440641740515}},
	Fold[MPOEvenOddTopUpdate[#1,Map[Function[h2j,MatrixExp[-If[OddQ[#2],cb[[(#2+1)/2]],ca[[#2/2]]]dt h2j]],h2],Mod[#2,2,1],"sqrt",tol]&,A,Range[13]]]

MPOSRKNb6LiouvilleStep[A_List,h2_List,dt_,tol_]:=Module[{
	ca={0.245298957184271,0.604872665711080,-0.350171622895351,-0.350171622895351,0.604872665711080,0.245298957184271},
	cb={0.08298440641740515,0.396309801498368,-0.03905630492234859,0.11952419401315084,-0.03905630492234859,0.396309801498368,0.08298440641740515}},
	Fold[MPOEvenOddUpdate[#1,
		Map[Function[h2j,MatrixExp[-If[OddQ[#2],cb[[(#2+1)/2]],ca[[#2/2]]]dt h2j]],h2],
		Map[Function[h2j,MatrixExp[ If[OddQ[#2],cb[[(#2+1)/2]],ca[[#2/2]]]dt h2j]],h2],
		Mod[#2,2,1],"sqrt",tol]&,A,Range[13]]]

MPOEvolution[fStep_,A_List,h2_List,t_,nsteps_,tol_]:=Nest[fStep[#,h2,t/nsteps,tol]&,A,nsteps]
