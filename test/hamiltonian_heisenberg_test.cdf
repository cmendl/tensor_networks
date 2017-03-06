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
NotebookDataLength[     39146,       1225]
NotebookOptionsPosition[     38470,       1180]
NotebookOutlinePosition[     38814,       1195]
CellTagsIndexPosition[     38771,       1192]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Heisenberg Hamiltonian", "Section"],

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
   "construct", " ", "Heisenberg", " ", "Hamiltonian", " ", "with", " ", 
    "open", " ", "boundary", " ", "conditions"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"HHeisenberg", "[", 
    RowBox[{"J_List", ",", "h_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"S", "=", 
       RowBox[{
        FractionBox["1", "2"], 
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
              RowBox[{"-", "1"}]}], "}"}]}], "}"}]}], "}"}]}]}], "}"}], ",", 
     RowBox[{
      RowBox[{"Sum", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"J", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], 
         RowBox[{"KroneckerProduct", "[", 
          RowBox[{
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox["2", 
             RowBox[{"j", "-", "1"}]], "]"}], ",", 
           RowBox[{
           "S", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], ",", 
           RowBox[{
           "S", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], ",", 
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox["2", 
             RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}]}], ",", 
        RowBox[{"{", 
         RowBox[{"i", ",", "3"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", "1", ",", 
          RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], "-", 
      RowBox[{"h", " ", 
       RowBox[{"Sum", "[", 
        RowBox[{
         RowBox[{"KroneckerProduct", "[", 
          RowBox[{
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox["2", 
             RowBox[{"j", "-", "1"}]], "]"}], ",", 
           RowBox[{
           "S", "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}], ",", 
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox["2", 
             RowBox[{"L", "-", "j"}]], "]"}]}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"j", ",", "1", ",", "L"}], "}"}]}], "]"}]}]}]}], 
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
    RowBox[{"J_List", ",", "h_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"S", "=", 
        RowBox[{
         FractionBox["1", "2"], 
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
               RowBox[{"-", "1"}]}], "}"}]}], "}"}]}], "}"}]}]}], ",", 
       RowBox[{"id", "=", 
        RowBox[{"IdentityMatrix", "[", "2", "]"}]}], ",", "SzI", ",", "ISz"}],
       "}"}], ",", 
     RowBox[{
      RowBox[{"SzI", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         RowBox[{"S", "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}], 
         ",", "id"}], "]"}]}], ";", 
      RowBox[{"ISz", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{"id", ",", 
         RowBox[{
         "S", "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}]}], 
        "]"}]}], ";", 
      RowBox[{
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"Sum", "[", 
          RowBox[{
           RowBox[{
            RowBox[{
            "J", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], 
            RowBox[{"KroneckerProduct", "[", 
             RowBox[{
              RowBox[{
              "S", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], 
              ",", 
              RowBox[{
              "S", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}]}], 
             "]"}]}], ",", 
           RowBox[{"{", 
            RowBox[{"i", ",", "3"}], "}"}]}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"j", ",", 
           RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], "-", 
       RowBox[{"h", " ", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"L", "\[Equal]", "2"}], ",", 
          RowBox[{"{", 
           RowBox[{"SzI", "+", "ISz"}], "}"}], ",", 
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{"If", "[", 
             RowBox[{
              RowBox[{"j", "\[Equal]", "1"}], ",", 
              RowBox[{"SzI", "+", 
               RowBox[{
                FractionBox["1", "2"], "ISz"}]}], ",", 
              RowBox[{"If", "[", 
               RowBox[{
                RowBox[{"j", "<", 
                 RowBox[{"L", "-", "1"}]}], ",", 
                RowBox[{
                 FractionBox["1", "2"], 
                 RowBox[{"(", 
                  RowBox[{"SzI", "+", "ISz"}], ")"}]}], ",", 
                RowBox[{
                 RowBox[{
                  FractionBox["1", "2"], "SzI"}], "+", "ISz"}]}], "]"}]}], 
             "]"}], ",", 
            RowBox[{"{", 
             RowBox[{"j", ",", 
              RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}], "]"}]}]}]}]}], 
    "]"}]}]}]], "Input"],

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
     RowBox[{"Jx", ",", "Jy", ",", "Jz", ",", "h", ",", 
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
              RowBox[{
               RowBox[{"{", 
                RowBox[{"Jx", ",", "Jy", ",", "Jz"}], "}"}], ",", "h", ",", 
               "L"}], "]"}], "\[LeftDoubleBracket]", "j", 
             "\[RightDoubleBracket]"}], ",", 
            RowBox[{"SparseIdentityMatrix", "[", 
             SuperscriptBox["2", 
              RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{"j", ",", "1", ",", 
            RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], "-", 
        RowBox[{"HHeisenberg", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"Jx", ",", "Jy", ",", "Jz"}], "}"}], ",", "h", ",", "L"}], 
         "]"}]}], "]"}], "]"}], "]"}]}], "]"}]}]], "Input"],

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
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["J", "x"], ",", 
       SubscriptBox["J", "y"], ",", 
       SubscriptBox["J", "z"]}], "}"}], ",", "h", ",", "7"}], 
    "]"}]}]}]], "Input"],

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
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["J", "x"], ",", 
       SubscriptBox["J", "y"], ",", 
       SubscriptBox["J", "z"]}], "}"}], ",", "h", ",", "7"}], 
    "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {
        RowBox[{
         RowBox[{"-", 
          FractionBox[
           RowBox[{"3", " ", "h"}], "4"]}], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}]},
       {"0", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["h", "4"]}], "-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0"},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], 
        RowBox[{
         FractionBox["h", "4"], "-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0"},
       {
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox[
          RowBox[{"3", " ", "h"}], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}]}
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
         RowBox[{"-", 
          FractionBox["h", "2"]}], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}]},
       {"0", 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0"},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0"},
       {
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox["h", "2"], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}]}
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
         RowBox[{"-", 
          FractionBox["h", "2"]}], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}]},
       {"0", 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0"},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0"},
       {
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox["h", "2"], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}]}
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
         RowBox[{"-", 
          FractionBox["h", "2"]}], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}]},
       {"0", 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0"},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0"},
       {
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox["h", "2"], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}]}
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
         RowBox[{"-", 
          FractionBox["h", "2"]}], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}]},
       {"0", 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0"},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0"},
       {
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox["h", "2"], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}]}
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
         RowBox[{"-", 
          FractionBox[
           RowBox[{"3", " ", "h"}], "4"]}], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}]},
       {"0", 
        RowBox[{
         FractionBox["h", "4"], "-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0"},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], 
        RowBox[{
         RowBox[{"-", 
          FractionBox["h", "4"]}], "-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0"},
       {
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox[
          RowBox[{"3", " ", "h"}], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}]}
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
        RowBox[{"{", 
         RowBox[{
          RowBox[{"5", "/", "11"}], ",", 
          RowBox[{"7", "/", "10"}], ",", 
          RowBox[{"13", "/", "8"}]}], "}"}]}], ",", 
       RowBox[{"h", "=", 
        RowBox[{"2", "/", "7"}]}], ",", 
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
                RowBox[{"J", ",", "h", ",", "L"}], "]"}], 
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

Cell[TextData[{
 "Special case ",
 Cell[BoxData[
  FormBox[
   RowBox[{
    SubscriptBox["J", "x"], "\[Equal]", 
    SubscriptBox["J", "y"]}], TraditionalForm]],
  FormatType->"TraditionalForm"]
}], "Text"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"Wfirst", "[", 
   RowBox[{"J_", ",", "Jz_", ",", "h_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"I", "=", 
       RowBox[{"IdentityMatrix", "[", "2", "]"}]}], ",", 
      RowBox[{"Sup", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"0", ",", "1"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"0", ",", "0"}], "}"}]}], "}"}]}], ",", 
      RowBox[{"Sdn", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"0", ",", "0"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"1", ",", "0"}], "}"}]}], "}"}]}], ",", 
      RowBox[{"Sz", "=", 
       RowBox[{
        FractionBox["1", "2"], 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"1", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", 
            RowBox[{"-", "1"}]}], "}"}]}], "}"}]}]}]}], "}"}], ",", 
    RowBox[{"SparseArray", "[", 
     RowBox[{"Transpose", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{
           RowBox[{"-", "h"}], " ", "Sz"}], ",", 
          RowBox[{
           FractionBox["1", "2"], "J", " ", "Sdn"}], ",", 
          RowBox[{
           FractionBox["1", "2"], "J", " ", "Sup"}], ",", 
          RowBox[{"Jz", " ", "Sz"}], ",", "I"}], "}"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"3", ",", "4", ",", "1", ",", "2"}], "}"}]}], "]"}], "]"}]}], 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"W", "[", 
   RowBox[{"J_", ",", "Jz_", ",", "h_"}], "]"}], ":=", 
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
      RowBox[{"Sup", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"0", ",", "1"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"0", ",", "0"}], "}"}]}], "}"}]}], ",", 
      RowBox[{"Sdn", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"0", ",", "0"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"1", ",", "0"}], "}"}]}], "}"}]}], ",", 
      RowBox[{"Sz", "=", 
       RowBox[{
        FractionBox["1", "2"], 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"1", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", 
            RowBox[{"-", "1"}]}], "}"}]}], "}"}]}]}]}], "}"}], ",", 
    RowBox[{"SparseArray", "[", 
     RowBox[{"Transpose", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"I", ",", "O", ",", "O", ",", "O", ",", "O"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"Sup", ",", "O", ",", "O", ",", "O", ",", "O"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"Sdn", ",", "O", ",", "O", ",", "O", ",", "O"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"Sz", ",", "O", ",", "O", ",", "O", ",", "O"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "h"}], " ", "Sz"}], ",", 
           RowBox[{
            FractionBox["1", "2"], "J", " ", "Sdn"}], ",", 
           RowBox[{
            FractionBox["1", "2"], "J", " ", "Sup"}], ",", 
           RowBox[{"Jz", " ", "Sz"}], ",", "I"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"3", ",", "4", ",", "1", ",", "2"}], "}"}]}], "]"}], "]"}]}], 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Wlast", "[", 
   RowBox[{"J_", ",", "Jz_", ",", "h_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"I", "=", 
       RowBox[{"IdentityMatrix", "[", "2", "]"}]}], ",", 
      RowBox[{"Sup", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"0", ",", "1"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"0", ",", "0"}], "}"}]}], "}"}]}], ",", 
      RowBox[{"Sdn", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"0", ",", "0"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"1", ",", "0"}], "}"}]}], "}"}]}], ",", 
      RowBox[{"Sz", "=", 
       RowBox[{
        FractionBox["1", "2"], 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"1", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", 
            RowBox[{"-", "1"}]}], "}"}]}], "}"}]}]}]}], "}"}], ",", 
    RowBox[{"SparseArray", "[", 
     RowBox[{"Transpose", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", "I", "}"}], ",", 
         RowBox[{"{", "Sup", "}"}], ",", 
         RowBox[{"{", "Sdn", "}"}], ",", 
         RowBox[{"{", "Sz", "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"-", "h"}], " ", "Sz"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"3", ",", "4", ",", "1", ",", "2"}], "}"}]}], "]"}], "]"}]}], 
   "]"}]}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"W", "[", 
    RowBox[{"J", ",", "Jz", ",", "h"}], "]"}], "//", 
   "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"1", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {
          FractionBox["1", "2"], "0", "0", "0", "0"},
         {
          RowBox[{"-", 
           FractionBox["h", "2"]}], "0", "0", 
          FractionBox["Jz", "2"], "1"}
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
         {"0", "0", "0", "0", "0"},
         {"1", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {"0", "0", 
          FractionBox["J", "2"], "0", "0"}
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
         {"0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {"1", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {"0", 
          FractionBox["J", "2"], "0", "0", "0"}
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
         {"1", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {
          RowBox[{"-", 
           FractionBox["1", "2"]}], "0", "0", "0", "0"},
         {
          FractionBox["h", "2"], "0", "0", 
          RowBox[{"-", 
           FractionBox["Jz", "2"]}], "1"}
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
    Automatic, {2, 2, 5, 5}, 0, {
     1, {{0, 7, 14}, {{1, 1, 1}, {1, 4, 1}, {1, 5, 1}, {1, 5, 4}, {1, 5, 5}, {
       2, 2, 1}, {2, 5, 3}, {1, 3, 1}, {1, 5, 2}, {2, 1, 1}, {2, 4, 1}, {2, 5,
        1}, {2, 5, 4}, {2, 5, 5}}}, {
      1, Rational[1, 2], Rational[-1, 2] $CellContext`h, 
       Rational[1, 2] $CellContext`Jz, 1, 1, Rational[1, 2] $CellContext`J, 1,
        Rational[1, 2] $CellContext`J, 1, Rational[-1, 2], 
       Rational[1, 2] $CellContext`h, Rational[-1, 2] $CellContext`Jz, 
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
     RowBox[{"J", ",", "Jz", ",", "h", ",", 
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
              RowBox[{"J", ",", "Jz", ",", "h"}], "]"}], ",", 
             RowBox[{"{", 
              RowBox[{"j", ",", "2", ",", 
               RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], ",", 
           RowBox[{"Wfirst", "[", 
            RowBox[{"J", ",", "Jz", ",", "h"}], "]"}]}], "]"}], ",", 
         RowBox[{"Wlast", "[", 
          RowBox[{"J", ",", "Jz", ",", "h"}], "]"}]}], "]"}], "]"}], "-", 
      RowBox[{"HHeisenberg", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"J", ",", "J", ",", "Jz"}], "}"}], ",", "h", ",", "L"}], 
       "]"}]}], "]"}]}], "]"}]}]], "Input"],

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
     RowBox[{
      RowBox[{"qd", "=", 
       RowBox[{"{", 
        RowBox[{
         FractionBox["1", "2"], ",", 
         RowBox[{"-", 
          FractionBox["1", "2"]}]}], "}"}]}], ",", 
      RowBox[{"qD", "=", 
       RowBox[{"{", 
        RowBox[{"0", ",", 
         RowBox[{"-", "1"}], ",", "1", ",", "0", ",", "0"}], "}"}]}]}], "}"}],
     ",", 
    RowBox[{
     RowBox[{"MPOBlockStructureError", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"Wfirst", "[", 
          RowBox[{"J", ",", "Jz", ",", "h"}], "]"}], ",", 
         RowBox[{"{", "0", "}"}], ",", "qD"}], "}"}], ",", "qd"}], "]"}], "+", 
     RowBox[{"MPOBlockStructureError", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"W", "[", 
          RowBox[{"J", ",", "Jz", ",", "h"}], "]"}], ",", "qD", ",", "qD"}], 
        "}"}], ",", "qd"}], "]"}], "+", 
     RowBox[{"MPOBlockStructureError", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"Wlast", "[", 
          RowBox[{"J", ",", "Jz", ",", "h"}], "]"}], ",", "qD", ",", 
         RowBox[{"{", "0", "}"}]}], "}"}], ",", "qd"}], "]"}]}]}], 
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
        RowBox[{"14", "/", "25"}]}], ",", 
       RowBox[{"Jz", "=", 
        RowBox[{"13", "/", "8"}]}], ",", 
       RowBox[{"h", "=", 
        RowBox[{"2", "/", "7"}]}], ",", 
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
                RowBox[{"J", ",", "Jz", ",", "h"}], "]"}], ",", 
               RowBox[{"If", "[", 
                RowBox[{
                 RowBox[{"j", "<", "L"}], ",", 
                 RowBox[{"W", "[", 
                  RowBox[{"J", ",", "Jz", ",", "h"}], "]"}], ",", 
                 RowBox[{"Wlast", "[", 
                  RowBox[{"J", ",", "Jz", ",", "h"}], "]"}]}], "]"}]}], "]"}],
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
WindowMargins->{{161, Automatic}, {Automatic, 105}},
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
Cell[1486, 35, 41, 0, 63, "Section"],
Cell[1530, 37, 123, 3, 31, "Input"],
Cell[1656, 42, 68, 1, 31, "Input"],
Cell[1727, 45, 174, 5, 31, "Input"],
Cell[CellGroupData[{
Cell[1926, 54, 61, 0, 43, "Subsection"],
Cell[1990, 56, 297, 9, 31, "Input"],
Cell[2290, 67, 2732, 75, 116, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5059, 147, 64, 0, 43, "Subsection"],
Cell[5126, 149, 3623, 104, 143, "Input"],
Cell[CellGroupData[{
Cell[8774, 257, 1496, 39, 120, "Input"],
Cell[10273, 298, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[10338, 303, 502, 17, 52, "Input"],
Cell[10843, 322, 116, 3, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[10996, 330, 355, 11, 52, "Input"],
Cell[11354, 343, 10437, 336, 249, "Output"]
}, Open  ]],
Cell[21806, 682, 1667, 46, 72, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[23510, 733, 75, 0, 43, "Subsection"],
Cell[23588, 735, 206, 8, 33, "Text"],
Cell[23797, 745, 5246, 160, 219, "Input"],
Cell[CellGroupData[{
Cell[29068, 909, 210, 6, 52, "Input"],
Cell[29281, 917, 4173, 106, 218, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[33491, 1028, 1206, 33, 52, "Input"],
Cell[34700, 1063, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[34765, 1068, 1524, 46, 95, "Input"],
Cell[36292, 1116, 28, 0, 31, "Output"]
}, Open  ]],
Cell[36335, 1119, 2107, 57, 92, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 2v0UD5HeYJRL#BKauppRTGBm *)
