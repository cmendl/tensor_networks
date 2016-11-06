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
NotebookDataLength[     36757,       1113]
NotebookOptionsPosition[     35039,       1032]
NotebookOutlinePosition[     35382,       1047]
CellTagsIndexPosition[     35339,       1044]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Evolution dynamics of matrix product operators", "Section"],

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

Cell["Initial MPO and Hamiltonian", "Subsection"],

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
   RowBox[{"physical", " ", "dimension"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["d", "val"], "=", "3"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"initial", " ", "MPO"}], " ", "*)"}], "\[IndentingNewLine]", 
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
           "1", ",", "5", ",", "6", ",", "4", ",", "7", ",", "4", ",", "1"}], 
           "}"}]}], ",", "zmax"}], "}"}], ",", 
       RowBox[{
        RowBox[{"zmax", "=", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "5"}]}], ";", 
        RowBox[{"Table", "[", 
         RowBox[{
          RowBox[{"If", "[", 
           RowBox[{
            RowBox[{"j", "\[Equal]", "1"}], ",", 
            RowBox[{"RandomComplex", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{"d", ",", "d", ",", 
                RowBox[{
                "D", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], 
                ",", 
                RowBox[{"D", "\[LeftDoubleBracket]", 
                 RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], 
               "}"}]}], "]"}], ",", 
            RowBox[{"If", "[", 
             RowBox[{
              RowBox[{"j", "<", "L"}], ",", 
              RowBox[{"RandomComplex", "[", 
               RowBox[{
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
                RowBox[{"{", 
                 RowBox[{"d", ",", "d", ",", 
                  RowBox[{
                  "D", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}],
                   ",", 
                  RowBox[{"D", "\[LeftDoubleBracket]", 
                   RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], 
                 "}"}]}], "]"}], ",", 
              RowBox[{"RandomComplex", "[", 
               RowBox[{
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
                RowBox[{"{", 
                 RowBox[{"d", ",", "d", ",", 
                  RowBox[{
                  "D", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}],
                   ",", 
                  RowBox[{"D", "\[LeftDoubleBracket]", 
                   RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], 
                 "}"}]}], "]"}]}], "]"}]}], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}]}], "]"}]}], 
    ";"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["A", "list"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"6", ",", "3", ",", "3"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "1", 
   "\[RightDoubleBracket]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "2", 
   "\[RightDoubleBracket]"}], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "3", ",", "1", ",", "5"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "3", ",", "5", ",", "6"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{"MPOMergeFull", "[", 
   SubscriptBox["A", "list"], "]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"729", ",", "729"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "local", " ", "real", " ", "symmetric", " ", "Hamiltonian", " ", "terms", 
    " ", "acting", " ", "on", " ", "neighboring", " ", "lattice", " ", 
    "sites"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"SeedRandom", "[", "43", "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["h", "list"], "=", 
     RowBox[{"Block", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"L", "=", 
          SubscriptBox["L", "val"]}], ",", 
         RowBox[{"d", "=", 
          SubscriptBox["d", "val"]}], ",", "t"}], "}"}], ",", 
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"t", "=", 
           RowBox[{"RandomReal", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{
               RowBox[{
                RowBox[{"-", "1"}], "/", "2"}], ",", 
               RowBox[{"1", "/", "2"}]}], "}"}], ",", 
             RowBox[{
              SuperscriptBox["d", "2"], 
              RowBox[{"{", 
               RowBox[{"1", ",", "1"}], "}"}]}]}], "]"}]}], ";", 
          RowBox[{"t", "+", 
           RowBox[{"Transpose", "[", "t", "]"}]}]}], ",", 
         RowBox[{"{", 
          RowBox[{"j", ",", 
           RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}], "]"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "9", ",", "9"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["h", "list"], "\[LeftDoubleBracket]", 
    RowBox[{"3", ",", 
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
     {"0.32610702409812875`", 
      RowBox[{"-", "0.33455997626792633`"}], 
      RowBox[{"-", "0.05861246151753163`"}]},
     {
      RowBox[{"-", "0.33455997626792633`"}], "0.8304501187007935`", 
      RowBox[{"-", "0.03228845404548841`"}]},
     {
      RowBox[{"-", "0.05861246151753163`"}], 
      RowBox[{"-", "0.03228845404548841`"}], 
      RowBox[{"-", "0.9568630075226952`"}]}
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
   RowBox[{"check", ":", " ", "symmetric"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Norm", "[", 
     RowBox[{"#", "-", 
      RowBox[{"Transpose", "[", "#", "]"}]}], "]"}], "&"}], "/@", 
   SubscriptBox["h", "list"]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.`", ",", "0.`", ",", "0.`", ",", "0.`", ",", "0.`"}], 
  "}"}]], "Output"]
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
            RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], ",", 
         "\"\<Complex128\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"save", " ", "'"}], 
    RowBox[{"h", "'"}], " ", "matrices", " ", "to", " ", "disk"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"d", "=", 
        SubscriptBox["d", "val"]}]}], "}"}], ",", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"Export", "[", 
        RowBox[{
         RowBox[{
          SubscriptBox["fn", "base"], "<>", "\"\<_h\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{"Transpose", "[", 
          RowBox[{
           RowBox[{"ArrayReshape", "[", 
            RowBox[{
             RowBox[{
              SubscriptBox["h", "list"], "\[LeftDoubleBracket]", "j", 
              "\[RightDoubleBracket]"}], ",", 
             RowBox[{"{", 
              RowBox[{"d", ",", "d", ",", "d", ",", "d"}], "}"}]}], "]"}], 
           ",", 
           RowBox[{"Reverse", "[", 
            RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], ",", 
         "\"\<Real64\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", 
         RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Strang splitting evolution", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"dt", "=", 
       RowBox[{
        RowBox[{"1", "/", "5"}], "+", 
        RowBox[{"\[ImaginaryI]", "/", "8"}]}]}], ",", 
      RowBox[{"tol", "=", 
       SuperscriptBox["10", 
        RowBox[{"-", "5"}]]}], ",", 
      RowBox[{"nsteps", "=", "7"}]}], "}"}], ",", 
    RowBox[{
     SubscriptBox["A", 
      RowBox[{"strang", ",", "dt"}]], "=", 
     RowBox[{"MPOEvolution", "[", 
      RowBox[{"MPOStrangStep", ",", 
       SubscriptBox["A", "list"], ",", 
       SubscriptBox["h", "list"], ",", 
       RowBox[{"nsteps", " ", "dt"}], ",", "nsteps", ",", "tol"}], "]"}]}]}], 
   "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", "%"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "1", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "9", ",", "67"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "67", ",", "92"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "92", ",", "70"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "70", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "9", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["A", 
     RowBox[{"strang", ",", 
      RowBox[{
       RowBox[{"1", "/", "5"}], "+", 
       RowBox[{"\[ImaginaryI]", "/", "8"}]}]}]], "\[LeftDoubleBracket]", 
    RowBox[{"3", ",", "1", ",", "2", ",", 
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
      RowBox[{"0.004023046267870201`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.050158970375234084`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.024666082754910126`"}], "-", 
       RowBox[{"0.008265102592267905`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.000020532825156326106`"}], "-", 
       RowBox[{"0.000015125762777170855`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.03055356144660695`"}], "+", 
       RowBox[{"0.007763956133659324`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.04747797923293115`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.03763690042648529`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.000015591447523000374`"}], "-", 
       RowBox[{"0.00004214078243471196`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.06369283089215291`"}], "-", 
       RowBox[{"0.05153790005938487`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.03281931360064594`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.024305975272769745`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.0004985600991554503`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.0005027789796477409`", " ", "\[ImaginaryI]"}]}]}
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

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"save", " ", "first", " ", "few", " ", "entries", " ", "of", " ", 
     RowBox[{"merged", " ", "'"}], 
     RowBox[{"A", "'"}], " ", "tensors", " ", "to", " ", "disk"}], ",", " ", 
    RowBox[{"after", " ", "appropriate", " ", "reordering"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], "}"}], ",", 
     RowBox[{"Export", "[", 
      RowBox[{
       RowBox[{
        SubscriptBox["fn", "base"], "<>", "\"\<_A_strang5i8_m.dat\>\""}], ",", 
       RowBox[{
        RowBox[{"Flatten", "[", 
         RowBox[{"Transpose", "[", 
          RowBox[{
           RowBox[{"ArrayReshape", "[", 
            RowBox[{
             RowBox[{"MPOMergeFull", "[", 
              SubscriptBox["A", 
               RowBox[{"strang", ",", 
                RowBox[{
                 RowBox[{"1", "/", "5"}], "+", 
                 RowBox[{"\[ImaginaryI]", "/", "8"}]}]}]], "]"}], ",", 
             RowBox[{"ConstantArray", "[", 
              RowBox[{
               SubscriptBox["d", "val"], ",", 
               RowBox[{"2", "L"}]}], "]"}]}], "]"}], ",", 
           RowBox[{"Reverse", "[", 
            RowBox[{"Range", "[", 
             RowBox[{"2", "L"}], "]"}], "]"}]}], "]"}], "]"}], 
        "\[LeftDoubleBracket]", 
        RowBox[{"1", ";;", "1764"}], "\[RightDoubleBracket]"}], ",", 
       "\"\<Complex128\>\""}], "]"}]}], "]"}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"dt", "=", 
       RowBox[{
        RowBox[{"1", "/", "6"}], "+", 
        RowBox[{"\[ImaginaryI]", "/", "7"}]}]}], ",", 
      RowBox[{"tol", "=", 
       SuperscriptBox["10", 
        RowBox[{"-", "5"}]]}], ",", 
      RowBox[{"nsteps", "=", "7"}]}], "}"}], ",", 
    RowBox[{
     SubscriptBox["A", 
      RowBox[{"strang", ",", "liouville", ",", "dt"}]], "=", 
     RowBox[{"MPOEvolution", "[", 
      RowBox[{"MPOStrangLiouvilleStep", ",", 
       SubscriptBox["A", "list"], ",", 
       SubscriptBox["h", "list"], ",", 
       RowBox[{"nsteps", " ", "dt"}], ",", "nsteps", ",", "tol"}], "]"}]}]}], 
   "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", "%"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "1", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "9", ",", "75"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "75", ",", "179"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "179", ",", "75"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "75", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "9", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["A", 
     RowBox[{"strang", ",", "liouville", ",", 
      RowBox[{
       RowBox[{"1", "/", "6"}], "+", 
       RowBox[{"\[ImaginaryI]", "/", "7"}]}]}]], "\[LeftDoubleBracket]", 
    RowBox[{"3", ",", "1", ",", "2", ",", 
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
      RowBox[{"0.05987388009034767`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.03389062333753873`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.01595349056518676`"}], "-", 
       RowBox[{"0.003203904595149732`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "2.540504131528609`*^-7"}], "-", 
       RowBox[{"5.404461015930618`*^-6", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.01163097788511894`"}], "+", 
       RowBox[{"0.14356873323791558`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.032275442125390644`"}], "-", 
       RowBox[{"0.018111599838047738`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.000011069784046632453`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.0000230070648117969`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.026063194492232003`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.010283227580036811`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.03013357472699331`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.02304185489148888`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.006145865504077307`"}], "+", 
       RowBox[{"0.0005002598873600067`", " ", "\[ImaginaryI]"}]}]}
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

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"save", " ", "first", " ", "few", " ", "entries", " ", "of", " ", 
     RowBox[{"merged", " ", "'"}], 
     RowBox[{"A", "'"}], " ", "tensors", " ", "to", " ", "disk"}], ",", " ", 
    RowBox[{"after", " ", "appropriate", " ", "reordering"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], "}"}], ",", 
     RowBox[{"Export", "[", 
      RowBox[{
       RowBox[{
        SubscriptBox["fn", "base"], "<>", "\"\<_A_Lstrang6i7_m.dat\>\""}], 
       ",", 
       RowBox[{
        RowBox[{"Flatten", "[", 
         RowBox[{"Transpose", "[", 
          RowBox[{
           RowBox[{"ArrayReshape", "[", 
            RowBox[{
             RowBox[{"MPOMergeFull", "[", 
              SubscriptBox["A", 
               RowBox[{"strang", ",", "liouville", ",", 
                RowBox[{
                 RowBox[{"1", "/", "6"}], "+", 
                 RowBox[{"\[ImaginaryI]", "/", "7"}]}]}]], "]"}], ",", 
             RowBox[{"ConstantArray", "[", 
              RowBox[{
               SubscriptBox["d", "val"], ",", 
               RowBox[{"2", "L"}]}], "]"}]}], "]"}], ",", 
           RowBox[{"Reverse", "[", 
            RowBox[{"Range", "[", 
             RowBox[{"2", "L"}], "]"}], "]"}]}], "]"}], "]"}], 
        "\[LeftDoubleBracket]", 
        RowBox[{"1", ";;", "1764"}], "\[RightDoubleBracket]"}], ",", 
       "\"\<Complex128\>\""}], "]"}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["SRKNb6 splitting evolution", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"dt", "=", 
       RowBox[{
        RowBox[{"1", "/", "11"}], "+", 
        RowBox[{"\[ImaginaryI]", "/", "9"}]}]}], ",", 
      RowBox[{"tol", "=", 
       SuperscriptBox["10", 
        RowBox[{"-", "5"}]]}], ",", 
      RowBox[{"nsteps", "=", "7"}]}], "}"}], ",", 
    RowBox[{
     SubscriptBox["A", 
      RowBox[{"SRKNb6", ",", "dt"}]], "=", 
     RowBox[{"MPOEvolution", "[", 
      RowBox[{"MPOSRKNb6Step", ",", 
       SubscriptBox["A", "list"], ",", 
       SubscriptBox["h", "list"], ",", 
       RowBox[{"nsteps", " ", "dt"}], ",", "nsteps", ",", "tol"}], "]"}]}]}], 
   "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", "%"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "1", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "9", ",", "77"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "77", ",", "155"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "155", ",", "78"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "78", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "9", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["A", 
     RowBox[{"SRKNb6", ",", 
      RowBox[{
       RowBox[{"1", "/", "11"}], "+", 
       RowBox[{"\[ImaginaryI]", "/", "9"}]}]}]], "\[LeftDoubleBracket]", 
    RowBox[{"3", ",", "1", ",", "2", ",", 
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
      RowBox[{"0.0429176939373579`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.01757378776727101`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.024752316105221623`"}], "-", 
       RowBox[{"0.025610444699887033`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.000915369805269174`"}], "-", 
       RowBox[{"0.0007984103088117931`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.009928947041578949`"}], "-", 
       RowBox[{"0.018202612447105568`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.07679916868324185`"}], "-", 
       RowBox[{"0.007892771004261688`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.001331250425219752`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.0007980115579216445`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.009990763924016637`"}], "-", 
       RowBox[{"0.0005510283915844674`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.005500061992822341`"}], "-", 
       RowBox[{"0.008072609475353716`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.0010066810603397965`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.0003037077543303937`", " ", "\[ImaginaryI]"}]}]}
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

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"save", " ", "first", " ", "few", " ", "entries", " ", "of", " ", 
     RowBox[{"merged", " ", "'"}], 
     RowBox[{"A", "'"}], " ", "tensors", " ", "to", " ", "disk"}], ",", " ", 
    RowBox[{"after", " ", "appropriate", " ", "reordering"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], "}"}], ",", 
     RowBox[{"Export", "[", 
      RowBox[{
       RowBox[{
        SubscriptBox["fn", "base"], "<>", "\"\<_A_srkn11i9_m.dat\>\""}], ",", 
       RowBox[{
        RowBox[{"Flatten", "[", 
         RowBox[{"Transpose", "[", 
          RowBox[{
           RowBox[{"ArrayReshape", "[", 
            RowBox[{
             RowBox[{"MPOMergeFull", "[", 
              SubscriptBox["A", 
               RowBox[{"SRKNb6", ",", 
                RowBox[{
                 RowBox[{"1", "/", "11"}], "+", 
                 RowBox[{"\[ImaginaryI]", "/", "9"}]}]}]], "]"}], ",", 
             RowBox[{"ConstantArray", "[", 
              RowBox[{
               SubscriptBox["d", "val"], ",", 
               RowBox[{"2", "L"}]}], "]"}]}], "]"}], ",", 
           RowBox[{"Reverse", "[", 
            RowBox[{"Range", "[", 
             RowBox[{"2", "L"}], "]"}], "]"}]}], "]"}], "]"}], 
        "\[LeftDoubleBracket]", 
        RowBox[{"1", ";;", "1764"}], "\[RightDoubleBracket]"}], ",", 
       "\"\<Complex128\>\""}], "]"}]}], "]"}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"dt", "=", 
       RowBox[{
        RowBox[{
         RowBox[{"-", "1"}], "/", "3"}], "+", 
        RowBox[{"\[ImaginaryI]", "/", "5"}]}]}], ",", 
      RowBox[{"tol", "=", 
       SuperscriptBox["10", 
        RowBox[{"-", "5"}]]}], ",", 
      RowBox[{"nsteps", "=", "7"}]}], "}"}], ",", 
    RowBox[{
     SubscriptBox["A", 
      RowBox[{"SRKNb6", ",", "liouville", ",", "dt"}]], "=", 
     RowBox[{"MPOEvolution", "[", 
      RowBox[{"MPOSRKNb6LiouvilleStep", ",", 
       SubscriptBox["A", "list"], ",", 
       SubscriptBox["h", "list"], ",", 
       RowBox[{"nsteps", " ", "dt"}], ",", "nsteps", ",", "tol"}], "]"}]}]}], 
   "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", "%"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "1", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "9", ",", "78"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "78", ",", "284"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "284", ",", "78"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "78", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "9", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["A", 
     RowBox[{"SRKNb6", ",", "liouville", ",", 
      RowBox[{
       RowBox[{
        RowBox[{"-", "1"}], "/", "3"}], "+", 
       RowBox[{"\[ImaginaryI]", "/", "5"}]}]}]], "\[LeftDoubleBracket]", 
    RowBox[{"3", ",", "1", ",", "2", ",", 
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
      RowBox[{"4.680041807418202`", "\[VeryThinSpace]", "-", 
       RowBox[{"3.054838939022962`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"1.338298370852282`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.16704684147974336`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.02061589375687384`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.015298567072061519`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.9038163517896914`"}], "-", 
       RowBox[{"8.413921743188377`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"4.039312717690092`", "\[VeryThinSpace]", "+", 
       RowBox[{"1.1173975721943836`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.028222097983415392`"}], "-", 
       RowBox[{"0.011017808329707252`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.09688639193091364`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.08030090545626525`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.027476375337565317`"}], "-", 
       RowBox[{"0.16127233634844648`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.011841221422593376`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.08529691105375581`", " ", "\[ImaginaryI]"}]}]}
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

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"save", " ", "first", " ", "few", " ", "entries", " ", "of", " ", 
     RowBox[{"merged", " ", "'"}], 
     RowBox[{"A", "'"}], " ", "tensors", " ", "to", " ", "disk"}], ",", " ", 
    RowBox[{"after", " ", "appropriate", " ", "reordering"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], "}"}], ",", 
     RowBox[{"Export", "[", 
      RowBox[{
       RowBox[{
        SubscriptBox["fn", "base"], "<>", "\"\<_A_Lsrkn3i5_m.dat\>\""}], ",", 
       RowBox[{
        RowBox[{"Flatten", "[", 
         RowBox[{"Transpose", "[", 
          RowBox[{
           RowBox[{"ArrayReshape", "[", 
            RowBox[{
             RowBox[{"MPOMergeFull", "[", 
              SubscriptBox["A", 
               RowBox[{"SRKNb6", ",", "liouville", ",", 
                RowBox[{
                 RowBox[{
                  RowBox[{"-", "1"}], "/", "3"}], "+", 
                 RowBox[{"\[ImaginaryI]", "/", "5"}]}]}]], "]"}], ",", 
             RowBox[{"ConstantArray", "[", 
              RowBox[{
               SubscriptBox["d", "val"], ",", 
               RowBox[{"2", "L"}]}], "]"}]}], "]"}], ",", 
           RowBox[{"Reverse", "[", 
            RowBox[{"Range", "[", 
             RowBox[{"2", "L"}], "]"}], "]"}]}], "]"}], "]"}], 
        "\[LeftDoubleBracket]", 
        RowBox[{"1", ";;", "1764"}], "\[RightDoubleBracket]"}], ",", 
       "\"\<Complex128\>\""}], "]"}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1767, 920},
WindowMargins->{{Automatic, 153}, {85, Automatic}},
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
Cell[1486, 35, 65, 0, 63, "Section"],
Cell[1554, 37, 1172, 26, 239, "Text"],
Cell[2729, 65, 123, 3, 31, "Input"],
Cell[2855, 70, 69, 1, 31, "Input"],
Cell[2927, 73, 174, 5, 31, "Input"],
Cell[CellGroupData[{
Cell[3126, 82, 49, 0, 43, "Subsection"],
Cell[3178, 84, 233, 7, 52, "Input"],
Cell[3414, 93, 209, 6, 52, "Input"],
Cell[3626, 101, 2931, 77, 92, "Input"],
Cell[CellGroupData[{
Cell[6582, 182, 88, 2, 31, "Input"],
Cell[6673, 186, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6793, 193, 323, 8, 52, "Input"],
Cell[7119, 203, 93, 2, 31, "Output"],
Cell[7215, 207, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7345, 214, 128, 3, 31, "Input"],
Cell[7476, 219, 77, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7590, 226, 1454, 42, 95, "Input"],
Cell[9047, 270, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[9167, 277, 447, 13, 52, "Input"],
Cell[9617, 292, 940, 25, 71, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[10594, 322, 314, 10, 52, "Input"],
Cell[10911, 334, 116, 3, 31, "Output"]
}, Open  ]],
Cell[11042, 340, 1058, 30, 52, "Input"],
Cell[12103, 372, 1361, 39, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13501, 416, 48, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[13574, 420, 773, 23, 54, "Input"],
Cell[14350, 445, 533, 14, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14920, 464, 590, 17, 52, "Input"],
Cell[15513, 483, 1782, 41, 74, "Output"]
}, Open  ]],
Cell[17310, 527, 1539, 40, 52, "Input"],
Cell[CellGroupData[{
Cell[18874, 571, 800, 23, 54, "Input"],
Cell[19677, 596, 535, 14, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20249, 615, 608, 17, 52, "Input"],
Cell[20860, 634, 1775, 41, 76, "Output"]
}, Open  ]],
Cell[22650, 678, 1566, 41, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[24253, 724, 48, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[24326, 728, 774, 23, 54, "Input"],
Cell[25103, 753, 535, 14, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[25675, 772, 591, 17, 52, "Input"],
Cell[26269, 791, 1779, 42, 74, "Output"]
}, Open  ]],
Cell[28063, 836, 1539, 40, 52, "Input"],
Cell[CellGroupData[{
Cell[29627, 880, 825, 24, 54, "Input"],
Cell[30455, 906, 535, 14, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[31027, 925, 632, 18, 52, "Input"],
Cell[31662, 945, 1744, 39, 74, "Output"]
}, Open  ]],
Cell[33421, 987, 1590, 41, 52, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature QvT8UasLOlz6qDgk8u34gD8H *)
