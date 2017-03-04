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
NotebookDataLength[     66043,       2154]
NotebookOptionsPosition[     60656,       1947]
NotebookOutlinePosition[     60999,       1962]
CellTagsIndexPosition[     60956,       1959]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Matrix Product States (MPS)", "Section"],

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
   RowBox[{
    RowBox[{"NotebookDirectory", "[", "]"}], "<>", 
    RowBox[{"FileBaseName", "[", 
     RowBox[{"NotebookFileName", "[", "]"}], "]"}]}]}], ";"}]], "Input"],

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

Cell[BoxData[
 RowBox[{
  RowBox[{"ColumnMajorLayout", "[", "A_", "]"}], ":=", 
  RowBox[{"Flatten", "[", 
   RowBox[{"Transpose", "[", 
    RowBox[{"A", ",", 
     RowBox[{"Reverse", "[", 
      RowBox[{"Range", "[", 
       RowBox[{"ArrayDepth", "[", "A", "]"}], "]"}], "]"}]}], "]"}], 
   "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell["Generate a random MPS", "Subsection"],

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
    SubscriptBox["d", "val"], "=", "4"}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
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
         "1", ",", "2", ",", "9", ",", "6", ",", "5", ",", "3", ",", "1"}], 
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
          RowBox[{
           RowBox[{
           "D", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], ",", 
           RowBox[{"D", "\[LeftDoubleBracket]", 
            RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "}"}]}], 
        "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"\[Sigma]", ",", "d"}], "}"}]}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"6", ",", "4"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["A", "full"], "=", 
   RowBox[{"MPSMergeFull", "[", 
    SubscriptBox["A", "list"], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}], "\[IndentingNewLine]", 
 RowBox[{"%", "-", 
  SuperscriptBox["4", "6"]}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", "4096", "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", "0", "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["A", "list"], "\[LeftDoubleBracket]", 
    RowBox[{"1", ",", "1"}], "\[RightDoubleBracket]"}], "//", 
   "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{
       RowBox[{"-", "0.04939647752269172`"}], "-", 
       RowBox[{"0.10195376432689374`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.07265122675055435`"}], "-", 
       RowBox[{"0.030839579542903284`", " ", "\[ImaginaryI]"}]}]}
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
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["A", "list"], "\[LeftDoubleBracket]", 
    RowBox[{"1", ",", "2"}], "\[RightDoubleBracket]"}], "//", 
   "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"0.037308894692079875`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.13543462490330416`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.14055383108840702`"}], "-", 
       RowBox[{"0.19572823702407227`", " ", "\[ImaginaryI]"}]}]}
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
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["A", "list"], "\[LeftDoubleBracket]", 
    RowBox[{"2", ",", "1"}], "\[RightDoubleBracket]"}], "//", 
   "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"0.15948406410596583`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.014158903165922498`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.30775696281537246`"}], "+", 
       RowBox[{"0.2325670020506272`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.08258189400319471`"}], "-", 
       RowBox[{"0.09804535435912853`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.13586756829737046`"}], "+", 
       RowBox[{"0.19967650507484214`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.018761272627993764`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.08944919855740974`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.07156787184214153`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.15993062802825353`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.26852973818264725`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.19302421801405734`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.22712173849202477`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.20468105016412275`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.2571681339548577`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.02311601315555567`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.018055367536775613`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.22381495587972244`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.04040305854339232`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.09135112180015459`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.28294734644630903`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.03712191450164759`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.3322819706158484`"}], "-", 
       RowBox[{"0.10580746360913662`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.26708016772290044`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.21771512354213263`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.08834047163565173`"}], "+", 
       RowBox[{"0.01276639062755569`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.1505901850691742`"}], "+", 
       RowBox[{"0.25304614359779687`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.31808029249483893`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.11760110776870913`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.3071534991610687`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.29353672921861707`", " ", "\[ImaginaryI]"}]}]}
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
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["A", "list"], "\[LeftDoubleBracket]", 
    RowBox[{
     RowBox[{"-", "1"}], ",", "1"}], "\[RightDoubleBracket]"}], "//", 
   "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"0.042491439231421735`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.11250332208772207`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.3021879559128381`"}], "-", 
       RowBox[{"0.001999373012654626`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.011188907440324858`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.23584186044240063`", " ", "\[ImaginaryI]"}]}]}
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
   RowBox[{"save", " ", "to", " ", "disk"}], " ", "*)"}], 
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
         RowBox[{"ColumnMajorLayout", "[", 
          RowBox[{
           SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "j", 
           "\[RightDoubleBracket]"}], "]"}], ",", "\"\<Complex128\>\""}], 
        "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"]
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
    SubscriptBox["A", "list"]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", "%"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"1", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "81"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"81", ",", "36"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"36", ",", "25"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"25", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"9", ",", "1"}], "}"}]}], "}"}]], "Output"]
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
      RowBox[{"0.1507067337204237`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.08995139412618598`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.02184603650139247`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.08995139412618598`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.02184603650139247`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.30352311628087086`", "\[VeryThinSpace]", "+", 
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
   RowBox[{"0.8110767739639566`", "\[VeryThinSpace]", "-", 
    RowBox[{"1.3153827899162881`*^-17", " ", "\[ImaginaryI]"}]}], "}"}], 
  "}"}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Unitary left projection", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", "dim", ",", "U", ",", "S", ",", "V", 
      ",", 
      RowBox[{"s2", "=", 
       RowBox[{"{", 
        RowBox[{"1", ",", 
         RowBox[{"-", "1"}], ",", 
         RowBox[{"-", "1"}], ",", "1", ",", "1", ",", 
         RowBox[{"-", "1"}], ",", "1", ",", 
         RowBox[{"-", "1"}]}], "}"}]}]}], "}"}], ",", 
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"dim", "=", 
        RowBox[{"Dimensions", "[", 
         RowBox[{
          SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "j", 
          "\[RightDoubleBracket]"}], "]"}]}], ";", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"U", ",", "S", ",", "V"}], "}"}], "=", 
        RowBox[{"EconomicalSVD", "[", 
         RowBox[{"ArrayReshape", "[", 
          RowBox[{
           RowBox[{
            SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "j", 
            "\[RightDoubleBracket]"}], ",", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{
              RowBox[{
              "dim", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}], 
              RowBox[{
              "dim", "\[LeftDoubleBracket]", "2", "\[RightDoubleBracket]"}]}],
              ",", 
             RowBox[{
             "dim", "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}]}], 
            "}"}]}], "]"}], "]"}]}], ";", 
       RowBox[{"If", "[", 
        RowBox[{
         RowBox[{"j", "\[Equal]", "2"}], ",", 
         RowBox[{
          RowBox[{"U", "=", 
           RowBox[{"U", ".", 
            RowBox[{"DiagonalMatrix", "[", "s2", "]"}]}]}], ";", 
          RowBox[{"V", "=", 
           RowBox[{"V", ".", 
            RowBox[{"DiagonalMatrix", "[", "s2", "]"}]}]}]}], ",", 
         RowBox[{
          RowBox[{"U", "=", 
           RowBox[{"-", "U"}]}], ";", 
          RowBox[{"V", "=", 
           RowBox[{"-", "V"}]}]}]}], "]"}], ";", 
       RowBox[{
        SubscriptBox["A", 
         RowBox[{"left", ",", "j", ",", "list"}]], "=", 
        RowBox[{"Table", "[", 
         RowBox[{
          RowBox[{"If", "[", 
           RowBox[{
            RowBox[{"i", "\[Equal]", "j"}], ",", 
            RowBox[{"ArrayReshape", "[", 
             RowBox[{"U", ",", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{
                "dim", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}],
                 ",", 
                RowBox[{
                "dim", "\[LeftDoubleBracket]", "2", "\[RightDoubleBracket]"}],
                 ",", 
                RowBox[{"Length", "[", "S", "]"}]}], "}"}]}], "]"}], ",", 
            RowBox[{"If", "[", 
             RowBox[{
              RowBox[{"i", "\[Equal]", 
               RowBox[{"j", "+", "1"}]}], ",", 
              RowBox[{"Transpose", "[", 
               RowBox[{
                RowBox[{
                 RowBox[{"DiagonalMatrix", "[", "S", "]"}], ".", 
                 RowBox[{"ConjugateTranspose", "[", "V", "]"}], ".", 
                 RowBox[{"Transpose", "[", 
                  RowBox[{
                   RowBox[{
                    SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "i", 
                    "\[RightDoubleBracket]"}], ",", 
                   RowBox[{"{", 
                    RowBox[{"2", ",", "1", ",", "3"}], "}"}]}], "]"}]}], ",", 
                RowBox[{"{", 
                 RowBox[{"2", ",", "1", ",", "3"}], "}"}]}], "]"}], ",", 
              RowBox[{
               SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "i", 
               "\[RightDoubleBracket]"}]}], "]"}]}], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{"i", ",", "L"}], "}"}]}], "]"}]}]}], ",", 
      RowBox[{"{", 
       RowBox[{"j", ",", 
        RowBox[{"{", 
         RowBox[{"2", ",", "3"}], "}"}]}], "}"}]}], "]"}]}], "]"}], 
  ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "note", " ", "that", " ", "bond", " ", "dimension", " ", "is", " ", "now", 
    " ", "reduced", " ", "from", " ", "9", " ", "to", " ", "8"}], " ", "*)"}],
   "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Dimensions", "[", 
    RowBox[{
     SubscriptBox["A", 
      RowBox[{"left", ",", "2", ",", "list"}]], "\[LeftDoubleBracket]", "2", 
     "\[RightDoubleBracket]"}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", 
    RowBox[{
     SubscriptBox["A", 
      RowBox[{"left", ",", "2", ",", "list"}]], "\[LeftDoubleBracket]", "3", 
     "\[RightDoubleBracket]"}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "2", ",", "8"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "8", ",", "6"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", 
    RowBox[{"left", ",", "3", ",", "list"}]], "\[LeftDoubleBracket]", "3", 
   "\[RightDoubleBracket]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", 
    RowBox[{"left", ",", "3", ",", "list"}]], "\[LeftDoubleBracket]", "4", 
   "\[RightDoubleBracket]"}], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "9", ",", "6"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "6", ",", "5"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{"representing", " ", "same", " ", "operator"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Table", "[", 
   RowBox[{
    RowBox[{"Norm", "[", 
     RowBox[{
      SubscriptBox["A", "full"], "-", 
      RowBox[{"MPSMergeFull", "[", 
       SubscriptBox["A", 
        RowBox[{"left", ",", "j", ",", "list"}]], "]"}]}], "]"}], ",", 
    RowBox[{"{", 
     RowBox[{"j", ",", 
      RowBox[{"{", 
       RowBox[{"2", ",", "3"}], "}"}]}], "}"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1.0167327688425237`*^-15", ",", "9.05013299912248`*^-16"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{"left", "-", "normalized"}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"d", "=", 
       SubscriptBox["d", "val"]}], ",", "dim"}], "}"}], ",", 
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"dim", "=", 
        RowBox[{"Dimensions", "[", 
         RowBox[{
          SubscriptBox["A", 
           RowBox[{"left", ",", "j", ",", "list"}]], "\[LeftDoubleBracket]", 
          "j", "\[RightDoubleBracket]"}], "]"}]}], ";", 
       RowBox[{"Norm", "[", 
        RowBox[{
         RowBox[{"Sum", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"ConjugateTranspose", "[", 
             RowBox[{
              SubscriptBox["A", 
               RowBox[{"left", ",", "j", ",", "list"}]], 
              "\[LeftDoubleBracket]", 
              RowBox[{"j", ",", "\[Sigma]"}], "\[RightDoubleBracket]"}], 
             "]"}], ".", 
            RowBox[{
             SubscriptBox["A", 
              RowBox[{"left", ",", "j", ",", "list"}]], 
             "\[LeftDoubleBracket]", 
             RowBox[{"j", ",", "\[Sigma]"}], "\[RightDoubleBracket]"}]}], ",", 
           RowBox[{"{", 
            RowBox[{"\[Sigma]", ",", "d"}], "}"}]}], "]"}], "-", 
         RowBox[{"IdentityMatrix", "[", 
          RowBox[{"Last", "[", "dim", "]"}], "]"}]}], "]"}]}], ",", 
      RowBox[{"{", 
       RowBox[{"j", ",", 
        RowBox[{"{", 
         RowBox[{"2", ",", "3"}], "}"}]}], "}"}]}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1.5662387062261104`*^-15", ",", "1.5449657697760228`*^-15"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "as", " ", "reference", " ", "to", " ", "disk"}], " ",
    "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], "}"}], ",", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"Export", "[", 
          RowBox[{
           RowBox[{
            SubscriptBox["fn", "base"], "<>", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"\"\<_B\>\"", ",", "\"\<_C\>\""}], "}"}], 
             "\[LeftDoubleBracket]", 
             RowBox[{"j", "-", "1"}], "\[RightDoubleBracket]"}], "<>", 
            RowBox[{"ToString", "[", 
             RowBox[{"i", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
           RowBox[{"ColumnMajorLayout", "[", 
            RowBox[{
             SubscriptBox["A", 
              RowBox[{"left", ",", "j", ",", "list"}]], 
             "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], "]"}], 
           ",", "\"\<Complex128\>\""}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"i", ",", "j", ",", 
           RowBox[{"j", "+", "1"}]}], "}"}]}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", 
         RowBox[{"{", 
          RowBox[{"2", ",", "3"}], "}"}]}], "}"}]}], "]"}]}], "]"}], 
   ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Unitary right projection", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", "dim", ",", "U", ",", "S", ",", "V", 
      ",", 
      RowBox[{"j", "=", "5"}], ",", 
      RowBox[{"s", "=", 
       RowBox[{"{", 
        RowBox[{"1", ",", "1", ",", "1", ",", "1", ",", 
         RowBox[{"-", "1"}]}], "}"}]}]}], "}"}], ",", 
    RowBox[{
     RowBox[{"dim", "=", 
      RowBox[{"Dimensions", "[", 
       RowBox[{
        SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "j", 
        "\[RightDoubleBracket]"}], "]"}]}], ";", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"U", ",", "S", ",", "V"}], "}"}], "=", 
      RowBox[{"EconomicalSVD", "[", 
       RowBox[{"ArrayReshape", "[", 
        RowBox[{
         RowBox[{"Transpose", "[", 
          RowBox[{
           RowBox[{
            SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "j", 
            "\[RightDoubleBracket]"}], ",", 
           RowBox[{"{", 
            RowBox[{"2", ",", "1", ",", "3"}], "}"}]}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{
           "dim", "\[LeftDoubleBracket]", "2", "\[RightDoubleBracket]"}], ",", 
           RowBox[{
            RowBox[{
            "dim", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}], 
            RowBox[{
            "dim", "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}]}]}],
           "}"}]}], "]"}], "]"}]}], ";", 
     RowBox[{"U", "=", 
      RowBox[{"U", ".", 
       RowBox[{"DiagonalMatrix", "[", "s", "]"}]}]}], ";", 
     RowBox[{"V", "=", 
      RowBox[{"V", ".", 
       RowBox[{"DiagonalMatrix", "[", "s", "]"}]}]}], ";", 
     RowBox[{
      SubscriptBox["A", 
       RowBox[{"right", ",", "j", ",", "list"}]], "=", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"i", "\[Equal]", "j"}], ",", 
          RowBox[{"Transpose", "[", 
           RowBox[{
            RowBox[{"ArrayReshape", "[", 
             RowBox[{
              RowBox[{"ConjugateTranspose", "[", "V", "]"}], ",", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{"Length", "[", "S", "]"}], ",", 
                RowBox[{
                "dim", "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}],
                 ",", 
                RowBox[{
                "dim", "\[LeftDoubleBracket]", "3", 
                 "\[RightDoubleBracket]"}]}], "}"}]}], "]"}], ",", 
            RowBox[{"{", 
             RowBox[{"2", ",", "1", ",", "3"}], "}"}]}], "]"}], ",", 
          RowBox[{"If", "[", 
           RowBox[{
            RowBox[{"i", "\[Equal]", 
             RowBox[{"j", "-", "1"}]}], ",", 
            RowBox[{
             RowBox[{
              SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "i", 
              "\[RightDoubleBracket]"}], ".", "U", ".", 
             RowBox[{"DiagonalMatrix", "[", "S", "]"}]}], ",", 
            RowBox[{
             SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "i", 
             "\[RightDoubleBracket]"}]}], "]"}]}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"i", ",", "L"}], "}"}]}], "]"}]}]}]}], "]"}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", 
    RowBox[{"right", ",", "5", ",", "list"}]], "\[LeftDoubleBracket]", "5", 
   "\[RightDoubleBracket]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", 
    RowBox[{"right", ",", "5", ",", "list"}]], "\[LeftDoubleBracket]", "4", 
   "\[RightDoubleBracket]"}], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "5", ",", "3"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "6", ",", "5"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{"representing", " ", "same", " ", "operator"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"j", "=", "5"}], "}"}], ",", 
    RowBox[{"Norm", "[", 
     RowBox[{
      SubscriptBox["A", "full"], "-", 
      RowBox[{"MPSMergeFull", "[", 
       SubscriptBox["A", 
        RowBox[{"right", ",", "j", ",", "list"}]], "]"}]}], "]"}]}], 
   "]"}]}]], "Input"],

Cell[BoxData["5.805984453526243`*^-16"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{"right", "-", "normalized"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"d", "=", 
       SubscriptBox["d", "val"]}], ",", 
      RowBox[{"j", "=", "5"}], ",", "dim"}], "}"}], ",", 
    RowBox[{
     RowBox[{"dim", "=", 
      RowBox[{"Dimensions", "[", 
       RowBox[{
        SubscriptBox["A", 
         RowBox[{"right", ",", "j", ",", "list"}]], "\[LeftDoubleBracket]", 
        "j", "\[RightDoubleBracket]"}], "]"}]}], ";", 
     RowBox[{"Norm", "[", 
      RowBox[{
       RowBox[{"Sum", "[", 
        RowBox[{
         RowBox[{
          RowBox[{
           SubscriptBox["A", 
            RowBox[{"right", ",", "j", ",", "list"}]], "\[LeftDoubleBracket]", 
           RowBox[{"j", ",", "\[Sigma]"}], "\[RightDoubleBracket]"}], ".", 
          RowBox[{"ConjugateTranspose", "[", 
           RowBox[{
            SubscriptBox["A", 
             RowBox[{"right", ",", "j", ",", "list"}]], 
            "\[LeftDoubleBracket]", 
            RowBox[{"j", ",", "\[Sigma]"}], "\[RightDoubleBracket]"}], 
           "]"}]}], ",", 
         RowBox[{"{", 
          RowBox[{"\[Sigma]", ",", "d"}], "}"}]}], "]"}], "-", 
       RowBox[{"IdentityMatrix", "[", 
        RowBox[{"dim", "\[LeftDoubleBracket]", "2", "\[RightDoubleBracket]"}],
         "]"}]}], "]"}]}]}], "]"}]}]], "Input"],

Cell[BoxData["8.471024646000495`*^-16"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "as", " ", "reference", " ", "to", " ", "disk"}], " ",
    "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"j", "=", "5"}]}], "}"}], ",", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"Export", "[", 
        RowBox[{
         RowBox[{
          SubscriptBox["fn", "base"], "<>", "\"\<_D\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"i", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{"ColumnMajorLayout", "[", 
          RowBox[{
           SubscriptBox["A", 
            RowBox[{"right", ",", "j", ",", "list"}]], "\[LeftDoubleBracket]",
            "i", "\[RightDoubleBracket]"}], "]"}], ",", 
         "\"\<Complex128\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"i", ",", 
         RowBox[{"j", "-", "1"}], ",", "j"}], "}"}]}], "]"}]}], "]"}], 
   ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Left and right contraction step", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "4", 
   "\[RightDoubleBracket]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "6", ",", "5"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "43", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["BL", 
    RowBox[{"contr", ",", "0"}]], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"D", "=", 
        RowBox[{
         RowBox[{"Dimensions", "[", 
          RowBox[{
           SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "4", 
           "\[RightDoubleBracket]"}], "]"}], "\[LeftDoubleBracket]", "2", 
         "\[RightDoubleBracket]"}]}], ",", 
       RowBox[{"zmax", "=", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "2"}]}]}], "}"}], 
     ",", 
     RowBox[{"RandomComplex", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"D", ",", "D"}], "}"}]}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"6", ",", "6"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "44", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["BR", 
    RowBox[{"contr", ",", "0"}]], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"D", "=", 
        RowBox[{
         RowBox[{"Dimensions", "[", 
          RowBox[{
           SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "4", 
           "\[RightDoubleBracket]"}], "]"}], "\[LeftDoubleBracket]", "3", 
         "\[RightDoubleBracket]"}]}], ",", 
       RowBox[{"zmax", "=", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "2"}]}]}], "}"}], 
     ",", 
     RowBox[{"RandomComplex", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"D", ",", "D"}], "}"}]}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "5"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["BL", 
    RowBox[{"contr", ",", "1"}]], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"A", "=", 
        RowBox[{
         SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "4", 
         "\[RightDoubleBracket]"}]}], ",", 
       RowBox[{"BL", "=", 
        SubscriptBox["BL", 
         RowBox[{"contr", ",", "0"}]]}]}], "}"}], ",", 
     RowBox[{"DotMultiDim", "[", 
      RowBox[{
       RowBox[{"Transpose", "[", 
        RowBox[{"A", ",", 
         RowBox[{"{", 
          RowBox[{"3", ",", "2", ",", "1"}], "}"}]}], "]"}], ",", 
       RowBox[{"BL", ".", 
        RowBox[{"ConjugateTranspose", "[", 
         RowBox[{"A", ",", 
          RowBox[{"{", 
           RowBox[{"2", ",", "1", ",", "3"}], "}"}]}], "]"}]}], ",", "2"}], 
      "]"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "5"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["BR", 
    RowBox[{"contr", ",", "1"}]], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"A", "=", 
        RowBox[{
         SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "4", 
         "\[RightDoubleBracket]"}]}], ",", 
       RowBox[{"BR", "=", 
        SubscriptBox["BR", 
         RowBox[{"contr", ",", "0"}]]}]}], "}"}], ",", 
     RowBox[{"DotMultiDim", "[", 
      RowBox[{
       RowBox[{"Transpose", "[", 
        RowBox[{
         RowBox[{"A", ".", "BR"}], ",", 
         RowBox[{"{", 
          RowBox[{"2", ",", "1", ",", "3"}], "}"}]}], "]"}], ",", 
       RowBox[{"ConjugateTranspose", "[", 
        RowBox[{"A", ",", 
         RowBox[{"{", 
          RowBox[{"1", ",", "3", ",", "2"}], "}"}]}], "]"}], ",", "2"}], 
      "]"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"6", ",", "6"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "as", " ", "reference", " ", "to", " ", "disk"}], " ",
    "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", "\"\<_BLcontr\>\"", "<>", 
         RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}], ",", 
        RowBox[{"ColumnMajorLayout", "[", 
         SubscriptBox["BL", 
          RowBox[{"contr", ",", "i"}]], "]"}], ",", "\"\<Complex128\>\""}], 
       "]"}], ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", "0", ",", "1"}], "}"}]}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", "\"\<_BRcontr\>\"", "<>", 
         RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}], ",", 
        RowBox[{"ColumnMajorLayout", "[", 
         SubscriptBox["BR", 
          RowBox[{"contr", ",", "i"}]], "]"}], ",", "\"\<Complex128\>\""}], 
       "]"}], ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", "0", ",", "1"}], "}"}]}], "]"}], ";"}]}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["\<\
Left and right contraction step with a matrix product operator sandwiched in \
between\
\>", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "4", 
   "\[RightDoubleBracket]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "6", ",", "5"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"local", " ", "operator"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"SeedRandom", "[", "45", "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["W", "val"], "=", 
     RowBox[{"Block", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"d", "=", 
          SubscriptBox["d", "val"]}], ",", 
         RowBox[{"zmax", "=", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "2"}]}]}], "}"}],
        ",", 
       RowBox[{"RandomComplex", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"d", ",", "d", ",", "7", ",", "13"}], "}"}]}], "]"}]}], 
      "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "7", ",", "13"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "46", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["BL", 
    RowBox[{"op", ",", "contr", ",", "0"}]], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"D", "=", 
        RowBox[{
         RowBox[{"Dimensions", "[", 
          RowBox[{
           SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "4", 
           "\[RightDoubleBracket]"}], "]"}], "\[LeftDoubleBracket]", "2", 
         "\[RightDoubleBracket]"}]}], ",", 
       RowBox[{"zmax", "=", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "2"}]}]}], "}"}], 
     ",", 
     RowBox[{"RandomComplex", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"D", ",", "7", ",", "D"}], "}"}]}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"6", ",", "7", ",", "6"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "47", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["BR", 
    RowBox[{"op", ",", "contr", ",", "0"}]], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"D", "=", 
        RowBox[{
         RowBox[{"Dimensions", "[", 
          RowBox[{
           SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "4", 
           "\[RightDoubleBracket]"}], "]"}], "\[LeftDoubleBracket]", "3", 
         "\[RightDoubleBracket]"}]}], ",", 
       RowBox[{"zmax", "=", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "2"}]}]}], "}"}], 
     ",", 
     RowBox[{"RandomComplex", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"D", ",", "13", ",", "D"}], "}"}]}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "13", ",", "5"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["BL", 
    RowBox[{"op", ",", "contr", ",", "1"}]], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"A", "=", 
        RowBox[{
         SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "4", 
         "\[RightDoubleBracket]"}]}], ",", 
       RowBox[{"W", "=", 
        SubscriptBox["W", "val"]}], ",", 
       RowBox[{"BL", "=", 
        SubscriptBox["BL", 
         RowBox[{"op", ",", "contr", ",", "0"}]]}]}], "}"}], ",", 
     RowBox[{"DotMultiDim", "[", 
      RowBox[{
       RowBox[{"Transpose", "[", 
        RowBox[{"A", ",", 
         RowBox[{"{", 
          RowBox[{"3", ",", "2", ",", "1"}], "}"}]}], "]"}], ",", 
       RowBox[{"Transpose", "[", 
        RowBox[{
         RowBox[{"DotMultiDim", "[", 
          RowBox[{
           RowBox[{"Transpose", "[", 
            RowBox[{
             RowBox[{"BL", ".", 
              RowBox[{"ConjugateTranspose", "[", 
               RowBox[{"A", ",", 
                RowBox[{"{", 
                 RowBox[{"2", ",", "1", ",", "3"}], "}"}]}], "]"}]}], ",", 
             RowBox[{"{", 
              RowBox[{"1", ",", "3", ",", "4", ",", "2"}], "}"}]}], "]"}], 
           ",", 
           RowBox[{"Transpose", "[", 
            RowBox[{"W", ",", 
             RowBox[{"{", 
              RowBox[{"2", ",", "3", ",", "1", ",", "4"}], "}"}]}], "]"}], 
           ",", "2"}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"1", ",", "4", ",", "2", ",", "3"}], "}"}]}], "]"}], ",", 
       "2"}], "]"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "13", ",", "5"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["BR", 
    RowBox[{"op", ",", "contr", ",", "1"}]], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"A", "=", 
        RowBox[{
         SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "4", 
         "\[RightDoubleBracket]"}]}], ",", 
       RowBox[{"W", "=", 
        SubscriptBox["W", "val"]}], ",", 
       RowBox[{"BR", "=", 
        SubscriptBox["BR", 
         RowBox[{"op", ",", "contr", ",", "0"}]]}]}], "}"}], ",", 
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
             RowBox[{"A", ".", "BR"}], ",", 
             RowBox[{"{", 
              RowBox[{"1", ",", "3", ",", "2", ",", "4"}], "}"}]}], "]"}], 
           ",", "2"}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"3", ",", "2", ",", "1", ",", "4"}], "}"}]}], "]"}], ",", 
       RowBox[{"ConjugateTranspose", "[", 
        RowBox[{"A", ",", 
         RowBox[{"{", 
          RowBox[{"1", ",", "3", ",", "2"}], "}"}]}], "]"}], ",", "2"}], 
      "]"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"6", ",", "7", ",", "6"}], "}"}]], "Output"]
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
       SubscriptBox["fn", "base"], "<>", "\"\<_W.dat\>\""}], ",", 
      RowBox[{"ColumnMajorLayout", "[", 
       SubscriptBox["W", "val"], "]"}], ",", "\"\<Complex128\>\""}], "]"}], 
    ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", "\"\<_BLopcontr\>\"", "<>", 
         RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}], ",", 
        RowBox[{"ColumnMajorLayout", "[", 
         SubscriptBox["BL", 
          RowBox[{"op", ",", "contr", ",", "i"}]], "]"}], ",", 
        "\"\<Complex128\>\""}], "]"}], ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", "0", ",", "1"}], "}"}]}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", "\"\<_BRopcontr\>\"", "<>", 
         RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}], ",", 
        RowBox[{"ColumnMajorLayout", "[", 
         SubscriptBox["BR", 
          RowBox[{"op", ",", "contr", ",", "i"}]], "]"}], ",", 
        "\"\<Complex128\>\""}], "]"}], ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", "0", ",", "1"}], "}"}]}], "]"}], ";"}]}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Splitting of a two-site tensor", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "48", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["E", "pair"], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"zmax", "=", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "4"}]}], "}"}], ",", 
     RowBox[{"RandomComplex", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"3", " ", "4"}], ",", "11", ",", "7"}], "}"}]}], "]"}]}], 
    "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"12", ",", "11", ",", "7"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["E", "0"], ",", 
       SubscriptBox["qE", "0"], ",", 
       SubscriptBox["qE", "1"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["E", "1"], ",", 
       SubscriptBox["qE", 
        RowBox[{"1", ",", "alt"}]], ",", 
       SubscriptBox["qE", "2"]}], "}"}], ",", 
     SubscriptBox["S", "val"]}], "}"}], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"d0", "=", "3"}], ",", 
       RowBox[{"d1", "=", "4"}], ",", 
       RowBox[{"D0", "=", 
        RowBox[{
         RowBox[{"Dimensions", "[", 
          SubscriptBox["E", "pair"], "]"}], "\[LeftDoubleBracket]", "2", 
         "\[RightDoubleBracket]"}]}], ",", 
       RowBox[{"D2", "=", 
        RowBox[{
         RowBox[{"Dimensions", "[", 
          SubscriptBox["E", "pair"], "]"}], "\[LeftDoubleBracket]", "3", 
         "\[RightDoubleBracket]"}]}]}], "}"}], ",", 
     RowBox[{"MPSSplitTensor", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         SubscriptBox["E", "pair"], ",", 
         RowBox[{"ConstantArray", "[", 
          RowBox[{"0", ",", "D0"}], "]"}], ",", 
         RowBox[{"ConstantArray", "[", 
          RowBox[{"0", ",", "D2"}], "]"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"ConstantArray", "[", 
          RowBox[{"0", ",", "d0"}], "]"}], ",", 
         RowBox[{"ConstantArray", "[", 
          RowBox[{"0", ",", "d1"}], "]"}]}], "}"}], ",", "0"}], "]"}]}], 
    "]"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Dimensions", "[", 
  SubscriptBox["E", "0"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["E", "1"], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "11", ",", "28"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "28", ",", "7"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"consistency", " ", "check"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    SubscriptBox["qE", "1"], "-", 
    SubscriptBox["qE", 
     RowBox[{"1", ",", "alt"}]]}], "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  SubscriptBox["S", "val"]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "2.1408851437060306`", ",", "1.9833103246114405`", ",", 
   "1.838247431892725`", ",", "1.7348131887335392`", ",", "1.70249084570972`",
    ",", "1.5901703591529217`", ",", "1.4721787554015793`", ",", 
   "1.4442710666407568`", ",", "1.3979267773515236`", ",", 
   "1.2958147273848213`", ",", "1.26113844943703`", ",", 
   "1.1852604876609938`", ",", "1.0612570639450132`", ",", 
   "1.021310445813917`", ",", "0.9586798762155417`", ",", 
   "0.8762890594548909`", ",", "0.8127277303964578`", ",", 
   "0.7479588269584336`", ",", "0.6898252204489428`", ",", 
   "0.6457634286779966`", ",", "0.6026075632427658`", ",", 
   "0.5537159414806064`", ",", "0.4732150403795064`", ",", 
   "0.4033094814659186`", ",", "0.3731877559472228`", ",", 
   "0.2942747554920019`", ",", "0.24345799432606371`", ",", 
   "0.15100883299290038`"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"norm", " ", "of", " ", "singular", " ", "values"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   SubscriptBox["S", "val"], "]"}]}]], "Input"],

Cell[BoxData["6.208706214000858`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "von", " ", "Neumann", " ", "entropy", " ", "of", " ", "singular", " ", 
    "values"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Total", "[", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"-", 
       SuperscriptBox["#", "2"]}], 
      RowBox[{"Log", "[", 
       SuperscriptBox["#", "2"], "]"}]}], "&"}], "/@", 
    FractionBox[
     SubscriptBox["S", "val"], 
     RowBox[{"Norm", "[", 
      SubscriptBox["S", "val"], "]"}]]}], "]"}]}]], "Input"],

Cell[BoxData["2.9174835032576425`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{"agrees", " ", "with", " ", "original", " ", "tensor"}]}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"Flatten", "[", 
     RowBox[{
      RowBox[{"MPSMergeTensors", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["E", "0"], ".", 
         RowBox[{"DiagonalMatrix", "[", 
          SubscriptBox["S", "val"], "]"}]}], ",", 
        SubscriptBox["E", "1"]}], "]"}], "-", 
      SubscriptBox["E", "pair"]}], "]"}], ",", "\[Infinity]"}], 
   "]"}]}]], "Input"],

Cell[BoxData["9.09180472805593`*^-16"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"reduced", " ", "bond", " ", "dimension"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        SubscriptBox["E", 
         RowBox[{"0", ",", "red"}]], ",", 
        SubscriptBox["qE", 
         RowBox[{"0", ",", "red"}]], ",", 
        SubscriptBox["qE", 
         RowBox[{"1", ",", "red"}]]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        SubscriptBox["E", 
         RowBox[{"1", ",", "red"}]], ",", 
        SubscriptBox["qE", 
         RowBox[{"1", ",", "red", ",", "alt"}]], ",", 
        SubscriptBox["qE", 
         RowBox[{"2", ",", "red"}]]}], "}"}], ",", 
      SubscriptBox["S", 
       RowBox[{"val", ",", "red"}]]}], "}"}], "=", 
    RowBox[{"Block", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"d0", "=", "3"}], ",", 
        RowBox[{"d1", "=", "4"}], ",", 
        RowBox[{"D0", "=", 
         RowBox[{
          RowBox[{"Dimensions", "[", 
           SubscriptBox["E", "pair"], "]"}], "\[LeftDoubleBracket]", "2", 
          "\[RightDoubleBracket]"}]}], ",", 
        RowBox[{"D2", "=", 
         RowBox[{
          RowBox[{"Dimensions", "[", 
           SubscriptBox["E", "pair"], "]"}], "\[LeftDoubleBracket]", "3", 
          "\[RightDoubleBracket]"}]}]}], "}"}], ",", 
      RowBox[{"MPSSplitTensor", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["E", "pair"], ",", 
          RowBox[{"ConstantArray", "[", 
           RowBox[{"0", ",", "D0"}], "]"}], ",", 
          RowBox[{"ConstantArray", "[", 
           RowBox[{"0", ",", "D2"}], "]"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"ConstantArray", "[", 
           RowBox[{"0", ",", "d0"}], "]"}], ",", 
          RowBox[{"ConstantArray", "[", 
           RowBox[{"0", ",", "d1"}], "]"}]}], "}"}], ",", "0.08"}], "]"}]}], 
     "]"}]}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Dimensions", "[", 
  SubscriptBox["E", 
   RowBox[{"0", ",", "red"}]], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["E", 
   RowBox[{"1", ",", "red"}]], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "11", ",", "17"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "17", ",", "7"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"leading", " ", "singular", " ", "values", " ", "agree"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    SubscriptBox["S", 
     RowBox[{"val", ",", "red"}]], "-", 
    RowBox[{
     SubscriptBox["S", "val"], "\[LeftDoubleBracket]", 
     RowBox[{"1", ";;", 
      RowBox[{"Length", "[", 
       SubscriptBox["S", 
        RowBox[{"val", ",", "red"}]], "]"}]}], "\[RightDoubleBracket]"}]}], 
   "]"}]}]], "Input"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"norm", " ", "of", " ", "singular", " ", "values"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   SubscriptBox["S", 
    RowBox[{"val", ",", "red"}]], "]"}]}]], "Input"],

Cell[BoxData["5.9775790063705285`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "von", " ", "Neumann", " ", "entropy", " ", "of", " ", "singular", " ", 
    "values"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Total", "[", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"-", 
       SuperscriptBox["#", "2"]}], 
      RowBox[{"Log", "[", 
       SuperscriptBox["#", "2"], "]"}]}], "&"}], "/@", 
    FractionBox[
     SubscriptBox["S", 
      RowBox[{"val", ",", "red"}]], 
     RowBox[{"Norm", "[", 
      SubscriptBox["S", 
       RowBox[{"val", ",", "red"}]], "]"}]]}], "]"}]}]], "Input"],

Cell[BoxData["2.695728869388412`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "merge", " ", "the", " ", "two", " ", "tensors", " ", "with", " ", 
    "reduced", " ", "bond", " ", "dimension"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["E", 
      RowBox[{"pair", ",", "red"}]], "=", 
     RowBox[{"MPSMergeTensors", "[", 
      RowBox[{
       RowBox[{
        SubscriptBox["E", 
         RowBox[{"0", ",", "red"}]], ".", 
        RowBox[{"DiagonalMatrix", "[", 
         SubscriptBox["S", 
          RowBox[{"val", ",", "red"}]], "]"}]}], ",", 
       SubscriptBox["E", 
        RowBox[{"1", ",", "red"}]]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"12", ",", "11", ",", "7"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
    "no", " ", "longer", " ", "exactly", " ", "reproducing", " ", "original", 
     " ", "two"}], "-", 
    RowBox[{"site", " ", "tensor"}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Norm", "[", 
    RowBox[{"Flatten", "[", 
     RowBox[{
      SubscriptBox["E", 
       RowBox[{"pair", ",", "red"}]], "-", 
      SubscriptBox["E", "pair"]}], "]"}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"%", "/", 
    RowBox[{"Norm", "[", 
     RowBox[{"Flatten", "[", 
      SubscriptBox["E", "pair"], "]"}], "]"}]}]}]}]], "Input"],

Cell[BoxData["1.6782675812787438`"], "Output"],

Cell[BoxData["0.27030874443602926`"], "Output"]
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
       SubscriptBox["fn", "base"], "<>", "\"\<_E2.dat\>\""}], ",", 
      RowBox[{"ColumnMajorLayout", "[", 
       RowBox[{"ArrayReshape", "[", 
        RowBox[{
         SubscriptBox["E", "pair"], ",", 
         RowBox[{"{", 
          RowBox[{"3", ",", "4", ",", "11", ",", "7"}], "}"}]}], "]"}], "]"}],
       ",", "\"\<Complex128\>\""}], "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_E2mrg.dat\>\""}], ",", 
      RowBox[{"ColumnMajorLayout", "[", 
       RowBox[{"ArrayReshape", "[", 
        RowBox[{
         SubscriptBox["E", 
          RowBox[{"pair", ",", "red"}]], ",", 
         RowBox[{"{", 
          RowBox[{"3", ",", "4", ",", "11", ",", "7"}], "}"}]}], "]"}], "]"}],
       ",", "\"\<Complex128\>\""}], "]"}], ";"}]}]}]], "Input"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1654, 920},
WindowMargins->{{Automatic, 224}, {56, Automatic}},
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
Cell[1535, 37, 123, 3, 31, "Input"],
Cell[1661, 42, 68, 1, 31, "Input"],
Cell[1732, 45, 242, 7, 31, "Input"],
Cell[1977, 54, 1374, 38, 52, "Input"],
Cell[3354, 94, 310, 9, 31, "Input"],
Cell[CellGroupData[{
Cell[3689, 107, 43, 0, 43, "Subsection"],
Cell[3735, 109, 233, 7, 52, "Input"],
Cell[3971, 118, 209, 6, 52, "Input"],
Cell[CellGroupData[{
Cell[4205, 128, 1416, 43, 72, "Input"],
Cell[5624, 173, 73, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5734, 180, 300, 8, 72, "Input"],
Cell[6037, 190, 53, 1, 31, "Output"],
Cell[6093, 193, 50, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6180, 199, 265, 7, 52, "Input"],
Cell[6448, 208, 825, 22, 45, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7310, 235, 265, 7, 52, "Input"],
Cell[7578, 244, 822, 21, 45, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[8437, 270, 265, 7, 52, "Input"],
Cell[8705, 279, 2921, 59, 58, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11663, 343, 286, 8, 52, "Input"],
Cell[11952, 353, 967, 25, 74, "Output"]
}, Open  ]],
Cell[12934, 381, 880, 25, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13851, 411, 26, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[13902, 415, 443, 14, 52, "Input"],
Cell[14348, 431, 413, 14, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14798, 450, 241, 6, 52, "Input"],
Cell[15042, 458, 1043, 24, 45, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16122, 487, 344, 9, 52, "Input"],
Cell[16469, 498, 198, 5, 33, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[16716, 509, 45, 0, 43, "Subsection"],
Cell[16764, 511, 3935, 105, 152, "Input"],
Cell[CellGroupData[{
Cell[20724, 620, 661, 17, 72, "Input"],
Cell[21388, 639, 83, 2, 31, "Output"],
Cell[21474, 643, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[21594, 650, 399, 10, 52, "Input"],
Cell[21996, 662, 83, 2, 31, "Output"],
Cell[22082, 666, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[22202, 673, 559, 17, 52, "Input"],
Cell[22764, 692, 120, 3, 33, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[22921, 700, 1606, 44, 72, "Input"],
Cell[24530, 746, 122, 3, 33, "Output"]
}, Open  ]],
Cell[24667, 752, 1418, 39, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[26122, 796, 46, 0, 43, "Subsection"],
Cell[26171, 798, 3214, 86, 112, "Input"],
Cell[CellGroupData[{
Cell[29410, 888, 401, 10, 52, "Input"],
Cell[29814, 900, 83, 2, 31, "Output"],
Cell[29900, 904, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[30020, 911, 509, 16, 52, "Input"],
Cell[30532, 929, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[30619, 934, 1453, 40, 72, "Input"],
Cell[32075, 976, 50, 0, 31, "Output"]
}, Open  ]],
Cell[32140, 979, 1059, 30, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[33236, 1014, 53, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[33314, 1018, 160, 4, 31, "Input"],
Cell[33477, 1024, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[33597, 1031, 1013, 31, 72, "Input"],
Cell[34613, 1064, 73, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[34723, 1071, 1013, 31, 72, "Input"],
Cell[35739, 1104, 73, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[35849, 1111, 941, 28, 52, "Input"],
Cell[36793, 1141, 73, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[36903, 1148, 939, 28, 52, "Input"],
Cell[37845, 1178, 73, 2, 31, "Output"]
}, Open  ]],
Cell[37933, 1183, 1245, 34, 72, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[39215, 1222, 116, 3, 43, "Subsection"],
Cell[CellGroupData[{
Cell[39356, 1229, 160, 4, 31, "Input"],
Cell[39519, 1235, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[39639, 1242, 961, 29, 92, "Input"],
Cell[40603, 1273, 94, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[40734, 1280, 1034, 31, 72, "Input"],
Cell[41771, 1313, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[41891, 1320, 1035, 31, 72, "Input"],
Cell[42929, 1353, 84, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[43050, 1360, 1657, 46, 72, "Input"],
Cell[44710, 1408, 84, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[44831, 1415, 1487, 42, 72, "Input"],
Cell[46321, 1459, 83, 2, 31, "Output"]
}, Open  ]],
Cell[46419, 1464, 1562, 42, 92, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[48018, 1511, 52, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[48095, 1515, 716, 22, 72, "Input"],
Cell[48814, 1539, 85, 2, 31, "Output"]
}, Open  ]],
Cell[48914, 1544, 1601, 48, 54, "Input"],
Cell[CellGroupData[{
Cell[50540, 1596, 173, 4, 52, "Input"],
Cell[50716, 1602, 85, 2, 31, "Output"],
Cell[50804, 1606, 84, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[50925, 1613, 273, 8, 54, "Input"],
Cell[51201, 1623, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[51266, 1628, 132, 3, 52, "Input"],
Cell[51401, 1633, 888, 16, 52, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[52326, 1654, 221, 6, 52, "Input"],
Cell[52550, 1662, 45, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[52632, 1667, 526, 17, 69, "Input"],
Cell[53161, 1686, 46, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[53244, 1691, 604, 18, 52, "Input"],
Cell[53851, 1711, 49, 0, 31, "Output"]
}, Open  ]],
Cell[53915, 1714, 1983, 58, 75, "Input"],
Cell[CellGroupData[{
Cell[55923, 1776, 225, 6, 52, "Input"],
Cell[56151, 1784, 85, 2, 31, "Output"],
Cell[56239, 1788, 84, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[56360, 1795, 505, 15, 52, "Input"],
Cell[56868, 1812, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[56935, 1817, 248, 7, 52, "Input"],
Cell[57186, 1826, 46, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[57269, 1831, 585, 19, 73, "Input"],
Cell[57857, 1852, 45, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[57939, 1857, 741, 22, 72, "Input"],
Cell[58683, 1881, 85, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[58805, 1888, 612, 18, 72, "Input"],
Cell[59420, 1908, 46, 0, 31, "Output"],
Cell[59469, 1910, 47, 0, 31, "Output"]
}, Open  ]],
Cell[59531, 1913, 1097, 30, 72, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Uvpyzjq3qIRzQBgMZ3rIUddJ *)
