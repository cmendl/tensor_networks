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
NotebookDataLength[     23868,        782]
NotebookOptionsPosition[     22474,        712]
NotebookOutlinePosition[     22817,        727]
CellTagsIndexPosition[     22774,        724]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Operations on Matrix Product Operators and States", "Section"],

Cell[TextData[{
 "References:\n\tF. Verstraete, V. Murg, J. I. Cirac\n\tMatrix product \
states, projected entangled pair states, and variational renormalization \
group methods for quantum spin systems\n\tAdvances in Physics 57, 143-224 \
(2008) ",
 ButtonBox["DOI",
  BaseStyle->"Hyperlink",
  ButtonData->{
    URL["http://dx.doi.org/10.1080/14789940801912366"], None},
  ButtonNote->"http://dx.doi.org/10.1080/14789940801912366"],
 "\n\n\tUlrich Schollw\[ODoubleDot]ck\n\tThe density-matrix renormalization \
group in the age of matrix product states\n\tAnnals of Physics 326, 96-192 \
(2011) ",
 ButtonBox["DOI",
  BaseStyle->"Hyperlink",
  ButtonData->{
    URL["http://dx.doi.org/10.1016/j.aop.2010.09.012"], None},
  ButtonNote->"http://dx.doi.org/10.1016/j.aop.2010.09.012"],
 "\n\n\tThomas Barthel\n\tPrecise evaluation of thermal response functions by \
optimized density matrix renormalization group schemes\n\tNew Journal of \
Physics 15, 073010 (2013) ",
 ButtonBox["DOI",
  BaseStyle->"Hyperlink",
  ButtonData->{
    URL["http://dx.doi.org/10.1088/1367-2630/15/7/073010"], None},
  ButtonNote->"http://dx.doi.org/10.1088/1367-2630/15/7/073010"]
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
   RowBox[{"FileBaseName", "[", 
    RowBox[{"NotebookFileName", "[", "]"}], "]"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell["Average (expectation value) of operator and state", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"number", " ", "of", " ", "lattice", " ", "sites"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["L", "val"], "=", "6"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"made", "-", 
    RowBox[{"up", " ", "physical", " ", "dimension"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["d", "val"], "=", "3"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"matrix", " ", "product", " ", "state"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"SeedRandom", "[", "42", "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["A", "list"], "=", 
     RowBox[{"Block", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"L", "=", 
          SubscriptBox["L", "val"]}], ",", 
         RowBox[{"d", "=", 
          SubscriptBox["d", "val"]}], ",", 
         RowBox[{"D", "=", 
          RowBox[{"{", 
           RowBox[{
           "1", ",", "7", ",", "6", ",", "4", ",", "5", ",", "8", ",", "1"}], 
           "}"}]}], ",", 
         RowBox[{"zmax", "=", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "3"}]}]}], "}"}],
        ",", 
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"RandomComplex", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"d", ",", 
             RowBox[{
             "D", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], ",", 
             RowBox[{"D", "\[LeftDoubleBracket]", 
              RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "}"}]}], 
          "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}]}], 
    ";"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["A", "list"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"6", ",", "3"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"state", " ", 
    RowBox[{"(", "wavefunction", ")"}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["\[Psi]", "val"], "=", 
     RowBox[{"MPSMergeFull", "[", 
      SubscriptBox["A", "list"], "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", "729", "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"not", " ", "normalized"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   SubscriptBox["\[Psi]", "val"], "]"}]}]], "Input"],

Cell[BoxData["0.9160965803846459`"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"matrix", " ", "product", " ", "operator"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"SeedRandom", "[", "43", "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["W", "list"], "=", 
     RowBox[{"Block", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"L", "=", 
          SubscriptBox["L", "val"]}], ",", 
         RowBox[{"d", "=", 
          SubscriptBox["d", "val"]}], ",", 
         RowBox[{"D", "=", 
          RowBox[{"{", 
           RowBox[{
           "1", ",", "5", ",", "6", ",", "4", ",", "7", ",", "4", ",", "1"}], 
           "}"}]}], ",", 
         RowBox[{"zmax", "=", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", 
           SqrtBox["2"]}]}]}], "}"}], ",", 
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"RandomComplex", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"d", ",", "d", ",", 
             RowBox[{
             "D", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], ",", 
             RowBox[{"D", "\[LeftDoubleBracket]", 
              RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "}"}]}], 
          "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}]}], 
    ";"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["W", "list"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"6", ",", "3", ",", "3"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["W", "full"], "=", 
   RowBox[{"MPOMergeFull", "[", 
    SubscriptBox["W", "list"], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}], "\[IndentingNewLine]", 
 RowBox[{"Times", "@@", "%"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"729", ",", "729"}], "}"}]], "Output"],

Cell[BoxData["531441"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["W", "full"], "\[LeftDoubleBracket]", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"1", ",", "2", ",", 
       RowBox[{"-", "1"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "2", ",", 
       RowBox[{"-", "1"}]}], "}"}]}], "\[RightDoubleBracket]"}], "//", 
   "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{
       RowBox[{"-", "0.19584560020079966`"}], "-", 
       RowBox[{"0.9141044807511445`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.6998698500277544`"}], "+", 
       RowBox[{"0.5418731189831685`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.8942042233586124`", "\[VeryThinSpace]", "+", 
       RowBox[{"1.0494697325252549`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.9981957155467744`"}], "+", 
       RowBox[{"0.9464428150506646`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.04125978280547837`", "\[VeryThinSpace]", "+", 
       RowBox[{"1.3323786714217518`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "1.2877958646858065`"}], "+", 
       RowBox[{"0.40039573088010605`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"2.259339020975282`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.8349637236220881`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.6454441612528128`", "\[VeryThinSpace]", "+", 
       RowBox[{"1.2362001550969692`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"1.3126051958223448`", "\[VeryThinSpace]", "+", 
       RowBox[{"3.9146140575910273`", " ", "\[ImaginaryI]"}]}]}
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
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"average", " ", 
    RowBox[{"(", 
     RowBox[{"expectation", " ", "value"}], ")"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Conjugate", "[", 
    SubscriptBox["\[Psi]", "val"], "]"}], ".", 
   RowBox[{"(", 
    RowBox[{
     SubscriptBox["W", "full"], ".", 
     SubscriptBox["\[Psi]", "val"]}], ")"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"0.13951174201351324`", "\[VeryThinSpace]", "+", 
  RowBox[{"0.418058504881752`", " ", "\[ImaginaryI]"}]}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"save", " ", "'"}], 
    RowBox[{"A", "'"}], " ", "tensors", " ", "to", " ", "disk"}], " ", "*)"}],
   "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], "}"}], ",", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"Export", "[", 
        RowBox[{
         RowBox[{
          SubscriptBox["fn", "base"], "<>", "\"\<_A\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{"Transpose", "[", 
          RowBox[{
           RowBox[{
            SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "j", 
            "\[RightDoubleBracket]"}], ",", 
           RowBox[{"Reverse", "[", 
            RowBox[{"Range", "[", "3", "]"}], "]"}]}], "]"}], ",", 
         "\"\<Complex128\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"save", " ", "'"}], 
    RowBox[{"W", "'"}], " ", "tensors", " ", "to", " ", "disk"}], " ", "*)"}],
   "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], "}"}], ",", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"Export", "[", 
        RowBox[{
         RowBox[{
          SubscriptBox["fn", "base"], "<>", "\"\<_W\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{"Transpose", "[", 
          RowBox[{
           RowBox[{
            SubscriptBox["W", "list"], "\[LeftDoubleBracket]", "j", 
            "\[RightDoubleBracket]"}], ",", 
           RowBox[{"Reverse", "[", 
            RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], ",", 
         "\"\<Complex128\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Apply local Hamiltonian operator", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "5", 
   "\[RightDoubleBracket]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "5", ",", "8"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["W", "list"], "\[LeftDoubleBracket]", "5", 
   "\[RightDoubleBracket]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "3", ",", "7", ",", "4"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "fictitious", " ", "left", " ", "and", " ", "right", " ", "tensor", " ", 
    "blocks"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"SeedRandom", "[", "44", "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["BL", "val"], "=", 
     RowBox[{"Block", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"zmax", "=", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "3"}]}], "}"}], 
       ",", 
       RowBox[{"RandomComplex", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"5", ",", "7", ",", "6"}], "}"}]}], "]"}]}], "]"}]}], ";"}],
    "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["BR", "val"], "=", 
     RowBox[{"Block", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"zmax", "=", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "3"}]}], "}"}], 
       ",", 
       RowBox[{"RandomComplex", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"8", ",", "4", ",", "9"}], "}"}]}], "]"}]}], "]"}]}], 
    ";"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"construct", " ", "local", " ", "Hamiltonian"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["H", "local"], "=", 
     RowBox[{"Block", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"W", "=", 
          RowBox[{
           SubscriptBox["W", "list"], "\[LeftDoubleBracket]", "5", 
           "\[RightDoubleBracket]"}]}], ",", 
         RowBox[{"BL", "=", 
          SubscriptBox["BL", "val"]}], ",", 
         RowBox[{"BR", "=", 
          SubscriptBox["BR", "val"]}]}], "}"}], ",", 
       RowBox[{"Transpose", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"Transpose", "[", 
           RowBox[{"BL", ",", 
            RowBox[{"{", 
             RowBox[{"2", ",", "3", ",", "1"}], "}"}]}], "]"}], ".", 
          RowBox[{"Transpose", "[", 
           RowBox[{"W", ",", 
            RowBox[{"{", 
             RowBox[{"2", ",", "3", ",", "1", ",", "4"}], "}"}]}], "]"}], ".", 
          RowBox[{"Transpose", "[", 
           RowBox[{"BR", ",", 
            RowBox[{"{", 
             RowBox[{"3", ",", "1", ",", "2"}], "}"}]}], "]"}]}], ",", 
         RowBox[{"{", 
          RowBox[{"2", ",", "5", ",", "1", ",", "4", ",", "3", ",", "6"}], 
          "}"}]}], "]"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "6", ",", "9", ",", "3", ",", "5", ",", "8"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "apply", " ", "Hamiltonian", " ", "to", " ", "MPS", " ", "tensor"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["HM", "local"], "=", 
     RowBox[{
      RowBox[{"ArrayReshape", "[", 
       RowBox[{
        SubscriptBox["H", "local"], ",", 
        RowBox[{"{", 
         RowBox[{"3", ",", "6", ",", "9", ",", 
          RowBox[{"3", " ", "5", " ", "8"}]}], "}"}]}], "]"}], ".", 
      RowBox[{"Flatten", "[", 
       RowBox[{
        SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "5", 
        "\[RightDoubleBracket]"}], "]"}]}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "6", ",", "9"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"DotMultiDim", "[", 
   RowBox[{"A_", ",", "B_", ",", "n_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"dimA", "=", 
       RowBox[{"Dimensions", "[", "A", "]"}]}], ",", 
      RowBox[{"dimB", "=", 
       RowBox[{"Dimensions", "[", "B", "]"}]}]}], "}"}], ",", 
    RowBox[{
     RowBox[{"ArrayReshape", "[", 
      RowBox[{"A", ",", 
       RowBox[{"Append", "[", 
        RowBox[{
         RowBox[{"dimA", "\[LeftDoubleBracket]", 
          RowBox[{"1", ";;", 
           RowBox[{
            RowBox[{"-", "n"}], "-", "1"}]}], "\[RightDoubleBracket]"}], ",", 
         RowBox[{"Times", "@@", 
          RowBox[{"dimA", "\[LeftDoubleBracket]", 
           RowBox[{
            RowBox[{"-", "n"}], ";;", 
            RowBox[{"-", "1"}]}], "\[RightDoubleBracket]"}]}]}], "]"}]}], 
      "]"}], ".", 
     RowBox[{"ArrayReshape", "[", 
      RowBox[{"B", ",", 
       RowBox[{"Prepend", "[", 
        RowBox[{
         RowBox[{"dimB", "\[LeftDoubleBracket]", 
          RowBox[{
           RowBox[{"n", "+", "1"}], ";;", 
           RowBox[{"-", "1"}]}], "\[RightDoubleBracket]"}], ",", 
         RowBox[{"Times", "@@", 
          RowBox[{"dimB", "\[LeftDoubleBracket]", 
           RowBox[{"1", ";;", "n"}], "\[RightDoubleBracket]"}]}]}], "]"}]}], 
      "]"}]}]}], "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"compare", " ", "with", " ", "alternative", " ", "contraction"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Block", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"M", "=", 
         RowBox[{
          SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "5", 
          "\[RightDoubleBracket]"}]}], ",", 
        RowBox[{"W", "=", 
         RowBox[{
          SubscriptBox["W", "list"], "\[LeftDoubleBracket]", "5", 
          "\[RightDoubleBracket]"}]}], ",", 
        RowBox[{"BL", "=", 
         SubscriptBox["BL", "val"]}], ",", 
        RowBox[{"BR", "=", 
         SubscriptBox["BR", "val"]}]}], "}"}], ",", 
      RowBox[{"Transpose", "[", 
       RowBox[{
        RowBox[{"DotMultiDim", "[", 
         RowBox[{
          RowBox[{"Transpose", "[", 
           RowBox[{
            RowBox[{"DotMultiDim", "[", 
             RowBox[{
              RowBox[{"Transpose", "[", 
               RowBox[{"W", ",", 
                RowBox[{"{", 
                 RowBox[{"1", ",", "3", ",", "2", ",", "4"}], "}"}]}], "]"}], 
              ",", 
              RowBox[{"Transpose", "[", 
               RowBox[{
                RowBox[{"M", ".", "BR"}], ",", 
                RowBox[{"{", 
                 RowBox[{"1", ",", "3", ",", "2", ",", "4"}], "}"}]}], "]"}], 
              ",", "2"}], "]"}], ",", 
            RowBox[{"{", 
             RowBox[{"1", ",", "4", ",", "3", ",", "2"}], "}"}]}], "]"}], ",",
           "BL", ",", "2"}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"1", ",", "3", ",", "2"}], "}"}]}], "]"}]}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{"Flatten", "[", 
     RowBox[{"%", "-", 
      SubscriptBox["HM", "local"]}], "]"}], "]"}]}]}]], "Input"],

Cell[BoxData["4.602592439394806`*^-15"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "as", " ", "reference", " ", "to", " ", "disk"}], " ",
    "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_BL.dat\>\""}], ",", 
      RowBox[{"Transpose", "[", 
       RowBox[{
        SubscriptBox["BL", "val"], ",", 
        RowBox[{"Reverse", "[", 
         RowBox[{"Range", "[", "3", "]"}], "]"}]}], "]"}], ",", 
      "\"\<Complex128\>\""}], "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_BR.dat\>\""}], ",", 
      RowBox[{"Transpose", "[", 
       RowBox[{
        SubscriptBox["BR", "val"], ",", 
        RowBox[{"Reverse", "[", 
         RowBox[{"Range", "[", "3", "]"}], "]"}]}], "]"}], ",", 
      "\"\<Complex128\>\""}], "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_HM.dat\>\""}], ",", 
      RowBox[{"Transpose", "[", 
       RowBox[{
        SubscriptBox["HM", "local"], ",", 
        RowBox[{"Reverse", "[", 
         RowBox[{"Range", "[", "3", "]"}], "]"}]}], "]"}], ",", 
      "\"\<Complex128\>\""}], "]"}], ";"}]}]}]], "Input"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1560, 920},
WindowMargins->{{227, Automatic}, {84, Automatic}},
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
Cell[1486, 35, 68, 0, 63, "Section"],
Cell[1557, 37, 1172, 26, 239, "Text"],
Cell[2732, 65, 123, 3, 31, "Input"],
Cell[2858, 70, 69, 1, 31, "Input"],
Cell[2930, 73, 174, 5, 31, "Input"],
Cell[CellGroupData[{
Cell[3129, 82, 71, 0, 43, "Subsection"],
Cell[3203, 84, 233, 7, 52, "Input"],
Cell[3439, 93, 251, 8, 52, "Input"],
Cell[3693, 103, 1506, 45, 72, "Input"],
Cell[CellGroupData[{
Cell[5224, 152, 88, 2, 31, "Input"],
Cell[5315, 156, 73, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5425, 163, 392, 11, 72, "Input"],
Cell[5820, 176, 52, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5909, 182, 198, 5, 52, "Input"],
Cell[6110, 189, 46, 0, 31, "Output"]
}, Open  ]],
Cell[6171, 192, 1532, 45, 80, "Input"],
Cell[CellGroupData[{
Cell[7728, 241, 88, 2, 31, "Input"],
Cell[7819, 245, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7939, 252, 281, 7, 72, "Input"],
Cell[8223, 261, 77, 2, 31, "Output"],
Cell[8303, 265, 33, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[8373, 270, 437, 13, 52, "Input"],
Cell[8813, 285, 1738, 40, 74, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[10588, 330, 400, 13, 52, "Input"],
Cell[10991, 345, 141, 2, 31, "Output"]
}, Open  ]],
Cell[11147, 350, 1058, 30, 52, "Input"],
Cell[12208, 382, 1058, 30, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13303, 417, 54, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[13382, 421, 160, 4, 31, "Input"],
Cell[13545, 427, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13665, 434, 160, 4, 31, "Input"],
Cell[13828, 440, 93, 2, 31, "Output"]
}, Open  ]],
Cell[13936, 445, 1432, 46, 92, "Input"],
Cell[CellGroupData[{
Cell[15393, 495, 1414, 39, 72, "Input"],
Cell[16810, 536, 116, 3, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16963, 544, 738, 21, 72, "Input"],
Cell[17704, 567, 83, 2, 31, "Output"]
}, Open  ]],
Cell[17802, 572, 1374, 38, 52, "Input"],
Cell[CellGroupData[{
Cell[19201, 614, 1835, 51, 92, "Input"],
Cell[21039, 667, 50, 0, 31, "Output"]
}, Open  ]],
Cell[21104, 670, 1342, 38, 92, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature SvTew17DdQcTFBgxxwR@iM89 *)
