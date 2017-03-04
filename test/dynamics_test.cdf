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
NotebookDataLength[     35697,       1094]
NotebookOptionsPosition[     34022,       1014]
NotebookOutlinePosition[     34365,       1029]
CellTagsIndexPosition[     34322,       1026]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Evolution dynamics of matrix product operators", "Section"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";"}]], "Input"],

Cell[BoxData[
 RowBox[{"<<", "../mathematica/tn_base.m"}]], "Input"],

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
   RowBox[{
    RowBox[{"initial", " ", "MPO"}], ",", " ", 
    RowBox[{
    "setting", " ", "all", " ", "quantum", " ", "numbers", " ", "to", " ", 
     "zero"}]}], " ", "*)"}], "\[IndentingNewLine]", 
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
          RowBox[{"{", 
           RowBox[{
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
            RowBox[{"ConstantArray", "[", 
             RowBox[{"0", ",", 
              RowBox[{
              "D", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}]}], 
             "]"}], ",", 
            RowBox[{"ConstantArray", "[", 
             RowBox[{"0", ",", 
              RowBox[{"D", "\[LeftDoubleBracket]", 
               RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "]"}]}], 
           "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}]}], "]"}]}], 
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

Cell[BoxData[{
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", "list"], "\[LeftDoubleBracket]", 
   RowBox[{"1", ",", "1"}], "\[RightDoubleBracket]"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", "list"], "\[LeftDoubleBracket]", 
   RowBox[{"2", ",", "1"}], "\[RightDoubleBracket]"}], "]"}]}], "Input"],

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
   RowBox[{"First", "/@", 
    SubscriptBox["A", "list"]}], "]"}], "]"}]], "Input"],

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
            SubscriptBox["A", "list"], "\[LeftDoubleBracket]", 
            RowBox[{"j", ",", "1"}], "\[RightDoubleBracket]"}], ",", 
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
     RowBox[{"MPOStrangEvolution", "[", 
      RowBox[{
       SubscriptBox["A", "list"], ",", 
       SubscriptBox["h", "list"], ",", 
       RowBox[{"ConstantArray", "[", 
        RowBox[{"0", ",", 
         SubscriptBox["d", "val"]}], "]"}], ",", 
       RowBox[{"nsteps", " ", "dt"}], ",", "nsteps", ",", "tol"}], "]"}]}]}], 
   "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", 
  RowBox[{"(", 
   RowBox[{"First", "/@", "%"}], ")"}]}]}], "Input"],

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
    RowBox[{"3", ",", "1", ",", "1", ",", "2", ",", 
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
      RowBox[{"0.004023046267869798`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.050158970375234146`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.024666082754910765`"}], "-", 
       RowBox[{"0.008265102592267228`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.000020532825156312337`"}], "-", 
       RowBox[{"0.00001512576277717181`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.030553561446606568`"}], "+", 
       RowBox[{"0.007763956133659312`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.04747797923293104`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.0376369004264845`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.00001559144752300371`"}], "-", 
       RowBox[{"0.000042140782434714634`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.06369283089215637`"}], "-", 
       RowBox[{"0.05153790005938258`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.03281931360064281`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.02430597527277171`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.0004985600991551549`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.0005027789796476524`", " ", "\[ImaginaryI]"}]}]}
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
              RowBox[{"First", "/@", 
               SubscriptBox["A", 
                RowBox[{"strang", ",", 
                 RowBox[{
                  RowBox[{"1", "/", "5"}], "+", 
                  RowBox[{"\[ImaginaryI]", "/", "8"}]}]}]]}], "]"}], ",", 
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
     RowBox[{"MPOStrangLiouvilleEvolution", "[", 
      RowBox[{
       SubscriptBox["A", "list"], ",", 
       SubscriptBox["h", "list"], ",", 
       RowBox[{"ConstantArray", "[", 
        RowBox[{"0", ",", 
         SubscriptBox["d", "val"]}], "]"}], ",", 
       RowBox[{"nsteps", " ", "dt"}], ",", "nsteps", ",", "tol"}], "]"}]}]}], 
   "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", 
  RowBox[{"(", 
   RowBox[{"First", "/@", "%"}], ")"}]}]}], "Input"],

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
    RowBox[{"3", ",", "1", ",", "1", ",", "2", ",", 
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
      RowBox[{"0.05987388009034378`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.03389062333752353`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.01595349056519951`"}], "-", 
       RowBox[{"0.0032039045951461065`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "2.5405041315410774`*^-7"}], "-", 
       RowBox[{"5.40446101595813`*^-6", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.01163097788501338`"}], "+", 
       RowBox[{"0.14356873323793318`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.03227544212539336`"}], "-", 
       RowBox[{"0.018111599838027292`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.000011069784046580561`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.000023007064811848778`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.026063194492234282`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.010283227580014289`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.03013357472697612`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.023041854891515376`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.006145865504073382`"}], "+", 
       RowBox[{"0.0005002598873634968`", " ", "\[ImaginaryI]"}]}]}
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
              RowBox[{"First", "/@", 
               SubscriptBox["A", 
                RowBox[{"strang", ",", "liouville", ",", 
                 RowBox[{
                  RowBox[{"1", "/", "6"}], "+", 
                  RowBox[{"\[ImaginaryI]", "/", "7"}]}]}]]}], "]"}], ",", 
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
     RowBox[{"MPOSRKNb6Evolution", "[", 
      RowBox[{
       SubscriptBox["A", "list"], ",", 
       SubscriptBox["h", "list"], ",", 
       RowBox[{"ConstantArray", "[", 
        RowBox[{"0", ",", 
         SubscriptBox["d", "val"]}], "]"}], ",", 
       RowBox[{"nsteps", " ", "dt"}], ",", "nsteps", ",", "tol"}], "]"}]}]}], 
   "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", 
  RowBox[{"(", 
   RowBox[{"First", "/@", "%"}], ")"}]}]}], "Input"],

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
    RowBox[{"3", ",", "1", ",", "1", ",", "2", ",", 
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
      RowBox[{"0.0429176939373507`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.01757378776726616`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.024752316105227896`"}], "-", 
       RowBox[{"0.025610444699902982`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.0009153698052683987`"}], "-", 
       RowBox[{"0.0007984103088123142`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.009928947041577037`"}], "-", 
       RowBox[{"0.018202612447105186`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.07679916868323572`"}], "-", 
       RowBox[{"0.007892771004267054`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.0013312504252199456`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.0007980115579217915`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.009990763924015234`"}], "-", 
       RowBox[{"0.0005510283915678898`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.005500061992815096`"}], "-", 
       RowBox[{"0.008072609475350595`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.0010066810603406083`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.00030370775433035297`", " ", "\[ImaginaryI]"}]}]}
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
              RowBox[{"First", "/@", 
               SubscriptBox["A", 
                RowBox[{"SRKNb6", ",", 
                 RowBox[{
                  RowBox[{"1", "/", "11"}], "+", 
                  RowBox[{"\[ImaginaryI]", "/", "9"}]}]}]]}], "]"}], ",", 
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
     RowBox[{"MPOSRKNb6LiouvilleEvolution", "[", 
      RowBox[{
       SubscriptBox["A", "list"], ",", 
       SubscriptBox["h", "list"], ",", 
       RowBox[{"ConstantArray", "[", 
        RowBox[{"0", ",", 
         SubscriptBox["d", "val"]}], "]"}], ",", 
       RowBox[{"nsteps", " ", "dt"}], ",", "nsteps", ",", "tol"}], "]"}]}]}], 
   "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", 
  RowBox[{"(", 
   RowBox[{"First", "/@", "%"}], ")"}]}]}], "Input"],

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
    RowBox[{"3", ",", "1", ",", "1", ",", "2", ",", 
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
      RowBox[{"4.680041807412436`", "\[VeryThinSpace]", "-", 
       RowBox[{"3.0548389390234814`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"1.3382983708546228`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.16704684147763574`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.02061589375697598`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.015298567072093913`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.9038163517808393`"}], "-", 
       RowBox[{"8.41392174319019`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"4.039312717690346`", "\[VeryThinSpace]", "+", 
       RowBox[{"1.1173975721952638`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.028222097983416888`"}], "-", 
       RowBox[{"0.011017808329692921`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.0968863919308572`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.08030090545644668`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.02747637533726566`"}], "-", 
       RowBox[{"0.16127233634838753`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.01184122142240094`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.08529691105391776`", " ", "\[ImaginaryI]"}]}]}
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
              RowBox[{"First", "/@", 
               SubscriptBox["A", 
                RowBox[{"SRKNb6", ",", "liouville", ",", 
                 RowBox[{
                  RowBox[{
                   RowBox[{"-", "1"}], "/", "3"}], "+", 
                  RowBox[{"\[ImaginaryI]", "/", "5"}]}]}]]}], "]"}], ",", 
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
WindowMargins->{{Automatic, 130}, {44, Automatic}},
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
Cell[1554, 37, 123, 3, 31, "Input"],
Cell[1680, 42, 68, 1, 31, "Input"],
Cell[1751, 45, 174, 5, 31, "Input"],
Cell[CellGroupData[{
Cell[1950, 54, 49, 0, 43, "Subsection"],
Cell[2002, 56, 233, 7, 52, "Input"],
Cell[2238, 65, 209, 6, 52, "Input"],
Cell[2450, 73, 2180, 61, 92, "Input"],
Cell[CellGroupData[{
Cell[4655, 138, 88, 2, 31, "Input"],
Cell[4746, 142, 73, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4856, 149, 366, 9, 52, "Input"],
Cell[5225, 160, 93, 2, 31, "Output"],
Cell[5321, 164, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5451, 171, 158, 4, 31, "Input"],
Cell[5612, 177, 77, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5726, 184, 1454, 42, 95, "Input"],
Cell[7183, 228, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7303, 235, 447, 13, 52, "Input"],
Cell[7753, 250, 940, 25, 71, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[8730, 280, 314, 10, 52, "Input"],
Cell[9047, 292, 116, 3, 31, "Output"]
}, Open  ]],
Cell[9178, 298, 1078, 30, 52, "Input"],
Cell[10259, 330, 1361, 39, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11657, 374, 48, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[11730, 378, 924, 28, 54, "Input"],
Cell[12657, 408, 533, 14, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13227, 427, 600, 17, 52, "Input"],
Cell[13830, 446, 1780, 41, 74, "Output"]
}, Open  ]],
Cell[15625, 490, 1584, 41, 52, "Input"],
Cell[CellGroupData[{
Cell[17234, 535, 951, 28, 54, "Input"],
Cell[18188, 565, 535, 14, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[18760, 584, 618, 17, 52, "Input"],
Cell[19381, 603, 1778, 41, 76, "Output"]
}, Open  ]],
Cell[21174, 647, 1611, 42, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[22822, 694, 48, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[22895, 698, 925, 28, 54, "Input"],
Cell[23823, 728, 535, 14, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[24395, 747, 601, 17, 52, "Input"],
Cell[24999, 766, 1782, 42, 74, "Output"]
}, Open  ]],
Cell[26796, 811, 1584, 41, 52, "Input"],
Cell[CellGroupData[{
Cell[28405, 856, 976, 29, 54, "Input"],
Cell[29384, 887, 535, 14, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[29956, 906, 642, 18, 52, "Input"],
Cell[30601, 926, 1742, 39, 74, "Output"]
}, Open  ]],
Cell[32358, 968, 1636, 42, 52, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature zxpQcQSsbaY6oB17xl@#KAuT *)
