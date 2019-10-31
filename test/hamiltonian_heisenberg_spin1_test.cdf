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
NotebookDataLength[     52254,       1537]
NotebookOptionsPosition[     49957,       1466]
NotebookOutlinePosition[     50303,       1481]
CellTagsIndexPosition[     50260,       1478]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Heisenberg Hamiltonian", "Section",ExpressionUUID->"43b17dc8-fa70-467b-9c9a-16e231460d1e"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";"}]], "Input",ExpressionU\
UID->"b1c580e8-44d9-46bb-9286-9e7835ddc55b"],

Cell[BoxData[
 RowBox[{"<<", "../mathematica/tn_base.m"}]], "Input",ExpressionUUID->"442c1a3b-5a09-4b6b-927c-8fa1e28215a8"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["fn", "base"], "=", 
   RowBox[{"FileBaseName", "[", 
    RowBox[{"NotebookFileName", "[", "]"}], "]"}]}], ";"}]], "Input",Expressio\
nUUID->"8a1e41b2-88fd-40ac-b0ea-9caf7ee61954"],

Cell[CellGroupData[{

Cell["Construct full Hamiltonian as reference", "Subsection",ExpressionUUID->"53c4fe2d-35fa-4900-9059-6f3c9b946930"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SparseIdentityMatrix", "[", "d_", "]"}], ":=", 
  RowBox[{"SparseArray", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"{", 
      RowBox[{"i_", ",", "i_"}], "}"}], "\[Rule]", "1"}], ",", 
    RowBox[{"{", 
     RowBox[{"d", ",", "d"}], "}"}]}], "]"}]}]], "Input",ExpressionUUID->\
"cda0e2d5-fc53-48be-9449-acc305f5d5b8"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"construct", " ", "spin"}], "-", 
    RowBox[{
    "1", " ", "Heisenberg", " ", "Hamiltonian", " ", "with", " ", "open", " ",
      "boundary", " ", "conditions"}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"HHeisenbergSpin1", "[", 
    RowBox[{"J_List", ",", "h_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"S", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{
          FractionBox["1", 
           SqrtBox["2"]], 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", "1", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"1", ",", "0", ",", "1"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "1", ",", "0"}], "}"}]}], "}"}]}], ",", 
         RowBox[{
          FractionBox["\[ImaginaryI]", 
           SqrtBox["2"]], 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"0", ",", 
              RowBox[{"-", "1"}], ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"1", ",", "0", ",", 
              RowBox[{"-", "1"}]}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", "1", ",", "0"}], "}"}]}], "}"}]}], ",", 
         RowBox[{"DiagonalMatrix", "[", 
          RowBox[{"{", 
           RowBox[{"1", ",", "0", ",", 
            RowBox[{"-", "1"}]}], "}"}], "]"}]}], "}"}]}], "}"}], ",", 
     RowBox[{
      RowBox[{"Sum", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"J", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], 
         RowBox[{"KroneckerProduct", "[", 
          RowBox[{
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox["3", 
             RowBox[{"j", "-", "1"}]], "]"}], ",", 
           RowBox[{
           "S", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], ",", 
           RowBox[{
           "S", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], ",", 
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox["3", 
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
            SuperscriptBox["3", 
             RowBox[{"j", "-", "1"}]], "]"}], ",", 
           RowBox[{
           "S", "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}], ",", 
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox["3", 
             RowBox[{"L", "-", "j"}]], "]"}]}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"j", ",", "1", ",", "L"}], "}"}]}], "]"}]}]}]}], 
    "]"}]}]}]], "Input",ExpressionUUID->"b5b0834f-5cae-495f-aedf-\
cebc4d0fe4c3"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Construct local Hamiltonian operator terms", "Subsection",ExpressionUUID->"c1335216-c21f-4378-8073-b03389cbaf82"],

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
        RowBox[{"{", 
         RowBox[{
          RowBox[{
           FractionBox["1", 
            SqrtBox["2"]], 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"0", ",", "1", ",", "0"}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"1", ",", "0", ",", "1"}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"0", ",", "1", ",", "0"}], "}"}]}], "}"}]}], ",", 
          RowBox[{
           FractionBox["\[ImaginaryI]", 
            SqrtBox["2"]], 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"0", ",", 
               RowBox[{"-", "1"}], ",", "0"}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"1", ",", "0", ",", 
               RowBox[{"-", "1"}]}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"0", ",", "1", ",", "0"}], "}"}]}], "}"}]}], ",", 
          RowBox[{"DiagonalMatrix", "[", 
           RowBox[{"{", 
            RowBox[{"1", ",", "0", ",", 
             RowBox[{"-", "1"}]}], "}"}], "]"}]}], "}"}]}], ",", 
       RowBox[{"id", "=", 
        RowBox[{"IdentityMatrix", "[", "3", "]"}]}], ",", "SzI", ",", "ISz"}],
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
    "]"}]}]}]], "Input",ExpressionUUID->"7bbab82f-1191-46a8-8ffc-\
0ab0f6228558"],

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
             SuperscriptBox["3", 
              RowBox[{"j", "-", "1"}]], "]"}], ",", 
            RowBox[{
             RowBox[{"h2", "[", 
              RowBox[{
               RowBox[{"{", 
                RowBox[{"Jx", ",", "Jy", ",", "Jz"}], "}"}], ",", "h", ",", 
               "L"}], "]"}], "\[LeftDoubleBracket]", "j", 
             "\[RightDoubleBracket]"}], ",", 
            RowBox[{"SparseIdentityMatrix", "[", 
             SuperscriptBox["3", 
              RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{"j", ",", "1", ",", 
            RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], "-", 
        RowBox[{"HHeisenbergSpin1", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"Jx", ",", "Jy", ",", "Jz"}], "}"}], ",", "h", ",", "L"}], 
         "]"}]}], "]"}], "]"}], "]"}]}], "]"}]}]], "Input",ExpressionUUID->\
"2938d3c5-cf58-428b-b495-41c23cb85416"],

Cell[BoxData["0"], "Output",ExpressionUUID->"fb672b2c-7c9b-4b75-952f-1bb2d51c54ce"]
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
       SubscriptBox["J", "z"]}], "}"}], ",", "h", ",", "6"}], 
    "]"}]}]}]], "Input",ExpressionUUID->"b58cd1e4-177a-4fb8-b40e-\
5f538df60728"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "0", ",", "0", ",", "0", ",", "0"}], "}"}]], "Output",Expr\
essionUUID->"86b42082-19d2-4540-a2df-ed63c803b408"]
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
       SubscriptBox["J", "z"]}], "}"}], ",", "h", ",", "5"}], 
    "]"}]}]}]], "Input",ExpressionUUID->"9a53dc07-7030-46d4-8459-\
065cb2b2744d"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {
        RowBox[{
         RowBox[{"-", 
          FractionBox[
           RowBox[{"3", " ", "h"}], "2"]}], "+", 
         SubscriptBox["J", "z"]}], "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", "0"},
       {"0", 
        RowBox[{"-", "h"}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0"},
       {"0", "0", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["h", "2"]}], "-", 
         SubscriptBox["J", "z"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", "0"},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{"-", 
         FractionBox["h", "2"]}], "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0"},
       {
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}]},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", 
        FractionBox["h", "2"], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{
         FractionBox["h", "2"], "-", 
         SubscriptBox["J", "z"]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "h", "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", 
        RowBox[{
         FractionBox[
          RowBox[{"3", " ", "h"}], "2"], "+", 
         SubscriptBox["J", "z"]}]}
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
         RowBox[{"-", "h"}], "+", 
         SubscriptBox["J", "z"]}], "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", "0"},
       {"0", 
        RowBox[{"-", 
         FractionBox["h", "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0"},
       {"0", "0", 
        RowBox[{"-", 
         SubscriptBox["J", "z"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", "0"},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{"-", 
         FractionBox["h", "2"]}], "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0"},
       {
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}]},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", 
        FractionBox["h", "2"], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{"-", 
         SubscriptBox["J", "z"]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        FractionBox["h", "2"], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", 
        RowBox[{"h", "+", 
         SubscriptBox["J", "z"]}]}
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
         RowBox[{"-", "h"}], "+", 
         SubscriptBox["J", "z"]}], "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", "0"},
       {"0", 
        RowBox[{"-", 
         FractionBox["h", "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0"},
       {"0", "0", 
        RowBox[{"-", 
         SubscriptBox["J", "z"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", "0"},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{"-", 
         FractionBox["h", "2"]}], "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0"},
       {
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}]},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", 
        FractionBox["h", "2"], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{"-", 
         SubscriptBox["J", "z"]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        FractionBox["h", "2"], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", 
        RowBox[{"h", "+", 
         SubscriptBox["J", "z"]}]}
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
           RowBox[{"3", " ", "h"}], "2"]}], "+", 
         SubscriptBox["J", "z"]}], "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", "0"},
       {"0", 
        RowBox[{"-", 
         FractionBox["h", "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0"},
       {"0", "0", 
        RowBox[{
         FractionBox["h", "2"], "-", 
         SubscriptBox["J", "z"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", "0"},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{"-", "h"}], "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0"},
       {
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}]},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", "h", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["h", "2"]}], "-", 
         SubscriptBox["J", "z"]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", 
        FractionBox["h", "2"], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "2"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "2"]}], "0", "0", "0", 
        RowBox[{
         FractionBox[
          RowBox[{"3", " ", "h"}], "2"], "+", 
         SubscriptBox["J", "z"]}]}
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
     MatrixForm[BoxForm`e$]]]}], "}"}]], "Output",ExpressionUUID->"a22a9c61-\
8844-4794-936d-99d583b75bbe"]
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
          RowBox[{"7", "/", "10"}], ",", 
          RowBox[{
           RowBox[{"-", "5"}], "/", "13"}], ",", 
          RowBox[{"11", "/", "8"}]}], "}"}]}], ",", 
       RowBox[{"h", "=", 
        RowBox[{"3", "/", "7"}]}], ",", 
       RowBox[{"L", "=", "6"}]}], "}"}], ",", 
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
               RowBox[{"3", ",", "3", ",", "3", ",", "3"}], "}"}]}], "]"}], 
            ",", 
            RowBox[{"Reverse", "[", 
             RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], "]"}], ",", 
         "\"\<Real64\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", 
         RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input",\
ExpressionUUID->"7a58ed86-a1f7-4dbd-ad16-96f066083470"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Matrix product operator representation of Hamiltonian", "Subsection",ExpressionUUID->"87b5a0d5-0d92-4ab1-bdce-5e80a1e1c658"],

Cell[TextData[{
 "Special case ",
 Cell[BoxData[
  FormBox[
   RowBox[{
    SubscriptBox["J", "x"], "\[Equal]", 
    SubscriptBox["J", "y"]}], TraditionalForm]],ExpressionUUID->
  "6101f62e-098d-492e-8b85-792fcd706031"]
}], "Text",ExpressionUUID->"27ccc420-afef-4340-bbd8-51ddcff31df3"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"Wfirst", "[", 
   RowBox[{"J_", ",", "Jz_", ",", "h_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"I", "=", 
       RowBox[{"IdentityMatrix", "[", "3", "]"}]}], ",", 
      RowBox[{"Sup", "=", 
       RowBox[{
        SqrtBox["2"], 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"0", ",", "1", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "1"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0"}], "}"}]}], "}"}]}]}], ",", 
      RowBox[{"Sdn", "=", 
       RowBox[{
        SqrtBox["2"], 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"1", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "1", ",", "0"}], "}"}]}], "}"}]}]}], ",", 
      RowBox[{"Sz", "=", 
       RowBox[{"DiagonalMatrix", "[", 
        RowBox[{"{", 
         RowBox[{"1", ",", "0", ",", 
          RowBox[{"-", "1"}]}], "}"}], "]"}]}]}], "}"}], ",", 
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
       RowBox[{"IdentityMatrix", "[", "3", "]"}]}], ",", 
      RowBox[{"O", "=", 
       RowBox[{"ConstantArray", "[", 
        RowBox[{"0", ",", 
         RowBox[{"{", 
          RowBox[{"3", ",", "3"}], "}"}]}], "]"}]}], ",", 
      RowBox[{"Sup", "=", 
       RowBox[{
        SqrtBox["2"], 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"0", ",", "1", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "1"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0"}], "}"}]}], "}"}]}]}], ",", 
      RowBox[{"Sdn", "=", 
       RowBox[{
        SqrtBox["2"], 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"1", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "1", ",", "0"}], "}"}]}], "}"}]}]}], ",", 
      RowBox[{"Sz", "=", 
       RowBox[{"DiagonalMatrix", "[", 
        RowBox[{"{", 
         RowBox[{"1", ",", "0", ",", 
          RowBox[{"-", "1"}]}], "}"}], "]"}]}]}], "}"}], ",", 
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
       RowBox[{"IdentityMatrix", "[", "3", "]"}]}], ",", 
      RowBox[{"Sup", "=", 
       RowBox[{
        SqrtBox["2"], 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"0", ",", "1", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "1"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0"}], "}"}]}], "}"}]}]}], ",", 
      RowBox[{"Sdn", "=", 
       RowBox[{
        SqrtBox["2"], 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"1", ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "1", ",", "0"}], "}"}]}], "}"}]}]}], ",", 
      RowBox[{"Sz", "=", 
       RowBox[{"DiagonalMatrix", "[", 
        RowBox[{"{", 
         RowBox[{"1", ",", "0", ",", 
          RowBox[{"-", "1"}]}], "}"}], "]"}]}]}], "}"}], ",", 
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
   "]"}]}]}], "Input",ExpressionUUID->"ac0a11e8-4b74-4628-b6d7-92c5f239cad2"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"W", "[", 
    RowBox[{"J", ",", "Jz", ",", "h"}], "]"}], "//", 
   "MatrixForm"}]}]], "Input",ExpressionUUID->"534d33de-a29f-4303-a172-\
9490a62995d0"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"1", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {"1", "0", "0", "0", "0"},
         {
          RowBox[{"-", "h"}], "0", "0", "Jz", "1"}
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
         {
          SqrtBox["2"], "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {"0", "0", 
          FractionBox["J", 
           SqrtBox["2"]], "0", "0"}
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
         {"0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"}
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
         {
          SqrtBox["2"], "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {"0", 
          FractionBox["J", 
           SqrtBox["2"]], "0", "0", "0"}
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
         {"0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "1"}
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
         {
          SqrtBox["2"], "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {"0", "0", 
          FractionBox["J", 
           SqrtBox["2"]], "0", "0"}
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
         {"0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"}
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
         {"0", "0", "0", "0", "0"},
         {
          SqrtBox["2"], "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0"},
         {"0", 
          FractionBox["J", 
           SqrtBox["2"]], "0", "0", "0"}
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
          RowBox[{"-", "1"}], "0", "0", "0", "0"},
         {"h", "0", "0", 
          RowBox[{"-", "Jz"}], "1"}
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
    Automatic, {3, 3, 5, 5}, 0, {
     1, {{0, 7, 13, 20}, {{1, 1, 1}, {1, 4, 1}, {1, 5, 1}, {1, 5, 4}, {1, 5, 
       5}, {2, 2, 1}, {2, 5, 3}, {1, 3, 1}, {1, 5, 2}, {2, 1, 1}, {2, 5, 5}, {
       3, 2, 1}, {3, 5, 3}, {2, 3, 1}, {2, 5, 2}, {3, 1, 1}, {3, 4, 1}, {3, 5,
        1}, {3, 5, 4}, {3, 5, 5}}}, {
      1, 1, -$CellContext`h, $CellContext`Jz, 1, 2^Rational[1, 2], 
       2^Rational[-1, 2] $CellContext`J, 2^Rational[1, 2], 
       2^Rational[-1, 2] $CellContext`J, 1, 1, 2^Rational[1, 2], 
       2^Rational[-1, 2] $CellContext`J, 2^Rational[1, 2], 
       2^Rational[-1, 2] $CellContext`J, 
       1, -1, $CellContext`h, -$CellContext`Jz, 1}}]]]]], "Output",ExpressionU\
UID->"b68c1dec-fd31-491f-8e72-db9f4196be64"]
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
      RowBox[{"L", "=", "6"}]}], "}"}], ",", 
    RowBox[{"Norm", "[", 
     RowBox[{"Normal", "[", 
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
       RowBox[{"HHeisenbergSpin1", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"J", ",", "J", ",", "Jz"}], "}"}], ",", "h", ",", "L"}], 
        "]"}]}], "]"}], "]"}]}], "]"}]}]], "Input",ExpressionUUID->"2302e41e-\
feaf-488e-9258-2e5f4c1605f7"],

Cell[BoxData["0"], "Output",ExpressionUUID->"10189c40-b62b-4b02-99dc-c03c9b45bf71"]
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
        RowBox[{"1", ",", "0", ",", 
         RowBox[{"-", "1"}]}], "}"}]}], ",", 
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
         RowBox[{"{", "0", "}"}], ",", "qD"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"qd", ",", "qd"}], "}"}]}], "]"}], "+", 
     RowBox[{"MPOBlockStructureError", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"W", "[", 
          RowBox[{"J", ",", "Jz", ",", "h"}], "]"}], ",", "qD", ",", "qD"}], 
        "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"qd", ",", "qd"}], "}"}]}], "]"}], "+", 
     RowBox[{"MPOBlockStructureError", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"Wlast", "[", 
          RowBox[{"J", ",", "Jz", ",", "h"}], "]"}], ",", "qD", ",", 
         RowBox[{"{", "0", "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"qd", ",", "qd"}], "}"}]}], "]"}]}]}], "]"}]}]], "Input",Expre\
ssionUUID->"ad47babd-7532-4310-93ba-8338cc86539d"],

Cell[BoxData["0"], "Output",ExpressionUUID->"4dd6170a-9117-4082-84a4-98dc0b7406c2"]
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
        RowBox[{"11", "/", "8"}]}], ",", 
       RowBox[{"h", "=", 
        RowBox[{"3", "/", "7"}]}], ",", 
       RowBox[{"L", "=", "6"}]}], "}"}], ",", 
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
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input",Ex\
pressionUUID->"9a0fd789-11b0-4c02-a347-5a5303bf4f09"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1414, 881},
WindowMargins->{{161, Automatic}, {Automatic, 105}},
FrontEndVersion->"11.1 for Microsoft Windows (64-bit) (April 18, 2017)",
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
Cell[1486, 35, 96, 0, 63, "Section", "ExpressionUUID" -> \
"43b17dc8-fa70-467b-9c9a-16e231460d1e"],
Cell[1585, 37, 180, 4, 30, "Input", "ExpressionUUID" -> \
"b1c580e8-44d9-46bb-9286-9e7835ddc55b"],
Cell[1768, 43, 123, 1, 30, "Input", "ExpressionUUID" -> \
"442c1a3b-5a09-4b6b-927c-8fa1e28215a8"],
Cell[1894, 46, 231, 6, 30, "Input", "ExpressionUUID" -> \
"8a1e41b2-88fd-40ac-b0ea-9caf7ee61954"],
Cell[CellGroupData[{
Cell[2150, 56, 116, 0, 43, "Subsection", "ExpressionUUID" -> \
"53c4fe2d-35fa-4900-9059-6f3c9b946930"],
Cell[2269, 58, 354, 10, 30, "Input", "ExpressionUUID" -> \
"cda0e2d5-fc53-48be-9449-acc305f5d5b8"],
Cell[2626, 70, 3098, 83, 140, "Input", "ExpressionUUID" -> \
"b5b0834f-5cae-495f-aedf-cebc4d0fe4c3"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5761, 158, 119, 0, 43, "Subsection", "ExpressionUUID" -> \
"c1335216-c21f-4378-8073-b03389cbaf82"],
Cell[5883, 160, 3938, 111, 169, "Input", "ExpressionUUID" -> \
"7bbab82f-1191-46a8-8ffc-0ab0f6228558"],
Cell[CellGroupData[{
Cell[9846, 275, 1558, 40, 101, "Input", "ExpressionUUID" -> \
"2938d3c5-cf58-428b-b495-41c23cb85416"],
Cell[11407, 317, 83, 0, 30, "Output", "ExpressionUUID" -> \
"fb672b2c-7c9b-4b75-952f-1bb2d51c54ce"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11527, 322, 559, 18, 52, "Input", "ExpressionUUID" -> \
"b58cd1e4-177a-4fb8-b40e-5f538df60728"],
Cell[12089, 342, 160, 3, 30, "Output", "ExpressionUUID" -> \
"86b42082-19d2-4540-a2df-ed63c803b408"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12286, 350, 412, 12, 52, "Input", "ExpressionUUID" -> \
"9a53dc07-7030-46d4-8459-065cb2b2744d"],
Cell[12701, 364, 15520, 489, 613, "Output", "ExpressionUUID" -> \
"a22a9c61-8844-4794-936d-99d583b75bbe"]
}, Open  ]],
Cell[28236, 856, 1751, 48, 69, "Input", "ExpressionUUID" -> \
"7a58ed86-a1f7-4dbd-ad16-96f066083470"]
}, Open  ]],
Cell[CellGroupData[{
Cell[30024, 909, 130, 0, 43, "Subsection", "ExpressionUUID" -> \
"87b5a0d5-0d92-4ab1-bdce-5e80a1e1c658"],
Cell[30157, 911, 286, 8, 33, "Text", "ExpressionUUID" -> \
"27ccc420-afef-4340-bbd8-51ddcff31df3"],
Cell[30446, 921, 5835, 169, 225, "Input", "ExpressionUUID" -> \
"ac0a11e8-4b74-4628-b6d7-92c5f239cad2"],
Cell[CellGroupData[{
Cell[36306, 1094, 267, 7, 50, "Input", "ExpressionUUID" -> \
"534d33de-a29f-4303-a172-9490a62995d0"],
Cell[36576, 1103, 7898, 199, 347, "Output", "ExpressionUUID" -> \
"b68c1dec-fd31-491f-8e72-db9f4196be64"]
}, Open  ]],
Cell[CellGroupData[{
Cell[44511, 1307, 1326, 35, 50, "Input", "ExpressionUUID" -> \
"2302e41e-feaf-488e-9258-2e5f4c1605f7"],
Cell[45840, 1344, 83, 0, 30, "Output", "ExpressionUUID" -> \
"10189c40-b62b-4b02-99dc-c03c9b45bf71"]
}, Open  ]],
Cell[CellGroupData[{
Cell[45960, 1349, 1704, 50, 69, "Input", "ExpressionUUID" -> \
"ad47babd-7532-4310-93ba-8338cc86539d"],
Cell[47667, 1401, 83, 0, 30, "Output", "ExpressionUUID" -> \
"4dd6170a-9117-4082-84a4-98dc0b7406c2"]
}, Open  ]],
Cell[47765, 1404, 2164, 58, 88, "Input", "ExpressionUUID" -> \
"9a0fd789-11b0-4c02-a347-5a5303bf4f09"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* NotebookSignature MuTBswUy@S3MGCKqOFqUgL@c *)
