(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 10.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1064,         20]
NotebookDataLength[     17719,        593]
NotebookOptionsPosition[     16393,        522]
NotebookOutlinePosition[     16736,        537]
CellTagsIndexPosition[     16693,        534]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Matrix Product States (MPS)", "Section"],

Cell[TextData[{
 "Reference:\n\tF. Verstraete, V. Murg, J. I. Cirac\n\tMatrix product states, \
projected entangled pair states, and variational renormalization group \
methods for quantum spin systems\n\tAdvances in Physics 57, 143-224 ",
 ButtonBox["DOI",
  BaseStyle->"Hyperlink",
  ButtonData->{
    URL["http://dx.doi.org/10.1080/14789940801912366"], None},
  ButtonNote->"http://dx.doi.org/10.1080/14789940801912366"]
}], "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";"}]], "Input"],

Cell[BoxData[
 RowBox[{"<<", "../mathematica/mps_base.m"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["fn", "base"], "=", 
   RowBox[{
    RowBox[{"NotebookDirectory", "[", "]"}], "<>", 
    RowBox[{"FileBaseName", "[", 
     RowBox[{"NotebookFileName", "[", "]"}], "]"}]}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell["Two-site MPS decomposition", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"split", " ", "a", " ", "two"}], "-", 
    RowBox[{
    "site", " ", "d1", "\[Times]", "d2", " ", "state", " ", "into", " ", 
     "two", " ", "MPS", " ", "tensors"}]}], " ", "*)"}], "\n", 
  RowBox[{
   RowBox[{"MPSSplitState", "[", 
    RowBox[{"psi_", ",", 
     RowBox[{"dmax_:", "\[Infinity]"}]}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"A0", ",", "A1", ",", "S"}], "}"}], ",", "\[IndentingNewLine]", 
     "\t", 
     RowBox[{
      RowBox[{
       RowBox[{"{", 
        RowBox[{"A0", ",", "S", ",", "A1"}], "}"}], "=", 
       RowBox[{"EconomicalSVD", "[", 
        RowBox[{"psi", ",", "dmax"}], "]"}]}], ";", "\n", "\t", 
      RowBox[{"A1", "=", 
       RowBox[{"ConjugateTranspose", "[", "A1", "]"}]}], ";", "\n", "\t", 
      RowBox[{"A0", "=", 
       RowBox[{"ArrayReshape", "[", 
        RowBox[{"A0", ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"First", "[", 
            RowBox[{"Dimensions", "[", "psi", "]"}], "]"}], ",", "1", ",", 
           RowBox[{"Length", "[", "S", "]"}]}], "}"}]}], "]"}]}], ";", "\n", 
      "\t", 
      RowBox[{"A1", "=", 
       RowBox[{"ArrayReshape", "[", 
        RowBox[{"A1", ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"Length", "[", "S", "]"}], ",", "1", ",", 
           RowBox[{"Last", "[", 
            RowBox[{"Dimensions", "[", "psi", "]"}], "]"}]}], "}"}]}], 
        "]"}]}], ";", "\n", "\t", 
      RowBox[{"A1", "=", 
       RowBox[{"Transpose", "[", 
        RowBox[{"A1", ",", 
         RowBox[{"{", 
          RowBox[{"2", ",", "3", ",", "1"}], "}"}]}], "]"}]}], ";", "\n", 
      "\t", 
      RowBox[{"{", 
       RowBox[{"A0", ",", "A1", ",", "S"}], "}"}]}]}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"physical", " ", "site", " ", "dimensions"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["d", "1"], "=", "5"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["d", "2"], "=", "6"}], ";"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "42", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"RandomComplex", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"-", 
       RowBox[{"(", 
        RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], ",", 
      RowBox[{"(", 
       RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], "}"}], ",", 
    RowBox[{"{", 
     RowBox[{
      SubscriptBox["d", "1"], ",", 
      SubscriptBox["d", "2"]}], "}"}]}], "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["\[Psi]", "val"], "=", 
   RowBox[{"%", "/", 
    RowBox[{"Norm", "[", 
     RowBox[{"Flatten", "[", "%", "]"}], "]"}]}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "6"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     SubscriptBox["A", "0"], ",", 
     SubscriptBox["A", "1"], ",", 
     SubscriptBox["\[Sigma]", "val"]}], "}"}], "=", 
   RowBox[{"MPSSplitState", "[", 
    SubscriptBox["\[Psi]", "val"], "]"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", " ", "normalization"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Norm", "[", 
    SubscriptBox["\[Sigma]", "val"], "]"}], "-", "1"}]}]], "Input"],

Cell[BoxData["4.440892098500626`*^-16"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["A", "0"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "1", ",", "5"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["A", "1"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"6", ",", "5", ",", "1"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "unitary", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"ArrayReshape", "[", 
     RowBox[{
      SubscriptBox["A", "0"], ",", 
      RowBox[{
       RowBox[{"Dimensions", "[", 
        SubscriptBox["A", "0"], "]"}], "\[LeftDoubleBracket]", 
       RowBox[{"{", 
        RowBox[{"1", ",", "3"}], "}"}], "\[RightDoubleBracket]"}]}], "]"}], 
    ";"}], "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{"%", ".", 
      RowBox[{"ConjugateTranspose", "[", "%", "]"}]}], "-", 
     RowBox[{"IdentityMatrix", "[", "5", "]"}]}], "]"}]}]}]], "Input"],

Cell[BoxData["1.1216757140554005`*^-15"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "unitary", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"ArrayReshape", "[", 
     RowBox[{
      SubscriptBox["A", "1"], ",", 
      RowBox[{
       RowBox[{"Dimensions", "[", 
        SubscriptBox["A", "1"], "]"}], "\[LeftDoubleBracket]", 
       RowBox[{"1", ";;", "2"}], "\[RightDoubleBracket]"}]}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"ConjugateTranspose", "[", "%", "]"}], ".", "%"}], "-", 
     RowBox[{"IdentityMatrix", "[", "5", "]"}]}], "]"}]}]}]], "Input"],

Cell[BoxData["1.0780836547945482`*^-15"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{"reproduce", " ", "wavefunction"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"ArrayFlatten", "[", 
     RowBox[{"Transpose", "[", 
      RowBox[{
       RowBox[{
        SubscriptBox["A", "0"], ".", 
        RowBox[{"DiagonalMatrix", "[", 
         SubscriptBox["\[Sigma]", "val"], "]"}], ".", 
        RowBox[{"Transpose", "[", 
         RowBox[{
          SubscriptBox["A", "1"], ",", 
          RowBox[{"{", 
           RowBox[{"2", ",", "1", ",", "3"}], "}"}]}], "]"}]}], ",", 
       RowBox[{"{", 
        RowBox[{"1", ",", "3", ",", "2", ",", "4"}], "}"}]}], "]"}], "]"}], 
    "-", 
    SubscriptBox["\[Psi]", "val"]}], "]"}]}]], "Input"],

Cell[BoxData["6.24368220533463`*^-16"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", " ", 
    RowBox[{"(", 
     RowBox[{"equivalen", " ", "to", " ", "unitary", " ", "property"}], 
     ")"}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"Total", "[", 
     RowBox[{"ArrayReshape", "[", 
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"KroneckerProduct", "[", 
          RowBox[{"#", ",", 
           RowBox[{"Conjugate", "[", "#", "]"}]}], "]"}], "&"}], "/@", 
        SubscriptBox["A", "0"]}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{
          SubscriptBox["d", "1"], 
          SubscriptBox["d", "2"]}], ",", "5", ",", "5"}], "}"}]}], "]"}], 
     "]"}], "-", 
    RowBox[{"IdentityMatrix", "[", "5", "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["1.2049025049455379`*^-15"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", " ", 
    RowBox[{"(", 
     RowBox[{"equivalen", " ", "to", " ", "unitary", " ", "property"}], 
     ")"}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"Total", "[", 
     RowBox[{"ArrayReshape", "[", 
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"KroneckerProduct", "[", 
          RowBox[{"#", ",", 
           RowBox[{"Conjugate", "[", "#", "]"}]}], "]"}], "&"}], "/@", 
        SubscriptBox["A", "1"]}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{
          SubscriptBox["d", "1"], 
          SubscriptBox["d", "2"]}], ",", "5", ",", "5"}], "}"}]}], "]"}], 
     "]"}], "-", 
    RowBox[{"IdentityMatrix", "[", "5", "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["1.1499769204152573`*^-15"], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Norm", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["e", "list"], "=", 
   RowBox[{
    RowBox[{
     RowBox[{"Total", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"KroneckerProduct", "[", 
         RowBox[{"#", ",", 
          RowBox[{"Conjugate", "[", "#", "]"}]}], "]"}], "&"}], "/@", "#"}], 
      "]"}], "&"}], "/@", 
    RowBox[{"{", 
     RowBox[{
      SubscriptBox["A", "0"], ",", 
      SubscriptBox["A", "1"]}], "}"}]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", "2", "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["e", "list"], "\[LeftDoubleBracket]", "1", 
   "\[RightDoubleBracket]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "25"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["e", "list"], "\[LeftDoubleBracket]", "1", 
    "\[RightDoubleBracket]"}], "//", "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"1.0000000000000004`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"2.0816681711721685`*^-16", "+", 
       RowBox[{"4.85722573273506`*^-17", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"1.1102230246251565`*^-16", "-", 
       RowBox[{"9.71445146547012`*^-17", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"5.551115123125783`*^-17", "+", 
       RowBox[{"5.551115123125783`*^-17", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "1.6653345369377348`*^-16"}], "-", 
       RowBox[{"4.163336342344337`*^-17", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"2.0816681711721685`*^-16", "-", 
       RowBox[{"4.85722573273506`*^-17", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"1.0000000000000009`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "4.163336342344337`*^-17"}], "+", 
       RowBox[{"3.8163916471489756`*^-17", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "8.326672684688674`*^-17"}], "-", 
       RowBox[{"3.8163916471489756`*^-17", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "2.0816681711721685`*^-16"}], "+", 
       RowBox[{"9.71445146547012`*^-17", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"1.1102230246251565`*^-16", "+", 
       RowBox[{"9.71445146547012`*^-17", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "4.163336342344337`*^-17"}], "-", 
       RowBox[{"3.8163916471489756`*^-17", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"1.0000000000000007`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "1.3877787807814457`*^-16"}], "+", 
       RowBox[{"1.1102230246251565`*^-16", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"1.3877787807814457`*^-16", "+", 
       RowBox[{"8.326672684688674`*^-17", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"5.551115123125783`*^-17", "-", 
       RowBox[{"5.551115123125783`*^-17", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "8.326672684688674`*^-17"}], "+", 
       RowBox[{"3.8163916471489756`*^-17", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "1.3877787807814457`*^-16"}], "-", 
       RowBox[{"1.1102230246251565`*^-16", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"1.0000000000000002`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"1.6653345369377348`*^-16", "-", 
       RowBox[{"1.3183898417423734`*^-16", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "1.6653345369377348`*^-16"}], "+", 
       RowBox[{"4.163336342344337`*^-17", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "2.0816681711721685`*^-16"}], "-", 
       RowBox[{"9.71445146547012`*^-17", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"1.3877787807814457`*^-16", "-", 
       RowBox[{"8.326672684688674`*^-17", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"1.6653345369377348`*^-16", "+", 
       RowBox[{"1.3183898417423734`*^-16", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"1.0000000000000007`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}]}
    },
    GridBoxAlignment->{
     "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.7]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
  Function[BoxForm`e$, 
   MatrixForm[BoxForm`e$]]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["e", "list"], "\[LeftDoubleBracket]", "2", 
   "\[RightDoubleBracket]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"25", ",", "1"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"the", " ", "norm", " ", "is", " ", "equal", " ", "to", " ", 
    RowBox[{
     SubscriptBox["e", "1"], ".", 
     SubscriptBox["e", "2"]}], 
    SubscriptBox["\[Ellipsis]e", "L"]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Dot", "@@", 
   SubscriptBox["e", "list"]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{"5.000000000000002`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], "}"}], "}"}]], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1654, 920},
WindowMargins->{{Automatic, 209}, {Automatic, 54}},
FrontEndVersion->"10.0 for Microsoft Windows (64-bit) (July 1, 2014)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1486, 35, 46, 0, 63, "Section"],
Cell[1535, 37, 435, 9, 87, "Text"],
Cell[1973, 48, 123, 3, 31, "Input"],
Cell[2099, 53, 69, 1, 31, "Input"],
Cell[2171, 56, 242, 7, 31, "Input"],
Cell[CellGroupData[{
Cell[2438, 67, 48, 0, 43, "Subsection"],
Cell[2489, 69, 1812, 50, 172, "Input"],
Cell[4304, 121, 337, 11, 72, "Input"],
Cell[CellGroupData[{
Cell[4666, 136, 764, 24, 92, "Input"],
Cell[5433, 162, 73, 2, 31, "Output"]
}, Open  ]],
Cell[5521, 167, 282, 9, 31, "Input"],
Cell[CellGroupData[{
Cell[5828, 180, 233, 7, 52, "Input"],
Cell[6064, 189, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6151, 194, 85, 2, 31, "Input"],
Cell[6239, 198, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6359, 205, 85, 2, 31, "Input"],
Cell[6447, 209, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6567, 216, 640, 18, 72, "Input"],
Cell[7210, 236, 51, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7298, 241, 611, 17, 72, "Input"],
Cell[7912, 260, 51, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[8000, 265, 783, 23, 52, "Input"],
Cell[8786, 290, 49, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[8872, 295, 795, 24, 52, "Input"],
Cell[9670, 321, 51, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[9758, 326, 795, 24, 52, "Input"],
Cell[10556, 352, 51, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[10656, 358, 26, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[10707, 362, 523, 17, 52, "Input"],
Cell[11233, 381, 50, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11320, 387, 160, 4, 31, "Input"],
Cell[11483, 393, 74, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11594, 400, 241, 6, 52, "Input"],
Cell[11838, 408, 3684, 76, 45, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15559, 489, 160, 4, 31, "Input"],
Cell[15722, 495, 74, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15833, 502, 344, 9, 52, "Input"],
Cell[16180, 513, 173, 4, 31, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature vup4b0l5R1DHdBwSYbUaFtYW *)
