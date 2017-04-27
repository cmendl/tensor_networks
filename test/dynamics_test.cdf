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
NotebookDataLength[     79426,       2104]
NotebookOptionsPosition[     77078,       2002]
NotebookOutlinePosition[     77421,       2017]
CellTagsIndexPosition[     77378,       2014]
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

Cell["Initial MPO and Hamiltonian", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"number", " ", "of", " ", "lattice", " ", "sites"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["L", "val"], "=", "5"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"fictitious", " ", "physical", " ", "quantum", " ", "numbers"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["qd", "val"], "=", 
    RowBox[{"{", 
     RowBox[{"1", ",", "0", ",", 
      RowBox[{"-", "2"}], ",", "1"}], "}"}]}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "fictitious", " ", "virtual", " ", "bond", " ", "quantum", " ", 
    "numbers"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"SeedRandom", "[", "69", "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    SubscriptBox["qA", "list"], "=", 
    RowBox[{"Block", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"L", "=", 
         SubscriptBox["L", "val"]}], ",", 
        RowBox[{"D", "=", 
         RowBox[{"{", 
          RowBox[{"1", ",", "5", ",", "6", ",", "4", ",", "7", ",", "1"}], 
          "}"}]}]}], "}"}], ",", 
      RowBox[{
       RowBox[{
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"#", "\[Equal]", "1"}], ",", 
          RowBox[{"{", "0", "}"}], ",", 
          RowBox[{"RandomInteger", "[", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{
              RowBox[{"-", "3"}], ",", "3"}], "}"}], ",", "#"}], "]"}]}], 
         "]"}], "&"}], "/@", "D"}]}], "]"}]}], "\[IndentingNewLine]", 
   RowBox[{"Length", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "0", ",", "1", ",", "2", ",", 
     RowBox[{"-", "3"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "3"}], ",", "1", ",", "2", ",", "0", ",", "2", ",", "2"}], 
    "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "3"}], ",", "2", ",", "1", ",", 
     RowBox[{"-", "2"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "3", ",", 
     RowBox[{"-", "2"}], ",", "1", ",", "0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", "0", "}"}]}], "}"}]], "Output"],

Cell[BoxData["6"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

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
         RowBox[{"qd", "=", 
          SubscriptBox["qd", "val"]}], ",", 
         RowBox[{"qA", "=", 
          SubscriptBox["qA", "list"]}], ",", 
         RowBox[{"zmax", "=", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "2"}]}], ",", 
         "qD"}], "}"}], ",", 
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"Outer", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"If", "[", 
               RowBox[{
                RowBox[{
                 RowBox[{"#1", "-", "#2", "+", "#3", "-", "#4"}], "\[Equal]", 
                 "0"}], ",", 
                RowBox[{"RandomComplex", "[", 
                 RowBox[{"{", 
                  RowBox[{
                   RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], "]"}], ",", 
                "0"}], "]"}], "&"}], ",", "qd", ",", "qd", ",", 
             RowBox[{
             "qA", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], 
             ",", 
             RowBox[{"qA", "\[LeftDoubleBracket]", 
              RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "]"}], 
           ",", 
           RowBox[{
           "qA", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], ",", 
           RowBox[{"qA", "\[LeftDoubleBracket]", 
            RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "3"}], "}"}]], "Output"]
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
  RowBox[{"4", ",", "4", ",", "1", ",", "5"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "5", ",", "6"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{"MPOMergeFull", "[", 
   RowBox[{"First", "/@", 
    SubscriptBox["A", "list"]}], "]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1024", ",", "1024"}], "}"}]], "Output"]
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
         RowBox[{"qd2", "=", 
          RowBox[{"Flatten", "[", 
           RowBox[{"Outer", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"#1", "+", "#2"}], "&"}], ",", 
             SubscriptBox["qd", "val"], ",", 
             SubscriptBox["qd", "val"]}], "]"}], "]"}]}], ",", "t"}], "}"}], 
       ",", 
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"t", "=", 
           RowBox[{"Outer", "[", 
            RowBox[{
             RowBox[{
              RowBox[{"If", "[", 
               RowBox[{
                RowBox[{
                 RowBox[{"#1", "-", "#2"}], "\[Equal]", "0"}], ",", 
                RowBox[{"RandomReal", "[", 
                 RowBox[{"{", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"-", "1"}], "/", "2"}], ",", 
                   RowBox[{"1", "/", "2"}]}], "}"}], "]"}], ",", "0"}], "]"}],
               "&"}], ",", "qd2", ",", "qd2"}], "]"}]}], ";", 
          RowBox[{"t", "+", 
           RowBox[{"Transpose", "[", "t", "]"}]}]}], ",", 
         RowBox[{"{", 
          RowBox[{"j", ",", 
           RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}], "]"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "16", ",", "16"}], "}"}]], "Output"]
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
     {"0.28740459633836624`", "0", "0.20951811012093424`"},
     {"0", 
      RowBox[{"-", "0.22400053739383052`"}], "0"},
     {"0.20951811012093424`", "0", "0.183746691676423`"}
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
  RowBox[{"0.`", ",", "0.`", ",", "0.`", ",", "0.`"}], "}"}]], "Output"]
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
         RowBox[{"ColumnMajorLayout", "[", 
          RowBox[{
           SubscriptBox["A", "list"], "\[LeftDoubleBracket]", 
           RowBox[{"j", ",", "1"}], "\[RightDoubleBracket]"}], "]"}], ",", 
         "\"\<Complex128\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "save", " ", "virtual", " ", "bond", " ", "quantum", " ", "numbers", " ", 
    "to", " ", "disk"}], " ", "*)"}], "\[IndentingNewLine]", 
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
          SubscriptBox["fn", "base"], "<>", "\"\<_qA\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{
          SubscriptBox["qA", "list"], "\[LeftDoubleBracket]", "j", 
          "\[RightDoubleBracket]"}], ",", "\"\<Integer32\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", 
         RowBox[{"L", "+", "1"}]}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"],

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
        RowBox[{"Length", "[", 
         SubscriptBox["qd", "val"], "]"}]}]}], "}"}], ",", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"Export", "[", 
        RowBox[{
         RowBox[{
          SubscriptBox["fn", "base"], "<>", "\"\<_h\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{"ColumnMajorLayout", "[", 
          RowBox[{"ArrayReshape", "[", 
           RowBox[{
            RowBox[{
             SubscriptBox["h", "list"], "\[LeftDoubleBracket]", "j", 
             "\[RightDoubleBracket]"}], ",", 
            RowBox[{"{", 
             RowBox[{"d", ",", "d", ",", "d", ",", "d"}], "}"}]}], "]"}], 
          "]"}], ",", "\"\<Real64\>\""}], "]"}], ",", 
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
       SubscriptBox["qd", "val"], ",", 
       RowBox[{"nsteps", " ", "dt"}], ",", "nsteps", ",", "tol"}], "]"}]}]}], 
   "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", 
  RowBox[{"(", 
   RowBox[{"First", "/@", "%"}], ")"}]}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "1", ",", "16"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "16", ",", "68"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "68", ",", "56"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "56", ",", "15"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "15", ",", "1"}], "}"}]}], "}"}]], "Output"]
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
     {"0", 
      RowBox[{"0.008120603221019634`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.0015346984379770133`", " ", "\[ImaginaryI]"}]}], "0"},
     {"0", "0", "0"},
     {"0", "0", "0"}
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
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"dt", "=", 
     RowBox[{
      RowBox[{"1", "/", "5"}], "+", 
      RowBox[{"\[ImaginaryI]", "/", "8"}]}]}], "}"}], ",", 
   RowBox[{
    SubscriptBox["A", 
     RowBox[{"strang", ",", "dt", ",", "merged"}]], "=", 
    RowBox[{"SparseArray", "[", 
     RowBox[{"MPOMergeFull", "[", 
      RowBox[{"First", "/@", 
       SubscriptBox["A", 
        RowBox[{"strang", ",", "dt"}]]}], "]"}], "]"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[
  TemplateBox[{RowBox[{
      StyleBox[
       TagBox["SparseArray", "SummaryHead"], "NonInterpretableSummary"], 
      StyleBox["[", "NonInterpretableSummary"], 
      DynamicModuleBox[{Typeset`open$$ = False}, 
       PanelBox[
        PaneSelectorBox[{False -> GridBox[{{
              PaneBox[
               ButtonBox[
                DynamicBox[
                 FEPrivate`FrontEndResource[
                 "FEBitmaps", "SquarePlusIconMedium"]], 
                ButtonFunction :> (Typeset`open$$ = True), Appearance -> None,
                 Evaluator -> Automatic, Method -> "Preemptive"], 
               Alignment -> {Center, Center}, ImageSize -> 
               Dynamic[{
                 Automatic, 3.5 CurrentValue["FontCapHeight"]/
                  AbsoluteCurrentValue[Magnification]}]], 
              GraphicsBox[
               RasterBox[
               SparseArray[
                Automatic, {10, 10}, 0.93, {
                 1, {{0, 1, 1, 4, 4, 5, 6, 6, 8, 10, 13}, {{4}, {6}, {7}, {
                   10}, {5}, {9}, {3}, {8}, {5}, {7}, {2}, {3}, {7}}}, {0., 
                  0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0.}}], {{0, 
                0}, {10, 10}}, {0, 1}], Frame -> False, Axes -> False, 
               AspectRatio -> 1, ImageSize -> 
               Dynamic[{
                 Automatic, 3.5 CurrentValue["FontCapHeight"]/
                  AbsoluteCurrentValue[Magnification]}], Frame -> True, 
               FrameTicks -> None, FrameStyle -> Directive[
                 Opacity[0.5], 
                 Thickness[Tiny], 
                 RGBColor[0.368417, 0.506779, 0.709798]], 
               FrameLabel -> {None, None}, 
               FrameTicks -> {{None, None}, {None, None}}], 
              GridBox[{{
                 RowBox[{
                   TagBox[
                   "\"Specified elements: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["108532", "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Dimensions: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox[
                    RowBox[{"{", 
                    RowBox[{"1024", ",", "1024"}], "}"}], "SummaryItem"]}]}}, 
               GridBoxAlignment -> {
                "Columns" -> {{Left}}, "Rows" -> {{Automatic}}}, AutoDelete -> 
               False, GridBoxItemSize -> {
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
               GridBoxSpacings -> {
                "Columns" -> {{2}}, "Rows" -> {{Automatic}}}, 
               BaseStyle -> {
                ShowStringCharacters -> False, NumberMarks -> False, 
                 PrintPrecision -> 3, ShowSyntaxStyles -> False}]}}, 
            GridBoxAlignment -> {"Rows" -> {{Top}}}, AutoDelete -> False, 
            GridBoxItemSize -> {
             "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
            BaselinePosition -> {1, 1}], True -> GridBox[{{
              PaneBox[
               ButtonBox[
                DynamicBox[
                 FEPrivate`FrontEndResource[
                 "FEBitmaps", "SquareMinusIconMedium"]], 
                ButtonFunction :> (Typeset`open$$ = False), Appearance -> 
                None, Evaluator -> Automatic, Method -> "Preemptive"], 
               Alignment -> {Center, Center}, ImageSize -> 
               Dynamic[{
                 Automatic, 3.5 CurrentValue["FontCapHeight"]/
                  AbsoluteCurrentValue[Magnification]}]], 
              GraphicsBox[
               RasterBox[
               SparseArray[
                Automatic, {10, 10}, 0.93, {
                 1, {{0, 1, 1, 4, 4, 5, 6, 6, 8, 10, 13}, {{4}, {6}, {7}, {
                   10}, {5}, {9}, {3}, {8}, {5}, {7}, {2}, {3}, {7}}}, {0., 
                  0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0.}}], {{0, 
                0}, {10, 10}}, {0, 1}], Frame -> False, Axes -> False, 
               AspectRatio -> 1, ImageSize -> 
               Dynamic[{
                 Automatic, 3.5 CurrentValue["FontCapHeight"]/
                  AbsoluteCurrentValue[Magnification]}], Frame -> True, 
               FrameTicks -> None, FrameStyle -> Directive[
                 Opacity[0.5], 
                 Thickness[Tiny], 
                 RGBColor[0.368417, 0.506779, 0.709798]], 
               FrameLabel -> {None, None}, 
               FrameTicks -> {{None, None}, {None, None}}], 
              GridBox[{{
                 RowBox[{
                   TagBox[
                   "\"Specified elements: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["108532", "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Dimensions: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox[
                    RowBox[{"{", 
                    RowBox[{"1024", ",", "1024"}], "}"}], "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Default: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox[
                    RowBox[{
                    RowBox[{"0.`", "\[VeryThinSpace]"}], "+", 
                    RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
                    "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Density: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["0.10350418090820312`", "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Elements:\"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["\"\"", "SummaryItem"]}]}, {
                 TagBox[
                  TagBox[
                   GridBox[{{
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "1"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{
                    RowBox[{"-", "0.00006864304862053746`"}], "-", 
                    
                    RowBox[{"0.00012284604112458087`", " ", 
                    "\[ImaginaryI]"}]}], ContentPadding -> False, 
                    FrameMargins -> 0, StripOnInput -> True, BaselinePosition -> 
                    Baseline, ImageSize -> {{1, 300}, Automatic}], 
                    LineBreakWithin -> False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "4"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{
                    RowBox[{"0.00020586552725569893`", "\[VeryThinSpace]"}], 
                    "-", 
                    
                    RowBox[{"0.0001728356809330636`", " ", 
                    "\[ImaginaryI]"}]}], ContentPadding -> False, 
                    FrameMargins -> 0, StripOnInput -> True, BaselinePosition -> 
                    Baseline, ImageSize -> {{1, 300}, Automatic}], 
                    LineBreakWithin -> False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "13"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{"3.285774621305772`*^-7", "-", 
                    
                    RowBox[{"0.00014465621258617678`", " ", 
                    "\[ImaginaryI]"}]}], ContentPadding -> False, 
                    FrameMargins -> 0, StripOnInput -> True, BaselinePosition -> 
                    Baseline, ImageSize -> {{1, 300}, Automatic}], 
                    LineBreakWithin -> False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "16"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{
                    RowBox[{"0.00008791756490498566`", "\[VeryThinSpace]"}], 
                    "-", 
                    
                    RowBox[{"0.0001414289292274318`", " ", 
                    "\[ImaginaryI]"}]}], ContentPadding -> False, 
                    FrameMargins -> 0, StripOnInput -> True, BaselinePosition -> 
                    Baseline, ImageSize -> {{1, 300}, Automatic}], 
                    LineBreakWithin -> False]}]}, {
                    ItemBox[
                    "\"\[VerticalEllipsis]\"", Alignment -> Center, 
                    StripOnInput -> False]}}, 
                    GridBoxAlignment -> {"Columns" -> {{Left}}}, 
                    DefaultBaseStyle -> "Column", 
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}], 
                   "Column"], "SummaryItem"]}}, 
               GridBoxAlignment -> {
                "Columns" -> {{Left}}, "Rows" -> {{Automatic}}}, AutoDelete -> 
               False, GridBoxItemSize -> {
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
               GridBoxSpacings -> {
                "Columns" -> {{2}}, "Rows" -> {{Automatic}}}, 
               BaseStyle -> {
                ShowStringCharacters -> False, NumberMarks -> False, 
                 PrintPrecision -> 3, ShowSyntaxStyles -> False}]}}, 
            GridBoxAlignment -> {"Rows" -> {{Top}}}, AutoDelete -> False, 
            GridBoxItemSize -> {
             "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
            BaselinePosition -> {1, 1}]}, 
         Dynamic[Typeset`open$$], ImageSize -> Automatic], BaselinePosition -> 
        Baseline], DynamicModuleValues :> {}], 
      StyleBox["]", "NonInterpretableSummary"]}]},
   "CopyTag",
   DisplayFunction->(#& ),
   InterpretationFunction->("SparseArray[<108532>, {1024, 1024}]"& )],
  False,
  Editable->False,
  SelectWithContents->True,
  Selectable->False]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"save", " ", "non"}], "-", 
     RowBox[{"zero", " ", "entries", " ", "of", " ", 
      RowBox[{"merged", " ", "'"}], 
      RowBox[{"A", "'"}], " ", "tensors", " ", "to", " ", "disk"}]}], ",", 
    " ", 
    RowBox[{"after", " ", "appropriate", " ", "reordering"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"dt", "=", 
        RowBox[{
         RowBox[{"1", "/", "5"}], "+", 
         RowBox[{"\[ImaginaryI]", "/", "8"}]}]}], ",", "ar"}], "}"}], ",", 
     RowBox[{
      RowBox[{"ar", "=", 
       RowBox[{"Most", "[", 
        RowBox[{"ArrayRules", "[", 
         RowBox[{"SparseArray", "[", 
          RowBox[{"ColumnMajorLayout", "[", 
           RowBox[{"ArrayReshape", "[", 
            RowBox[{
             RowBox[{"Normal", "[", 
              SubscriptBox["A", 
               RowBox[{"strang", ",", "dt", ",", "merged"}]], "]"}], ",", 
             RowBox[{"ConstantArray", "[", 
              RowBox[{
               RowBox[{"Length", "[", 
                SubscriptBox["qd", "val"], "]"}], ",", 
               RowBox[{"2", "L"}]}], "]"}]}], "]"}], "]"}], "]"}], "]"}], 
        "]"}]}], ";", 
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", "\"\<_A_strang5i8_m_val.dat\>\""}],
         ",", 
        RowBox[{"Last", "/@", "ar"}], ",", "\"\<Complex128\>\""}], "]"}], ";",
       "\[IndentingNewLine]", 
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", "\"\<_A_strang5i8_m_ind.dat\>\""}],
         ",", 
        RowBox[{
         RowBox[{"Flatten", "[", 
          RowBox[{"First", "/@", "ar"}], "]"}], "-", "1"}], ",", 
        "\"\<Integer64\>\""}], "]"}]}]}], "]"}], ";"}]}]], "Input"],

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
       SubscriptBox["qd", "val"], ",", 
       RowBox[{"nsteps", " ", "dt"}], ",", "nsteps", ",", "tol"}], "]"}]}]}], 
   "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", 
  RowBox[{"(", 
   RowBox[{"First", "/@", "%"}], ")"}]}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "1", ",", "16"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "16", ",", "153"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "153", ",", "137"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "137", ",", "16"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "16", ",", "1"}], "}"}]}], "}"}]], "Output"]
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
     {"0", 
      RowBox[{"0.002509268674527564`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.0006012449363362355`", " ", "\[ImaginaryI]"}]}], "0"},
     {"0", 
      RowBox[{"0.02014529332792398`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.012973029686390518`", " ", "\[ImaginaryI]"}]}], "0"},
     {"0", "0", "0"}
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
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"dt", "=", 
     RowBox[{
      RowBox[{"1", "/", "6"}], "+", 
      RowBox[{"\[ImaginaryI]", "/", "7"}]}]}], "}"}], ",", 
   RowBox[{
    SubscriptBox["A", 
     RowBox[{"strang", ",", "liouville", ",", "dt", ",", "merged"}]], "=", 
    RowBox[{"SparseArray", "[", 
     RowBox[{"MPOMergeFull", "[", 
      RowBox[{"First", "/@", 
       SubscriptBox["A", 
        RowBox[{"strang", ",", "liouville", ",", "dt"}]]}], "]"}], "]"}]}]}], 
  "]"}]], "Input"],

Cell[BoxData[
 TagBox[
  TemplateBox[{RowBox[{
      StyleBox[
       TagBox["SparseArray", "SummaryHead"], "NonInterpretableSummary"], 
      StyleBox["[", "NonInterpretableSummary"], 
      DynamicModuleBox[{Typeset`open$$ = False}, 
       PanelBox[
        PaneSelectorBox[{False -> GridBox[{{
              PaneBox[
               ButtonBox[
                DynamicBox[
                 FEPrivate`FrontEndResource[
                 "FEBitmaps", "SquarePlusIconMedium"]], 
                ButtonFunction :> (Typeset`open$$ = True), Appearance -> None,
                 Evaluator -> Automatic, Method -> "Preemptive"], 
               Alignment -> {Center, Center}, ImageSize -> 
               Dynamic[{
                 Automatic, 3.5 CurrentValue["FontCapHeight"]/
                  AbsoluteCurrentValue[Magnification]}]], 
              GraphicsBox[
               RasterBox[
               SparseArray[
                Automatic, {10, 10}, 0.93, {
                 1, {{0, 1, 1, 4, 4, 5, 6, 6, 8, 10, 13}, {{4}, {6}, {7}, {
                   10}, {5}, {9}, {3}, {8}, {5}, {7}, {2}, {3}, {7}}}, {0., 
                  0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0.}}], {{0, 
                0}, {10, 10}}, {0, 1}], Frame -> False, Axes -> False, 
               AspectRatio -> 1, ImageSize -> 
               Dynamic[{
                 Automatic, 3.5 CurrentValue["FontCapHeight"]/
                  AbsoluteCurrentValue[Magnification]}], Frame -> True, 
               FrameTicks -> None, FrameStyle -> Directive[
                 Opacity[0.5], 
                 Thickness[Tiny], 
                 RGBColor[0.368417, 0.506779, 0.709798]], 
               FrameLabel -> {None, None}, 
               FrameTicks -> {{None, None}, {None, None}}], 
              GridBox[{{
                 RowBox[{
                   TagBox[
                   "\"Specified elements: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["108532", "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Dimensions: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox[
                    RowBox[{"{", 
                    RowBox[{"1024", ",", "1024"}], "}"}], "SummaryItem"]}]}}, 
               GridBoxAlignment -> {
                "Columns" -> {{Left}}, "Rows" -> {{Automatic}}}, AutoDelete -> 
               False, GridBoxItemSize -> {
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
               GridBoxSpacings -> {
                "Columns" -> {{2}}, "Rows" -> {{Automatic}}}, 
               BaseStyle -> {
                ShowStringCharacters -> False, NumberMarks -> False, 
                 PrintPrecision -> 3, ShowSyntaxStyles -> False}]}}, 
            GridBoxAlignment -> {"Rows" -> {{Top}}}, AutoDelete -> False, 
            GridBoxItemSize -> {
             "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
            BaselinePosition -> {1, 1}], True -> GridBox[{{
              PaneBox[
               ButtonBox[
                DynamicBox[
                 FEPrivate`FrontEndResource[
                 "FEBitmaps", "SquareMinusIconMedium"]], 
                ButtonFunction :> (Typeset`open$$ = False), Appearance -> 
                None, Evaluator -> Automatic, Method -> "Preemptive"], 
               Alignment -> {Center, Center}, ImageSize -> 
               Dynamic[{
                 Automatic, 3.5 CurrentValue["FontCapHeight"]/
                  AbsoluteCurrentValue[Magnification]}]], 
              GraphicsBox[
               RasterBox[
               SparseArray[
                Automatic, {10, 10}, 0.93, {
                 1, {{0, 1, 1, 4, 4, 5, 6, 6, 8, 10, 13}, {{4}, {6}, {7}, {
                   10}, {5}, {9}, {3}, {8}, {5}, {7}, {2}, {3}, {7}}}, {0., 
                  0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0.}}], {{0, 
                0}, {10, 10}}, {0, 1}], Frame -> False, Axes -> False, 
               AspectRatio -> 1, ImageSize -> 
               Dynamic[{
                 Automatic, 3.5 CurrentValue["FontCapHeight"]/
                  AbsoluteCurrentValue[Magnification]}], Frame -> True, 
               FrameTicks -> None, FrameStyle -> Directive[
                 Opacity[0.5], 
                 Thickness[Tiny], 
                 RGBColor[0.368417, 0.506779, 0.709798]], 
               FrameLabel -> {None, None}, 
               FrameTicks -> {{None, None}, {None, None}}], 
              GridBox[{{
                 RowBox[{
                   TagBox[
                   "\"Specified elements: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["108532", "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Dimensions: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox[
                    RowBox[{"{", 
                    RowBox[{"1024", ",", "1024"}], "}"}], "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Default: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox[
                    RowBox[{
                    RowBox[{"0.`", "\[VeryThinSpace]"}], "+", 
                    RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
                    "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Density: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["0.10350418090820312`", "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Elements:\"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["\"\"", "SummaryItem"]}]}, {
                 TagBox[
                  TagBox[
                   GridBox[{{
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "1"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{
                    RowBox[{"0.0009869085675925412`", "\[VeryThinSpace]"}], 
                    "-", 
                    RowBox[{"0.002761998396093015`", " ", "\[ImaginaryI]"}]}],
                     ContentPadding -> False, FrameMargins -> 0, StripOnInput -> 
                    True, BaselinePosition -> Baseline, 
                    ImageSize -> {{1, 300}, Automatic}], LineBreakWithin -> 
                    False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "4"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{
                    RowBox[{"-", "0.0001524336534865703`"}], "-", 
                    RowBox[{"0.00005433703808053024`", " ", 
                    "\[ImaginaryI]"}]}], ContentPadding -> False, 
                    FrameMargins -> 0, StripOnInput -> True, BaselinePosition -> 
                    Baseline, ImageSize -> {{1, 300}, Automatic}], 
                    LineBreakWithin -> False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "13"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{
                    RowBox[{"-", "0.0030462280808089613`"}], "+", 
                    RowBox[{"0.001247573387083064`", " ", "\[ImaginaryI]"}]}],
                     ContentPadding -> False, FrameMargins -> 0, StripOnInput -> 
                    True, BaselinePosition -> Baseline, 
                    ImageSize -> {{1, 300}, Automatic}], LineBreakWithin -> 
                    False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "16"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{
                    RowBox[{"0.0017162690862260427`", "\[VeryThinSpace]"}], 
                    "-", 
                    
                    RowBox[{"0.0008074197345771324`", " ", 
                    "\[ImaginaryI]"}]}], ContentPadding -> False, 
                    FrameMargins -> 0, StripOnInput -> True, BaselinePosition -> 
                    Baseline, ImageSize -> {{1, 300}, Automatic}], 
                    LineBreakWithin -> False]}]}, {
                    ItemBox[
                    "\"\[VerticalEllipsis]\"", Alignment -> Center, 
                    StripOnInput -> False]}}, 
                    GridBoxAlignment -> {"Columns" -> {{Left}}}, 
                    DefaultBaseStyle -> "Column", 
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}], 
                   "Column"], "SummaryItem"]}}, 
               GridBoxAlignment -> {
                "Columns" -> {{Left}}, "Rows" -> {{Automatic}}}, AutoDelete -> 
               False, GridBoxItemSize -> {
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
               GridBoxSpacings -> {
                "Columns" -> {{2}}, "Rows" -> {{Automatic}}}, 
               BaseStyle -> {
                ShowStringCharacters -> False, NumberMarks -> False, 
                 PrintPrecision -> 3, ShowSyntaxStyles -> False}]}}, 
            GridBoxAlignment -> {"Rows" -> {{Top}}}, AutoDelete -> False, 
            GridBoxItemSize -> {
             "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
            BaselinePosition -> {1, 1}]}, 
         Dynamic[Typeset`open$$], ImageSize -> Automatic], BaselinePosition -> 
        Baseline], DynamicModuleValues :> {}], 
      StyleBox["]", "NonInterpretableSummary"]}]},
   "CopyTag",
   DisplayFunction->(#& ),
   InterpretationFunction->("SparseArray[<108532>, {1024, 1024}]"& )],
  False,
  Editable->False,
  SelectWithContents->True,
  Selectable->False]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"save", " ", "non"}], "-", 
     RowBox[{"zero", " ", "entries", " ", "of", " ", 
      RowBox[{"merged", " ", "'"}], 
      RowBox[{"A", "'"}], " ", "tensors", " ", "to", " ", "disk"}]}], ",", 
    " ", 
    RowBox[{"after", " ", "appropriate", " ", "reordering"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"dt", "=", 
        RowBox[{
         RowBox[{"1", "/", "6"}], "+", 
         RowBox[{"\[ImaginaryI]", "/", "7"}]}]}], ",", "ar"}], "}"}], ",", 
     RowBox[{
      RowBox[{"ar", "=", 
       RowBox[{"Most", "[", 
        RowBox[{"ArrayRules", "[", 
         RowBox[{"SparseArray", "[", 
          RowBox[{"ColumnMajorLayout", "[", 
           RowBox[{"ArrayReshape", "[", 
            RowBox[{
             RowBox[{"Normal", "[", 
              SubscriptBox["A", 
               RowBox[{
               "strang", ",", "liouville", ",", "dt", ",", "merged"}]], "]"}],
              ",", 
             RowBox[{"ConstantArray", "[", 
              RowBox[{
               RowBox[{"Length", "[", 
                SubscriptBox["qd", "val"], "]"}], ",", 
               RowBox[{"2", "L"}]}], "]"}]}], "]"}], "]"}], "]"}], "]"}], 
        "]"}]}], ";", 
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", 
         "\"\<_A_Lstrang6i7_m_val.dat\>\""}], ",", 
        RowBox[{"Last", "/@", "ar"}], ",", "\"\<Complex128\>\""}], "]"}], ";",
       "\[IndentingNewLine]", 
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", 
         "\"\<_A_Lstrang6i7_m_ind.dat\>\""}], ",", 
        RowBox[{
         RowBox[{"Flatten", "[", 
          RowBox[{"First", "/@", "ar"}], "]"}], "-", "1"}], ",", 
        "\"\<Integer64\>\""}], "]"}]}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["PRK splitting evolution", "Subsection"],

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
      RowBox[{"PRK", ",", "dt"}]], "=", 
     RowBox[{"MPOPRKEvolution", "[", 
      RowBox[{
       SubscriptBox["A", "list"], ",", 
       SubscriptBox["h", "list"], ",", 
       SubscriptBox["qd", "val"], ",", 
       RowBox[{"nsteps", " ", "dt"}], ",", "nsteps", ",", "tol"}], "]"}]}]}], 
   "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", 
  RowBox[{"(", 
   RowBox[{"First", "/@", "%"}], ")"}]}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "1", ",", "16"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "16", ",", "85"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "85", ",", "54"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "54", ",", "16"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "16", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["A", 
     RowBox[{"PRK", ",", 
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
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.0005171654677627658`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.0006102317129320567`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
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
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"dt", "=", 
     RowBox[{
      RowBox[{"1", "/", "11"}], "+", 
      RowBox[{"\[ImaginaryI]", "/", "9"}]}]}], "}"}], ",", 
   RowBox[{
    SubscriptBox["A", 
     RowBox[{"PRK", ",", "dt", ",", "merged"}]], "=", 
    RowBox[{"SparseArray", "[", 
     RowBox[{"MPOMergeFull", "[", 
      RowBox[{"First", "/@", 
       SubscriptBox["A", 
        RowBox[{"PRK", ",", "dt"}]]}], "]"}], "]"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 TagBox[
  TemplateBox[{RowBox[{
      StyleBox[
       TagBox["SparseArray", "SummaryHead"], "NonInterpretableSummary"], 
      StyleBox["[", "NonInterpretableSummary"], 
      DynamicModuleBox[{Typeset`open$$ = False}, 
       PanelBox[
        PaneSelectorBox[{False -> GridBox[{{
              PaneBox[
               ButtonBox[
                DynamicBox[
                 FEPrivate`FrontEndResource[
                 "FEBitmaps", "SquarePlusIconMedium"]], 
                ButtonFunction :> (Typeset`open$$ = True), Appearance -> None,
                 Evaluator -> Automatic, Method -> "Preemptive"], 
               Alignment -> {Center, Center}, ImageSize -> 
               Dynamic[{
                 Automatic, 3.5 CurrentValue["FontCapHeight"]/
                  AbsoluteCurrentValue[Magnification]}]], 
              GraphicsBox[
               RasterBox[
               SparseArray[
                Automatic, {10, 10}, 0.93, {
                 1, {{0, 1, 1, 4, 4, 5, 6, 6, 8, 10, 13}, {{4}, {6}, {7}, {
                   10}, {5}, {9}, {3}, {8}, {5}, {7}, {2}, {3}, {7}}}, {0., 
                  0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0.}}], {{0, 
                0}, {10, 10}}, {0, 1}], Frame -> False, Axes -> False, 
               AspectRatio -> 1, ImageSize -> 
               Dynamic[{
                 Automatic, 3.5 CurrentValue["FontCapHeight"]/
                  AbsoluteCurrentValue[Magnification]}], Frame -> True, 
               FrameTicks -> None, FrameStyle -> Directive[
                 Opacity[0.5], 
                 Thickness[Tiny], 
                 RGBColor[0.368417, 0.506779, 0.709798]], 
               FrameLabel -> {None, None}, 
               FrameTicks -> {{None, None}, {None, None}}], 
              GridBox[{{
                 RowBox[{
                   TagBox[
                   "\"Specified elements: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["108532", "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Dimensions: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox[
                    RowBox[{"{", 
                    RowBox[{"1024", ",", "1024"}], "}"}], "SummaryItem"]}]}}, 
               GridBoxAlignment -> {
                "Columns" -> {{Left}}, "Rows" -> {{Automatic}}}, AutoDelete -> 
               False, GridBoxItemSize -> {
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
               GridBoxSpacings -> {
                "Columns" -> {{2}}, "Rows" -> {{Automatic}}}, 
               BaseStyle -> {
                ShowStringCharacters -> False, NumberMarks -> False, 
                 PrintPrecision -> 3, ShowSyntaxStyles -> False}]}}, 
            GridBoxAlignment -> {"Rows" -> {{Top}}}, AutoDelete -> False, 
            GridBoxItemSize -> {
             "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
            BaselinePosition -> {1, 1}], True -> GridBox[{{
              PaneBox[
               ButtonBox[
                DynamicBox[
                 FEPrivate`FrontEndResource[
                 "FEBitmaps", "SquareMinusIconMedium"]], 
                ButtonFunction :> (Typeset`open$$ = False), Appearance -> 
                None, Evaluator -> Automatic, Method -> "Preemptive"], 
               Alignment -> {Center, Center}, ImageSize -> 
               Dynamic[{
                 Automatic, 3.5 CurrentValue["FontCapHeight"]/
                  AbsoluteCurrentValue[Magnification]}]], 
              GraphicsBox[
               RasterBox[
               SparseArray[
                Automatic, {10, 10}, 0.93, {
                 1, {{0, 1, 1, 4, 4, 5, 6, 6, 8, 10, 13}, {{4}, {6}, {7}, {
                   10}, {5}, {9}, {3}, {8}, {5}, {7}, {2}, {3}, {7}}}, {0., 
                  0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0.}}], {{0, 
                0}, {10, 10}}, {0, 1}], Frame -> False, Axes -> False, 
               AspectRatio -> 1, ImageSize -> 
               Dynamic[{
                 Automatic, 3.5 CurrentValue["FontCapHeight"]/
                  AbsoluteCurrentValue[Magnification]}], Frame -> True, 
               FrameTicks -> None, FrameStyle -> Directive[
                 Opacity[0.5], 
                 Thickness[Tiny], 
                 RGBColor[0.368417, 0.506779, 0.709798]], 
               FrameLabel -> {None, None}, 
               FrameTicks -> {{None, None}, {None, None}}], 
              GridBox[{{
                 RowBox[{
                   TagBox[
                   "\"Specified elements: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["108532", "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Dimensions: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox[
                    RowBox[{"{", 
                    RowBox[{"1024", ",", "1024"}], "}"}], "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Default: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox[
                    RowBox[{
                    RowBox[{"0.`", "\[VeryThinSpace]"}], "+", 
                    RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
                    "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Density: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["0.10350418090820312`", "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Elements:\"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["\"\"", "SummaryItem"]}]}, {
                 TagBox[
                  TagBox[
                   GridBox[{{
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "1"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{"6.490410267045715`*^-6", "-", 
                    
                    RowBox[{"1.5739162995773593`*^-6", " ", 
                    "\[ImaginaryI]"}]}], ContentPadding -> False, 
                    FrameMargins -> 0, StripOnInput -> True, BaselinePosition -> 
                    Baseline, ImageSize -> {{1, 300}, Automatic}], 
                    LineBreakWithin -> False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "4"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{
                    RowBox[{"0.000010338819503497523`", "\[VeryThinSpace]"}], 
                    "+", 
                    
                    RowBox[{"3.7418027752692996`*^-6", " ", 
                    "\[ImaginaryI]"}]}], ContentPadding -> False, 
                    FrameMargins -> 0, StripOnInput -> True, BaselinePosition -> 
                    Baseline, ImageSize -> {{1, 300}, Automatic}], 
                    LineBreakWithin -> False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "13"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{"5.216634361111733`*^-7", "+", 
                    RowBox[{"5.09469698874345`*^-6", " ", "\[ImaginaryI]"}]}],
                     ContentPadding -> False, FrameMargins -> 0, StripOnInput -> 
                    True, BaselinePosition -> Baseline, 
                    ImageSize -> {{1, 300}, Automatic}], LineBreakWithin -> 
                    False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "16"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{"4.1973181007515135`*^-6", "+", 
                    
                    RowBox[{"6.757355061499951`*^-6", " ", 
                    "\[ImaginaryI]"}]}], ContentPadding -> False, 
                    FrameMargins -> 0, StripOnInput -> True, BaselinePosition -> 
                    Baseline, ImageSize -> {{1, 300}, Automatic}], 
                    LineBreakWithin -> False]}]}, {
                    ItemBox[
                    "\"\[VerticalEllipsis]\"", Alignment -> Center, 
                    StripOnInput -> False]}}, 
                    GridBoxAlignment -> {"Columns" -> {{Left}}}, 
                    DefaultBaseStyle -> "Column", 
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}], 
                   "Column"], "SummaryItem"]}}, 
               GridBoxAlignment -> {
                "Columns" -> {{Left}}, "Rows" -> {{Automatic}}}, AutoDelete -> 
               False, GridBoxItemSize -> {
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
               GridBoxSpacings -> {
                "Columns" -> {{2}}, "Rows" -> {{Automatic}}}, 
               BaseStyle -> {
                ShowStringCharacters -> False, NumberMarks -> False, 
                 PrintPrecision -> 3, ShowSyntaxStyles -> False}]}}, 
            GridBoxAlignment -> {"Rows" -> {{Top}}}, AutoDelete -> False, 
            GridBoxItemSize -> {
             "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
            BaselinePosition -> {1, 1}]}, 
         Dynamic[Typeset`open$$], ImageSize -> Automatic], BaselinePosition -> 
        Baseline], DynamicModuleValues :> {}], 
      StyleBox["]", "NonInterpretableSummary"]}]},
   "CopyTag",
   DisplayFunction->(#& ),
   InterpretationFunction->("SparseArray[<108532>, {1024, 1024}]"& )],
  False,
  Editable->False,
  SelectWithContents->True,
  Selectable->False]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"save", " ", "non"}], "-", 
     RowBox[{"zero", " ", "entries", " ", "of", " ", 
      RowBox[{"merged", " ", "'"}], 
      RowBox[{"A", "'"}], " ", "tensors", " ", "to", " ", "disk"}]}], ",", 
    " ", 
    RowBox[{"after", " ", "appropriate", " ", "reordering"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"dt", "=", 
        RowBox[{
         RowBox[{"1", "/", "11"}], "+", 
         RowBox[{"\[ImaginaryI]", "/", "9"}]}]}], ",", "ar"}], "}"}], ",", 
     RowBox[{
      RowBox[{"ar", "=", 
       RowBox[{"Most", "[", 
        RowBox[{"ArrayRules", "[", 
         RowBox[{"SparseArray", "[", 
          RowBox[{"ColumnMajorLayout", "[", 
           RowBox[{"ArrayReshape", "[", 
            RowBox[{
             RowBox[{"Normal", "[", 
              SubscriptBox["A", 
               RowBox[{"PRK", ",", "dt", ",", "merged"}]], "]"}], ",", 
             RowBox[{"ConstantArray", "[", 
              RowBox[{
               RowBox[{"Length", "[", 
                SubscriptBox["qd", "val"], "]"}], ",", 
               RowBox[{"2", "L"}]}], "]"}]}], "]"}], "]"}], "]"}], "]"}], 
        "]"}]}], ";", 
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", "\"\<_A_prk11i9_m_val.dat\>\""}], 
        ",", 
        RowBox[{"Last", "/@", "ar"}], ",", "\"\<Complex128\>\""}], "]"}], ";",
       "\[IndentingNewLine]", 
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", "\"\<_A_prk11i9_m_ind.dat\>\""}], 
        ",", 
        RowBox[{
         RowBox[{"Flatten", "[", 
          RowBox[{"First", "/@", "ar"}], "]"}], "-", "1"}], ",", 
        "\"\<Integer64\>\""}], "]"}]}]}], "]"}], ";"}]}]], "Input"],

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
      RowBox[{"PRK", ",", "liouville", ",", "dt"}]], "=", 
     RowBox[{"MPOPRKLiouvilleEvolution", "[", 
      RowBox[{
       SubscriptBox["A", "list"], ",", 
       SubscriptBox["h", "list"], ",", 
       SubscriptBox["qd", "val"], ",", 
       RowBox[{"nsteps", " ", "dt"}], ",", "nsteps", ",", "tol"}], "]"}]}]}], 
   "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", 
  RowBox[{"(", 
   RowBox[{"First", "/@", "%"}], ")"}]}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "1", ",", "16"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "16", ",", "191"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "191", ",", "146"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "146", ",", "16"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "16", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["A", 
     RowBox[{"PRK", ",", "liouville", ",", 
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
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.08735549991455556`"}], "+", 
       RowBox[{"0.1907943665710823`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.084851182420701`"}], "-", 
       RowBox[{"0.16268708087616876`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
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
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"dt", "=", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "1"}], "/", "3"}], "+", 
      RowBox[{"\[ImaginaryI]", "/", "5"}]}]}], "}"}], ",", 
   RowBox[{
    SubscriptBox["A", 
     RowBox[{"PRK", ",", "liouville", ",", "dt", ",", "merged"}]], "=", 
    RowBox[{"SparseArray", "[", 
     RowBox[{"MPOMergeFull", "[", 
      RowBox[{"First", "/@", 
       SubscriptBox["A", 
        RowBox[{"PRK", ",", "liouville", ",", "dt"}]]}], "]"}], "]"}]}]}], 
  "]"}]], "Input"],

Cell[BoxData[
 TagBox[
  TemplateBox[{RowBox[{
      StyleBox[
       TagBox["SparseArray", "SummaryHead"], "NonInterpretableSummary"], 
      StyleBox["[", "NonInterpretableSummary"], 
      DynamicModuleBox[{Typeset`open$$ = False}, 
       PanelBox[
        PaneSelectorBox[{False -> GridBox[{{
              PaneBox[
               ButtonBox[
                DynamicBox[
                 FEPrivate`FrontEndResource[
                 "FEBitmaps", "SquarePlusIconMedium"]], 
                ButtonFunction :> (Typeset`open$$ = True), Appearance -> None,
                 Evaluator -> Automatic, Method -> "Preemptive"], 
               Alignment -> {Center, Center}, ImageSize -> 
               Dynamic[{
                 Automatic, 3.5 CurrentValue["FontCapHeight"]/
                  AbsoluteCurrentValue[Magnification]}]], 
              GraphicsBox[
               RasterBox[
               SparseArray[
                Automatic, {10, 10}, 0.93, {
                 1, {{0, 1, 1, 4, 4, 5, 6, 6, 8, 10, 13}, {{4}, {6}, {7}, {
                   10}, {5}, {9}, {3}, {8}, {5}, {7}, {2}, {3}, {7}}}, {0., 
                  0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0.}}], {{0, 
                0}, {10, 10}}, {0, 1}], Frame -> False, Axes -> False, 
               AspectRatio -> 1, ImageSize -> 
               Dynamic[{
                 Automatic, 3.5 CurrentValue["FontCapHeight"]/
                  AbsoluteCurrentValue[Magnification]}], Frame -> True, 
               FrameTicks -> None, FrameStyle -> Directive[
                 Opacity[0.5], 
                 Thickness[Tiny], 
                 RGBColor[0.368417, 0.506779, 0.709798]], 
               FrameLabel -> {None, None}, 
               FrameTicks -> {{None, None}, {None, None}}], 
              GridBox[{{
                 RowBox[{
                   TagBox[
                   "\"Specified elements: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["109036", "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Dimensions: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox[
                    RowBox[{"{", 
                    RowBox[{"1024", ",", "1024"}], "}"}], "SummaryItem"]}]}}, 
               GridBoxAlignment -> {
                "Columns" -> {{Left}}, "Rows" -> {{Automatic}}}, AutoDelete -> 
               False, GridBoxItemSize -> {
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
               GridBoxSpacings -> {
                "Columns" -> {{2}}, "Rows" -> {{Automatic}}}, 
               BaseStyle -> {
                ShowStringCharacters -> False, NumberMarks -> False, 
                 PrintPrecision -> 3, ShowSyntaxStyles -> False}]}}, 
            GridBoxAlignment -> {"Rows" -> {{Top}}}, AutoDelete -> False, 
            GridBoxItemSize -> {
             "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
            BaselinePosition -> {1, 1}], True -> GridBox[{{
              PaneBox[
               ButtonBox[
                DynamicBox[
                 FEPrivate`FrontEndResource[
                 "FEBitmaps", "SquareMinusIconMedium"]], 
                ButtonFunction :> (Typeset`open$$ = False), Appearance -> 
                None, Evaluator -> Automatic, Method -> "Preemptive"], 
               Alignment -> {Center, Center}, ImageSize -> 
               Dynamic[{
                 Automatic, 3.5 CurrentValue["FontCapHeight"]/
                  AbsoluteCurrentValue[Magnification]}]], 
              GraphicsBox[
               RasterBox[
               SparseArray[
                Automatic, {10, 10}, 0.93, {
                 1, {{0, 1, 1, 4, 4, 5, 6, 6, 8, 10, 13}, {{4}, {6}, {7}, {
                   10}, {5}, {9}, {3}, {8}, {5}, {7}, {2}, {3}, {7}}}, {0., 
                  0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0.}}], {{0, 
                0}, {10, 10}}, {0, 1}], Frame -> False, Axes -> False, 
               AspectRatio -> 1, ImageSize -> 
               Dynamic[{
                 Automatic, 3.5 CurrentValue["FontCapHeight"]/
                  AbsoluteCurrentValue[Magnification]}], Frame -> True, 
               FrameTicks -> None, FrameStyle -> Directive[
                 Opacity[0.5], 
                 Thickness[Tiny], 
                 RGBColor[0.368417, 0.506779, 0.709798]], 
               FrameLabel -> {None, None}, 
               FrameTicks -> {{None, None}, {None, None}}], 
              GridBox[{{
                 RowBox[{
                   TagBox[
                   "\"Specified elements: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["109036", "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Dimensions: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox[
                    RowBox[{"{", 
                    RowBox[{"1024", ",", "1024"}], "}"}], "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Default: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox[
                    RowBox[{
                    RowBox[{"0.`", "\[VeryThinSpace]"}], "+", 
                    RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
                    "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Density: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["0.10398483276367188`", "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Elements:\"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["\"\"", "SummaryItem"]}]}, {
                 TagBox[
                  TagBox[
                   GridBox[{{
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "1"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{
                    RowBox[{"-", "0.585912873576815`"}], "-", 
                    RowBox[{"0.9547383517628588`", " ", "\[ImaginaryI]"}]}], 
                    ContentPadding -> False, FrameMargins -> 0, StripOnInput -> 
                    True, BaselinePosition -> Baseline, 
                    ImageSize -> {{1, 300}, Automatic}], LineBreakWithin -> 
                    False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "4"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{
                    RowBox[{"1.0091708810920927`", "\[VeryThinSpace]"}], "+", 
                    RowBox[{"0.988650593423614`", " ", "\[ImaginaryI]"}]}], 
                    ContentPadding -> False, FrameMargins -> 0, StripOnInput -> 
                    True, BaselinePosition -> Baseline, 
                    ImageSize -> {{1, 300}, Automatic}], LineBreakWithin -> 
                    False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "13"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{
                    RowBox[{"-", "1.2672580360252639`"}], "-", 
                    RowBox[{"0.006352000180989088`", " ", "\[ImaginaryI]"}]}],
                     ContentPadding -> False, FrameMargins -> 0, StripOnInput -> 
                    True, BaselinePosition -> Baseline, 
                    ImageSize -> {{1, 300}, Automatic}], LineBreakWithin -> 
                    False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "16"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{
                    RowBox[{"-", "1.9241320423344224`"}], "-", 
                    RowBox[{"0.08915343554722455`", " ", "\[ImaginaryI]"}]}], 
                    ContentPadding -> False, FrameMargins -> 0, StripOnInput -> 
                    True, BaselinePosition -> Baseline, 
                    ImageSize -> {{1, 300}, Automatic}], LineBreakWithin -> 
                    False]}]}, {
                    ItemBox[
                    "\"\[VerticalEllipsis]\"", Alignment -> Center, 
                    StripOnInput -> False]}}, 
                    GridBoxAlignment -> {"Columns" -> {{Left}}}, 
                    DefaultBaseStyle -> "Column", 
                    GridBoxItemSize -> {
                    "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}], 
                   "Column"], "SummaryItem"]}}, 
               GridBoxAlignment -> {
                "Columns" -> {{Left}}, "Rows" -> {{Automatic}}}, AutoDelete -> 
               False, GridBoxItemSize -> {
                "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
               GridBoxSpacings -> {
                "Columns" -> {{2}}, "Rows" -> {{Automatic}}}, 
               BaseStyle -> {
                ShowStringCharacters -> False, NumberMarks -> False, 
                 PrintPrecision -> 3, ShowSyntaxStyles -> False}]}}, 
            GridBoxAlignment -> {"Rows" -> {{Top}}}, AutoDelete -> False, 
            GridBoxItemSize -> {
             "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
            BaselinePosition -> {1, 1}]}, 
         Dynamic[Typeset`open$$], ImageSize -> Automatic], BaselinePosition -> 
        Baseline], DynamicModuleValues :> {}], 
      StyleBox["]", "NonInterpretableSummary"]}]},
   "CopyTag",
   DisplayFunction->(#& ),
   InterpretationFunction->("SparseArray[<109036>, {1024, 1024}]"& )],
  False,
  Editable->False,
  SelectWithContents->True,
  Selectable->False]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"save", " ", "non"}], "-", 
     RowBox[{"zero", " ", "entries", " ", "of", " ", 
      RowBox[{"merged", " ", "'"}], 
      RowBox[{"A", "'"}], " ", "tensors", " ", "to", " ", "disk"}]}], ",", 
    " ", 
    RowBox[{"after", " ", "appropriate", " ", "reordering"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"dt", "=", 
        RowBox[{
         RowBox[{
          RowBox[{"-", "1"}], "/", "3"}], "+", 
         RowBox[{"\[ImaginaryI]", "/", "5"}]}]}], ",", "ar"}], "}"}], ",", 
     RowBox[{
      RowBox[{"ar", "=", 
       RowBox[{"Most", "[", 
        RowBox[{"ArrayRules", "[", 
         RowBox[{"SparseArray", "[", 
          RowBox[{"ColumnMajorLayout", "[", 
           RowBox[{"ArrayReshape", "[", 
            RowBox[{
             RowBox[{"Normal", "[", 
              SubscriptBox["A", 
               RowBox[{"PRK", ",", "liouville", ",", "dt", ",", "merged"}]], 
              "]"}], ",", 
             RowBox[{"ConstantArray", "[", 
              RowBox[{
               RowBox[{"Length", "[", 
                SubscriptBox["qd", "val"], "]"}], ",", 
               RowBox[{"2", "L"}]}], "]"}]}], "]"}], "]"}], "]"}], "]"}], 
        "]"}]}], ";", 
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", "\"\<_A_Lprk3i5_m_val.dat\>\""}], 
        ",", 
        RowBox[{"Last", "/@", "ar"}], ",", "\"\<Complex128\>\""}], "]"}], ";",
       "\[IndentingNewLine]", 
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", "\"\<_A_Lprk3i5_m_ind.dat\>\""}], 
        ",", 
        RowBox[{
         RowBox[{"Flatten", "[", 
          RowBox[{"First", "/@", "ar"}], "]"}], "-", "1"}], ",", 
        "\"\<Integer64\>\""}], "]"}]}]}], "]"}], ";"}]}]], "Input"]
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
Cell[1928, 52, 310, 9, 31, "Input"],
Cell[CellGroupData[{
Cell[2263, 65, 49, 0, 43, "Subsection"],
Cell[2315, 67, 233, 7, 52, "Input"],
Cell[2551, 76, 340, 10, 52, "Input"],
Cell[CellGroupData[{
Cell[2916, 90, 1107, 33, 92, "Input"],
Cell[4026, 125, 607, 18, 31, "Output"],
Cell[4636, 145, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4701, 150, 2033, 55, 92, "Input"],
Cell[6737, 207, 73, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6847, 214, 366, 9, 52, "Input"],
Cell[7216, 225, 93, 2, 31, "Output"],
Cell[7312, 229, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7442, 236, 158, 4, 31, "Input"],
Cell[7603, 242, 79, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7719, 249, 1855, 52, 92, "Input"],
Cell[9577, 303, 85, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[9699, 310, 447, 13, 52, "Input"],
Cell[10149, 325, 732, 19, 71, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[10918, 349, 314, 10, 52, "Input"],
Cell[11235, 361, 101, 2, 31, "Output"]
}, Open  ]],
Cell[11351, 366, 967, 27, 52, "Input"],
Cell[12321, 395, 915, 25, 52, "Input"],
Cell[13239, 422, 1276, 36, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14552, 463, 48, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[14625, 467, 849, 26, 54, "Input"],
Cell[15477, 495, 456, 12, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15970, 512, 600, 17, 52, "Input"],
Cell[16573, 531, 745, 20, 72, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17355, 556, 494, 15, 31, "Input"],
Cell[17852, 573, 9947, 206, 75, "Output"]
}, Open  ]],
Cell[27814, 782, 1968, 55, 92, "Input"],
Cell[CellGroupData[{
Cell[29807, 841, 876, 26, 54, "Input"],
Cell[30686, 869, 460, 12, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[31183, 886, 618, 17, 52, "Input"],
Cell[31804, 905, 871, 22, 73, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[32712, 932, 533, 16, 31, "Input"],
Cell[33248, 950, 9914, 204, 75, "Output"]
}, Open  ]],
Cell[43177, 1157, 2020, 57, 92, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[45234, 1219, 45, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[45304, 1223, 844, 26, 54, "Input"],
Cell[46151, 1251, 456, 12, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[46644, 1268, 598, 17, 52, "Input"],
Cell[47245, 1287, 1474, 36, 74, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[48756, 1328, 489, 15, 31, "Input"],
Cell[49248, 1345, 9817, 202, 75, "Output"]
}, Open  ]],
Cell[59080, 1550, 1962, 55, 92, "Input"],
Cell[CellGroupData[{
Cell[61067, 1609, 895, 27, 54, "Input"],
Cell[61965, 1638, 460, 12, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[62462, 1655, 639, 18, 52, "Input"],
Cell[63104, 1675, 1507, 38, 74, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[64648, 1718, 550, 17, 31, "Input"],
Cell[65201, 1737, 9814, 201, 75, "Output"]
}, Open  ]],
Cell[75030, 1941, 2020, 57, 92, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature evTNLRefcsVTiDKvQ6HddDRi *)
