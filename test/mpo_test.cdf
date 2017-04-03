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
NotebookDataLength[    121126,       3821]
NotebookOptionsPosition[    111445,       3480]
NotebookOutlinePosition[    111788,       3495]
CellTagsIndexPosition[    111745,       3492]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Matrix Product Operators (MPO)", "Section"],

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
    RowBox[{
     SubscriptBox["qd", "0"], "=", 
     RowBox[{"{", 
      RowBox[{"1", ",", "0", ",", 
       RowBox[{"-", "2"}], ",", "1"}], "}"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["qd", "1"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "1"}], ",", "0", ",", "2", ",", "0", ",", "1"}], "}"}]}], 
    ";"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "save", " ", "physical", " ", "quantum", " ", "numbers", " ", "to", " ", 
    "disk"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"Export", "[", 
      RowBox[{
       RowBox[{
        SubscriptBox["fn", "base"], "<>", "\"\<_qd\>\"", "<>", 
        RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}], ",", 
       SubscriptBox["qd", "i"], ",", "\"\<Integer32\>\""}], "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"i", ",", "0", ",", "1"}], "}"}]}], "]"}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell["Matrix representation on full Hilbert space", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "fictitious", " ", "virtual", " ", "bond", " ", "quantum", " ", 
    "numbers"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"SeedRandom", "[", "41", "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    SubscriptBox["qA", 
     RowBox[{"1", ",", "list"}]], "=", 
    RowBox[{"Block", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"L", "=", 
         SubscriptBox["L", "val"]}], ",", 
        RowBox[{"D", "=", 
         RowBox[{"{", 
          RowBox[{"1", ",", "5", ",", "9", ",", "7", ",", "4", ",", "1"}], 
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
   RowBox[{
    SubscriptBox["qA", 
     RowBox[{"2", ",", "list"}]], "=", 
    RowBox[{"Block", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"L", "=", 
         SubscriptBox["L", "val"]}], ",", 
        RowBox[{"D", "=", 
         RowBox[{"{", 
          RowBox[{"1", ",", "10", ",", "6", ",", "8", ",", "7", ",", "1"}], 
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
         "]"}], "&"}], "/@", "D"}]}], "]"}]}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "3"}], ",", "3", ",", 
     RowBox[{"-", "3"}], ",", "2", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "3", ",", 
     RowBox[{"-", "3"}], ",", "0", ",", "2", ",", "3", ",", "1", ",", "0", 
     ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "2"}], ",", 
     RowBox[{"-", "2"}], ",", "1", ",", 
     RowBox[{"-", "3"}], ",", 
     RowBox[{"-", "2"}], ",", 
     RowBox[{"-", "3"}], ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", 
     RowBox[{"-", "2"}], ",", "1", ",", "3"}], "}"}], ",", 
   RowBox[{"{", "0", "}"}]}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "2", ",", 
     RowBox[{"-", "1"}], ",", "2", ",", "1", ",", "0", ",", 
     RowBox[{"-", "2"}], ",", 
     RowBox[{"-", "3"}], ",", "3"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "1", ",", "3", ",", "3", ",", 
     RowBox[{"-", "2"}], ",", 
     RowBox[{"-", "3"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "1", ",", "2", ",", 
     RowBox[{"-", "1"}], ",", 
     RowBox[{"-", "3"}], ",", "3", ",", 
     RowBox[{"-", "2"}], ",", 
     RowBox[{"-", "2"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", 
     RowBox[{"-", "2"}], ",", 
     RowBox[{"-", "3"}], ",", 
     RowBox[{"-", "3"}], ",", 
     RowBox[{"-", "3"}], ",", "1", ",", "0"}], "}"}], ",", 
   RowBox[{"{", "0", "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "42", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Table", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["A", 
      RowBox[{"i", ",", "list"}]], "=", 
     RowBox[{"Block", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"L", "=", 
          SubscriptBox["L", "val"]}], ",", "qd0", ",", "qd1", ",", 
         RowBox[{"qA", "=", 
          SubscriptBox["qA", 
           RowBox[{"i", ",", "list"}]]}], ",", 
         RowBox[{"zmax", "=", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "2"}]}], ",", 
         "qD"}], "}"}], ",", 
       RowBox[{
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"i", "\[Equal]", "1"}], ",", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"qd0", ",", "qd1"}], "}"}], "=", 
           RowBox[{"{", 
            RowBox[{
             SubscriptBox["qd", "0"], ",", 
             SubscriptBox["qd", "1"]}], "}"}]}], ",", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"qd0", ",", "qd1"}], "}"}], "=", 
           RowBox[{"{", 
            RowBox[{
             SubscriptBox["qd", "1"], ",", 
             SubscriptBox["qd", "0"]}], "}"}]}]}], "]"}], ";", 
        RowBox[{"Table", "[", 
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
               "0"}], "]"}], "&"}], ",", "qd0", ",", "qd1", ",", 
            RowBox[{
            "qA", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], ",", 
            RowBox[{"qA", "\[LeftDoubleBracket]", 
             RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}]}], "]"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"i", ",", "2"}], "}"}]}], "]"}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["A", 
   RowBox[{"1", ",", "list"}]], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "4", ",", "5"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["A", 
   RowBox[{"2", ",", "list"}]], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "5", ",", "4"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", 
    RowBox[{"1", ",", "list"}]], "\[LeftDoubleBracket]", "1", 
   "\[RightDoubleBracket]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", 
    RowBox[{"1", ",", "list"}]], "\[LeftDoubleBracket]", "2", 
   "\[RightDoubleBracket]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", 
    RowBox[{"1", ",", "list"}]], "\[LeftDoubleBracket]", "3", 
   "\[RightDoubleBracket]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", 
    RowBox[{"1", ",", "list"}]], "\[LeftDoubleBracket]", 
   RowBox[{"-", "1"}], "\[RightDoubleBracket]"}], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "5", ",", "1", ",", "5"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "5", ",", "5", ",", "9"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "5", ",", "9", ",", "7"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "5", ",", "4", ",", "1"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  SubscriptBox["A", 
   RowBox[{"1", ",", "merged"}]], "=", 
  RowBox[{"SparseArray", "[", 
   RowBox[{"MPOMergeFull", "[", 
    SubscriptBox["A", 
     RowBox[{"1", ",", "list"}]], "]"}], "]"}]}]], "Input"],

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
                   TagBox["9412", "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Dimensions: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox[
                    RowBox[{"{", 
                    RowBox[{"1024", ",", "3125"}], "}"}], "SummaryItem"]}]}}, 
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
                   TagBox["9412", "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Dimensions: \"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox[
                    RowBox[{"{", 
                    RowBox[{"1024", ",", "3125"}], "}"}], "SummaryItem"]}]}, {
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
                   TagBox["0.00294125`", "SummaryItem"]}]}, {
                 RowBox[{
                   TagBox["\"Elements:\"", "SummaryItemAnnotation"], 
                   "\[InvisibleSpace]", 
                   TagBox["\"\"", "SummaryItem"]}]}, {
                 TagBox[
                  TagBox[
                   GridBox[{{
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "188"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{
                    RowBox[{"0.0033738693996983563`", "\[VeryThinSpace]"}], 
                    "+", 
                    RowBox[{"0.00403174818599427`", " ", "\[ImaginaryI]"}]}], 
                    ContentPadding -> False, FrameMargins -> 0, StripOnInput -> 
                    True, BaselinePosition -> Baseline, 
                    ImageSize -> {{1, 300}, Automatic}], LineBreakWithin -> 
                    False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "288"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{
                    RowBox[{"-", "0.006868080793758859`"}], "+", 
                    RowBox[{"0.00048653246069201256`", " ", 
                    "\[ImaginaryI]"}]}], ContentPadding -> False, 
                    FrameMargins -> 0, StripOnInput -> True, BaselinePosition -> 
                    Baseline, ImageSize -> {{1, 300}, Automatic}], 
                    LineBreakWithin -> False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "338"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{
                    RowBox[{"0.0021147829359333963`", "\[VeryThinSpace]"}], 
                    "-", 
                    
                    RowBox[{"0.0001233791348320842`", " ", 
                    "\[ImaginaryI]"}]}], ContentPadding -> False, 
                    FrameMargins -> 0, StripOnInput -> True, BaselinePosition -> 
                    Baseline, ImageSize -> {{1, 300}, Automatic}], 
                    LineBreakWithin -> False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"1", ",", "373"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{
                    RowBox[{"-", "0.001004434793059162`"}], "-", 
                    
                    RowBox[{"0.0014074202102394764`", " ", 
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
   InterpretationFunction->("SparseArray[<9412>, {1024, 3125}]"& )],
  False,
  Editable->False,
  SelectWithContents->True,
  Selectable->False]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["A", 
     RowBox[{"1", ",", "merged"}]], "\[LeftDoubleBracket]", 
    RowBox[{
     RowBox[{"105", ";;", "110"}], ",", 
     RowBox[{"1", ";;", "7"}]}], "\[RightDoubleBracket]"}], "//", 
   "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.006385879312897575`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.004140481525222113`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
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
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.004297228824353835`"}], "+", 
       RowBox[{"0.0000727155826799285`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.006430513225905554`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.00485698410845506`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
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
      RowBox[{
       RowBox[{"-", "0.004935989938934292`"}], "+", 
       RowBox[{"0.005575826744951517`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
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
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
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
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
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
   MatrixForm[
   SparseArray[
    Automatic, {6, 7}, Complex[0., 0.], {
     1, {{0, 1, 2, 3, 4, 4, 4}, {{3}, {5}, {1}, {3}}}, {Complex[
      0.006385879312897575, 0.004140481525222113], 
      Complex[-0.004297228824353835, 0.0000727155826799285], Complex[
      0.006430513225905554, 0.00485698410845506], 
      Complex[-0.004935989938934292, 0.005575826744951517]}}]]]]], "Output"]
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
           RowBox[{"i", "-", "1"}], "]"}], "<>", "\"\<_\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{"ColumnMajorLayout", "[", 
          RowBox[{
           SubscriptBox["A", 
            RowBox[{"i", ",", "list"}]], "\[LeftDoubleBracket]", "j", 
           "\[RightDoubleBracket]"}], "]"}], ",", "\"\<Complex128\>\""}], 
        "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"i", ",", "2"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"],

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
        SubscriptBox["L", "val"]}], ",", "ar"}], "}"}], ",", 
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
               RowBox[{"1", ",", "merged"}]], "]"}], ",", 
             RowBox[{"Join", "[", 
              RowBox[{
               RowBox[{"ConstantArray", "[", 
                RowBox[{
                 RowBox[{"Length", "[", 
                  SubscriptBox["qd", "0"], "]"}], ",", "L"}], "]"}], ",", 
               RowBox[{"ConstantArray", "[", 
                RowBox[{
                 RowBox[{"Length", "[", 
                  SubscriptBox["qd", "1"], "]"}], ",", "L"}], "]"}]}], 
              "]"}]}], "]"}], "]"}], "]"}], "]"}], "]"}]}], ";", 
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", "\"\<_A_merged_val.dat\>\""}], ",", 
        RowBox[{"Last", "/@", "ar"}], ",", "\"\<Complex128\>\""}], "]"}], ";", 
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", "\"\<_A_merged_ind.dat\>\""}], ",", 
        RowBox[{
         RowBox[{"Flatten", "[", 
          RowBox[{"First", "/@", "ar"}], "]"}], "-", "1"}], ",", 
        "\"\<Integer64\>\""}], "]"}]}]}], "]"}], ";"}]}]], "Input"],

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
           RowBox[{"i", "-", "1"}], "]"}], "<>", "\"\<_\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{
          SubscriptBox["qA", 
           RowBox[{"i", ",", "list"}]], "\[LeftDoubleBracket]", "j", 
          "\[RightDoubleBracket]"}], ",", "\"\<Integer32\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", 
         RowBox[{"L", "+", "1"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"i", ",", "2"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["MPO trace", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "fictitious", " ", "virtual", " ", "bond", " ", "quantum", " ", 
    "numbers"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"SeedRandom", "[", "43", "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    SubscriptBox["qB", "list"], "=", 
    RowBox[{"Block", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"L", "=", 
         SubscriptBox["L", "val"]}], ",", 
        RowBox[{"D", "=", 
         RowBox[{"{", 
          RowBox[{"1", ",", "5", ",", "6", ",", "7", ",", "8", ",", "1"}], 
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
              RowBox[{"-", "1"}], ",", "1"}], "}"}], ",", "#"}], "]"}]}], 
         "]"}], "&"}], "/@", "D"}]}], "]"}]}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "1"}], ",", 
     RowBox[{"-", "1"}], ",", "0", ",", "1", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "1"}], ",", "1", ",", "1", ",", 
     RowBox[{"-", "1"}], ",", 
     RowBox[{"-", "1"}], ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", 
     RowBox[{"-", "1"}], ",", "1", ",", "1", ",", 
     RowBox[{"-", "1"}], ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "1"}], ",", "1", ",", "0", ",", 
     RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "1", ",", "1"}], "}"}], ",", 
   RowBox[{"{", "0", "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "41", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["B", "list"], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"qd", "=", 
        SubscriptBox["qd", "0"]}], ",", 
       RowBox[{"qB", "=", 
        SubscriptBox["qB", "list"]}], ",", 
       RowBox[{"zmax", "=", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "2"}]}]}], "}"}], 
     ",", 
     RowBox[{"Table", "[", 
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
               RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], "]"}], ",", "0"}],
            "]"}], "&"}], ",", "qd", ",", "qd", ",", 
         RowBox[{"qB", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}],
          ",", 
         RowBox[{"qB", "\[LeftDoubleBracket]", 
          RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "4", ",", "4"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["B", "list"], "\[LeftDoubleBracket]", 
    RowBox[{"3", ",", "1", ",", "4", ",", 
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
     {"0", "0", "0"},
     {"0", "0", 
      RowBox[{
       RowBox[{"-", "0.3770632469342694`"}], "+", 
       RowBox[{"0.16748680075901978`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.12876525863807542`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.06641813663106055`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.3085902177659725`"}], "-", 
       RowBox[{"0.13321583503528278`", " ", "\[ImaginaryI]"}]}], "0"}
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
  RowBox[{"(*", " ", "trace", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Tr", "[", 
   RowBox[{"MPOMergeFull", "[", 
    SubscriptBox["B", "list"], "]"}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"-", "0.06181116171457786`"}], "+", 
  RowBox[{"0.41652782215072304`", " ", "\[ImaginaryI]"}]}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"save", " ", "'"}], 
    RowBox[{"B", "'"}], " ", "tensors", " ", "to", " ", "disk"}], " ", "*)"}],
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
          SubscriptBox["fn", "base"], "<>", "\"\<_B\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{"ColumnMajorLayout", "[", 
          RowBox[{
           SubscriptBox["B", "list"], "\[LeftDoubleBracket]", "j", 
           "\[RightDoubleBracket]"}], "]"}], ",", "\"\<Complex128\>\""}], 
        "]"}], ",", 
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
          SubscriptBox["fn", "base"], "<>", "\"\<_qB\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{
          SubscriptBox["qB", "list"], "\[LeftDoubleBracket]", "j", 
          "\[RightDoubleBracket]"}], ",", "\"\<Integer32\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", 
         RowBox[{"L", "+", "1"}]}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["MPO trace product", "Subsection"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "43", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["R", "0"], "=", 
   RowBox[{"RandomComplex", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", 
        RowBox[{"(", 
         RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], ",", 
       RowBox[{"(", 
        RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"8", ",", "7"}], "}"}]}], "]"}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["R", "1"], "=", 
   RowBox[{"MPOTraceProductTensorReduce", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["A", 
       RowBox[{"1", ",", "list"}]], "\[LeftDoubleBracket]", "3", 
      "\[RightDoubleBracket]"}], ",", 
     RowBox[{
      SubscriptBox["A", 
       RowBox[{"2", ",", "list"}]], "\[LeftDoubleBracket]", "3", 
      "\[RightDoubleBracket]"}], ",", 
     SubscriptBox["R", "0"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"6", ",", "9"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"save", " ", "'"}], 
    RowBox[{"R", "'"}], " ", "tensors", " ", "to", " ", "disk"}], " ", "*)"}],
   "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"Export", "[", 
      RowBox[{
       RowBox[{
        SubscriptBox["fn", "base"], "<>", "\"\<_R\>\"", "<>", 
        RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}], ",", 
       RowBox[{"ColumnMajorLayout", "[", 
        SubscriptBox["R", "i"], "]"}], ",", "\"\<Complex128\>\""}], "]"}], 
     ",", 
     RowBox[{"{", 
      RowBox[{"i", ",", "0", ",", "1"}], "}"}]}], "]"}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"trace", " ", "product"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"MPOTraceProduct", "[", 
    RowBox[{
     SubscriptBox["A", 
      RowBox[{"1", ",", "list"}]], ",", 
     SubscriptBox["A", 
      RowBox[{"2", ",", "list"}]]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"(*", " ", 
    RowBox[{"check", " ", 
     RowBox[{"(", 
      RowBox[{"relative", " ", "error"}], ")"}]}], " ", "*)"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Abs", "[", 
     RowBox[{"%", "-", 
      RowBox[{"Tr", "[", 
       RowBox[{
        RowBox[{"MPOMergeFull", "[", 
         SubscriptBox["A", 
          RowBox[{"2", ",", "list"}]], "]"}], ".", 
        RowBox[{"MPOMergeFull", "[", 
         SubscriptBox["A", 
          RowBox[{"1", ",", "list"}]], "]"}]}], "]"}]}], "]"}], "/", 
    RowBox[{"Abs", "[", "%", "]"}]}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"0.0034089965364192724`", "\[VeryThinSpace]", "+", 
  RowBox[{"0.0010843561394613549`", " ", "\[ImaginaryI]"}]}]], "Output"],

Cell[BoxData["7.762590116883725`*^-16"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"Frobenius", " ", "norm"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"MPOFrobeniusNorm", "[", 
    SubscriptBox["A", 
     RowBox[{"1", ",", "list"}]], "]"}], "\[IndentingNewLine]", 
   RowBox[{"(*", " ", "check", " ", "*)"}], "\[IndentingNewLine]", 
   RowBox[{"Abs", "[", 
    RowBox[{"%", "-", 
     RowBox[{"Norm", "[", 
      RowBox[{
       RowBox[{"MPOMergeFull", "[", 
        SubscriptBox["A", 
         RowBox[{"1", ",", "list"}]], "]"}], ",", "\"\<Frobenius\>\""}], 
      "]"}]}], "]"}]}]}]], "Input"],

Cell[BoxData["1.3400324621941806`"], "Output"],

Cell[BoxData["1.7763568394002505`*^-15"], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["MPO trace quad-product", "Subsection"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "84", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"d", "=", 
       RowBox[{"{", 
        RowBox[{"3", ",", "6", ",", "4", ",", "2", ",", "3"}], "}"}]}], ",", 
      RowBox[{"D", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"1", ",", "5", ",", "6", ",", "4", ",", "7", ",", "1"}], 
          "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"1", ",", "6", ",", "2", ",", "7", ",", "5", ",", "1"}], 
          "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"1", ",", "5", ",", "6", ",", "7", ",", "3", ",", "1"}], 
          "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"1", ",", "5", ",", "7", ",", "1", ",", "3", ",", "1"}], 
          "}"}]}], "}"}]}], ",", 
      RowBox[{"zmax", "=", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "3"}]}]}], "}"}], 
    ",", 
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["F", 
        RowBox[{"i", ",", "list"}]], "=", 
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
             "d", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], ",", 
             RowBox[{"d", "\[LeftDoubleBracket]", 
              RowBox[{"i", "+", "1"}], "\[RightDoubleBracket]"}], ",", 
             RowBox[{"D", "\[LeftDoubleBracket]", 
              RowBox[{"i", ",", "j"}], "\[RightDoubleBracket]"}], ",", 
             RowBox[{"D", "\[LeftDoubleBracket]", 
              RowBox[{"i", ",", 
               RowBox[{"j", "+", "1"}]}], "\[RightDoubleBracket]"}]}], 
            "}"}]}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", "4"}], "}"}]}], "]"}]}], "]"}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["F", 
   RowBox[{"1", ",", "list"}]], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "3", ",", "6"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["F", 
   RowBox[{"2", ",", "list"}]], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "6", ",", "4"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["F", 
    RowBox[{"1", ",", "list"}]], "\[LeftDoubleBracket]", "1", 
   "\[RightDoubleBracket]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["F", 
    RowBox[{"1", ",", "list"}]], "\[LeftDoubleBracket]", "2", 
   "\[RightDoubleBracket]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["F", 
    RowBox[{"1", ",", "list"}]], "\[LeftDoubleBracket]", 
   RowBox[{"-", "1"}], "\[RightDoubleBracket]"}], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "6", ",", "1", ",", "5"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "6", ",", "5", ",", "6"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "6", ",", "7", ",", "1"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["F", 
    RowBox[{"1", ",", "list"}]], "\[LeftDoubleBracket]", 
   RowBox[{"1", ",", "2", ",", "3"}], "\[RightDoubleBracket]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{
     RowBox[{"-", "0.15075169402203537`"}], "+", 
     RowBox[{"0.08898378355714232`", " ", "\[ImaginaryI]"}]}], ",", 
    RowBox[{"0.10449352631296382`", "\[VeryThinSpace]", "+", 
     RowBox[{"0.11392244757896641`", " ", "\[ImaginaryI]"}]}], ",", 
    RowBox[{"0.29891894846708067`", "\[VeryThinSpace]", "+", 
     RowBox[{"0.16776608279138405`", " ", "\[ImaginaryI]"}]}], ",", 
    RowBox[{"0.274771352088919`", "\[VeryThinSpace]", "-", 
     RowBox[{"0.08763630809476586`", " ", "\[ImaginaryI]"}]}], ",", 
    RowBox[{"0.2617657610622619`", "\[VeryThinSpace]", "+", 
     RowBox[{"0.2846220154061423`", " ", "\[ImaginaryI]"}]}]}], "}"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Tr", "[", 
  RowBox[{
   RowBox[{"MPOMergeFull", "[", 
    SubscriptBox["F", 
     RowBox[{"1", ",", "list"}]], "]"}], ".", 
   RowBox[{"MPOMergeFull", "[", 
    SubscriptBox["F", 
     RowBox[{"2", ",", "list"}]], "]"}], ".", 
   RowBox[{"MPOMergeFull", "[", 
    SubscriptBox["F", 
     RowBox[{"3", ",", "list"}]], "]"}], ".", 
   RowBox[{"MPOMergeFull", "[", 
    SubscriptBox["F", 
     RowBox[{"4", ",", "list"}]], "]"}]}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"-", "0.18256141240166204`"}], "-", 
  RowBox[{"0.03934545059094635`", " ", "\[ImaginaryI]"}]}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"save", " ", "'"}], 
    RowBox[{"F", "'"}], " ", "tensors", " ", "to", " ", "disk"}], " ", "*)"}],
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
          SubscriptBox["fn", "base"], "<>", "\"\<_F\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"i", "-", "1"}], "]"}], "<>", "\"\<_\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{"ColumnMajorLayout", "[", 
          RowBox[{
           SubscriptBox["F", 
            RowBox[{"i", ",", "list"}]], "\[LeftDoubleBracket]", "j", 
           "\[RightDoubleBracket]"}], "]"}], ",", "\"\<Complex128\>\""}], 
        "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"i", ",", "4"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Split a MPO tensor", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"combine", " ", "physical", " ", "quantum", " ", "numbers"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["qd", 
     RowBox[{"0", ",", "1"}]], "=", 
    RowBox[{"Flatten", "[", 
     RowBox[{"Outer", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"#1", "+", "#2"}], "&"}], ",", 
       SubscriptBox["qd", "0"], ",", 
       SubscriptBox["qd", "1"]}], "]"}], "]"}]}], "\[IndentingNewLine]", 
   RowBox[{"Length", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "1", ",", "3", ",", "1", ",", "2", ",", 
   RowBox[{"-", "1"}], ",", "0", ",", "2", ",", "0", ",", "1", ",", 
   RowBox[{"-", "3"}], ",", 
   RowBox[{"-", "2"}], ",", "0", ",", 
   RowBox[{"-", "2"}], ",", 
   RowBox[{"-", "1"}], ",", "0", ",", "1", ",", "3", ",", "1", ",", "2"}], 
  "}"}]], "Output"],

Cell[BoxData["20"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "fictitious", " ", "virtual", " ", "bond", " ", "quantum", " ", 
    "numbers"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["qG", "0"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "5"}], ",", 
       RowBox[{"-", "5"}], ",", 
       RowBox[{"-", "7"}], ",", "4", ",", "0", ",", "3", ",", "1", ",", 
       RowBox[{"-", "5"}], ",", 
       RowBox[{"-", "2"}], ",", "6", ",", "0", ",", 
       RowBox[{"-", "2"}], ",", "6"}], "}"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["qG", "2"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "7"}], ",", "4", ",", 
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "2"}], ",", "0", ",", "3", ",", "2", ",", "1", ",", 
       RowBox[{"-", "2"}], ",", "6", ",", "2"}], "}"}]}], ";"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "43", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["G", "pair"], "=", 
   RowBox[{"Outer", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"#1", "-", "#2", "+", "#3", "-", "#4"}], "\[Equal]", "0"}], 
        ",", 
        RowBox[{"RandomComplex", "[", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"-", 
            RowBox[{"(", 
             RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], ",", 
           RowBox[{"(", 
            RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], "}"}], "]"}], ",", 
        "0"}], "]"}], "&"}], ",", 
     SubscriptBox["qd", 
      RowBox[{"0", ",", "1"}]], ",", 
     SubscriptBox["qd", 
      RowBox[{"0", ",", "1"}]], ",", 
     SubscriptBox["qG", "0"], ",", 
     SubscriptBox["qG", "2"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"20", ",", "20", ",", "13", ",", "11"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{
     RowBox[{"entries", " ", "are", " ", "non"}], "-", 
     RowBox[{
     "zero", " ", "only", " ", "for", " ", "matching", " ", "quantum", " ", 
      "numbers"}]}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"MPOBlockStructureError", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      SubscriptBox["G", "pair"], ",", 
      SubscriptBox["qG", "0"], ",", 
      SubscriptBox["qG", "2"]}], "}"}], ",", 
    RowBox[{"{", 
     RowBox[{
      SubscriptBox["qd", 
       RowBox[{"0", ",", "1"}]], ",", 
      SubscriptBox["qd", 
       RowBox[{"0", ",", "1"}]]}], "}"}]}], "]"}]}]], "Input"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "save", " ", "tensor", " ", "as", " ", "reference", " ", "to", " ", 
    "disk"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "base"], "<>", "\"\<_G2.dat\>\""}], ",", 
     RowBox[{"ColumnMajorLayout", "[", 
      RowBox[{"ArrayReshape", "[", 
       RowBox[{
        SubscriptBox["G", "pair"], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Length", "[", 
           SubscriptBox["qd", "0"], "]"}], ",", 
          RowBox[{"Length", "[", 
           SubscriptBox["qd", "1"], "]"}], ",", 
          RowBox[{"Length", "[", 
           SubscriptBox["qd", "0"], "]"}], ",", 
          RowBox[{"Length", "[", 
           SubscriptBox["qd", "1"], "]"}], ",", 
          RowBox[{"Length", "[", 
           SubscriptBox["qG", "0"], "]"}], ",", 
          RowBox[{"Length", "[", 
           SubscriptBox["qG", "2"], "]"}]}], "}"}]}], "]"}], "]"}], ",", 
     "\"\<Complex128\>\""}], "]"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "quantum", " ", "numbers", " ", "to", " ", "disk"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"Export", "[", 
      RowBox[{
       RowBox[{
        SubscriptBox["fn", "base"], "<>", "\"\<_qG\>\"", "<>", 
        RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}], ",", 
       SubscriptBox["qG", "i"], ",", "\"\<Integer32\>\""}], "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"i", ",", 
       RowBox[{"{", 
        RowBox[{"0", ",", "2"}], "}"}]}], "}"}]}], "]"}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell["Without truncation", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["G", "0"], ",", 
       SubscriptBox["qG", "0"], ",", 
       SubscriptBox["qG", "1"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["G", "1"], ",", 
       SubscriptBox["qG", 
        RowBox[{"1", ",", "alt"}]], ",", 
       SubscriptBox["qG", "2"]}], "}"}], ",", 
     SubscriptBox["\[Sigma]", 
      RowBox[{"G", ",", "val"}]]}], "}"}], "=", 
   RowBox[{"MPOSplitTensor", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["G", "pair"], ",", 
       SubscriptBox["qG", "0"], ",", 
       SubscriptBox["qG", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["qd", "0"], ",", 
       SubscriptBox["qd", "1"]}], "}"}], ",", "0"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["G", "0"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["G", "1"], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "13", ",", "175"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "5", ",", "175", ",", "11"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"consistency", " ", "check"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    SubscriptBox["qG", "1"], "-", 
    SubscriptBox["qG", 
     RowBox[{"1", ",", "alt"}]]}], "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["\[Sigma]", 
    RowBox[{"G", ",", "val"}]], "\[LeftDoubleBracket]", 
   RowBox[{"{", 
    RowBox[{"1", ",", "2", ",", "3", ",", 
     RowBox[{"-", "1"}]}], "}"}], "\[RightDoubleBracket]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "1.0161942167676605`", ",", "1.1210294261494165`", ",", 
   "3.203847696309703`", ",", "1.7316272958499028`"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"norm", " ", "of", " ", "singular", " ", "values"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   SubscriptBox["\[Sigma]", 
    RowBox[{"G", ",", "val"}]], "]"}]}]], "Input"],

Cell[BoxData["48.77942245012797`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "von", " ", "Neumann", " ", "entropy", " ", "of", " ", "singular", " ", 
    "values"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"NeumannEntropy", "[", 
   SubscriptBox["\[Sigma]", 
    RowBox[{"G", ",", "val"}]], "]"}]}]], "Input"],

Cell[BoxData["4.770317493788066`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{
    "split", " ", "tensors", " ", "describe", " ", "the", " ", "same", " ", 
     "state"}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"Flatten", "[", 
     RowBox[{
      SubscriptBox["G", "pair"], "-", 
      RowBox[{"MPOMergeTensors", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["G", "0"], ".", 
         RowBox[{"DiagonalMatrix", "[", 
          SubscriptBox["\[Sigma]", 
           RowBox[{"G", ",", "val"}]], "]"}]}], ",", 
        SubscriptBox["G", "1"]}], "]"}]}], "]"}], ",", "\[Infinity]"}], 
   "]"}]}]], "Input"],

Cell[BoxData["6.072067428425779`*^-15"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{
     RowBox[{"entries", " ", "are", " ", "non"}], "-", 
     RowBox[{
     "zero", " ", "only", " ", "for", " ", "matching", " ", "quantum", " ", 
      "numbers"}]}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"MPOBlockStructureError", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["G", "0"], ",", 
       SubscriptBox["qG", "0"], ",", 
       SubscriptBox["qG", "1"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["qd", "0"], ",", 
       SubscriptBox["qd", "0"]}], "}"}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"MPOBlockStructureError", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["G", "1"], ",", 
       SubscriptBox["qG", "1"], ",", 
       SubscriptBox["qG", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["qd", "1"], ",", 
       SubscriptBox["qd", "1"]}], "}"}]}], "]"}]}]}]], "Input"],

Cell[BoxData["0.`"], "Output"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "save", " ", "virtual", " ", "bond", " ", "quantum", " ", "numbers", " ", 
    "to", " ", "disk"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "base"], "<>", "\"\<_qG1.dat\>\""}], ",", 
     SubscriptBox["qG", "1"], ",", "\"\<Integer32\>\""}], "]"}], 
   ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["With truncation (reduced bond dimension)", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["G", 
        RowBox[{"0", ",", "red"}]], ",", 
       SubscriptBox["qG", 
        RowBox[{"0", ",", "red"}]], ",", 
       SubscriptBox["qG", 
        RowBox[{"1", ",", "red"}]]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["G", 
        RowBox[{"1", ",", "red"}]], ",", 
       SubscriptBox["qG", 
        RowBox[{"1", ",", "red", ",", "alt"}]], ",", 
       SubscriptBox["qG", 
        RowBox[{"2", ",", "red"}]]}], "}"}], ",", 
     SubscriptBox["\[Sigma]", 
      RowBox[{"G", ",", "val", ",", "red"}]]}], "}"}], "=", 
   RowBox[{"MPOSplitTensor", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["G", "pair"], ",", 
       SubscriptBox["qG", "0"], ",", 
       SubscriptBox["qG", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["qd", "0"], ",", 
       SubscriptBox["qd", "1"]}], "}"}], ",", "0.1"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["G", 
   RowBox[{"0", ",", "red"}]], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["G", 
   RowBox[{"1", ",", "red"}]], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "13", ",", "102"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "5", ",", "102", ",", "11"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"consistency", " ", "check"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    SubscriptBox["qG", 
     RowBox[{"1", ",", "red"}]], "-", 
    SubscriptBox["qG", 
     RowBox[{"1", ",", "red", ",", "alt"}]]}], "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["\[Sigma]", 
    RowBox[{"G", ",", "val", ",", "red"}]], "\[LeftDoubleBracket]", 
   RowBox[{"{", 
    RowBox[{"1", ",", "2", ",", "3", ",", 
     RowBox[{"-", "1"}]}], "}"}], "\[RightDoubleBracket]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "3.203847696309703`", ",", "3.9799166848088485`", ",", "2.861353137011203`",
    ",", "3.58258549571751`"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"leading", " ", "singular", " ", "values", " ", "agree"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"Sort", "[", 
     RowBox[{
      SubscriptBox["\[Sigma]", 
       RowBox[{"G", ",", "val", ",", "red"}]], ",", "Greater"}], "]"}], "-", 
    RowBox[{
     RowBox[{"Sort", "[", 
      RowBox[{
       SubscriptBox["\[Sigma]", 
        RowBox[{"G", ",", "val"}]], ",", "Greater"}], "]"}], 
     "\[LeftDoubleBracket]", 
     RowBox[{"1", ";;", 
      RowBox[{"Length", "[", 
       SubscriptBox["\[Sigma]", 
        RowBox[{"G", ",", "val", ",", "red"}]], "]"}]}], 
     "\[RightDoubleBracket]"}]}], "]"}]}]], "Input"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"norm", " ", "of", " ", "singular", " ", "values"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   SubscriptBox["\[Sigma]", 
    RowBox[{"G", ",", "val", ",", "red"}]], "]"}]}]], "Input"],

Cell[BoxData["46.345164006872245`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "von", " ", "Neumann", " ", "entropy", " ", "of", " ", "singular", " ", 
    "values"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"NeumannEntropy", "[", 
   SubscriptBox["\[Sigma]", 
    RowBox[{"G", ",", "val", ",", "red"}]], "]"}]}]], "Input"],

Cell[BoxData["4.49445479211037`"], "Output"]
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
     SubscriptBox["G", 
      RowBox[{"pair", ",", "red"}]], "=", 
     RowBox[{"MPOMergeTensors", "[", 
      RowBox[{
       RowBox[{
        SubscriptBox["G", 
         RowBox[{"0", ",", "red"}]], ".", 
        RowBox[{"DiagonalMatrix", "[", 
         SubscriptBox["\[Sigma]", 
          RowBox[{"G", ",", "val", ",", "red"}]], "]"}]}], ",", 
       SubscriptBox["G", 
        RowBox[{"1", ",", "red"}]]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"20", ",", "20", ",", "13", ",", "11"}], "}"}]], "Output"]
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
  FractionBox[
   RowBox[{"Norm", "[", 
    RowBox[{"Flatten", "[", 
     RowBox[{
      SubscriptBox["G", 
       RowBox[{"pair", ",", "red"}]], "-", 
      SubscriptBox["G", "pair"]}], "]"}], "]"}], 
   RowBox[{"Norm", "[", 
    RowBox[{"Flatten", "[", 
     SubscriptBox["G", "pair"], "]"}], "]"}]]}]], "Input"],

Cell[BoxData["0.3119558106532555`"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "save", " ", "virtual", " ", "bond", " ", "quantum", " ", "numbers", " ", 
    "to", " ", "disk"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "base"], "<>", "\"\<_qG1_red.dat\>\""}], ",", 
     SubscriptBox["qG", 
      RowBox[{"1", ",", "red"}]], ",", "\"\<Integer32\>\""}], "]"}], 
   ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "save", " ", "truncated", " ", "approximation", " ", "as", " ", 
    "reference", " ", "to", " ", "disk"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "base"], "<>", "\"\<_G2_red.dat\>\""}], ",", 
     RowBox[{"ColumnMajorLayout", "[", 
      RowBox[{"ArrayReshape", "[", 
       RowBox[{
        SubscriptBox["G", 
         RowBox[{"pair", ",", "red"}]], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Length", "[", 
           SubscriptBox["qd", "0"], "]"}], ",", 
          RowBox[{"Length", "[", 
           SubscriptBox["qd", "1"], "]"}], ",", 
          RowBox[{"Length", "[", 
           SubscriptBox["qd", "0"], "]"}], ",", 
          RowBox[{"Length", "[", 
           SubscriptBox["qd", "1"], "]"}], ",", 
          RowBox[{"Length", "[", 
           SubscriptBox["qG", "0"], "]"}], ",", 
          RowBox[{"Length", "[", 
           SubscriptBox["qG", "2"], "]"}]}], "}"}]}], "]"}], "]"}], ",", 
     "\"\<Complex128\>\""}], "]"}], ";"}]}]], "Input"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Compress virtual bonds", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "fictitious", " ", "virtual", " ", "bond", " ", "quantum", " ", 
    "numbers"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["qK", "0"], "=", 
     RowBox[{"{", 
      RowBox[{"1", ",", "2", ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "3"}], ",", "0"}], "}"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["qK", "1"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "2"}], ",", "1", ",", 
       RowBox[{"-", "4"}], ",", 
       RowBox[{"-", "7"}], ",", "0", ",", 
       RowBox[{"-", "2"}], ",", "4", ",", "3", ",", "5", ",", "1", ",", 
       RowBox[{"-", "5"}], ",", 
       RowBox[{"-", "5"}], ",", "1"}], "}"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["qK", "2"], "=", 
     RowBox[{"{", 
      RowBox[{"4", ",", 
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "2"}], ",", "0", ",", "3", ",", 
       RowBox[{"-", "5"}], ",", 
       RowBox[{"-", "2"}]}], "}"}]}], ";"}]}]}]], "Input"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "44", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["K", "0"], "=", 
   RowBox[{"Outer", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"#1", "-", "#2", "+", "#3", "-", "#4"}], "\[Equal]", "0"}], 
        ",", 
        RowBox[{"RandomComplex", "[", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"-", 
            RowBox[{"(", 
             RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], ",", 
           RowBox[{"(", 
            RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], "}"}], "]"}], ",", 
        "0"}], "]"}], "&"}], ",", 
     SubscriptBox["qd", "0"], ",", 
     SubscriptBox["qd", "0"], ",", 
     SubscriptBox["qK", "0"], ",", 
     SubscriptBox["qK", "1"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["K", "1"], "=", 
   RowBox[{"Outer", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"#1", "-", "#2", "+", "#3", "-", "#4"}], "\[Equal]", "0"}], 
        ",", 
        RowBox[{"RandomComplex", "[", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"-", 
            RowBox[{"(", 
             RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], ",", 
           RowBox[{"(", 
            RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], "}"}], "]"}], ",", 
        "0"}], "]"}], "&"}], ",", 
     SubscriptBox["qd", "1"], ",", 
     SubscriptBox["qd", "1"], ",", 
     SubscriptBox["qK", "1"], ",", 
     SubscriptBox["qK", "2"]}], "]"}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Dimensions", "[", 
  SubscriptBox["K", "0"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["K", "1"], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "5", ",", "14"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "5", ",", "14", ",", "7"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["cK", "0"], ",", 
       SubscriptBox["qcK", "0"], ",", 
       SubscriptBox["qcK", "1"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["cK", "1"], ",", 
       SubscriptBox["qcK", 
        RowBox[{"1", ",", "alt"}]], ",", 
       SubscriptBox["qcK", "2"]}], "}"}], ",", 
     SubscriptBox["\[Sigma]", 
      RowBox[{"K", ",", "val"}]]}], "}"}], "=", 
   RowBox[{"MPOCompressTensors", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["K", "0"], ",", 
       SubscriptBox["qK", "0"], ",", 
       SubscriptBox["qK", "1"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["K", "1"], ",", 
       SubscriptBox["qK", "1"], ",", 
       SubscriptBox["qK", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["qd", "0"], ",", 
       SubscriptBox["qd", "1"]}], "}"}], ",", "0.02"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["cK", "0"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["cK", "1"], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "5", ",", "10"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "5", ",", "10", ",", "7"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"consistency", " ", "check"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Norm", "[", 
    RowBox[{
     SubscriptBox["qcK", "0"], "-", 
     SubscriptBox["qK", "0"]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     SubscriptBox["qcK", "1"], "-", 
     SubscriptBox["qcK", 
      RowBox[{"1", ",", "alt"}]]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     SubscriptBox["qcK", "2"], "-", 
     SubscriptBox["qK", "2"]}], "]"}]}]}]], "Input"],

Cell[BoxData["0"], "Output"],

Cell[BoxData["0"], "Output"],

Cell[BoxData["0"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  SubscriptBox["\[Sigma]", 
   RowBox[{"K", ",", "val"}]]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "4.756782906426508`", ",", "10.088597257987622`", ",", "8.33354112197053`", 
   ",", "4.698085010718789`", ",", "7.882556927835047`", ",", 
   "10.805500112558825`", ",", "8.177908455108158`", ",", 
   "4.870331027612785`", ",", "5.071679712752171`", ",", 
   "4.024141348772294`"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"norm", " ", "of", " ", "singular", " ", "values"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   SubscriptBox["\[Sigma]", 
    RowBox[{"K", ",", "val"}]], "]"}]}]], "Input"],

Cell[BoxData["22.963758071744884`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "von", " ", "Neumann", " ", "entropy", " ", "of", " ", "singular", " ", 
    "values"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"NeumannEntropy", "[", 
   SubscriptBox["\[Sigma]", 
    RowBox[{"K", ",", "val"}]], "]"}]}]], "Input"],

Cell[BoxData["2.093919636764969`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{
     RowBox[{"entries", " ", "are", " ", "non"}], "-", 
     RowBox[{
     "zero", " ", "only", " ", "for", " ", "matching", " ", "quantum", " ", 
      "numbers"}]}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"MPOBlockStructureError", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["cK", "0"], ",", 
       SubscriptBox["qcK", "0"], ",", 
       SubscriptBox["qcK", "1"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["qd", "0"], ",", 
       SubscriptBox["qd", "0"]}], "}"}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"MPOBlockStructureError", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["cK", "1"], ",", 
       SubscriptBox["qcK", "1"], ",", 
       SubscriptBox["qcK", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["qd", "1"], ",", 
       SubscriptBox["qd", "1"]}], "}"}]}], "]"}]}]}]], "Input"],

Cell[BoxData["0.`"], "Output"],

Cell[BoxData["0.`"], "Output"]
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
     SubscriptBox["cK", "pair"], "=", 
     RowBox[{"MPOMergeTensors", "[", 
      RowBox[{
       RowBox[{
        SubscriptBox["cK", "0"], ".", 
        RowBox[{"DiagonalMatrix", "[", 
         SubscriptBox["\[Sigma]", 
          RowBox[{"K", ",", "val"}]], "]"}]}], ",", 
       SubscriptBox["cK", "1"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"20", ",", "20", ",", "5", ",", "7"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "compressed", " ", "tensors", " ", "no", " ", "longer", " ", "exactly", 
    " ", "reproduce", " ", "original", " ", "tensors", " ", "due", " ", "to", 
    " ", "finite", " ", "tolerance"}], " ", "*)"}], "\[IndentingNewLine]", 
  FractionBox[
   RowBox[{"Norm", "[", 
    RowBox[{"Flatten", "[", 
     RowBox[{
      RowBox[{"MPOMergeTensors", "[", 
       RowBox[{
        SubscriptBox["K", "0"], ",", 
        SubscriptBox["K", "1"]}], "]"}], "-", 
      SubscriptBox["cK", "pair"]}], "]"}], "]"}], 
   RowBox[{"Norm", "[", 
    RowBox[{"Flatten", "[", 
     RowBox[{"MPOMergeTensors", "[", 
      RowBox[{
       SubscriptBox["K", "0"], ",", 
       SubscriptBox["K", "1"]}], "]"}], "]"}], "]"}]]}]], "Input"],

Cell[BoxData["0.138290715435202`"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "save", " ", "tensors", " ", "as", " ", "reference", " ", "to", " ", 
    "disk"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", "\"\<_K\>\"", "<>", 
         RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}], ",", 
        RowBox[{"ColumnMajorLayout", "[", 
         SubscriptBox["K", "i"], "]"}], ",", "\"\<Complex128\>\""}], "]"}], 
      ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", "0", ",", "1"}], "}"}]}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_cK2.dat\>\""}], ",", 
      RowBox[{"ColumnMajorLayout", "[", 
       RowBox[{"ArrayReshape", "[", 
        RowBox[{
         SubscriptBox["cK", "pair"], ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"Length", "[", 
            SubscriptBox["qd", "0"], "]"}], ",", 
           RowBox[{"Length", "[", 
            SubscriptBox["qd", "1"], "]"}], ",", 
           RowBox[{"Length", "[", 
            SubscriptBox["qd", "0"], "]"}], ",", 
           RowBox[{"Length", "[", 
            SubscriptBox["qd", "1"], "]"}], ",", 
           RowBox[{"Length", "[", 
            SubscriptBox["qK", "0"], "]"}], ",", 
           RowBox[{"Length", "[", 
            SubscriptBox["qK", "2"], "]"}]}], "}"}]}], "]"}], "]"}], ",", 
      "\"\<Complex128\>\""}], "]"}], ";"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "quantum", " ", "numbers", " ", "to", " ", "disk"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", "\"\<_qK\>\"", "<>", 
         RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}], ",", 
        SubscriptBox["qK", "i"], ",", "\"\<Integer32\>\""}], "]"}], ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", "0", ",", "2"}], "}"}]}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_qcK1.dat\>\""}], ",", 
      SubscriptBox["qcK", "1"], ",", "\"\<Integer32\>\""}], "]"}], 
    ";"}]}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Compose MPO tensor pairs", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "fictitious", " ", "virtual", " ", "bond", " ", "quantum", " ", 
    "numbers"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["qM", "0"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "1"}], ",", "0", ",", "4", ",", 
       RowBox[{"-", "2"}], ",", "2", ",", "1"}], "}"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["qM", "1"], "=", 
     RowBox[{"{", 
      RowBox[{"4", ",", "1", ",", "4", ",", 
       RowBox[{"-", "3"}], ",", 
       RowBox[{"-", "5"}], ",", "0", ",", 
       RowBox[{"-", "2"}], ",", "4", ",", 
       RowBox[{"-", "4"}], ",", "2"}], "}"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["qM", "2"], "=", 
     RowBox[{"{", 
      RowBox[{"2", ",", "1", ",", "3", ",", 
       RowBox[{"-", "3"}], ",", "0", ",", 
       RowBox[{"-", "2"}]}], "}"}]}], ";"}]}]}]], "Input"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "45", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["M", "0"], "=", 
   RowBox[{"Outer", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"#1", "-", "#2", "+", "#3", "-", "#4"}], "\[Equal]", "0"}], 
        ",", 
        RowBox[{"RandomComplex", "[", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{
            RowBox[{"-", 
             RowBox[{"(", 
              RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], "/", "2"}], ",", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "2"}]}], "}"}], 
         "]"}], ",", "0"}], "]"}], "&"}], ",", 
     SubscriptBox["qd", "0"], ",", 
     SubscriptBox["qd", "0"], ",", 
     SubscriptBox["qM", "0"], ",", 
     SubscriptBox["qM", "1"]}], "]"}]}], ";", 
  RowBox[{
   SubscriptBox["M", "1"], "=", 
   RowBox[{"Outer", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"#1", "-", "#2", "+", "#3", "-", "#4"}], "\[Equal]", "0"}], 
        ",", 
        RowBox[{"RandomComplex", "[", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{
            RowBox[{"-", 
             RowBox[{"(", 
              RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], "/", "2"}], ",", 
           RowBox[{
            RowBox[{"(", 
             RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "2"}]}], "}"}], 
         "]"}], ",", "0"}], "]"}], "&"}], ",", 
     SubscriptBox["qd", "1"], ",", 
     SubscriptBox["qd", "1"], ",", 
     SubscriptBox["qM", "1"], ",", 
     SubscriptBox["qM", "2"]}], "]"}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Dimensions", "[", 
  SubscriptBox["M", "0"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["M", "1"], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "6", ",", "10"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "5", ",", "10", ",", "6"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["P", "0"], ",", 
       SubscriptBox["qP", "0"], ",", 
       SubscriptBox["qP", "1"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["P", "1"], ",", 
       SubscriptBox["qP", 
        RowBox[{"1", ",", "alt"}]], ",", 
       SubscriptBox["qP", "2"]}], "}"}], ",", 
     SubscriptBox["\[Sigma]", 
      RowBox[{"P", ",", "val"}]]}], "}"}], "=", 
   RowBox[{"MPOPairComposition", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["K", "0"], ",", 
       SubscriptBox["qK", "0"], ",", 
       SubscriptBox["qK", "1"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["K", "1"], ",", 
       SubscriptBox["qK", "1"], ",", 
       SubscriptBox["qK", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["M", "0"], ",", 
       SubscriptBox["qM", "0"], ",", 
       SubscriptBox["qM", "1"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["M", "1"], ",", 
       SubscriptBox["qM", "1"], ",", 
       SubscriptBox["qM", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["qd", "0"], ",", 
       SubscriptBox["qd", "1"]}], "}"}], ",", "0.05"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["P", "0"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["P", "1"], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "30", ",", "57"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "5", ",", "57", ",", "42"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"consistency", " ", "check"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    SubscriptBox["qP", "1"], "-", 
    SubscriptBox["qP", 
     RowBox[{"1", ",", "alt"}]]}], "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["\[Sigma]", 
    RowBox[{"P", ",", "val"}]], "\[LeftDoubleBracket]", 
   RowBox[{"{", 
    RowBox[{"1", ",", "2", ",", "3", ",", 
     RowBox[{"-", "1"}]}], "}"}], "\[RightDoubleBracket]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "2.5760186771905524`", ",", "1.8160086543934821`", ",", "5.17177782154485`",
    ",", "2.2840606392126075`"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"norm", " ", "of", " ", "singular", " ", "values"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   SubscriptBox["\[Sigma]", 
    RowBox[{"P", ",", "val"}]], "]"}]}]], "Input"],

Cell[BoxData["29.932926894252983`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "von", " ", "Neumann", " ", "entropy", " ", "of", " ", "singular", " ", 
    "values"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"NeumannEntropy", "[", 
   SubscriptBox["\[Sigma]", 
    RowBox[{"P", ",", "val"}]], "]"}]}]], "Input"],

Cell[BoxData["3.6956519290156757`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{
     RowBox[{"entries", " ", "are", " ", "non"}], "-", 
     RowBox[{
     "zero", " ", "only", " ", "for", " ", "matching", " ", "quantum", " ", 
      "numbers"}]}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"MPOBlockStructureError", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["P", "0"], ",", 
       SubscriptBox["qP", "0"], ",", 
       SubscriptBox["qP", "1"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["qd", "0"], ",", 
       SubscriptBox["qd", "0"]}], "}"}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"MPOBlockStructureError", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["P", "1"], ",", 
       SubscriptBox["qP", "1"], ",", 
       SubscriptBox["qP", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["qd", "1"], ",", 
       SubscriptBox["qd", "1"]}], "}"}]}], "]"}]}]}]], "Input"],

Cell[BoxData["0.`"], "Output"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  SubscriptBox["qP", "0"]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "1", ",", "5", ",", 
   RowBox[{"-", "1"}], ",", "3", ",", "2", ",", "1", ",", "2", ",", "6", ",", 
   "0", ",", "4", ",", "3", ",", 
   RowBox[{"-", "2"}], ",", 
   RowBox[{"-", "1"}], ",", "3", ",", 
   RowBox[{"-", "3"}], ",", "1", ",", "0", ",", 
   RowBox[{"-", "4"}], ",", 
   RowBox[{"-", "3"}], ",", "1", ",", 
   RowBox[{"-", "5"}], ",", 
   RowBox[{"-", "1"}], ",", 
   RowBox[{"-", "2"}], ",", 
   RowBox[{"-", "1"}], ",", "0", ",", "4", ",", 
   RowBox[{"-", "2"}], ",", "2", ",", "1"}], "}"}]], "Output"]
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
     SubscriptBox["P", "pair"], "=", 
     RowBox[{"MPOMergeTensors", "[", 
      RowBox[{
       RowBox[{
        SubscriptBox["P", "0"], ".", 
        RowBox[{"DiagonalMatrix", "[", 
         SubscriptBox["\[Sigma]", 
          RowBox[{"P", ",", "val"}]], "]"}]}], ",", 
       SubscriptBox["P", "1"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"20", ",", "20", ",", "30", ",", "42"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "save", " ", "tensors", " ", "as", " ", "reference", " ", "to", " ", 
    "disk"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", "\"\<_M\>\"", "<>", 
         RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}], ",", 
        RowBox[{"ColumnMajorLayout", "[", 
         SubscriptBox["M", "i"], "]"}], ",", "\"\<Complex128\>\""}], "]"}], 
      ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", "0", ",", "1"}], "}"}]}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_P2.dat\>\""}], ",", 
      RowBox[{
       RowBox[{"ColumnMajorLayout", "[", 
        RowBox[{"ArrayReshape", "[", 
         RowBox[{
          SubscriptBox["P", "pair"], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"Length", "[", 
             SubscriptBox["qd", "0"], "]"}], ",", 
            RowBox[{"Length", "[", 
             SubscriptBox["qd", "1"], "]"}], ",", 
            RowBox[{"Length", "[", 
             SubscriptBox["qd", "0"], "]"}], ",", 
            RowBox[{"Length", "[", 
             SubscriptBox["qd", "1"], "]"}], ",", 
            RowBox[{"Length", "[", 
             SubscriptBox["qK", "0"], "]"}], ",", 
            RowBox[{"Length", "[", 
             SubscriptBox["qM", "0"], "]"}], ",", 
            RowBox[{"Length", "[", 
             SubscriptBox["qK", "2"], "]"}], ",", 
            RowBox[{"Length", "[", 
             SubscriptBox["qM", "2"], "]"}]}], "}"}]}], "]"}], "]"}], 
       "\[LeftDoubleBracket]", 
       RowBox[{"1", ";;", 
        SuperscriptBox["2", "14"]}], "\[RightDoubleBracket]"}], ",", 
      "\"\<Complex128\>\""}], "]"}], ";"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "quantum", " ", "numbers", " ", "to", " ", "disk"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", "\"\<_qM\>\"", "<>", 
         RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}], ",", 
        SubscriptBox["qM", "i"], ",", "\"\<Integer32\>\""}], "]"}], ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", "0", ",", "2"}], "}"}]}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", "\"\<_qP\>\"", "<>", 
         RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}], ",", 
        RowBox[{"ColumnMajorLayout", "[", 
         RowBox[{"ArrayReshape", "[", 
          RowBox[{
           SubscriptBox["qP", "i"], ",", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"Length", "[", 
              SubscriptBox["qK", "i"], "]"}], ",", 
             RowBox[{"Length", "[", 
              SubscriptBox["qM", "i"], "]"}]}], "}"}]}], "]"}], "]"}], ",", 
        "\"\<Integer32\>\""}], "]"}], ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", 
        RowBox[{"{", 
         RowBox[{"0", ",", "2"}], "}"}]}], "}"}]}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_qP1.dat\>\""}], ",", 
      SubscriptBox["qP", "1"], ",", "\"\<Integer32\>\""}], "]"}], 
    ";"}]}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["MPO composition", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"qA", "=", 
       SubscriptBox["qA", 
        RowBox[{"1", ",", "list"}]]}], ",", 
      RowBox[{"qB", "=", 
       SubscriptBox["qB", "list"]}], ",", "BA1q"}], "}"}], ",", 
    RowBox[{
     RowBox[{"BA1q", "=", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"MPOComposition", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             SubscriptBox["B", "list"], "\[LeftDoubleBracket]", "j", 
             "\[RightDoubleBracket]"}], ",", 
            RowBox[{
            "qB", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], ",", 
            RowBox[{"qB", "\[LeftDoubleBracket]", 
             RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             SubscriptBox["A", 
              RowBox[{"1", ",", "list"}]], "\[LeftDoubleBracket]", "j", 
             "\[RightDoubleBracket]"}], ",", 
            RowBox[{
            "qA", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], ",", 
            RowBox[{"qA", "\[LeftDoubleBracket]", 
             RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "}"}]}], 
         "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], ";", 
     RowBox[{
      SubscriptBox["BA1", "list"], "=", 
      RowBox[{"First", "/@", "BA1q"}]}], ";", 
     RowBox[{
      SubscriptBox["qBA1", "list"], "=", 
      RowBox[{"Prepend", "[", 
       RowBox[{
        RowBox[{"Last", "/@", "BA1q"}], ",", 
        RowBox[{"BA1q", "\[LeftDoubleBracket]", 
         RowBox[{"1", ",", "2"}], "\[RightDoubleBracket]"}]}], "]"}]}]}]}], 
   "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", 
  SubscriptBox["BA1", "list"]}], "\[IndentingNewLine]", 
 RowBox[{"Length", "/@", 
  SubscriptBox["qBA1", "list"]}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"4", ",", "5", ",", "1", ",", "25"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "5", ",", "25", ",", "54"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "5", ",", "54", ",", "49"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "5", ",", "49", ",", "32"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "5", ",", "32", ",", "1"}], "}"}]}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "25", ",", "54", ",", "49", ",", "32", ",", "1"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "composition", " ", 
    RowBox[{"of", " ", "'"}], 
    RowBox[{
     SubscriptBox["A", "1"], "'"}], " ", 
    RowBox[{"and", " ", "'"}], 
    RowBox[{"B", "'"}], " ", "tensors", " ", "to", " ", "disk"}], " ", "*)"}],
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
          SubscriptBox["fn", "base"], "<>", "\"\<_BA0\>\"", "<>", "\"\<_\>\"",
           "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{"ColumnMajorLayout", "[", 
          RowBox[{"ArrayReshape", "[", 
           RowBox[{
            RowBox[{
             SubscriptBox["BA1", "list"], "\[LeftDoubleBracket]", "j", 
             "\[RightDoubleBracket]"}], ",", 
            RowBox[{"{", 
             RowBox[{
              RowBox[{
               RowBox[{"Dimensions", "[", 
                RowBox[{
                 SubscriptBox["BA1", "list"], "\[LeftDoubleBracket]", "j", 
                 "\[RightDoubleBracket]"}], "]"}], "\[LeftDoubleBracket]", 
               "1", "\[RightDoubleBracket]"}], ",", 
              RowBox[{
               RowBox[{"Dimensions", "[", 
                RowBox[{
                 SubscriptBox["BA1", "list"], "\[LeftDoubleBracket]", "j", 
                 "\[RightDoubleBracket]"}], "]"}], "\[LeftDoubleBracket]", 
               "2", "\[RightDoubleBracket]"}], ",", 
              RowBox[{"Length", "[", 
               RowBox[{
                SubscriptBox["qB", "list"], "\[LeftDoubleBracket]", "j", 
                "\[RightDoubleBracket]"}], "]"}], ",", 
              RowBox[{"Length", "[", 
               RowBox[{
                SubscriptBox["qA", 
                 RowBox[{"1", ",", "list"}]], "\[LeftDoubleBracket]", "j", 
                "\[RightDoubleBracket]"}], "]"}], ",", 
              RowBox[{"Length", "[", 
               RowBox[{
                SubscriptBox["qB", "list"], "\[LeftDoubleBracket]", 
                RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}], "]"}], 
              ",", 
              RowBox[{"Length", "[", 
               RowBox[{
                SubscriptBox["qA", 
                 RowBox[{"1", ",", "list"}]], "\[LeftDoubleBracket]", 
                RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}], "]"}]}], 
             "}"}]}], "]"}], "]"}], ",", "\"\<Complex128\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "save", " ", "corresponding", " ", "virtual", " ", "bond", " ", "quantum", 
    " ", "numbers", " ", "to", " ", "disk"}], " ", "*)"}], 
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
          SubscriptBox["fn", "base"], "<>", "\"\<_qBA0_\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{"ColumnMajorLayout", "[", 
          RowBox[{"ArrayReshape", "[", 
           RowBox[{
            RowBox[{
             SubscriptBox["qBA1", "list"], "\[LeftDoubleBracket]", "j", 
             "\[RightDoubleBracket]"}], ",", 
            RowBox[{"{", 
             RowBox[{
              RowBox[{"Length", "[", 
               RowBox[{
                SubscriptBox["qB", "list"], "\[LeftDoubleBracket]", "j", 
                "\[RightDoubleBracket]"}], "]"}], ",", 
              RowBox[{"Length", "[", 
               RowBox[{
                SubscriptBox["qA", 
                 RowBox[{"1", ",", "list"}]], "\[LeftDoubleBracket]", "j", 
                "\[RightDoubleBracket]"}], "]"}]}], "}"}]}], "]"}], "]"}], 
         ",", "\"\<Integer32\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", 
         RowBox[{"L", "+", "1"}]}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Apply two-site operators", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"bond", " ", "dimensions"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["D", "1"], "=", "6"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["D", "2"], "=", "7"}], ";"}], 
   RowBox[{"(*", " ", 
    RowBox[{"shared", " ", "bond"}], " ", "*)"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["D", "3"], "=", "8"}], ";"}]}]}]], "Input"],

Cell[BoxData[{
 RowBox[{"SeedRandom", "[", "42", "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["C", "0"], "=", 
   RowBox[{"RandomComplex", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{
        RowBox[{"-", 
         RowBox[{"(", 
          RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], "/", 
        SubscriptBox["D", "2"]}], ",", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", 
        SubscriptBox["D", "2"]}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"3", ",", "3", ",", 
       SubscriptBox["D", "1"], ",", 
       SubscriptBox["D", "2"]}], "}"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["C", "1"], "=", 
   RowBox[{"RandomComplex", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{
        RowBox[{"-", 
         RowBox[{"(", 
          RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], "/", 
        SubscriptBox["D", "2"]}], ",", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", 
        SubscriptBox["D", "2"]}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"4", ",", "4", ",", 
       SubscriptBox["D", "2"], ",", 
       SubscriptBox["D", "3"]}], "}"}]}], "]"}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["C", "0"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "3", ",", "6", ",", "7"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["C", "1"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "7", ",", "8"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "43", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["op", "T"], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"D", "=", "13"}], ",", 
       RowBox[{"d1", "=", "3"}], ",", 
       RowBox[{"d2", "=", "4"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"RandomComplex", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{"-", "1"}], "-", "\[ImaginaryI]"}], ",", 
            RowBox[{"1", "+", "\[ImaginaryI]"}]}], "}"}], "/", 
          SqrtBox["D"]}], ",", 
         RowBox[{"{", 
          RowBox[{"d1", ",", "d1", ",", "1", ",", "D"}], "}"}]}], "]"}], ",", 
       RowBox[{"RandomComplex", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{"-", "1"}], "-", "\[ImaginaryI]"}], ",", 
            RowBox[{"1", "+", "\[ImaginaryI]"}]}], "}"}], "/", 
          SqrtBox["D"]}], ",", 
         RowBox[{"{", 
          RowBox[{"d2", ",", "d2", ",", "D", ",", "1"}], "}"}]}], "]"}]}], 
      "}"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["op", "B"], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"D", "=", "15"}], ",", 
       RowBox[{"d1", "=", "3"}], ",", 
       RowBox[{"d2", "=", "4"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"RandomComplex", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{"-", "1"}], "-", "\[ImaginaryI]"}], ",", 
            RowBox[{"1", "+", "\[ImaginaryI]"}]}], "}"}], "/", 
          SqrtBox["D"]}], ",", 
         RowBox[{"{", 
          RowBox[{"d1", ",", "d1", ",", "1", ",", "D"}], "}"}]}], "]"}], ",", 
       RowBox[{"RandomComplex", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{"-", "1"}], "-", "\[ImaginaryI]"}], ",", 
            RowBox[{"1", "+", "\[ImaginaryI]"}]}], "}"}], "/", 
          SqrtBox["D"]}], ",", 
         RowBox[{"{", 
          RowBox[{"d2", ",", "d2", ",", "D", ",", "1"}], "}"}]}], "]"}]}], 
      "}"}]}], "]"}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Dimensions", "/@", 
  SubscriptBox["op", "T"]}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", 
  SubscriptBox["op", "B"]}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "1", ",", "13"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "13", ",", "1"}], "}"}]}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "1", ",", "15"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "15", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"apply", " ", "operators"}], ",", " ", 
    RowBox[{
    "using", " ", "artificially", " ", "high", " ", "tolerance", " ", "to", 
     " ", "truncate", " ", "some", " ", "singular", " ", "values"}]}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        SubscriptBox["M", "0"], ",", 
        SubscriptBox["qM", "0"], ",", 
        SubscriptBox["qM", "1"]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        SubscriptBox["M", "1"], ",", 
        SubscriptBox["qM", 
         RowBox[{"1", ",", "alt"}]], ",", 
        SubscriptBox["qM", "2"]}], "}"}], ",", 
      SubscriptBox["S", "val"]}], "}"}], "=", 
    RowBox[{"Block", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"DT", "=", "13"}], ",", 
        RowBox[{"DB", "=", "15"}], ",", 
        RowBox[{"d1", "=", "3"}], ",", 
        RowBox[{"d2", "=", "4"}]}], "}"}], ",", 
      RowBox[{"MPOPairComposition", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{
           SubscriptBox["op", "T"], "\[LeftDoubleBracket]", "1", 
           "\[RightDoubleBracket]"}], ",", 
          RowBox[{"{", "0", "}"}], ",", 
          RowBox[{"ConstantArray", "[", 
           RowBox[{"0", ",", "DT"}], "]"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{
           SubscriptBox["op", "T"], "\[LeftDoubleBracket]", "2", 
           "\[RightDoubleBracket]"}], ",", 
          RowBox[{"ConstantArray", "[", 
           RowBox[{"0", ",", "DT"}], "]"}], ",", 
          RowBox[{"{", "0", "}"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["C", "0"], ",", 
          RowBox[{"ConstantArray", "[", 
           RowBox[{"0", ",", 
            SubscriptBox["D", "1"]}], "]"}], ",", 
          RowBox[{"ConstantArray", "[", 
           RowBox[{"0", ",", 
            SubscriptBox["D", "2"]}], "]"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["C", "1"], ",", 
          RowBox[{"ConstantArray", "[", 
           RowBox[{"0", ",", 
            SubscriptBox["D", "2"]}], "]"}], ",", 
          RowBox[{"ConstantArray", "[", 
           RowBox[{"0", ",", 
            SubscriptBox["D", "3"]}], "]"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{
           SubscriptBox["op", "B"], "\[LeftDoubleBracket]", "1", 
           "\[RightDoubleBracket]"}], ",", 
          RowBox[{"{", "0", "}"}], ",", 
          RowBox[{"ConstantArray", "[", 
           RowBox[{"0", ",", "DB"}], "]"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{
           SubscriptBox["op", "B"], "\[LeftDoubleBracket]", "2", 
           "\[RightDoubleBracket]"}], ",", 
          RowBox[{"ConstantArray", "[", 
           RowBox[{"0", ",", "DB"}], "]"}], ",", 
          RowBox[{"{", "0", "}"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"ConstantArray", "[", 
           RowBox[{"0", ",", "d1"}], "]"}], ",", 
          RowBox[{"ConstantArray", "[", 
           RowBox[{"0", ",", "d2"}], "]"}]}], "}"}], ",", "0.1"}], "]"}]}], 
     "]"}]}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["M", "0"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "3", ",", "6", ",", "33"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["M", "1"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "33", ",", "8"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"singular", " ", "values"}], " ", "*)"}], "\[IndentingNewLine]", 
  SubscriptBox["S", "val"]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.31125627558365093`", ",", "0.30436656429244213`", ",", 
   "0.27698399094724524`", ",", "0.2683563193513333`", ",", 
   "0.2563250605241153`", ",", "0.2484473729692912`", ",", 
   "0.24164455858126332`", ",", "0.22926171922608934`", ",", 
   "0.2233926197679`", ",", "0.21839788176393854`", ",", 
   "0.21438718052367486`", ",", "0.20287969349017265`", ",", 
   "0.19492942519719475`", ",", "0.19216577125843234`", ",", 
   "0.18616892405575763`", ",", "0.18368862578796646`", ",", 
   "0.1798982408882015`", ",", "0.1746156400956803`", ",", 
   "0.16602349345435752`", ",", "0.16113662172239962`", ",", 
   "0.15749481913649632`", ",", "0.15438009037663666`", ",", 
   "0.14978797265772162`", ",", "0.14523406473364395`", ",", 
   "0.14065426315668234`", ",", "0.13598261318678947`", ",", 
   "0.1301860220292601`", ",", "0.12678661144214984`", ",", 
   "0.12420088863608131`", ",", "0.12132519975552865`", ",", 
   "0.11787145294638114`", ",", "0.11512445420151149`", ",", 
   "0.11069145409727293`"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"save", " ", "'"}], 
    RowBox[{"C", "'"}], " ", "tensors", " ", "to", " ", "disk"}], " ", "*)"}],
   "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"Export", "[", 
      RowBox[{
       RowBox[{
        SubscriptBox["fn", "base"], "<>", "\"\<_C\>\"", "<>", 
        RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}], ",", 
       RowBox[{"ColumnMajorLayout", "[", 
        SubscriptBox["C", "i"], "]"}], ",", "\"\<Complex128\>\""}], "]"}], 
     ",", 
     RowBox[{"{", 
      RowBox[{"i", ",", "0", ",", "1"}], "}"}]}], "]"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"save", " ", "'"}], 
    RowBox[{"op", "'"}], " ", "tensors", " ", "to", " ", "disk"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"d1", "=", "3"}], ",", 
       RowBox[{"d2", "=", "4"}]}], "}"}], ",", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"Export", "[", 
        RowBox[{
         RowBox[{
          SubscriptBox["fn", "base"], "<>", "\"\<_op\>\"", "<>", 
          RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{"ColumnMajorLayout", "[", 
          RowBox[{"ArrayReshape", "[", 
           RowBox[{
            RowBox[{"MPOMergeTensors", "[", 
             RowBox[{
              RowBox[{
               SubscriptBox["op", "i"], "\[LeftDoubleBracket]", "1", 
               "\[RightDoubleBracket]"}], ",", 
              RowBox[{
               SubscriptBox["op", "i"], "\[LeftDoubleBracket]", "2", 
               "\[RightDoubleBracket]"}]}], "]"}], ",", 
            RowBox[{"{", 
             RowBox[{"d1", ",", "d2", ",", "d1", ",", "d2"}], "}"}]}], "]"}], 
          "]"}], ",", "\"\<Complex128\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"i", ",", 
         RowBox[{"{", 
          RowBox[{"T", ",", "B"}], "}"}]}], "}"}]}], "]"}]}], "]"}], 
   ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", 
    RowBox[{"combined", " ", "'"}], 
    RowBox[{"M", "'"}], " ", "tensors", " ", "to", " ", "disk"}], " ", "*)"}],
   "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "base"], "<>", "\"\<_Cref.dat\>\""}], ",", 
     RowBox[{"ColumnMajorLayout", "[", 
      RowBox[{
       SubscriptBox["M", "0"], ".", 
       RowBox[{"DiagonalMatrix", "[", 
        SubscriptBox["S", "val"], "]"}], ".", 
       RowBox[{"Transpose", "[", 
        RowBox[{
         SubscriptBox["M", "1"], ",", 
         RowBox[{"{", 
          RowBox[{"2", ",", "3", ",", "1", ",", "4"}], "}"}]}], "]"}]}], 
      "]"}], ",", "\"\<Complex128\>\""}], "]"}], ";"}]}]], "Input"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1560, 920},
WindowMargins->{{239, Automatic}, {71, Automatic}},
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
Cell[1486, 35, 49, 0, 63, "Section"],
Cell[1538, 37, 123, 3, 31, "Input"],
Cell[1664, 42, 68, 1, 31, "Input"],
Cell[1735, 45, 174, 5, 31, "Input"],
Cell[1912, 52, 310, 9, 31, "Input"],
Cell[2225, 63, 233, 7, 52, "Input"],
Cell[2461, 72, 566, 18, 72, "Input"],
Cell[3030, 92, 602, 16, 52, "Input"],
Cell[CellGroupData[{
Cell[3657, 112, 65, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[3747, 116, 1876, 58, 96, "Input"],
Cell[5626, 176, 722, 22, 31, "Output"],
Cell[6351, 200, 860, 25, 31, "Output"]
}, Open  ]],
Cell[7226, 228, 2255, 63, 76, "Input"],
Cell[CellGroupData[{
Cell[9506, 295, 112, 3, 31, "Input"],
Cell[9621, 300, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[9741, 307, 112, 3, 31, "Input"],
Cell[9856, 312, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[9976, 319, 760, 20, 92, "Input"],
Cell[10739, 341, 93, 2, 31, "Output"],
Cell[10835, 345, 93, 2, 31, "Output"],
Cell[10931, 349, 93, 2, 31, "Output"],
Cell[11027, 353, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11157, 360, 231, 7, 31, "Input"],
Cell[11391, 369, 9924, 205, 75, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[21352, 579, 351, 10, 52, "Input"],
Cell[21706, 591, 5123, 114, 122, "Output"]
}, Open  ]],
Cell[26844, 708, 1151, 32, 52, "Input"],
Cell[27998, 742, 1989, 53, 92, "Input"],
Cell[29990, 797, 1119, 30, 54, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[31146, 832, 31, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[31202, 836, 1045, 32, 72, "Input"],
Cell[32250, 870, 726, 21, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[33013, 896, 1484, 43, 72, "Input"],
Cell[34500, 941, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[34620, 948, 467, 13, 52, "Input"],
Cell[35090, 963, 996, 26, 73, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[36123, 994, 202, 5, 52, "Input"],
Cell[36328, 1001, 141, 3, 31, "Output"]
}, Open  ]],
Cell[36484, 1007, 946, 27, 52, "Input"],
Cell[37433, 1036, 915, 25, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[38385, 1066, 39, 0, 43, "Subsection"],
Cell[38427, 1068, 510, 16, 52, "Input"],
Cell[CellGroupData[{
Cell[38962, 1088, 539, 15, 52, "Input"],
Cell[39504, 1105, 73, 2, 31, "Output"]
}, Open  ]],
Cell[39592, 1110, 668, 19, 52, "Input"],
Cell[CellGroupData[{
Cell[40285, 1133, 907, 27, 92, "Input"],
Cell[41195, 1162, 147, 2, 31, "Output"],
Cell[41345, 1166, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[41432, 1171, 588, 16, 92, "Input"],
Cell[42023, 1189, 46, 0, 31, "Output"],
Cell[42072, 1191, 51, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[42172, 1197, 44, 0, 43, "Subsection"],
Cell[42219, 1199, 2183, 60, 72, "Input"],
Cell[CellGroupData[{
Cell[44427, 1263, 112, 3, 31, "Input"],
Cell[44542, 1268, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[44662, 1275, 112, 3, 31, "Input"],
Cell[44777, 1280, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[44897, 1287, 574, 15, 72, "Input"],
Cell[45474, 1304, 93, 2, 31, "Output"],
Cell[45570, 1308, 93, 2, 31, "Output"],
Cell[45666, 1312, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[45796, 1319, 260, 6, 52, "Input"],
Cell[46059, 1327, 732, 15, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[46828, 1347, 470, 14, 31, "Input"],
Cell[47301, 1363, 141, 3, 31, "Output"]
}, Open  ]],
Cell[47457, 1369, 1151, 32, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[48645, 1406, 40, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[48710, 1410, 543, 16, 75, "Input"],
Cell[49256, 1428, 351, 8, 31, "Output"],
Cell[49610, 1438, 29, 0, 31, "Output"]
}, Open  ]],
Cell[49654, 1441, 912, 26, 72, "Input"],
Cell[CellGroupData[{
Cell[50591, 1471, 978, 29, 75, "Input"],
Cell[51572, 1502, 97, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[51706, 1509, 690, 21, 54, "Input"],
Cell[52399, 1532, 30, 0, 31, "Output"]
}, Open  ]],
Cell[52444, 1535, 1063, 29, 52, "Input"],
Cell[53510, 1566, 627, 17, 52, "Input"],
Cell[CellGroupData[{
Cell[54162, 1587, 43, 0, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[54230, 1591, 1022, 33, 74, "Input"],
Cell[55255, 1626, 96, 2, 31, "Output"],
Cell[55354, 1630, 96, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[55487, 1637, 273, 8, 54, "Input"],
Cell[55763, 1647, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[55828, 1652, 322, 8, 52, "Input"],
Cell[56153, 1662, 171, 4, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[56361, 1671, 253, 7, 52, "Input"],
Cell[56617, 1680, 45, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[56699, 1685, 300, 8, 52, "Input"],
Cell[57002, 1695, 45, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[57084, 1700, 676, 20, 52, "Input"],
Cell[57763, 1722, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[57850, 1727, 1013, 31, 72, "Input"],
Cell[58866, 1760, 30, 0, 31, "Output"],
Cell[58899, 1762, 30, 0, 31, "Output"]
}, Open  ]],
Cell[58944, 1765, 418, 12, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[59399, 1782, 65, 0, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[59489, 1786, 1255, 40, 74, "Input"],
Cell[60747, 1828, 96, 2, 31, "Output"],
Cell[60846, 1832, 96, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[60979, 1839, 313, 9, 54, "Input"],
Cell[61295, 1850, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[61360, 1855, 334, 8, 52, "Input"],
Cell[61697, 1865, 168, 4, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[61902, 1874, 721, 21, 52, "Input"],
Cell[62626, 1897, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[62693, 1902, 265, 7, 52, "Input"],
Cell[62961, 1911, 46, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[63044, 1916, 312, 8, 52, "Input"],
Cell[63359, 1926, 44, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[63440, 1931, 758, 22, 72, "Input"],
Cell[64201, 1955, 97, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[64335, 1962, 565, 17, 73, "Input"],
Cell[64903, 1981, 46, 0, 31, "Output"]
}, Open  ]],
Cell[64964, 1984, 451, 13, 54, "Input"],
Cell[65418, 1999, 1124, 30, 52, "Input"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[66591, 2035, 44, 0, 43, "Subsection"],
Cell[66638, 2037, 1132, 34, 92, "Input"],
Cell[67773, 2073, 1630, 50, 72, "Input"],
Cell[CellGroupData[{
Cell[69428, 2127, 173, 4, 52, "Input"],
Cell[69604, 2133, 94, 2, 31, "Output"],
Cell[69701, 2137, 94, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[69832, 2144, 1190, 38, 74, "Input"],
Cell[71025, 2184, 94, 2, 31, "Output"],
Cell[71122, 2188, 94, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[71253, 2195, 569, 17, 95, "Input"],
Cell[71825, 2214, 28, 0, 31, "Output"],
Cell[71856, 2216, 28, 0, 31, "Output"],
Cell[71887, 2218, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[71952, 2223, 163, 4, 52, "Input"],
Cell[72118, 2229, 343, 7, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[72498, 2241, 253, 7, 52, "Input"],
Cell[72754, 2250, 46, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[72837, 2255, 300, 8, 52, "Input"],
Cell[73140, 2265, 45, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[73222, 2270, 1019, 31, 72, "Input"],
Cell[74244, 2303, 30, 0, 31, "Output"],
Cell[74277, 2305, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[74344, 2310, 657, 19, 72, "Input"],
Cell[75004, 2331, 95, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[75136, 2338, 773, 21, 70, "Input"],
Cell[75912, 2361, 45, 0, 31, "Output"]
}, Open  ]],
Cell[75972, 2364, 1604, 44, 72, "Input"],
Cell[77579, 2410, 850, 24, 72, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[78466, 2439, 46, 0, 43, "Subsection"],
Cell[78515, 2441, 981, 30, 92, "Input"],
Cell[79499, 2473, 1735, 53, 72, "Input"],
Cell[CellGroupData[{
Cell[81259, 2530, 173, 4, 52, "Input"],
Cell[81435, 2536, 94, 2, 31, "Output"],
Cell[81532, 2540, 94, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[81663, 2547, 1494, 48, 74, "Input"],
Cell[83160, 2597, 95, 2, 31, "Output"],
Cell[83258, 2601, 95, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[83390, 2608, 273, 8, 54, "Input"],
Cell[83666, 2618, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[83731, 2623, 322, 8, 52, "Input"],
Cell[84056, 2633, 170, 4, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[84263, 2642, 253, 7, 52, "Input"],
Cell[84519, 2651, 46, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[84602, 2656, 300, 8, 52, "Input"],
Cell[84905, 2666, 46, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[84988, 2671, 1013, 31, 72, "Input"],
Cell[86004, 2704, 30, 0, 31, "Output"],
Cell[86037, 2706, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[86104, 2711, 131, 3, 52, "Input"],
Cell[86238, 2716, 566, 14, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[86841, 2735, 654, 19, 72, "Input"],
Cell[87498, 2756, 97, 2, 31, "Output"]
}, Open  ]],
Cell[87610, 2761, 1933, 52, 96, "Input"],
Cell[89546, 2815, 1703, 48, 92, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[91286, 2868, 37, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[91348, 2872, 2027, 55, 117, "Input"],
Cell[93378, 2929, 456, 12, 31, "Output"],
Cell[93837, 2943, 120, 3, 31, "Output"]
}, Open  ]],
Cell[93972, 2949, 2726, 66, 120, "Input"],
Cell[96701, 3017, 1563, 41, 54, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[98301, 3063, 46, 0, 43, "Subsection"],
Cell[98350, 3065, 488, 15, 92, "Input"],
Cell[98841, 3082, 1303, 42, 72, "Input"],
Cell[CellGroupData[{
Cell[100169, 3128, 85, 2, 31, "Input"],
Cell[100257, 3132, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[100387, 3139, 85, 2, 31, "Input"],
Cell[100475, 3143, 93, 2, 31, "Output"]
}, Open  ]],
Cell[100583, 3148, 2360, 72, 89, "Input"],
Cell[CellGroupData[{
Cell[102968, 3224, 167, 4, 52, "Input"],
Cell[103138, 3230, 213, 6, 31, "Output"],
Cell[103354, 3238, 213, 6, 31, "Output"]
}, Open  ]],
Cell[103582, 3247, 3261, 91, 95, "Input"],
Cell[CellGroupData[{
Cell[106868, 3342, 85, 2, 31, "Input"],
Cell[106956, 3346, 94, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[107087, 3353, 85, 2, 31, "Input"],
Cell[107175, 3357, 94, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[107306, 3364, 162, 4, 52, "Input"],
Cell[107471, 3370, 1067, 19, 52, "Output"]
}, Open  ]],
Cell[108553, 3392, 668, 19, 52, "Input"],
Cell[109224, 3413, 1410, 39, 72, "Input"],
Cell[110637, 3454, 780, 22, 52, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature uxDIV@FyEnuFdCwj@henhBzR *)
