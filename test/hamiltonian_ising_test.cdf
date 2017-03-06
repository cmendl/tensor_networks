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
NotebookDataLength[     30364,        942]
NotebookOptionsPosition[     29854,        902]
NotebookOutlinePosition[     30197,        917]
CellTagsIndexPosition[     30154,        914]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Ising Hamiltonian", "Section"],

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
   "construct", " ", "Ising", " ", "Hamiltonian", " ", "with", " ", 
    "longitudinal", " ", "field", " ", 
    RowBox[{"(", 
     RowBox[{"open", " ", "boundary", " ", "conditions"}], ")"}]}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"HIsing", "[", 
    RowBox[{"J_", ",", "h_", ",", "g_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"\[Sigma]", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"0", ",", "1"}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"1", ",", "0"}], "}"}]}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"0", ",", 
             RowBox[{"-", "\[ImaginaryI]"}]}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"\[ImaginaryI]", ",", "0"}], "}"}]}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"1", ",", "0"}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"0", ",", 
             RowBox[{"-", "1"}]}], "}"}]}], "}"}]}], "}"}]}], "}"}], ",", 
     RowBox[{
      RowBox[{"Sum", "[", 
       RowBox[{
        RowBox[{"J", " ", 
         RowBox[{"KroneckerProduct", "[", 
          RowBox[{
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox["2", 
             RowBox[{"l", "-", "1"}]], "]"}], ",", 
           RowBox[{
           "\[Sigma]", "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}],
            ",", 
           RowBox[{
           "\[Sigma]", "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}],
            ",", 
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox["2", 
             RowBox[{"L", "-", "l", "-", "1"}]], "]"}]}], "]"}]}], ",", 
        RowBox[{"{", 
         RowBox[{"l", ",", "1", ",", 
          RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], "+", 
      RowBox[{"Sum", "[", 
       RowBox[{
        RowBox[{"KroneckerProduct", "[", 
         RowBox[{
          RowBox[{"SparseIdentityMatrix", "[", 
           SuperscriptBox["2", 
            RowBox[{"l", "-", "1"}]], "]"}], ",", 
          RowBox[{
           RowBox[{"g", " ", 
            RowBox[{
            "\[Sigma]", "\[LeftDoubleBracket]", "1", 
             "\[RightDoubleBracket]"}]}], "+", 
           RowBox[{"h", " ", 
            RowBox[{
            "\[Sigma]", "\[LeftDoubleBracket]", "3", 
             "\[RightDoubleBracket]"}]}]}], ",", 
          RowBox[{"SparseIdentityMatrix", "[", 
           SuperscriptBox["2", 
            RowBox[{"L", "-", "l"}]], "]"}]}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"l", ",", "1", ",", "L"}], "}"}]}], "]"}]}]}], 
    "]"}]}]}]], "Input"]
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
    RowBox[{"J_", ",", "h_", ",", "g_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"\[Sigma]", "=", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", "1"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"1", ",", "0"}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", 
              RowBox[{"-", "\[ImaginaryI]"}]}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"\[ImaginaryI]", ",", "0"}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"1", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", 
              RowBox[{"-", "1"}]}], "}"}]}], "}"}]}], "}"}]}], ",", "opI", 
       ",", "Iop"}], "}"}], ",", 
     RowBox[{
      RowBox[{"opI", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"g", " ", 
           RowBox[{
           "\[Sigma]", "\[LeftDoubleBracket]", "1", 
            "\[RightDoubleBracket]"}]}], "+", 
          RowBox[{"h", " ", 
           RowBox[{
           "\[Sigma]", "\[LeftDoubleBracket]", "3", 
            "\[RightDoubleBracket]"}]}]}], ",", 
         RowBox[{"IdentityMatrix", "[", "2", "]"}]}], "]"}]}], ";", 
      RowBox[{"Iop", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         RowBox[{"IdentityMatrix", "[", "2", "]"}], ",", 
         RowBox[{
          RowBox[{"g", " ", 
           RowBox[{
           "\[Sigma]", "\[LeftDoubleBracket]", "1", 
            "\[RightDoubleBracket]"}]}], "+", 
          RowBox[{"h", " ", 
           RowBox[{
           "\[Sigma]", "\[LeftDoubleBracket]", "3", 
            "\[RightDoubleBracket]"}]}]}]}], "]"}]}], ";", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"J", " ", 
          RowBox[{"KroneckerProduct", "[", 
           RowBox[{
            RowBox[{
            "\[Sigma]", "\[LeftDoubleBracket]", "3", 
             "\[RightDoubleBracket]"}], ",", 
            RowBox[{
            "\[Sigma]", "\[LeftDoubleBracket]", "3", 
             "\[RightDoubleBracket]"}]}], "]"}]}], "+", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"j", "\[Equal]", "1"}], ",", 
           RowBox[{"opI", "+", 
            RowBox[{
             FractionBox["1", "2"], "Iop"}]}], ",", 
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{"j", "<", 
              RowBox[{"L", "-", "1"}]}], ",", 
             RowBox[{
              FractionBox["1", "2"], 
              RowBox[{"(", 
               RowBox[{"opI", "+", "Iop"}], ")"}]}], ",", 
             RowBox[{
              RowBox[{
               FractionBox["1", "2"], "opI"}], "+", "Iop"}]}], "]"}]}], 
          "]"}]}], ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", 
          RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}]}], "]"}]}]}]], "Input"],

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
     RowBox[{"J", ",", "h", ",", "g", ",", 
      RowBox[{"L", "=", "7"}]}], "}"}], ",", 
    RowBox[{"Norm", "[", 
     RowBox[{"Flatten", "[", 
      RowBox[{"FullSimplify", "[", 
       RowBox[{
        RowBox[{"Sum", "[", 
         RowBox[{
          RowBox[{"KroneckerProduct", "[", 
           RowBox[{
            RowBox[{"SparseIdentityMatrix", "[", 
             SuperscriptBox["2", 
              RowBox[{"j", "-", "1"}]], "]"}], ",", 
            RowBox[{
             RowBox[{"h2", "[", 
              RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], 
             "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], ",", 
            RowBox[{"SparseIdentityMatrix", "[", 
             SuperscriptBox["2", 
              RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{"j", ",", "1", ",", 
            RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], "-", 
        RowBox[{"HIsing", "[", 
         RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}]}], "]"}], "]"}], 
     "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
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
   RowBox[{"h2", "[", 
    RowBox[{"J", ",", "h", ",", "g", ",", "7"}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"MatrixForm", "/@", 
   RowBox[{"h2", "[", 
    RowBox[{"J", ",", "h", ",", "g", ",", "7"}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {
        RowBox[{
         FractionBox[
          RowBox[{"3", " ", "h"}], "2"], "+", "J"}], 
        FractionBox["g", "2"], "g", "0"},
       {
        FractionBox["g", "2"], 
        RowBox[{
         FractionBox["h", "2"], "-", "J"}], "0", "g"},
       {"g", "0", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["h", "2"]}], "-", "J"}], 
        FractionBox["g", "2"]},
       {"0", "g", 
        FractionBox["g", "2"], 
        RowBox[{
         RowBox[{"-", 
          FractionBox[
           RowBox[{"3", " ", "h"}], "2"]}], "+", "J"}]}
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
       {
        RowBox[{"h", "+", "J"}], 
        FractionBox["g", "2"], 
        FractionBox["g", "2"], "0"},
       {
        FractionBox["g", "2"], 
        RowBox[{"-", "J"}], "0", 
        FractionBox["g", "2"]},
       {
        FractionBox["g", "2"], "0", 
        RowBox[{"-", "J"}], 
        FractionBox["g", "2"]},
       {"0", 
        FractionBox["g", "2"], 
        FractionBox["g", "2"], 
        RowBox[{
         RowBox[{"-", "h"}], "+", "J"}]}
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
       {
        RowBox[{"h", "+", "J"}], 
        FractionBox["g", "2"], 
        FractionBox["g", "2"], "0"},
       {
        FractionBox["g", "2"], 
        RowBox[{"-", "J"}], "0", 
        FractionBox["g", "2"]},
       {
        FractionBox["g", "2"], "0", 
        RowBox[{"-", "J"}], 
        FractionBox["g", "2"]},
       {"0", 
        FractionBox["g", "2"], 
        FractionBox["g", "2"], 
        RowBox[{
         RowBox[{"-", "h"}], "+", "J"}]}
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
       {
        RowBox[{"h", "+", "J"}], 
        FractionBox["g", "2"], 
        FractionBox["g", "2"], "0"},
       {
        FractionBox["g", "2"], 
        RowBox[{"-", "J"}], "0", 
        FractionBox["g", "2"]},
       {
        FractionBox["g", "2"], "0", 
        RowBox[{"-", "J"}], 
        FractionBox["g", "2"]},
       {"0", 
        FractionBox["g", "2"], 
        FractionBox["g", "2"], 
        RowBox[{
         RowBox[{"-", "h"}], "+", "J"}]}
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
       {
        RowBox[{"h", "+", "J"}], 
        FractionBox["g", "2"], 
        FractionBox["g", "2"], "0"},
       {
        FractionBox["g", "2"], 
        RowBox[{"-", "J"}], "0", 
        FractionBox["g", "2"]},
       {
        FractionBox["g", "2"], "0", 
        RowBox[{"-", "J"}], 
        FractionBox["g", "2"]},
       {"0", 
        FractionBox["g", "2"], 
        FractionBox["g", "2"], 
        RowBox[{
         RowBox[{"-", "h"}], "+", "J"}]}
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
       {
        RowBox[{
         FractionBox[
          RowBox[{"3", " ", "h"}], "2"], "+", "J"}], "g", 
        FractionBox["g", "2"], "0"},
       {"g", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["h", "2"]}], "-", "J"}], "0", 
        FractionBox["g", "2"]},
       {
        FractionBox["g", "2"], "0", 
        RowBox[{
         FractionBox["h", "2"], "-", "J"}], "g"},
       {"0", 
        FractionBox["g", "2"], "g", 
        RowBox[{
         RowBox[{"-", 
          FractionBox[
           RowBox[{"3", " ", "h"}], "2"]}], "+", "J"}]}
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
       RowBox[{"J", "=", 
        RowBox[{"5", "/", "11"}]}], ",", 
       RowBox[{"h", "=", 
        RowBox[{
         RowBox[{"-", "2"}], "/", "7"}]}], ",", 
       RowBox[{"g", "=", 
        RowBox[{"13", "/", "8"}]}], ",", 
       RowBox[{"L", "=", "7"}]}], "}"}], ",", 
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
               RowBox[{"h2", "[", 
                RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], 
               "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], ",", 
              RowBox[{"{", 
               RowBox[{"2", ",", "2", ",", "2", ",", "2"}], "}"}]}], "]"}], 
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
   RowBox[{"J_", ",", "h_", ",", "g_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"I", "=", 
       RowBox[{"IdentityMatrix", "[", "2", "]"}]}], ",", 
      RowBox[{"\[Sigma]x", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"0", ",", "1"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"1", ",", "0"}], "}"}]}], "}"}]}], ",", 
      RowBox[{"\[Sigma]z", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"1", ",", "0"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"0", ",", 
           RowBox[{"-", "1"}]}], "}"}]}], "}"}]}]}], "}"}], ",", 
    RowBox[{"SparseArray", "[", 
     RowBox[{"Transpose", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{
           RowBox[{"g", " ", "\[Sigma]x"}], "+", 
           RowBox[{"h", " ", "\[Sigma]z"}]}], ",", 
          RowBox[{"J", " ", "\[Sigma]z"}], ",", "I"}], "}"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"3", ",", "4", ",", "1", ",", "2"}], "}"}]}], "]"}], "]"}]}], 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"W", "[", 
   RowBox[{"J_", ",", "h_", ",", "g_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"I", "=", 
       RowBox[{"IdentityMatrix", "[", "2", "]"}]}], ",", 
      RowBox[{"O", "=", 
       RowBox[{"ConstantArray", "[", 
        RowBox[{"0", ",", 
         RowBox[{"{", 
          RowBox[{"2", ",", "2"}], "}"}]}], "]"}]}], ",", 
      RowBox[{"\[Sigma]x", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"0", ",", "1"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"1", ",", "0"}], "}"}]}], "}"}]}], ",", 
      RowBox[{"\[Sigma]z", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"1", ",", "0"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"0", ",", 
           RowBox[{"-", "1"}]}], "}"}]}], "}"}]}]}], "}"}], ",", 
    RowBox[{"SparseArray", "[", 
     RowBox[{"Transpose", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"I", ",", "O", ",", "O"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"\[Sigma]z", ",", "O", ",", "O"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{
            RowBox[{"g", " ", "\[Sigma]x"}], "+", 
            RowBox[{"h", " ", "\[Sigma]z"}]}], ",", 
           RowBox[{"J", " ", "\[Sigma]z"}], ",", "I"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"3", ",", "4", ",", "1", ",", "2"}], "}"}]}], "]"}], "]"}]}], 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Wlast", "[", 
   RowBox[{"J_", ",", "h_", ",", "g_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"I", "=", 
       RowBox[{"IdentityMatrix", "[", "2", "]"}]}], ",", 
      RowBox[{"\[Sigma]x", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"0", ",", "1"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"1", ",", "0"}], "}"}]}], "}"}]}], ",", 
      RowBox[{"\[Sigma]z", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"1", ",", "0"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"0", ",", 
           RowBox[{"-", "1"}]}], "}"}]}], "}"}]}]}], "}"}], ",", 
    RowBox[{"SparseArray", "[", 
     RowBox[{"Transpose", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", "I", "}"}], ",", 
         RowBox[{"{", "\[Sigma]z", "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"g", " ", "\[Sigma]x"}], "+", 
           RowBox[{"h", " ", "\[Sigma]z"}]}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"3", ",", "4", ",", "1", ",", "2"}], "}"}]}], "]"}], "]"}]}], 
   "]"}]}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"W", "[", 
    RowBox[{"J", ",", "h", ",", "g"}], "]"}], "//", "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"1", "0", "0"},
         {"1", "0", "0"},
         {"h", "J", "1"}
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
         {"0", "0", "0"},
         {"0", "0", "0"},
         {"g", "0", "0"}
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
         {"0", "0", "0"},
         {"0", "0", "0"},
         {"g", "0", "0"}
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
         {"1", "0", "0"},
         {
          RowBox[{"-", "1"}], "0", "0"},
         {
          RowBox[{"-", "h"}], 
          RowBox[{"-", "J"}], "1"}
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
    Automatic, {2, 2, 3, 3}, 0, {
     1, {{0, 6, 12}, {{1, 1, 1}, {1, 2, 1}, {1, 3, 1}, {1, 3, 2}, {1, 3, 3}, {
       2, 3, 1}, {1, 3, 1}, {2, 1, 1}, {2, 2, 1}, {2, 3, 1}, {2, 3, 2}, {2, 3,
        3}}}, {1, 1, $CellContext`h, $CellContext`J, 
       1, $CellContext`g, $CellContext`g, 
       1, -1, -$CellContext`h, -$CellContext`J, 1}}]]]]], "Output"]
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
     RowBox[{"J", ",", "h", ",", "g", ",", 
      RowBox[{"L", "=", "7"}]}], "}"}], ",", 
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
              RowBox[{"J", ",", "h", ",", "g"}], "]"}], ",", 
             RowBox[{"{", 
              RowBox[{"j", ",", "2", ",", 
               RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], ",", 
           RowBox[{"Wfirst", "[", 
            RowBox[{"J", ",", "h", ",", "g"}], "]"}]}], "]"}], ",", 
         RowBox[{"Wlast", "[", 
          RowBox[{"J", ",", "h", ",", "g"}], "]"}]}], "]"}], "]"}], "-", 
      RowBox[{"HIsing", "[", 
       RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}]}], "]"}]}], 
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
       RowBox[{"J", "=", 
        RowBox[{"5", "/", "11"}]}], ",", 
       RowBox[{"h", "=", 
        RowBox[{
         RowBox[{"-", "2"}], "/", "7"}]}], ",", 
       RowBox[{"g", "=", 
        RowBox[{"13", "/", "8"}]}], ",", 
       RowBox[{"L", "=", "7"}]}], "}"}], ",", 
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
                RowBox[{"J", ",", "h", ",", "g"}], "]"}], ",", 
               RowBox[{"If", "[", 
                RowBox[{
                 RowBox[{"j", "<", "L"}], ",", 
                 RowBox[{"W", "[", 
                  RowBox[{"J", ",", "h", ",", "g"}], "]"}], ",", 
                 RowBox[{"Wlast", "[", 
                  RowBox[{"J", ",", "h", ",", "g"}], "]"}]}], "]"}]}], "]"}], 
             ",", 
             RowBox[{"Reverse", "[", 
              RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], "]"}], "+", 
          RowBox[{"0.", "\[ImaginaryI]"}]}], ",", "\"\<Complex128\>\""}], 
        "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1414, 881},
WindowMargins->{{Automatic, 315}, {70, Automatic}},
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
Cell[1486, 35, 36, 0, 63, "Section"],
Cell[1525, 37, 123, 3, 31, "Input"],
Cell[1651, 42, 68, 1, 31, "Input"],
Cell[1722, 45, 174, 5, 31, "Input"],
Cell[CellGroupData[{
Cell[1921, 54, 61, 0, 43, "Subsection"],
Cell[1985, 56, 297, 9, 31, "Input"],
Cell[2285, 67, 2831, 80, 98, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5153, 152, 64, 0, 43, "Subsection"],
Cell[5220, 154, 3348, 97, 115, "Input"],
Cell[CellGroupData[{
Cell[8593, 255, 1316, 34, 76, "Input"],
Cell[9912, 291, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[9977, 296, 363, 11, 52, "Input"],
Cell[10343, 309, 116, 3, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[10496, 317, 216, 5, 52, "Input"],
Cell[10715, 324, 6417, 200, 112, "Output"]
}, Open  ]],
Cell[17147, 527, 1635, 45, 72, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[18819, 577, 75, 0, 43, "Subsection"],
Cell[18897, 579, 3994, 122, 92, "Input"],
Cell[CellGroupData[{
Cell[22916, 705, 205, 5, 52, "Input"],
Cell[23124, 712, 3359, 87, 118, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[26520, 804, 1133, 31, 52, "Input"],
Cell[27656, 837, 28, 0, 31, "Output"]
}, Open  ]],
Cell[27699, 840, 2127, 58, 92, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature fx0VwUuw5RFhICwfCl5LFC6w *)
