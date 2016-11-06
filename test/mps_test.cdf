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
NotebookDataLength[     35918,       1130]
NotebookOptionsPosition[     33538,       1025]
NotebookOutlinePosition[     33881,       1040]
CellTagsIndexPosition[     33838,       1037]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Matrix Product States (MPS)", "Section"],

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
   RowBox[{
    RowBox[{"NotebookDirectory", "[", "]"}], "<>", 
    RowBox[{"FileBaseName", "[", 
     RowBox[{"NotebookFileName", "[", "]"}], "]"}]}]}], ";"}]], "Input"],

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
         "}"}]}], ",", "zmax"}], "}"}], ",", 
     RowBox[{
      RowBox[{"zmax", "=", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "3"}]}], ";", 
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
         RowBox[{"\[Sigma]", ",", "d"}], "}"}]}], "]"}]}]}], "]"}]}], 
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
         RowBox[{"Transpose", "[", 
          RowBox[{
           RowBox[{
            SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "j", 
            "\[RightDoubleBracket]"}], ",", 
           RowBox[{"{", 
            RowBox[{"3", ",", "2", ",", "1"}], "}"}]}], "]"}], ",", 
         "\"\<Complex128\>\""}], "]"}], ",", 
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
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", "6", "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["e", "list"], "\[LeftDoubleBracket]", "1", 
   "\[RightDoubleBracket]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "4"}], "}"}]], "Output"]
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
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["e", "list"], "\[LeftDoubleBracket]", "2", 
   "\[RightDoubleBracket]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "81"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["e", "list"], "\[LeftDoubleBracket]", 
   RowBox[{"-", "1"}], "\[RightDoubleBracket]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"9", ",", "1"}], "}"}]], "Output"]
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
           RowBox[{"Transpose", "[", 
            RowBox[{
             RowBox[{
              SubscriptBox["A", 
               RowBox[{"left", ",", "j", ",", "list"}]], 
              "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], ",", 
             RowBox[{"{", 
              RowBox[{"3", ",", "2", ",", "1"}], "}"}]}], "]"}], ",", 
           "\"\<Complex128\>\""}], "]"}], ",", 
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
         RowBox[{"Transpose", "[", 
          RowBox[{
           RowBox[{
            SubscriptBox["A", 
             RowBox[{"right", ",", "j", ",", "list"}]], 
            "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], ",", 
           RowBox[{"{", 
            RowBox[{"3", ",", "2", ",", "1"}], "}"}]}], "]"}], ",", 
         "\"\<Complex128\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"i", ",", 
         RowBox[{"j", "-", "1"}], ",", "j"}], "}"}]}], "]"}]}], "]"}], 
   ";"}]}]], "Input"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1654, 920},
WindowMargins->{{Automatic, 172}, {78, Automatic}},
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
Cell[1535, 37, 1172, 26, 239, "Text"],
Cell[2710, 65, 123, 3, 31, "Input"],
Cell[2836, 70, 69, 1, 31, "Input"],
Cell[2908, 73, 242, 7, 31, "Input"],
Cell[CellGroupData[{
Cell[3175, 84, 43, 0, 43, "Subsection"],
Cell[3221, 86, 233, 7, 52, "Input"],
Cell[3457, 95, 209, 6, 52, "Input"],
Cell[CellGroupData[{
Cell[3691, 105, 1453, 43, 72, "Input"],
Cell[5147, 150, 73, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5257, 157, 300, 8, 72, "Input"],
Cell[5560, 167, 53, 1, 31, "Output"],
Cell[5616, 170, 50, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5703, 176, 265, 7, 52, "Input"],
Cell[5971, 185, 825, 22, 45, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6833, 212, 265, 7, 52, "Input"],
Cell[7101, 221, 822, 21, 45, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7960, 247, 265, 7, 52, "Input"],
Cell[8228, 256, 2921, 59, 58, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11186, 320, 286, 8, 52, "Input"],
Cell[11475, 330, 967, 25, 74, "Output"]
}, Open  ]],
Cell[12457, 358, 982, 28, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13476, 391, 26, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[13527, 395, 447, 14, 52, "Input"],
Cell[13977, 411, 50, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14064, 417, 160, 4, 31, "Input"],
Cell[14227, 423, 73, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14337, 430, 241, 6, 52, "Input"],
Cell[14581, 438, 1043, 24, 45, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15661, 467, 160, 4, 31, "Input"],
Cell[15824, 473, 74, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15935, 480, 175, 4, 31, "Input"],
Cell[16113, 486, 73, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16223, 493, 344, 9, 52, "Input"],
Cell[16570, 504, 198, 5, 33, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[16817, 515, 45, 0, 43, "Subsection"],
Cell[16865, 517, 3935, 105, 152, "Input"],
Cell[CellGroupData[{
Cell[20825, 626, 661, 17, 72, "Input"],
Cell[21489, 645, 83, 2, 31, "Output"],
Cell[21575, 649, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[21695, 656, 399, 10, 52, "Input"],
Cell[22097, 668, 83, 2, 31, "Output"],
Cell[22183, 672, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[22303, 679, 559, 17, 52, "Input"],
Cell[22865, 698, 120, 3, 33, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[23022, 706, 1606, 44, 72, "Input"],
Cell[24631, 752, 122, 3, 33, "Output"]
}, Open  ]],
Cell[24768, 758, 1526, 42, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[26331, 805, 46, 0, 43, "Subsection"],
Cell[26380, 807, 3214, 86, 112, "Input"],
Cell[CellGroupData[{
Cell[29619, 897, 401, 10, 52, "Input"],
Cell[30023, 909, 83, 2, 31, "Output"],
Cell[30109, 913, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[30229, 920, 509, 16, 52, "Input"],
Cell[30741, 938, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[30828, 943, 1453, 40, 72, "Input"],
Cell[32284, 985, 50, 0, 31, "Output"]
}, Open  ]],
Cell[32349, 988, 1161, 33, 52, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature @w0cDKJGnmoEcDK5kUgtZYHd *)
