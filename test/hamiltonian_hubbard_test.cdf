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
NotebookDataLength[     72015,       1950]
NotebookOptionsPosition[     69816,       1855]
NotebookOutlinePosition[     70158,       1870]
CellTagsIndexPosition[     70115,       1867]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Fermionic Hubbard Hamiltonian", "Section"],

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

Cell["General definitions", "Subsection"],

Cell[BoxData[
 RowBox[{"(*", 
  RowBox[{
   RowBox[{
    RowBox[{" ", 
     RowBox[{
     "states", " ", "for", " ", "each", " ", "spin", " ", "and", " ", "site", 
      " ", "are", " ", 
      RowBox[{"\[LeftBracketingBar]", "0"}]}], "\[RightAngleBracket]"}], " ", 
    "and", " ", 
    RowBox[{"\[LeftBracketingBar]", "1"}]}], "\[RightAngleBracket]"}], " ", 
  "*)"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"identity", " ", "and", " ", "Pauli", " ", "matrices"}], " ", 
   "*)"}], "\n", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["\[Sigma]", "0"], "=", 
     RowBox[{"IdentityMatrix", "[", "2", "]"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["\[Sigma]", "1"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"0", ",", "1"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"1", ",", "0"}], "}"}]}], "}"}]}], ";"}], "\n", 
   RowBox[{
    RowBox[{
     SubscriptBox["\[Sigma]", "2"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"0", ",", 
         RowBox[{"-", "\[ImaginaryI]"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"\[ImaginaryI]", ",", "0"}], "}"}]}], "}"}]}], ";"}], "\n", 
   RowBox[{
    RowBox[{
     SubscriptBox["\[Sigma]", "3"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"1", ",", "0"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"0", ",", 
         RowBox[{"-", "1"}]}], "}"}]}], "}"}]}], ";"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"annihilation", " ", "operator"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["a", "annihil"], "=", 
   RowBox[{
    FractionBox["1", "2"], 
    RowBox[{"(", 
     RowBox[{
      SubscriptBox["\[Sigma]", "1"], "+", 
      RowBox[{"\[ImaginaryI]", " ", 
       SubscriptBox["\[Sigma]", "2"]}]}], ")"}]}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"creation", " ", "operator"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["a", "create"], "=", 
   RowBox[{
    FractionBox["1", "2"], 
    RowBox[{"(", 
     RowBox[{
      SubscriptBox["\[Sigma]", "1"], "-", 
      RowBox[{"\[ImaginaryI]", " ", 
       SubscriptBox["\[Sigma]", "2"]}]}], ")"}]}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "0"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"number", " ", "operator"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["a", "number"], "=", 
   RowBox[{
    SubscriptBox["a", "create"], ".", 
    SubscriptBox["a", "annihil"]}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"KroneckerProduct", "[", 
   RowBox[{
    SubscriptBox["a", "number"], ",", 
    SubscriptBox["a", "number"]}], "]"}], "//", "MatrixForm"}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0", "0", "0", "0"},
     {"0", "0", "0", "0"},
     {"0", "0", "0", "0"},
     {"0", "0", "0", "1"}
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
  RowBox[{"KroneckerProduct", "[", 
   RowBox[{
    SubscriptBox["a", "create"], ",", 
    RowBox[{"IdentityMatrix", "[", "2", "]"}]}], "]"}], "//", 
  "MatrixForm"}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0", "0", "0", "0"},
     {"0", "0", "0", "0"},
     {"1", "0", "0", "0"},
     {"0", "1", "0", "0"}
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
  RowBox[{"SparseIdentityMatrix", "[", "d_", "]"}], ":=", 
  RowBox[{"SparseArray", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"{", 
      RowBox[{"i_", ",", "i_"}], "}"}], "\[Rule]", "1"}], ",", 
    RowBox[{"{", 
     RowBox[{"d", ",", "d"}], "}"}]}], "]"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["\<\
Construct full Hamiltonian as reference, using Jordan-Wigner transformation\
\>", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"nearest", " ", "neighbor", " ", "hopping"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Tkin", "[", "L_", "]"}], ":=", 
   RowBox[{"Sum", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"KroneckerProduct", "[", 
       RowBox[{
        RowBox[{"SparseIdentityMatrix", "[", 
         SuperscriptBox["2", 
          RowBox[{"l", "-", "1"}]], "]"}], ",", 
        SubscriptBox["a", "create"], ",", 
        SubscriptBox["\[Sigma]", "3"], ",", 
        SubscriptBox["a", "annihil"], ",", 
        RowBox[{"SparseIdentityMatrix", "[", 
         SuperscriptBox["2", 
          RowBox[{
           RowBox[{"2", "L"}], "-", "l", "-", "2"}]], "]"}]}], "]"}], "+", 
      RowBox[{"KroneckerProduct", "[", 
       RowBox[{
        RowBox[{"SparseIdentityMatrix", "[", 
         SuperscriptBox["2", 
          RowBox[{"l", "-", "1"}]], "]"}], ",", 
        SubscriptBox["a", "annihil"], ",", 
        SubscriptBox["\[Sigma]", "3"], ",", 
        SubscriptBox["a", "create"], ",", 
        RowBox[{"SparseIdentityMatrix", "[", 
         SuperscriptBox["2", 
          RowBox[{
           RowBox[{"2", "L"}], "-", "l", "-", "2"}]], "]"}]}], "]"}]}], ",", 
     RowBox[{"{", 
      RowBox[{"l", ",", "1", ",", 
       RowBox[{
        RowBox[{"2", "L"}], "-", "2"}]}], "}"}]}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"Hubbard", " ", "interaction", " ", "term"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Hint", "[", "L_", "]"}], ":=", 
   RowBox[{"Sum", "[", 
    RowBox[{
     RowBox[{"KroneckerProduct", "[", 
      RowBox[{
       RowBox[{"SparseIdentityMatrix", "[", 
        SuperscriptBox["4", 
         RowBox[{"l", "-", "1"}]], "]"}], ",", 
       RowBox[{"DiagonalMatrix", "[", 
        RowBox[{"{", 
         RowBox[{"0", ",", "0", ",", "0", ",", "1"}], "}"}], "]"}], ",", 
       RowBox[{"SparseIdentityMatrix", "[", 
        SuperscriptBox["4", 
         RowBox[{"L", "-", "l"}]], "]"}]}], "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"l", ",", "1", ",", "L"}], "}"}]}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"number", " ", "operator"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"NumOp", "[", "L_", "]"}], ":=", 
   RowBox[{"Sum", "[", 
    RowBox[{
     RowBox[{"KroneckerProduct", "[", 
      RowBox[{
       RowBox[{"SparseIdentityMatrix", "[", 
        SuperscriptBox["2", 
         RowBox[{"l", "-", "1"}]], "]"}], ",", 
       SubscriptBox["a", "number"], ",", 
       RowBox[{"SparseIdentityMatrix", "[", 
        SuperscriptBox["2", 
         RowBox[{
          RowBox[{"2", "L"}], "-", "l"}]], "]"}]}], "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"l", ",", "1", ",", 
       RowBox[{"2", "L"}]}], "}"}]}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "construct", " ", "Hubbard", " ", "Hamiltonian", " ", "with", " ", "open", 
    " ", "boundary", " ", "conditions"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"HHubbard", "[", 
    RowBox[{"t_", ",", "U_", ",", "\[Mu]_", ",", "L_"}], "]"}], ":=", 
   RowBox[{
    RowBox[{
     RowBox[{"-", "t"}], " ", 
     RowBox[{"Tkin", "[", "L", "]"}]}], "+", 
    RowBox[{"U", " ", 
     RowBox[{"Hint", "[", "L", "]"}]}], "-", 
    RowBox[{"\[Mu]", " ", 
     RowBox[{"NumOp", "[", "L", "]"}]}]}]}]}]], "Input"],

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
   RowBox[{"nearest", " ", "neighbor", " ", "hopping", " ", "amplitude"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["t", "val"], "=", 
    RowBox[{"6", "/", "5"}]}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"interaction", " ", "strength"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["U", "val"], "=", 
    RowBox[{"27", "/", "10"}]}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"chemical", " ", "potential"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["\[Mu]", "val"], "=", 
    RowBox[{"3", "/", "10"}]}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  SubscriptBox["H", "hubbard"], "=", 
  RowBox[{"HHubbard", "[", 
   RowBox[{
    SubscriptBox["t", "val"], ",", 
    SubscriptBox["U", "val"], ",", 
    SubscriptBox["\[Mu]", "val"], ",", 
    SubscriptBox["L", "val"]}], "]"}]}]], "Input"],

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
                   TagBox["5119", "SummaryItem"]}]}, {
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
                   TagBox["5119", "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Dimensions: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox[
                    RowBox[{"{", 
                    RowBox[{"1024", ",", "1024"}], "}"}], "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Default: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["0", "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Density: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["0.004881858825683594`", "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Elements:\"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["\"\"", "SummaryItem"]}]}, {
                 TagBox[
                  TagBox[
                   GridBox[{{
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"2", ",", "2"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{"-", 
                    FractionBox["3", "10"]}], ContentPadding -> False, 
                    FrameMargins -> 0, StripOnInput -> True, BaselinePosition -> 
                    Baseline, ImageSize -> {{1, 300}, Automatic}], 
                    LineBreakWithin -> False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"2", ",", "5"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{"-", 
                    FractionBox["6", "5"]}], ContentPadding -> False, 
                    FrameMargins -> 0, StripOnInput -> True, BaselinePosition -> 
                    Baseline, ImageSize -> {{1, 300}, Automatic}], 
                    LineBreakWithin -> False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"3", ",", "3"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{"-", 
                    FractionBox["3", "10"]}], ContentPadding -> False, 
                    FrameMargins -> 0, StripOnInput -> True, BaselinePosition -> 
                    Baseline, ImageSize -> {{1, 300}, Automatic}], 
                    LineBreakWithin -> False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"3", ",", "9"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{"-", 
                    FractionBox["6", "5"]}], ContentPadding -> False, 
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
   InterpretationFunction->("SparseArray[<5119>, {1024, 1024}]"& )],
  False,
  Editable->False,
  SelectWithContents->True,
  Selectable->False]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", " ", "symmetry"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{"Flatten", "[", 
    RowBox[{
     SubscriptBox["H", "hubbard"], "-", 
     RowBox[{"ConjugateTranspose", "[", 
      SubscriptBox["H", "hubbard"], "]"}]}], "]"}], "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["\[Lambda]", "list"], "=", 
   RowBox[{"Sort", "[", 
    RowBox[{"Eigenvalues", "[", 
     RowBox[{"N", "[", 
      RowBox[{"Normal", "[", 
       SubscriptBox["H", "hubbard"], "]"}], "]"}], "]"}], "]"}]}], 
  ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListPlot", "[", 
  RowBox[{
   SubscriptBox["\[Lambda]", "list"], ",", 
   RowBox[{"AxesLabel", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{
     "\"\<i\>\"", ",", "\"\<\!\(\*SubscriptBox[\(\[Lambda]\), \(i\)]\)\>\""}],
      "}"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, 
   {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.008333333333333333], 
    AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJxd2nt8S+cfB/C4bEt1I8PosAmGMvyCoRT9mFtrVBRVl5HeqCpN7+n9pGma
NGnTjKFuW2xsde9cO9e4VV1GMFOXWcZo3abuNZf9up5vXq9ve/5J354853s+
R3Ke5zw5HUKiA8IbSmq2xhJJ7WvtVuXz99svmm3w9rDTP+CXjo7MWX1akaXY
W8cybNAFa57t+YDcEnl17IHLyuVdAse63A4ldSyHqY474lKPk+OverQgfwLH
E8U3D682J3fBqTr2hElRtOF8ocvdkVHHPaA/4EhaHO5yL+jqWIFpddwbQ+f7
ezgmv0/ug7gxYX5ZXVzui8kLK+f5nZSRP8PoOu4H3zEVmv07Xe6PYXU8AAPr
2AtedTwQ57YcTCrMdXkQdtWxNwx1PBiy2+bo0vYuD4G0jofiYSW3D67WMVD9
7I+Vy/c1Ey0A33JLhiFgWOeJuetd7cMwoleEudU7rvbP0ZRb+BybevL24Wj8
7rGIk42bUvtwHHVnlozAdG5hBP58+vjCir/epfaRCGxc6tahK1kYiQbcklF4
1Ii3j0JZWnXDJLs7tY/GYW5hNOZFCSfsA13tvpjKLfji4zrtfng5j7f7AYOe
dZJvaELtY9CSWxgDR+CIYW/NdLV/gSnBK/b7DXK1fwFfbslYjKrTPhbeddrH
oXOd9nGQ7pvojKtwo3Z/fHphjvDHSbLgj/u/MkvG4y63MB7Sb74N8TK62pU4
sooZSnS/p5dMayul9yvRltuuRNU/nwXdOP8O9Z+AM9yYgBPcwgTs57ZPQN8r
/oljBrv6B6A9NwLQiFsIwKyrizb0dtkegEnckokw7T4S6r/gbeo/EencwkRE
ctsn4tDbc/55uuwt6j8Jmq9PP0ybT8YkxHILkzCJ2z4JEXnHz90Nc/WfDOej
NoeSqxtT/8n4hVuYDDu3fTIWcksCcbfd4uhW9139A1HKLQQiuPv8CaO+dvUP
xGhuyRQ8HbJDYQty9Z+CoVt/7TjzTSPqPwUfctunoDW3JAg/V3yUtu4WGUHI
4haCEPtC8lbAJlf/IEzllkzFzL7/ba7+U+HDLUzFJ9z2qWjJLZkGWZ3+09Ch
9nri6j8Nv/Zktk/DuFWK7U32NKT+0zGAG9MR1WNl8b/eZGE6hnPbp0O6MtT+
vLur/ww4VzBjBn7nFmZg+3uO0PPXGlD/Gehb9vLoAIEs+RLOU/9tEur/JY5z
C1/iELf9S3zHLZmJx1Mau5ced/WfibvcwkwsO9agc7HN1X8mFnNLZkHPjVmY
zy3Mwr4H3fVd8lz9Z+H6syO/Vahc/VWYuHBnx7BRZLkK/txQwYtbpcKJR7Ov
t+nt2r8KW7ltKqzqtGhSUtm/B8R6KnRq3GbZ795kpwp/NWKWBCNp1KvF1w6/
ES0PxnBuBMOdWxUMew/3tdfKX4sWgrGO2xaMVdz2YJi5ncG4XHv+X1H9EJzh
lofgJ26EIPtQ//RF8WRVCBK5hRBEcNtCMIvbHoIAbmcIxnJLQjGKWx6K5hlP
BryO/ofqh+JeOrMqFEu4hVDkH/315EcnXlD9UOz1KU2+1YxsD4WV2xmKTG5J
GP5OXeMcuKSa6ofhAjfCUBng3/yb/5FVYXi/9g+yEAYZty0Mbtz2MPzz73/b
c6ofhrvcknDc4paH4wA3wrGfWxWO15/OeXfBEbIQjpfctnCc4bbX7I/bGY7v
ns4tLv3RVX82DNzy2ZjPjdmY2/LVpeUHn1H92QjhFmbDLfpRctF2sm02GnLb
Z+P6AmbnbHyvmhI1qeIp1Z+DJG75HKQk/90yaQ8Zc6DmVs1BxZSHu1sWk4U5
OMVtmwN5Rum1XbueUP05aPmr3i8wieycAym3JAINueURGHYlYPMPex9T/Qi8
w62KwIKGb04LYWQhAmO4bRHw5bZHYKz7Zq1lCtlZz5K58OKWz0Vo7Xjgqj8X
47hVc9GNW5iLD7ltc2k8cdWfC1XLB5Xqjq76c/GL56obLy4/ovqRKOOWR+Io
NyJxiFsViX3cQiQOON/r6t+PbIuE/Lu1n15MfEj1I9GW2xmJ9A9yttmH36f6
8zAh/a/Tnw0iy+fhShoz5uFJ7fXoHtWfh8fcwjzc47bNw+/c9nk0/pCd83CA
WxKF5dzyKGRwIwrb/vwyzHuDq34UxpTYek5r56ofhc+5bVHoxW2PwpVdzM4o
aAdKf3i27zbVn49wbvl87PVixnxYxpYN2f05WTUfg7mF+ZBWfFt2eV4F1Z+P
a7eY7fPx7q4/pr+dc4vqz8fPO5klC/Ajt3wBGi6bZB3z9C+qvwChI5E1poSs
WoD1tyJ2rvnsBtVfgAm1nzeybQHNf8j2BfiU27kAXbkl0ejELY/G+9yIxo8f
v/O1Pes61Y/GKm4hGiO5bdFYGLnbOLcj2R6N0rnMzmj4/THqrGbhn1Rfjf7c
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
Gxdf7Yz/A6AUkVw=
     "]]}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"i\"", TraditionalForm], 
    FormBox[
    "\"\\!\\(\\*SubscriptBox[\\(\[Lambda]\\), \\(i\\)]\\)\"", 
     TraditionalForm]},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotRange->{{0., 1024.}, {-6.058269738745123, 10.931030409731317`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]]
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
    RowBox[{"t_", ",", "U_", ",", "\[Mu]_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"hloc", "=", 
        RowBox[{
         RowBox[{"U", " ", 
          RowBox[{"DiagonalMatrix", "[", 
           RowBox[{"{", 
            RowBox[{"0", ",", "0", ",", "0", ",", "1"}], "}"}], "]"}]}], "-", 
         RowBox[{"\[Mu]", 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"KroneckerProduct", "[", 
             RowBox[{
              SubscriptBox["a", "number"], ",", 
              RowBox[{"IdentityMatrix", "[", "2", "]"}]}], "]"}], "+", 
            RowBox[{"KroneckerProduct", "[", 
             RowBox[{
              RowBox[{"IdentityMatrix", "[", "2", "]"}], ",", 
              SubscriptBox["a", "number"]}], "]"}]}], ")"}]}]}]}], ",", "hI", 
       ",", "Ih"}], "}"}], ",", 
     RowBox[{
      RowBox[{"hI", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{"hloc", ",", 
         RowBox[{"IdentityMatrix", "[", "4", "]"}]}], "]"}]}], ";", 
      RowBox[{"Ih", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         RowBox[{"IdentityMatrix", "[", "4", "]"}], ",", "hloc"}], "]"}]}], 
      ";", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{
         RowBox[{
          RowBox[{"-", "t"}], 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"KroneckerProduct", "[", 
             RowBox[{
              SubscriptBox["a", "create"], ",", 
              SubscriptBox["\[Sigma]", "3"], ",", 
              SubscriptBox["a", "annihil"], ",", 
              RowBox[{"IdentityMatrix", "[", "2", "]"}]}], "]"}], "+", 
            RowBox[{"KroneckerProduct", "[", 
             RowBox[{
              SubscriptBox["a", "annihil"], ",", 
              SubscriptBox["\[Sigma]", "3"], ",", 
              SubscriptBox["a", "create"], ",", 
              RowBox[{"IdentityMatrix", "[", "2", "]"}]}], "]"}], "+", 
            RowBox[{"KroneckerProduct", "[", 
             RowBox[{
              RowBox[{"IdentityMatrix", "[", "2", "]"}], ",", 
              SubscriptBox["a", "create"], ",", 
              SubscriptBox["\[Sigma]", "3"], ",", 
              SubscriptBox["a", "annihil"]}], "]"}], "+", 
            RowBox[{"KroneckerProduct", "[", 
             RowBox[{
              RowBox[{"IdentityMatrix", "[", "2", "]"}], ",", 
              SubscriptBox["a", "annihil"], ",", 
              SubscriptBox["\[Sigma]", "3"], ",", 
              SubscriptBox["a", "create"]}], "]"}]}], ")"}]}], "+", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"j", "\[Equal]", "1"}], ",", 
           RowBox[{"hI", "+", 
            RowBox[{
             FractionBox["1", "2"], "Ih"}]}], ",", 
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{"j", "<", 
              RowBox[{"L", "-", "1"}]}], ",", 
             RowBox[{
              FractionBox["1", "2"], 
              RowBox[{"(", 
               RowBox[{"hI", "+", "Ih"}], ")"}]}], ",", 
             RowBox[{
              RowBox[{
               FractionBox["1", "2"], "hI"}], "+", "Ih"}]}], "]"}]}], "]"}]}],
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
     SubscriptBox["L", "val"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "16", ",", "16"}], "}"}]], "Output"]
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
  RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]], "Output"]
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
         FractionBox["\[Mu]", "2"]}], "0", "0", 
        RowBox[{"-", "t"}]},
       {"0", "0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{"U", "-", 
           RowBox[{"2", " ", "\[Mu]"}]}], ")"}]}], "0"},
       {"0", 
        RowBox[{"-", "t"}], "0", "0", 
        RowBox[{"-", "\[Mu]"}]}
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
         FractionBox["\[Mu]", "2"]}], "0", "0", 
        RowBox[{"-", "t"}]},
       {"0", "0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{"U", "-", 
           RowBox[{"2", " ", "\[Mu]"}]}], ")"}]}], "0"},
       {"0", 
        RowBox[{"-", "t"}], "0", "0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}]}
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
         FractionBox["\[Mu]", "2"]}], "0", "0", 
        RowBox[{"-", "t"}]},
       {"0", "0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{"U", "-", 
           RowBox[{"2", " ", "\[Mu]"}]}], ")"}]}], "0"},
       {"0", 
        RowBox[{"-", "t"}], "0", "0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}]}
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
        RowBox[{"-", "\[Mu]"}], "0", "0", 
        RowBox[{"-", "t"}]},
       {"0", "0", 
        RowBox[{"-", "\[Mu]"}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{"U", "-", 
         RowBox[{"2", " ", "\[Mu]"}]}], "0"},
       {"0", 
        RowBox[{"-", "t"}], "0", "0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}]}
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
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}]}], "}"}], ",", 
    RowBox[{"Norm", "[", 
     RowBox[{"Flatten", "[", 
      RowBox[{"FullSimplify", "[", 
       RowBox[{
        RowBox[{"Sum", "[", 
         RowBox[{
          RowBox[{"KroneckerProduct", "[", 
           RowBox[{
            RowBox[{"SparseIdentityMatrix", "[", 
             SuperscriptBox["4", 
              RowBox[{"j", "-", "1"}]], "]"}], ",", 
            RowBox[{
             RowBox[{"h2", "[", 
              RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "L"}], "]"}], 
             "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], ",", 
            RowBox[{"SparseIdentityMatrix", "[", 
             SuperscriptBox["4", 
              RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{"j", ",", "1", ",", 
            RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], "-", 
        RowBox[{"HHubbard", "[", 
         RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "L"}], "]"}]}], "]"}], 
      "]"}], "]"}]}], "]"}]}]], "Input"],

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
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], "}"}], ",", 
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
              RowBox[{"ConstantArray", "[", 
               RowBox[{"2", ",", "8"}], "]"}]}], "]"}], ",", 
            RowBox[{"Reverse", "[", 
             RowBox[{"Range", "[", "8", "]"}], "]"}]}], "]"}], "]"}], ",", 
         "\"\<Real64\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", 
         RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Matrix product operator representation of Hamiltonian", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"W", "[", 
   RowBox[{"t_", ",", "U_", ",", "\[Mu]_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"I", "=", 
       RowBox[{"IdentityMatrix", "[", "4", "]"}]}], ",", 
      RowBox[{"O", "=", 
       RowBox[{"ConstantArray", "[", 
        RowBox[{"0", ",", 
         RowBox[{"{", 
          RowBox[{"4", ",", "4"}], "}"}]}], "]"}]}], ",", 
      RowBox[{"aup", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         SubscriptBox["a", "annihil"], ",", 
         RowBox[{"IdentityMatrix", "[", "2", "]"}]}], "]"}]}], ",", 
      RowBox[{"adup", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         SubscriptBox["a", "create"], ",", 
         RowBox[{"IdentityMatrix", "[", "2", "]"}]}], "]"}]}], ",", 
      RowBox[{"adn", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         RowBox[{"IdentityMatrix", "[", "2", "]"}], ",", 
         SubscriptBox["a", "annihil"]}], "]"}]}], ",", 
      RowBox[{"addn", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         RowBox[{"IdentityMatrix", "[", "2", "]"}], ",", 
         SubscriptBox["a", "create"]}], "]"}]}], ",", 
      RowBox[{"Fupadn", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         SubscriptBox["\[Sigma]", "3"], ",", 
         SubscriptBox["a", "annihil"]}], "]"}]}], ",", 
      RowBox[{"Fupaddn", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         SubscriptBox["\[Sigma]", "3"], ",", 
         SubscriptBox["a", "create"]}], "]"}]}], ",", 
      RowBox[{"adupFdn", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         SubscriptBox["a", "create"], ",", 
         SubscriptBox["\[Sigma]", "3"]}], "]"}]}], ",", 
      RowBox[{"aupFdn", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         SubscriptBox["a", "annihil"], ",", 
         SubscriptBox["\[Sigma]", "3"]}], "]"}]}], ",", 
      RowBox[{"hloc", "=", 
       RowBox[{
        RowBox[{"U", " ", 
         RowBox[{"DiagonalMatrix", "[", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0", ",", "0", ",", "1"}], "}"}], "]"}]}], "-", 
        RowBox[{"\[Mu]", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"KroneckerProduct", "[", 
            RowBox[{
             SubscriptBox["a", "number"], ",", 
             RowBox[{"IdentityMatrix", "[", "2", "]"}]}], "]"}], "+", 
           RowBox[{"KroneckerProduct", "[", 
            RowBox[{
             RowBox[{"IdentityMatrix", "[", "2", "]"}], ",", 
             SubscriptBox["a", "number"]}], "]"}]}], ")"}]}]}]}]}], "}"}], 
    ",", 
    RowBox[{"SparseArray", "[", 
     RowBox[{"Transpose", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"I", ",", "O", ",", "O", ",", "O", ",", "O", ",", "O"}], 
          "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"aup", ",", "O", ",", "O", ",", "O", ",", "O", ",", "O"}], 
          "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
          "Fupadn", ",", "O", ",", "O", ",", "O", ",", "O", ",", "O"}], "}"}],
          ",", 
         RowBox[{"{", 
          RowBox[{"adup", ",", "O", ",", "O", ",", "O", ",", "O", ",", "O"}], 
          "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
          "Fupaddn", ",", "O", ",", "O", ",", "O", ",", "O", ",", "O"}], 
          "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"hloc", ",", 
           RowBox[{
            RowBox[{"-", "t"}], " ", "adupFdn"}], ",", 
           RowBox[{
            RowBox[{"-", "t"}], " ", "addn"}], ",", 
           RowBox[{
            RowBox[{"-", "t"}], " ", "aupFdn"}], ",", 
           RowBox[{
            RowBox[{"-", "t"}], " ", "adn"}], ",", "I"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"3", ",", "4", ",", "1", ",", "2"}], "}"}]}], "]"}], "]"}]}], 
   "]"}]}]], "Input"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"Wfirst", "[", 
   RowBox[{"t_", ",", "U_", ",", "\[Mu]_"}], "]"}], ":=", 
  RowBox[{
   RowBox[{"W", "[", 
    RowBox[{"t", ",", "U", ",", "\[Mu]"}], "]"}], "\[LeftDoubleBracket]", 
   RowBox[{";;", ",", ";;", ",", 
    RowBox[{
     RowBox[{"-", "1"}], ";;", 
     RowBox[{"-", "1"}]}], ",", ";;"}], 
   "\[RightDoubleBracket]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Wlast", "[", 
   RowBox[{"t_", ",", "U_", ",", "\[Mu]_"}], "]"}], ":=", 
  RowBox[{
   RowBox[{"W", "[", 
    RowBox[{"t", ",", "U", ",", "\[Mu]"}], "]"}], "\[LeftDoubleBracket]", 
   RowBox[{";;", ",", ";;", ",", ";;", ",", 
    RowBox[{"1", ";;", "1"}]}], "\[RightDoubleBracket]"}]}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"W", "[", 
     RowBox[{"t", ",", "U", ",", "\[Mu]"}], "]"}], "//", "MatrixForm"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"1", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "1"}
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
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"1", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", 
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
         {"0", "0", "0", "0", "0", "0"},
         {"1", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", 
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
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"}
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
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"1", "0", "0", "0", "0", "0"},
         {"0", "0", 
          RowBox[{"-", "t"}], "0", "0", "0"}
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
         {"1", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {
          RowBox[{"-", "\[Mu]"}], "0", "0", "0", "0", "1"}
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
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"}
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
         {"0", "0", "0", "0", "0", "0"},
         {"1", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "t", "0", "0"}
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
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"1", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", 
          RowBox[{"-", "t"}], "0", "0", "0", "0"}
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
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"}
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
         {"1", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {
          RowBox[{"-", "\[Mu]"}], "0", "0", "0", "0", "1"}
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
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {
          RowBox[{"-", "1"}], "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", 
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
            Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}]},
     {
      RowBox[{"(", "\[NoBreak]", GridBox[{
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"}
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
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"1", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "t", "0", "0", "0", "0"}
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
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {
          RowBox[{"-", "1"}], "0", "0", "0", "0", "0"},
         {"0", "0", 
          RowBox[{"-", "t"}], "0", "0", "0"}
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
         {"1", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {"0", "0", "0", "0", "0", "0"},
         {
          RowBox[{"U", "-", 
           RowBox[{"2", " ", "\[Mu]"}]}], "0", "0", "0", "0", "1"}
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
    Automatic, {4, 4, 6, 6}, 0, {
     1, {{0, 6, 13, 20, 27}, {{1, 1, 1}, {1, 6, 6}, {2, 3, 1}, {2, 6, 5}, {3, 
       2, 1}, {3, 6, 4}, {1, 5, 1}, {1, 6, 3}, {2, 1, 1}, {2, 6, 1}, {2, 6, 
       6}, {4, 2, 1}, {4, 6, 4}, {1, 4, 1}, {1, 6, 2}, {3, 1, 1}, {3, 6, 1}, {
       3, 6, 6}, {4, 3, 1}, {4, 6, 5}, {2, 4, 1}, {2, 6, 2}, {3, 5, 1}, {3, 6,
        3}, {4, 1, 1}, {4, 6, 1}, {4, 6, 6}}}, {
      1, 1, 1, -$CellContext`t, 1, -$CellContext`t, 1, -$CellContext`t, 
       1, -$CellContext`\[Mu], 1, 1, $CellContext`t, 1, -$CellContext`t, 
       1, -$CellContext`\[Mu], 1, -1, -$CellContext`t, 
       1, $CellContext`t, -1, -$CellContext`t, 1, $CellContext`U - 
       2 $CellContext`\[Mu], 1}}]]]]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "6", ",", "6"}], "}"}]], "Output"]
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
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}]}], "}"}], ",", 
    RowBox[{"Norm", "[", 
     RowBox[{"Flatten", "[", 
      RowBox[{
       RowBox[{"MPOMergeFull", "[", 
        RowBox[{"Append", "[", 
         RowBox[{
          RowBox[{"Prepend", "[", 
           RowBox[{
            RowBox[{"Table", "[", 
             RowBox[{
              RowBox[{"W", "[", 
               RowBox[{"t", ",", "U", ",", "\[Mu]"}], "]"}], ",", 
              RowBox[{"{", 
               RowBox[{"j", ",", "2", ",", 
                RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], ",", 
            RowBox[{"Wfirst", "[", 
             RowBox[{"t", ",", "U", ",", "\[Mu]"}], "]"}]}], "]"}], ",", 
          RowBox[{"Wlast", "[", 
           RowBox[{"t", ",", "U", ",", "\[Mu]"}], "]"}]}], "]"}], "]"}], "-", 
       RowBox[{"HHubbard", "[", 
        RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "L"}], "]"}]}], "]"}], 
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
     RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "qd", ",", 
      RowBox[{"qD", "=", 
       RowBox[{"{", 
        RowBox[{"0", ",", "1", ",", "1", ",", 
         RowBox[{"-", "1"}], ",", 
         RowBox[{"-", "1"}], ",", "0"}], "}"}]}]}], "}"}], ",", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"{", 
       RowBox[{"0", ",", "1", ",", "1", ",", "2"}], "}"}]}], ";", 
     RowBox[{
      RowBox[{"MPOBlockStructureError", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Wfirst", "[", 
           RowBox[{"t", ",", "U", ",", "\[Mu]"}], "]"}], ",", 
          RowBox[{"{", "0", "}"}], ",", "qD"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"qd", ",", "qd"}], "}"}]}], "]"}], "+", 
      RowBox[{"MPOBlockStructureError", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"W", "[", 
           RowBox[{"t", ",", "U", ",", "\[Mu]"}], "]"}], ",", "qD", ",", 
          "qD"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"qd", ",", "qd"}], "}"}]}], "]"}], "+", 
      RowBox[{"MPOBlockStructureError", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Wlast", "[", 
           RowBox[{"t", ",", "U", ",", "\[Mu]"}], "]"}], ",", "qD", ",", 
          RowBox[{"{", "0", "}"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"qd", ",", "qd"}], "}"}]}], "]"}]}]}]}], "]"}]}]], "Input"],

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
             RowBox[{"ArrayReshape", "[", 
              RowBox[{
               RowBox[{"If", "[", 
                RowBox[{
                 RowBox[{"j", "\[Equal]", "1"}], ",", 
                 RowBox[{"Wfirst", "[", 
                  RowBox[{"t", ",", "U", ",", "\[Mu]"}], "]"}], ",", 
                 RowBox[{"If", "[", 
                  RowBox[{
                   RowBox[{"j", "<", "L"}], ",", 
                   RowBox[{"W", "[", 
                    RowBox[{"t", ",", "U", ",", "\[Mu]"}], "]"}], ",", 
                   RowBox[{"Wlast", "[", 
                    RowBox[{"t", ",", "U", ",", "\[Mu]"}], "]"}]}], "]"}]}], 
                "]"}], ",", 
               RowBox[{"{", 
                RowBox[{"2", ",", "2", ",", "2", ",", "2", ",", 
                 RowBox[{"If", "[", 
                  RowBox[{
                   RowBox[{"j", "\[Equal]", "1"}], ",", "1", ",", "6"}], 
                  "]"}], ",", 
                 RowBox[{"If", "[", 
                  RowBox[{
                   RowBox[{"j", "\[Equal]", "L"}], ",", "1", ",", "6"}], 
                  "]"}]}], "}"}]}], "]"}], ",", 
             RowBox[{"Reverse", "[", 
              RowBox[{"Range", "[", "6", "]"}], "]"}]}], "]"}], "]"}], "+", 
          RowBox[{"0.", "\[ImaginaryI]"}]}], ",", "\"\<Complex128\>\""}], 
        "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1914, 964},
WindowMargins->{{51, Automatic}, {22, Automatic}},
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
Cell[1486, 35, 48, 0, 63, "Section"],
Cell[1537, 37, 123, 3, 31, "Input"],
Cell[1663, 42, 68, 1, 31, "Input"],
Cell[1734, 45, 174, 5, 31, "Input"],
Cell[CellGroupData[{
Cell[1933, 54, 41, 0, 43, "Subsection"],
Cell[1977, 56, 380, 11, 31, "Input"],
Cell[2360, 69, 1143, 39, 112, "Input"],
Cell[CellGroupData[{
Cell[3528, 112, 398, 13, 75, "Input"],
Cell[3929, 127, 171, 6, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4137, 138, 390, 12, 75, "Input"],
Cell[4530, 152, 171, 6, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4738, 163, 272, 8, 52, "Input"],
Cell[5013, 173, 171, 6, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5221, 184, 184, 5, 31, "Input"],
Cell[5408, 191, 659, 19, 87, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6104, 215, 201, 6, 31, "Input"],
Cell[6308, 223, 659, 19, 88, "Output"]
}, Open  ]],
Cell[6982, 245, 297, 9, 31, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7316, 259, 105, 2, 43, "Subsection"],
Cell[7424, 263, 1360, 37, 55, "Input"],
Cell[8787, 302, 766, 21, 55, "Input"],
Cell[9556, 325, 703, 20, 55, "Input"],
Cell[10262, 347, 581, 16, 52, "Input"],
Cell[10846, 365, 233, 7, 52, "Input"],
Cell[11082, 374, 270, 8, 52, "Input"],
Cell[11355, 384, 241, 8, 52, "Input"],
Cell[11599, 394, 239, 7, 52, "Input"],
Cell[CellGroupData[{
Cell[11863, 405, 264, 8, 31, "Input"],
Cell[12130, 415, 9175, 189, 76, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[21342, 609, 339, 9, 52, "Input"],
Cell[21684, 620, 28, 0, 31, "Output"]
}, Open  ]],
Cell[21727, 623, 277, 9, 31, "Input"],
Cell[CellGroupData[{
Cell[22029, 636, 276, 8, 31, "Input"],
Cell[22308, 646, 10317, 182, 245, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[32674, 834, 64, 0, 43, "Subsection"],
Cell[32741, 836, 3551, 93, 173, "Input"],
Cell[CellGroupData[{
Cell[36317, 933, 264, 7, 52, "Input"],
Cell[36584, 942, 85, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[36706, 949, 313, 10, 52, "Input"],
Cell[37022, 961, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[37152, 968, 370, 10, 52, "Input"],
Cell[37525, 980, 4290, 128, 138, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[41852, 1113, 1360, 35, 55, "Input"],
Cell[43215, 1150, 28, 0, 31, "Output"]
}, Open  ]],
Cell[43258, 1153, 1722, 45, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[45017, 1203, 75, 0, 43, "Subsection"],
Cell[45095, 1205, 3931, 107, 92, "Input"],
Cell[49029, 1314, 712, 19, 52, "Input"],
Cell[CellGroupData[{
Cell[49766, 1337, 295, 8, 72, "Input"],
Cell[50064, 1347, 13782, 331, 398, "Output"],
Cell[63849, 1680, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[63979, 1687, 1242, 33, 52, "Input"],
Cell[65224, 1722, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[65289, 1727, 1757, 49, 72, "Input"],
Cell[67049, 1778, 28, 0, 31, "Output"]
}, Open  ]],
Cell[67092, 1781, 2696, 70, 92, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 4vDwkhn5tYhVrCKGMbmX7vZW *)
