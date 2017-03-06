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
NotebookDataLength[     52743,       1537]
NotebookOptionsPosition[     51620,       1477]
NotebookOutlinePosition[     51963,       1492]
CellTagsIndexPosition[     51920,       1489]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Bose-Hubbard Hamiltonian", "Section"],

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

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"number", " ", "of", " ", "lattice", " ", "sites"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["L", "val"], "=", "7"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"maximal", " ", "occupancy", " ", "per", " ", "site"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["M", "val"], "=", "4"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"Hamiltonian", " ", "parameters"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["t", "val"], "=", 
     RowBox[{"7", "/", "10"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["U", "val"], "=", 
     RowBox[{"16", "/", "5"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["\[Mu]", "val"], "=", 
     RowBox[{"13", "/", "10"}]}], ";"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell["General definitions", "Subsection"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"SiteCreateOp", "[", "M_", "]"}], ":=", 
  RowBox[{"DiagonalMatrix", "[", 
   RowBox[{
    RowBox[{"Sqrt", "[", 
     RowBox[{"Range", "[", 
      RowBox[{"1", ",", "M"}], "]"}], "]"}], ",", 
    RowBox[{"-", "1"}]}], "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"SiteAnnihilOp", "[", "M_", "]"}], ":=", 
  RowBox[{"DiagonalMatrix", "[", 
   RowBox[{
    RowBox[{"Sqrt", "[", 
     RowBox[{"Range", "[", 
      RowBox[{"1", ",", "M"}], "]"}], "]"}], ",", "1"}], "]"}]}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"NumberOp", "[", "M_", "]"}], ":=", 
  RowBox[{"DiagonalMatrix", "[", 
   RowBox[{"Range", "[", 
    RowBox[{"0", ",", "M"}], "]"}], "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "check", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Table", "[", 
   RowBox[{
    RowBox[{"Norm", "[", 
     RowBox[{
      RowBox[{"NumberOp", "[", "M", "]"}], "-", 
      RowBox[{
       RowBox[{"SiteCreateOp", "[", "M", "]"}], ".", 
       RowBox[{"SiteAnnihilOp", "[", "M", "]"}]}]}], "]"}], ",", 
    RowBox[{"{", 
     RowBox[{"M", ",", "1", ",", "6"}], "}"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0"}], 
  "}"}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Construct full Hamiltonian as reference", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SparseIdentityMatrix", "[", "d_", "]"}], ":=", 
  RowBox[{"SparseArray", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"{", 
      RowBox[{"i_", ",", "i_"}], "}"}], "\[Rule]", "1"}], ",", 
    RowBox[{"{", 
     RowBox[{"d", ",", "d"}], "}"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"construct", " ", "Bose"}], "-", 
    RowBox[{
    "Hamiltonian", " ", "with", " ", "open", " ", "boundary", " ", 
     "conditions"}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"HBoseHubbard", "[", 
     RowBox[{"t_", ",", "U_", ",", "\[Mu]_", ",", "M_", ",", "1"}], "]"}], ":=", 
    RowBox[{
     RowBox[{
      FractionBox["U", "2"], 
      RowBox[{
       RowBox[{"NumberOp", "[", "M", "]"}], ".", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"NumberOp", "[", "M", "]"}], "-", 
         RowBox[{"IdentityMatrix", "[", 
          RowBox[{"M", "+", "1"}], "]"}]}], ")"}]}]}], "-", 
     RowBox[{"\[Mu]", " ", 
      RowBox[{"NumberOp", "[", "M", "]"}]}]}]}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"HBoseHubbard", "[", 
     RowBox[{"t_", ",", "U_", ",", "\[Mu]_", ",", "M_", ",", "L_"}], "]"}], ":=", 
    RowBox[{
     RowBox[{
      RowBox[{"-", "t"}], " ", 
      RowBox[{"Sum", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"KroneckerProduct", "[", 
          RowBox[{
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"M", "+", "1"}], ")"}], 
             RowBox[{"j", "-", "1"}]], "]"}], ",", 
           RowBox[{"SiteCreateOp", "[", "M", "]"}], ",", 
           RowBox[{"SiteAnnihilOp", "[", "M", "]"}], ",", 
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"M", "+", "1"}], ")"}], 
             RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}], "+", 
         RowBox[{"KroneckerProduct", "[", 
          RowBox[{
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"M", "+", "1"}], ")"}], 
             RowBox[{"j", "-", "1"}]], "]"}], ",", 
           RowBox[{"SiteAnnihilOp", "[", "M", "]"}], ",", 
           RowBox[{"SiteCreateOp", "[", "M", "]"}], ",", 
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"M", "+", "1"}], ")"}], 
             RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}]}], ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", "1", ",", 
          RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}], "+", 
     RowBox[{"Sum", "[", 
      RowBox[{
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         RowBox[{"SparseIdentityMatrix", "[", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"M", "+", "1"}], ")"}], 
           RowBox[{"j", "-", "1"}]], "]"}], ",", 
         RowBox[{
          RowBox[{
           FractionBox["U", "2"], 
           RowBox[{
            RowBox[{"NumberOp", "[", "M", "]"}], ".", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"NumberOp", "[", "M", "]"}], "-", 
              RowBox[{"IdentityMatrix", "[", 
               RowBox[{"M", "+", "1"}], "]"}]}], ")"}]}]}], "-", 
          RowBox[{"\[Mu]", " ", 
           RowBox[{"NumberOp", "[", "M", "]"}]}]}], ",", 
         RowBox[{"SparseIdentityMatrix", "[", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"M", "+", "1"}], ")"}], 
           RowBox[{"L", "-", "j"}]], "]"}]}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "1", ",", "L"}], "}"}]}], "]"}]}]}]}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Construct local Hamiltonian operator terms", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "local", " ", "Hamiltonian", " ", "terms", " ", "acting", " ", "on", " ", 
    "neighboring", " ", "lattice", " ", "sites"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"h2", "[", 
    RowBox[{"t_", ",", "U_", ",", "\[Mu]_", ",", "M_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"bd", "=", 
        RowBox[{"SiteCreateOp", "[", "M", "]"}]}], ",", 
       RowBox[{"b", "=", 
        RowBox[{"SiteAnnihilOp", "[", "M", "]"}]}], ",", 
       RowBox[{"S", "=", 
        RowBox[{
         RowBox[{
          FractionBox["U", "2"], 
          RowBox[{
           RowBox[{"NumberOp", "[", "M", "]"}], ".", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"NumberOp", "[", "M", "]"}], "-", 
             RowBox[{"IdentityMatrix", "[", 
              RowBox[{"M", "+", "1"}], "]"}]}], ")"}]}]}], "-", 
         RowBox[{"\[Mu]", " ", 
          RowBox[{"NumberOp", "[", "M", "]"}]}]}]}], ",", "SI", ",", "IS"}], 
      "}"}], ",", 
     RowBox[{
      RowBox[{"SI", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{"S", ",", 
         RowBox[{"IdentityMatrix", "[", 
          RowBox[{"M", "+", "1"}], "]"}]}], "]"}]}], ";", 
      RowBox[{"IS", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         RowBox[{"IdentityMatrix", "[", 
          RowBox[{"M", "+", "1"}], "]"}], ",", "S"}], "]"}]}], ";", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{
         RowBox[{
          RowBox[{"-", "t"}], 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"KroneckerProduct", "[", 
             RowBox[{"bd", ",", "b"}], "]"}], "+", 
            RowBox[{"KroneckerProduct", "[", 
             RowBox[{"b", ",", "bd"}], "]"}]}], ")"}]}], "+", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"j", "\[Equal]", "1"}], ",", 
           RowBox[{"SI", "+", 
            RowBox[{
             FractionBox["1", "2"], "IS"}]}], ",", 
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{"j", "<", 
              RowBox[{"L", "-", "1"}]}], ",", 
             RowBox[{
              FractionBox["1", "2"], 
              RowBox[{"(", 
               RowBox[{"SI", "+", "IS"}], ")"}]}], ",", 
             RowBox[{
              RowBox[{
               FractionBox["1", "2"], "SI"}], "+", "IS"}]}], "]"}]}], "]"}]}],
         ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", 
          RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}]}], "]"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["h", "sym"], "=", 
   RowBox[{"h2", "[", 
    RowBox[{"t", ",", "U", ",", "\[Mu]", ",", 
     SubscriptBox["M", "val"], ",", 
     SubscriptBox["L", "val"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"6", ",", "25", ",", "25"}], "}"}]], "Output"]
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
   SubscriptBox["h", "sym"]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"MatrixForm", "[", 
     RowBox[{"#", "\[LeftDoubleBracket]", 
      RowBox[{
       RowBox[{"1", ";;", "5"}], ",", 
       RowBox[{"1", ";;", "5"}]}], "\[RightDoubleBracket]"}], "]"}], "&"}], "/@", 
   SubscriptBox["h", "sym"]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {"0", "0", "0", "0", "0"},
       {"0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}], "0", "0", "0"},
       {"0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{"U", "-", 
           RowBox[{"2", " ", "\[Mu]"}]}], ")"}]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"3", " ", "U"}], "-", 
           RowBox[{"3", " ", "\[Mu]"}]}], ")"}]}], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"6", " ", "U"}], "-", 
           RowBox[{"4", " ", "\[Mu]"}]}], ")"}]}]}
      },
      GridBoxAlignment->{
       "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
        "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
      GridBoxSpacings->{"Columns" -> {
          Offset[0.27999999999999997`], {
           Offset[0.7]}, 
          Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
          Offset[0.2], {
           Offset[0.4]}, 
          Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
    Function[BoxForm`e$, 
     MatrixForm[BoxForm`e$]]], ",", 
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {"0", "0", "0", "0", "0"},
       {"0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}], "0", "0", "0"},
       {"0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{"U", "-", 
           RowBox[{"2", " ", "\[Mu]"}]}], ")"}]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"3", " ", "U"}], "-", 
           RowBox[{"3", " ", "\[Mu]"}]}], ")"}]}], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"6", " ", "U"}], "-", 
           RowBox[{"4", " ", "\[Mu]"}]}], ")"}]}]}
      },
      GridBoxAlignment->{
       "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
        "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
      GridBoxSpacings->{"Columns" -> {
          Offset[0.27999999999999997`], {
           Offset[0.7]}, 
          Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
          Offset[0.2], {
           Offset[0.4]}, 
          Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
    Function[BoxForm`e$, 
     MatrixForm[BoxForm`e$]]], ",", 
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {"0", "0", "0", "0", "0"},
       {"0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}], "0", "0", "0"},
       {"0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{"U", "-", 
           RowBox[{"2", " ", "\[Mu]"}]}], ")"}]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"3", " ", "U"}], "-", 
           RowBox[{"3", " ", "\[Mu]"}]}], ")"}]}], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"6", " ", "U"}], "-", 
           RowBox[{"4", " ", "\[Mu]"}]}], ")"}]}]}
      },
      GridBoxAlignment->{
       "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
        "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
      GridBoxSpacings->{"Columns" -> {
          Offset[0.27999999999999997`], {
           Offset[0.7]}, 
          Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
          Offset[0.2], {
           Offset[0.4]}, 
          Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
    Function[BoxForm`e$, 
     MatrixForm[BoxForm`e$]]], ",", 
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {"0", "0", "0", "0", "0"},
       {"0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}], "0", "0", "0"},
       {"0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{"U", "-", 
           RowBox[{"2", " ", "\[Mu]"}]}], ")"}]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"3", " ", "U"}], "-", 
           RowBox[{"3", " ", "\[Mu]"}]}], ")"}]}], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"6", " ", "U"}], "-", 
           RowBox[{"4", " ", "\[Mu]"}]}], ")"}]}]}
      },
      GridBoxAlignment->{
       "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
        "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
      GridBoxSpacings->{"Columns" -> {
          Offset[0.27999999999999997`], {
           Offset[0.7]}, 
          Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
          Offset[0.2], {
           Offset[0.4]}, 
          Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
    Function[BoxForm`e$, 
     MatrixForm[BoxForm`e$]]], ",", 
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {"0", "0", "0", "0", "0"},
       {"0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}], "0", "0", "0"},
       {"0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{"U", "-", 
           RowBox[{"2", " ", "\[Mu]"}]}], ")"}]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"3", " ", "U"}], "-", 
           RowBox[{"3", " ", "\[Mu]"}]}], ")"}]}], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"6", " ", "U"}], "-", 
           RowBox[{"4", " ", "\[Mu]"}]}], ")"}]}]}
      },
      GridBoxAlignment->{
       "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
        "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
      GridBoxSpacings->{"Columns" -> {
          Offset[0.27999999999999997`], {
           Offset[0.7]}, 
          Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
          Offset[0.2], {
           Offset[0.4]}, 
          Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
    Function[BoxForm`e$, 
     MatrixForm[BoxForm`e$]]], ",", 
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {"0", "0", "0", "0", "0"},
       {"0", 
        RowBox[{"-", "\[Mu]"}], "0", "0", "0"},
       {"0", "0", 
        RowBox[{"U", "-", 
         RowBox[{"2", " ", "\[Mu]"}]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         RowBox[{"3", " ", "U"}], "-", 
         RowBox[{"3", " ", "\[Mu]"}]}], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         RowBox[{"6", " ", "U"}], "-", 
         RowBox[{"4", " ", "\[Mu]"}]}]}
      },
      GridBoxAlignment->{
       "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
        "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
      GridBoxSpacings->{"Columns" -> {
          Offset[0.27999999999999997`], {
           Offset[0.7]}, 
          Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
          Offset[0.2], {
           Offset[0.4]}, 
          Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
    Function[BoxForm`e$, 
     MatrixForm[BoxForm`e$]]]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{"compare", " ", "with", " ", "reference", " ", "Hamiltonian"}]}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"t", ",", "U", ",", "\[Mu]", ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", 
      RowBox[{"L", "=", "6"}]}], "}"}], ",", 
    RowBox[{"Norm", "[", 
     RowBox[{"Flatten", "[", 
      RowBox[{"FullSimplify", "[", 
       RowBox[{
        RowBox[{"Sum", "[", 
         RowBox[{
          RowBox[{"KroneckerProduct", "[", 
           RowBox[{
            RowBox[{"SparseIdentityMatrix", "[", 
             SuperscriptBox[
              RowBox[{"(", 
               RowBox[{"M", "+", "1"}], ")"}], 
              RowBox[{"j", "-", "1"}]], "]"}], ",", 
            RowBox[{
             RowBox[{"h2", "[", 
              RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], 
              "]"}], "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], 
            ",", 
            RowBox[{"SparseIdentityMatrix", "[", 
             SuperscriptBox[
              RowBox[{"(", 
               RowBox[{"M", "+", "1"}], ")"}], 
              RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{"j", ",", "1", ",", 
            RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], "-", 
        RowBox[{"HBoseHubbard", "[", 
         RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}]}], 
       "]"}], "]"}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"save", " ", "'"}], 
    RowBox[{"h", "'"}], " ", "matrices", " ", "as", " ", "reference", " ", 
    "to", " ", "disk"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"d", "=", 
        RowBox[{
         SubscriptBox["M", "val"], "+", "1"}]}]}], "}"}], ",", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"Export", "[", 
        RowBox[{
         RowBox[{
          SubscriptBox["fn", "base"], "<>", "\"\<_h\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{"Flatten", "[", 
          RowBox[{"Transpose", "[", 
           RowBox[{
            RowBox[{"ArrayReshape", "[", 
             RowBox[{
              RowBox[{
               RowBox[{
                SubscriptBox["h", "sym"], "\[LeftDoubleBracket]", "j", 
                "\[RightDoubleBracket]"}], "/.", 
               RowBox[{"{", 
                RowBox[{
                 RowBox[{"t", "\[Rule]", 
                  SubscriptBox["t", "val"]}], ",", 
                 RowBox[{"U", "\[Rule]", 
                  SubscriptBox["U", "val"]}], ",", 
                 RowBox[{"\[Mu]", "\[Rule]", 
                  SubscriptBox["\[Mu]", "val"]}]}], "}"}]}], ",", 
              RowBox[{"{", 
               RowBox[{"d", ",", "d", ",", "d", ",", "d"}], "}"}]}], "]"}], 
            ",", 
            RowBox[{"Reverse", "[", 
             RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], "]"}], ",", 
         "\"\<Real64\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", 
         RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Matrix product operator representation of Hamiltonian", "Subsection"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"Wfirst", "[", 
   RowBox[{"t_", ",", "U_", ",", "\[Mu]_", ",", "M_"}], "]"}], ":=", 
  RowBox[{"SparseArray", "[", 
   RowBox[{"Transpose", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{
         RowBox[{
          FractionBox["U", "2"], " ", 
          RowBox[{
           RowBox[{"NumberOp", "[", "M", "]"}], ".", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"NumberOp", "[", "M", "]"}], "-", 
             RowBox[{"IdentityMatrix", "[", 
              RowBox[{"M", "+", "1"}], "]"}]}], ")"}]}]}], "-", 
         RowBox[{"\[Mu]", " ", 
          RowBox[{"NumberOp", "[", "M", "]"}]}]}], ",", 
        RowBox[{
         RowBox[{"-", "t"}], " ", 
         RowBox[{"SiteCreateOp", "[", "M", "]"}]}], ",", 
        RowBox[{
         RowBox[{"-", "t"}], " ", 
         RowBox[{"SiteAnnihilOp", "[", "M", "]"}]}], ",", 
        RowBox[{"IdentityMatrix", "[", 
         RowBox[{"M", "+", "1"}], "]"}]}], "}"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"3", ",", "4", ",", "1", ",", "2"}], "}"}]}], "]"}], 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"W", "[", 
   RowBox[{"t_", ",", "U_", ",", "\[Mu]_", ",", "M_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"I", "=", 
       RowBox[{"IdentityMatrix", "[", 
        RowBox[{"M", "+", "1"}], "]"}]}], ",", 
      RowBox[{"O", "=", 
       RowBox[{"ConstantArray", "[", 
        RowBox[{"0", ",", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"M", "+", "1"}], ")"}], 
          RowBox[{"{", 
           RowBox[{"1", ",", "1"}], "}"}]}]}], "]"}]}]}], "}"}], ",", 
    RowBox[{"SparseArray", "[", 
     RowBox[{"Transpose", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"I", ",", "O", ",", "O", ",", "O"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"SiteAnnihilOp", "[", "M", "]"}], ",", "O", ",", "O", ",", 
           "O"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"SiteCreateOp", "[", "M", "]"}], ",", "O", ",", "O", ",", 
           "O"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{
            RowBox[{
             FractionBox["U", "2"], " ", 
             RowBox[{
              RowBox[{"NumberOp", "[", "M", "]"}], ".", 
              RowBox[{"(", 
               RowBox[{
                RowBox[{"NumberOp", "[", "M", "]"}], "-", 
                RowBox[{"IdentityMatrix", "[", 
                 RowBox[{"M", "+", "1"}], "]"}]}], ")"}]}]}], "-", 
            RowBox[{"\[Mu]", " ", 
             RowBox[{"NumberOp", "[", "M", "]"}]}]}], ",", 
           RowBox[{
            RowBox[{"-", "t"}], " ", 
            RowBox[{"SiteCreateOp", "[", "M", "]"}]}], ",", 
           RowBox[{
            RowBox[{"-", "t"}], " ", 
            RowBox[{"SiteAnnihilOp", "[", "M", "]"}]}], ",", "I"}], "}"}]}], 
        "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"3", ",", "4", ",", "1", ",", "2"}], "}"}]}], "]"}], "]"}]}], 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Wlast", "[", 
   RowBox[{"t_", ",", "U_", ",", "\[Mu]_", ",", "M_"}], "]"}], ":=", 
  RowBox[{"SparseArray", "[", 
   RowBox[{"Transpose", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"IdentityMatrix", "[", 
         RowBox[{"M", "+", "1"}], "]"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"SiteAnnihilOp", "[", "M", "]"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"SiteCreateOp", "[", "M", "]"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{
          FractionBox["U", "2"], " ", 
          RowBox[{
           RowBox[{"NumberOp", "[", "M", "]"}], ".", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"NumberOp", "[", "M", "]"}], "-", 
             RowBox[{"IdentityMatrix", "[", 
              RowBox[{"M", "+", "1"}], "]"}]}], ")"}]}]}], "-", 
         RowBox[{"\[Mu]", " ", 
          RowBox[{"NumberOp", "[", "M", "]"}]}]}], "}"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"3", ",", "4", ",", "1", ",", "2"}], "}"}]}], "]"}], 
   "]"}]}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"W", "[", 
    RowBox[{"t", ",", "U", ",", "\[Mu]", ",", 
     SubscriptBox["M", "val"]}], "]"}], "//", "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"1", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "1"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"1", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", 
          RowBox[{"-", "t"}], "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"1", "0", "0", "0"},
         {"0", 
          RowBox[{"-", "t"}], "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"1", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {
          RowBox[{"-", "\[Mu]"}], "0", "0", "1"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {
          SqrtBox["2"], "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", 
          RowBox[{
           RowBox[{"-", 
            SqrtBox["2"]}], " ", "t"}], "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {
          SqrtBox["2"], "0", "0", "0"},
         {"0", 
          RowBox[{
           RowBox[{"-", 
            SqrtBox["2"]}], " ", "t"}], "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"1", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {
          RowBox[{"U", "-", 
           RowBox[{"2", " ", "\[Mu]"}]}], "0", "0", "1"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {
          SqrtBox["3"], "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", 
          RowBox[{
           RowBox[{"-", 
            SqrtBox["3"]}], " ", "t"}], "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {
          SqrtBox["3"], "0", "0", "0"},
         {"0", 
          RowBox[{
           RowBox[{"-", 
            SqrtBox["3"]}], " ", "t"}], "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"1", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {
          RowBox[{
           RowBox[{"3", " ", "U"}], "-", 
           RowBox[{"3", " ", "\[Mu]"}]}], "0", "0", "1"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"2", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", 
          RowBox[{
           RowBox[{"-", "2"}], " ", "t"}], "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"2", "0", "0", "0"},
         {"0", 
          RowBox[{
           RowBox[{"-", "2"}], " ", "t"}], "0", "0"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}], 
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"1", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {"0", "0", "0", "0"},
         {
          RowBox[{
           RowBox[{"6", " ", "U"}], "-", 
           RowBox[{"4", " ", "\[Mu]"}]}], "0", "0", "1"}
        },
        GridBoxAlignment->{
         "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
          "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
        GridBoxSpacings->{"Columns" -> {
            Offset[0.27999999999999997`], {
             Offset[0.7]}, 
            Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
            Offset[0.2], {
             Offset[0.4]}, 
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}]}
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
   MatrixForm[
   SparseArray[
    Automatic, {5, 5, 4, 4}, 0, {
     1, {{0, 4, 11, 18, 25, 30}, {{1, 1, 1}, {1, 4, 4}, {2, 2, 1}, {2, 4, 
       3}, {1, 3, 1}, {1, 4, 2}, {2, 1, 1}, {2, 4, 1}, {2, 4, 4}, {3, 2, 1}, {
       3, 4, 3}, {2, 3, 1}, {2, 4, 2}, {3, 1, 1}, {3, 4, 1}, {3, 4, 4}, {4, 2,
        1}, {4, 4, 3}, {3, 3, 1}, {3, 4, 2}, {4, 1, 1}, {4, 4, 1}, {4, 4, 
       4}, {5, 2, 1}, {5, 4, 3}, {4, 3, 1}, {4, 4, 2}, {5, 1, 1}, {5, 4, 1}, {
       5, 4, 4}}}, {
      1, 1, 1, -$CellContext`t, 1, -$CellContext`t, 1, -$CellContext`\[Mu], 1,
        2^Rational[1, 2], -2^Rational[1, 2] $CellContext`t, 2^
       Rational[1, 2], -2^Rational[1, 2] $CellContext`t, 1, $CellContext`U - 
       2 $CellContext`\[Mu], 1, 3^
       Rational[1, 2], -3^Rational[1, 2] $CellContext`t, 3^
       Rational[1, 2], -3^Rational[1, 2] $CellContext`t, 1, 3 $CellContext`U - 
       3 $CellContext`\[Mu], 1, 2, (-2) $CellContext`t, 
       2, (-2) $CellContext`t, 1, 6 $CellContext`U - 4 $CellContext`\[Mu], 
       1}}]]]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{"compare", " ", "with", " ", "reference", " ", "Hamiltonian"}]}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"t", ",", "U", ",", "\[Mu]", ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", 
      RowBox[{"L", "=", "4"}]}], "}"}], ",", 
    RowBox[{"Norm", "[", 
     RowBox[{
      RowBox[{"MPOMergeFull", "[", 
       RowBox[{"Append", "[", 
        RowBox[{
         RowBox[{"Prepend", "[", 
          RowBox[{
           RowBox[{"Table", "[", 
            RowBox[{
             RowBox[{"W", "[", 
              RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M"}], "]"}], ",", 
             RowBox[{"{", 
              RowBox[{"j", ",", "2", ",", 
               RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], ",", 
           RowBox[{"Wfirst", "[", 
            RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M"}], "]"}]}], "]"}], 
         ",", 
         RowBox[{"Wlast", "[", 
          RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M"}], "]"}]}], "]"}], 
       "]"}], "-", 
      RowBox[{"HBoseHubbard", "[", 
       RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}]}], 
     "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{
     RowBox[{"entries", " ", "are", " ", "non"}], "-", 
     RowBox[{
     "zero", " ", "for", " ", "matching", " ", "quantum", " ", "numbers", " ",
       "only"}]}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"t", ",", "U", ",", "\[Mu]", ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", "qd", ",", 
      RowBox[{"qD", "=", 
       RowBox[{"{", 
        RowBox[{"0", ",", "1", ",", 
         RowBox[{"-", "1"}], ",", "0"}], "}"}]}]}], "}"}], ",", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"Range", "[", 
       RowBox[{"0", ",", "M"}], "]"}]}], ";", 
     RowBox[{
      RowBox[{"MPOBlockStructureError", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Wfirst", "[", 
           RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M"}], "]"}], ",", 
          RowBox[{"{", "0", "}"}], ",", "qD"}], "}"}], ",", "qd"}], "]"}], 
      "+", 
      RowBox[{"MPOBlockStructureError", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"W", "[", 
           RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M"}], "]"}], ",", "qD", 
          ",", "qD"}], "}"}], ",", "qd"}], "]"}], "+", 
      RowBox[{"MPOBlockStructureError", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Wlast", "[", 
           RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M"}], "]"}], ",", "qD", 
          ",", 
          RowBox[{"{", "0", "}"}]}], "}"}], ",", "qd"}], "]"}]}]}]}], 
   "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"save", " ", "'"}], 
     RowBox[{"W", "'"}], " ", "matrices", " ", "as", " ", "reference", " ", 
     "to", " ", "disk"}], ",", " ", 
    RowBox[{
     RowBox[{"imitating", " ", "complex"}], "-", 
     RowBox[{"valued", " ", "entries", " ", 
      RowBox[{"(", 
       RowBox[{
       "with", " ", "imaginary", " ", "part", " ", "set", " ", "to", " ", 
        "zero"}], ")"}]}]}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"t", "=", 
        SubscriptBox["t", "val"]}], ",", 
       RowBox[{"U", "=", 
        SubscriptBox["U", "val"]}], ",", 
       RowBox[{"\[Mu]", "=", 
        SubscriptBox["\[Mu]", "val"]}], ",", 
       RowBox[{"M", "=", 
        SubscriptBox["M", "val"]}], ",", 
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}]}], "}"}], ",", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"Export", "[", 
        RowBox[{
         RowBox[{
          SubscriptBox["fn", "base"], "<>", "\"\<_W\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{
          RowBox[{"Normal", "[", 
           RowBox[{"Transpose", "[", 
            RowBox[{
             RowBox[{"If", "[", 
              RowBox[{
               RowBox[{"j", "\[Equal]", "1"}], ",", 
               RowBox[{"Wfirst", "[", 
                RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M"}], "]"}], ",", 
               RowBox[{"If", "[", 
                RowBox[{
                 RowBox[{"j", "<", "L"}], ",", 
                 RowBox[{"W", "[", 
                  RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M"}], "]"}], ",", 
                 RowBox[{"Wlast", "[", 
                  RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M"}], "]"}]}], 
                "]"}]}], "]"}], ",", 
             RowBox[{"Reverse", "[", 
              RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], "]"}], "+", 
          RowBox[{"0.", "\[ImaginaryI]"}]}], ",", "\"\<Complex128\>\""}], 
        "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"]
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
Cell[1486, 35, 43, 0, 63, "Section"],
Cell[1532, 37, 123, 3, 31, "Input"],
Cell[1658, 42, 68, 1, 31, "Input"],
Cell[1729, 45, 174, 5, 31, "Input"],
Cell[1906, 52, 233, 7, 52, "Input"],
Cell[2142, 61, 237, 7, 52, "Input"],
Cell[2382, 70, 516, 17, 92, "Input"],
Cell[CellGroupData[{
Cell[2923, 91, 41, 0, 43, "Subsection"],
Cell[2967, 93, 524, 15, 52, "Input"],
Cell[3494, 110, 185, 5, 31, "Input"],
Cell[CellGroupData[{
Cell[3704, 119, 437, 12, 52, "Input"],
Cell[4144, 133, 116, 3, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[4309, 142, 61, 0, 43, "Subsection"],
Cell[4373, 144, 297, 9, 31, "Input"],
Cell[4673, 155, 3424, 91, 167, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[8134, 251, 64, 0, 43, "Subsection"],
Cell[8201, 253, 2601, 74, 123, "Input"],
Cell[CellGroupData[{
Cell[10827, 331, 301, 8, 52, "Input"],
Cell[11131, 341, 85, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11253, 348, 313, 10, 52, "Input"],
Cell[11569, 360, 116, 3, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11722, 368, 370, 10, 52, "Input"],
Cell[12095, 380, 7638, 226, 260, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[19770, 611, 1578, 41, 76, "Input"],
Cell[21351, 654, 28, 0, 31, "Output"]
}, Open  ]],
Cell[21394, 657, 1855, 50, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[23286, 712, 75, 0, 43, "Subsection"],
Cell[23364, 714, 4238, 120, 174, "Input"],
Cell[CellGroupData[{
Cell[27627, 838, 246, 6, 52, "Input"],
Cell[27876, 846, 18387, 468, 362, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[46300, 1319, 1285, 35, 52, "Input"],
Cell[47588, 1356, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[47653, 1361, 1639, 47, 72, "Input"],
Cell[49295, 1410, 28, 0, 31, "Output"]
}, Open  ]],
Cell[49338, 1413, 2254, 60, 72, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature cv0iG@hF3QHZVDKZ3LGLrD4x *)
