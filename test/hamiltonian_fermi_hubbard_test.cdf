(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 11.1' *)

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
NotebookDataLength[     85008,       2235]
NotebookOptionsPosition[     78605,       2066]
NotebookOutlinePosition[     78949,       2081]
CellTagsIndexPosition[     78906,       2078]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Fermionic Hubbard Hamiltonian", "Section",ExpressionUUID->"be4704ea-c891-4e2e-938c-74292c69effb"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";"}]], "Input",ExpressionU\
UID->"c1cb6f1e-b6e3-4a31-b35e-a28ec44ee89b"],

Cell[BoxData[
 RowBox[{"<<", "../mathematica/tn_base.m"}]], "Input",ExpressionUUID->"54336e7e-52ae-4ff4-bb74-2c805a7a52d6"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["fn", "base"], "=", 
   RowBox[{"FileBaseName", "[", 
    RowBox[{"NotebookFileName", "[", "]"}], "]"}]}], ";"}]], "Input",Expressio\
nUUID->"eb189ff9-e54a-486d-9046-fa8702d130d9"],

Cell[CellGroupData[{

Cell["General definitions", "Subsection",ExpressionUUID->"cedb01fc-84e5-40d3-9256-b1e1e9758c3e"],

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
  "*)"}]], "Input",ExpressionUUID->"5f99962f-fa19-4412-9c7c-00aeca048e26"],

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
         RowBox[{"-", "1"}]}], "}"}]}], "}"}]}], ";"}]}]}]], "Input",Expressio\
nUUID->"8b7c3335-5172-434f-bb79-a7af9c3187a2"],

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
       SubscriptBox["\[Sigma]", "2"]}]}], ")"}]}]}]}]], "Input",ExpressionUUID\
->"ae472cd2-4a9a-4160-ab87-393fbf60ffaa"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0"}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"719b1322-04e0-415c-a7f4-6dde852a0a96"]
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
       SubscriptBox["\[Sigma]", "2"]}]}], ")"}]}]}]}]], "Input",ExpressionUUID\
->"8a5cae93-4cd8-445e-8826-7ed50cf9b26d"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "0"}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"067add39-296b-4b25-b8cc-a3b9407bd309"]
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
    SubscriptBox["a", "annihil"]}]}]}]], "Input",ExpressionUUID->"82c855f7-\
e66b-4c03-b460-48701de27335"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "1"}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"054201b3-bcba-4bbe-b871-a03313865a8e"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"KroneckerProduct", "[", 
   RowBox[{
    SubscriptBox["a", "number"], ",", 
    SubscriptBox["a", "number"]}], "]"}], "//", "MatrixForm"}]], "Input",Expre\
ssionUUID->"29544b3f-51d4-4954-8194-e2339a7cd286"],

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
   MatrixForm[BoxForm`e$]]]], "Output",ExpressionUUID->"8c414901-3644-4011-\
826b-c497a9cb748d"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"KroneckerProduct", "[", 
   RowBox[{
    SubscriptBox["a", "create"], ",", 
    RowBox[{"IdentityMatrix", "[", "2", "]"}]}], "]"}], "//", 
  "MatrixForm"}]], "Input",ExpressionUUID->"229365ec-1d35-42b4-b5e5-\
86c1cee86c97"],

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
   MatrixForm[BoxForm`e$]]]], "Output",ExpressionUUID->"5471ac3b-5dd8-4a01-\
a8da-127f95bd1ac6"]
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
     RowBox[{"d", ",", "d"}], "}"}]}], "]"}]}]], "Input",ExpressionUUID->\
"d24e3fd0-f826-4674-bfd3-555c303ad3d4"]
}, Open  ]],

Cell[CellGroupData[{

Cell["\<\
Construct full Hamiltonian as reference, using Jordan-Wigner transformation\
\>", "Subsection",ExpressionUUID->"b2dbf992-1f26-4cc6-ba99-21dc85dcf87c"],

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
        RowBox[{"2", "L"}], "-", "2"}]}], "}"}]}], "]"}]}]}]], "Input",Express\
ionUUID->"cc83fdde-9b12-489b-bdc1-ee55306a82a5"],

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
      RowBox[{"l", ",", "1", ",", "L"}], "}"}]}], "]"}]}]}]], "Input",Expressi\
onUUID->"420a4348-e5d2-455d-ad41-74385b37a913"],

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
       RowBox[{"2", "L"}]}], "}"}]}], "]"}]}]}]], "Input",ExpressionUUID->\
"56ae3577-7512-4e7e-b636-e74f706c2c34"],

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
     RowBox[{"NumOp", "[", "L", "]"}]}]}]}]}]], "Input",ExpressionUUID->\
"8983d91b-0d91-4866-ad5c-78f10478deeb"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"number", " ", "of", " ", "lattice", " ", "sites"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["L", "val"], "=", "5"}], ";"}]}]], "Input",ExpressionUUID->\
"0f2e57b0-a247-40f2-920d-d43457ebfb17"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"nearest", " ", "neighbor", " ", "hopping", " ", "amplitude"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["t", "val"], "=", 
    RowBox[{"6", "/", "5"}]}], ";"}]}]], "Input",ExpressionUUID->"55e168fb-\
b678-4c40-8a15-1b56d1287944"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"interaction", " ", "strength"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["U", "val"], "=", 
    RowBox[{"27", "/", "10"}]}], ";"}]}]], "Input",ExpressionUUID->"091109bc-\
97cc-423d-ace2-f32e97861eba"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"chemical", " ", "potential"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["\[Mu]", "val"], "=", 
    RowBox[{"3", "/", "10"}]}], ";"}]}]], "Input",ExpressionUUID->"52dbc719-\
c4d7-43cf-becc-982fea075f87"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  SubscriptBox["H", "hubbard"], "=", 
  RowBox[{"HHubbard", "[", 
   RowBox[{
    SubscriptBox["t", "val"], ",", 
    SubscriptBox["U", "val"], ",", 
    SubscriptBox["\[Mu]", "val"], ",", 
    SubscriptBox["L", "val"]}], "]"}]}]], "Input",ExpressionUUID->"eef359c3-\
737b-4dbb-8143-00b26af162f7"],

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
  Selectable->False]], "Output",ExpressionUUID->"dc230cd5-72cb-4134-9179-\
03e55901e8ae"]
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
      SubscriptBox["H", "hubbard"], "]"}]}], "]"}], "]"}]}]], "Input",Expressi\
onUUID->"b79bf649-6ad3-47bf-ac65-a476d9021e72"],

Cell[BoxData["0"], "Output",ExpressionUUID->"542f73c3-6129-440a-8ab1-442865c5fbca"]
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
  ";"}]], "Input",ExpressionUUID->"c4621fc3-e1cf-42e0-a4f7-97619dc6249d"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListPlot", "[", 
  RowBox[{
   SubscriptBox["\[Lambda]", "list"], ",", 
   RowBox[{"AxesLabel", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{
     "\"\<i\>\"", ",", "\"\<\!\(\*SubscriptBox[\(\[Lambda]\), \(i\)]\)\>\""}],
      "}"}]}]}], "]"}]], "Input",ExpressionUUID->"5e17015a-62d7-4993-9dac-\
27f55dae1f3a"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
     0.0055000000000000005`], AbsoluteThickness[1.6], PointBox[CompressedData["
1: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
mMIt0SCcW6rBhOjMqTlhZJkGUdxyDbpikuew/WRoMJhbocHIDMUBzxKyUoNp
3GoN7unvLLrcqYzya1DHwGzVoHxlpf3epDuUX4Nn3HYNXnM7NHjL7dRg18kH
WSuKyK6q/fVZH3fkCLlcg/dMnW36oXcpfyLe55Ymoj23LBGDlF6/9xlJlidi
CDcSMZJbkYiJ3MpENFnu/3nhMbI6Ea/E+TDlT0QltzURdQuZbYmoz21PRFtu
RyLGftp3WY/5ZGdVfW5XIqZxlycipe3lz1plkiVJSOeWJsHKLUty3y9Q/iQU
cSMJx7kVSTjNrUzCWW51kvt+hfIn4XduaxLebTxx9tj/ufMnITai5eoyjweU
v+p4uR1JaLJoxSdBncjOJPhwu5KgefFk4WGfcsqfhBRuSTIWdXl50GsYWZqM
GG5ZMuQfbPzz6kuyPBlfciMZ3517PuPcT48pfzLWciuT8QO3OhknxPtHyp+M
U9zWZJzhtiXjPLc9GZ/k/eb/ywuyIxne0zr3TH9DdiajHbcrmcaPJ5Q/ma5f
ZEkK3Y+QpbUsS6HrG1me4r4fp/wpNB6RFSkYyK1MQV7B/Nuvh5DVKcgadFIX
YSILVe3c1hSs5LalYBW3PQVzDlz+88JTsqPKMbuSBlY8pfwpiON2pWDvU/8+
m43PKH8KYgY/eaP/iSxJhYZbmordh1ILn/d/TvlTUcQtT8UpbqSi1ejIsU8/
fEH5U3EyPjE4dhBZmYriuGkTZw8mq1PxK7eQilxxvYnyp2Ilty0Vq7jtqXgr
rodR/lSIOSoofyrqcLtSUY+7PBX1uSVpaMAtTYPnj9OfJA4gy2pZnoYm3EhD
c25FGsIbLx/TL5isrGV1GiK5hTQsDRt4KcxItqZhDbctDY9a50yc1O8V5U/D
K25HGt5yO9PQeU/xhcdasisNOz37x3b+H7k8DQe5Jek4xi1Nx5vQF/1d4a8p
fzrqhTHL0zESPbrklZKRjvHcinSEiuu5lD8dYdzqdPimzG3XxEYW0vEZt7WW
bel4/abg5sGtZHs6PW8gO9JxituZjgc/Dv/A9xHZVcvlVXm+WaFqU0mWCGjE
7SHg08shbRt2fEvnQ0Bvbm8BmooLp9odIMsEZHH7CvDK2HK8ddNKOl8Cvl/Y
/sZDKdlPwDpuCNjZWqkZO5YcKGA3t0LAPu5gAUe4lQLGBA1Uzx1HVgmYyq0W
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
pxUjixbXt1/tiP8DPf+wQw==
      "]]}, {}}, {}, {}, {{}, {}}, {{}, {}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"i\"", TraditionalForm], 
    FormBox[
    "\"\\!\\(\\*SubscriptBox[\\(\[Lambda]\\), \\(i\\)]\\)\"", 
     TraditionalForm]},
  AxesOrigin->{0., 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  ImagePadding->All,
  Method->{"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
        (Identity[#]& )[
         Part[#, 1]], 
        (Identity[#]& )[
         Part[#, 2]]}& ), "CopiedValueFunction" -> ({
        (Identity[#]& )[
         Part[#, 1]], 
        (Identity[#]& )[
         Part[#, 2]]}& )}},
  PlotRange->{{0., 1024.}, {-6.058269738745128, 10.931030409731324`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output",ExpressionUUID->"8598834c-0d11-\
4043-a4d7-7b73c8b0d7ab"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Construct local Hamiltonian operator terms", "Subsection",ExpressionUUID->"ab8a7720-61f7-4fd9-99f1-818170df1b4e"],

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
          RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}]}], "]"}]}]}]], "Input",E\
xpressionUUID->"0890f983-3b8b-4933-828b-1b1ae2aa8216"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["h", "sym"], "=", 
   RowBox[{"h2", "[", 
    RowBox[{"t", ",", "U", ",", "\[Mu]", ",", 
     SubscriptBox["L", "val"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input",ExpressionUUID->"e98a498f-\
2391-481e-8c82-a0a0541f2278"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "16", ",", "16"}], "}"}]], "Output",ExpressionUUID->\
"7accea08-ae7d-4974-b343-1693bbcc04cb"]
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
   SubscriptBox["h", "sym"]}]}]], "Input",ExpressionUUID->"2de7fa34-6333-4d13-\
8e6e-141993c0a2c0"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]], "Output",ExpressionUUID\
->"24842a2c-3c58-455e-b6f1-ed67588b7486"]
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
   SubscriptBox["h", "sym"]}]}]], "Input",ExpressionUUID->"9c486eec-c79e-4060-\
b1ac-16cae8239b8e"],

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
     MatrixForm[BoxForm`e$]]]}], "}"}]], "Output",ExpressionUUID->"2debebe8-\
98df-4ca3-b148-8c55b07afcdb"]
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
      "]"}], "]"}]}], "]"}]}]], "Input",ExpressionUUID->"fde4682d-c777-4702-\
8404-c73119d30b94"],

Cell[BoxData["0"], "Output",ExpressionUUID->"796a98fd-c9a1-4df6-bda0-3e9c7b7b2c34"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{
     RowBox[{"entries", " ", "are", " ", "non"}], "-", 
     RowBox[{"zero", " ", "for", " ", "matching", " ", "occupation", " ", 
      RowBox[{"(", 
       RowBox[{"particle", " ", "number"}], ")"}], " ", "quantum", " ", 
      "numbers", " ", "only"}]}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"qd", "=", 
       RowBox[{"{", 
        RowBox[{"0", ",", "1", ",", "1", ",", "2"}], "}"}]}], ",", "qd2"}], 
     "}"}], ",", 
    RowBox[{
     RowBox[{"qd2", "=", 
      RowBox[{"Flatten", "[", 
       RowBox[{"Outer", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"#1", "+", "#2"}], "&"}], ",", "qd", ",", "qd"}], "]"}], 
       "]"}]}], ";", 
     RowBox[{"Total", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"MPOBlockStructureError", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{"ArrayReshape", "[", 
             RowBox[{"#", ",", 
              RowBox[{"{", 
               RowBox[{"16", ",", "16", ",", "1", ",", "1"}], "}"}]}], "]"}], 
            ",", 
            RowBox[{"{", "0", "}"}], ",", 
            RowBox[{"{", "0", "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"qd2", ",", "qd2"}], "}"}]}], "]"}], "&"}], "/@", 
       SubscriptBox["h", "sym"]}], "]"}]}]}], "]"}]}]], "Input",ExpressionUUID\
->"e03e0153-fc62-42bc-be4d-1ac44ef27e29"],

Cell[BoxData["0"], "Output",ExpressionUUID->"0731216c-75c0-4f96-8e8d-9a24bdee4be1"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{
     RowBox[{"entries", " ", "are", " ", "non"}], "-", 
     RowBox[{
     "zero", " ", "for", " ", "matching", " ", "spin", " ", "quantum", " ", 
      "numbers", " ", "only"}]}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"qd", "=", 
       RowBox[{"{", 
        RowBox[{"0", ",", 
         RowBox[{"-", "1"}], ",", "1", ",", "0"}], "}"}]}], ",", "qd2"}], 
     "}"}], ",", 
    RowBox[{
     RowBox[{"qd2", "=", 
      RowBox[{"Flatten", "[", 
       RowBox[{"Outer", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"#1", "+", "#2"}], "&"}], ",", "qd", ",", "qd"}], "]"}], 
       "]"}]}], ";", 
     RowBox[{"Total", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"MPOBlockStructureError", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{"ArrayReshape", "[", 
             RowBox[{"#", ",", 
              RowBox[{"{", 
               RowBox[{"16", ",", "16", ",", "1", ",", "1"}], "}"}]}], "]"}], 
            ",", 
            RowBox[{"{", "0", "}"}], ",", 
            RowBox[{"{", "0", "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"qd2", ",", "qd2"}], "}"}]}], "]"}], "&"}], "/@", 
       SubscriptBox["h", "sym"]}], "]"}]}]}], "]"}]}]], "Input",ExpressionUUID\
->"0b0bd1b4-e563-497f-9475-f65bbd5dd190"],

Cell[BoxData["0"], "Output",ExpressionUUID->"d9a303f4-808a-4711-968f-91b366488574"]
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
         RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input",\
ExpressionUUID->"3c7c2649-15da-4717-aae2-8539d85d27cf"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Matrix product operator representation of Hamiltonian", "Subsection",ExpressionUUID->"bcac7908-1436-4661-9af4-ed8a2ddb57e5"],

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
   "]"}]}]], "Input",ExpressionUUID->"341f0c9f-4ab3-4088-a1c1-361ee73c358a"],

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
    RowBox[{"1", ";;", "1"}]}], "\[RightDoubleBracket]"}]}]}], "Input",Express\
ionUUID->"26ca1e88-cae7-441d-97c0-ec74a5182b79"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"W", "[", 
     RowBox[{"t", ",", "U", ",", "\[Mu]"}], "]"}], "//", "MatrixForm"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input",ExpressionUUID->\
"dad39351-d9a9-47b3-8fb1-22af86a71425"],

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
       2 $CellContext`\[Mu], 1}}]]]]], "Output",ExpressionUUID->"c6d4194a-\
04b1-405a-9f86-0cbc219eaa9c"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "6", ",", "6"}], "}"}]], "Output",ExpressionUUID\
->"3b7c87fb-40e4-421e-aab2-18f7ca097b4a"]
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
     "]"}]}], "]"}]}]], "Input",ExpressionUUID->"62aa7ecf-baab-48ca-89d8-\
05940207fb90"],

Cell[BoxData["0"], "Output",ExpressionUUID->"86b0ca94-ec30-423d-9bc4-03ac81b01011"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{
     RowBox[{"entries", " ", "are", " ", "non"}], "-", 
     RowBox[{"zero", " ", "for", " ", "matching", " ", "occupation", " ", 
      RowBox[{"(", 
       RowBox[{"particle", " ", "number"}], ")"}], " ", "quantum", " ", 
      "numbers", " ", "only"}]}]}], " ", "*)"}], "\[IndentingNewLine]", 
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
         RowBox[{"qd", ",", "qd"}], "}"}]}], "]"}]}]}]}], "]"}]}]], "Input",Ex\
pressionUUID->"8e5a974f-e1bc-4f84-9492-552c77107b1f"],

Cell[BoxData["0"], "Output",ExpressionUUID->"66b022fc-7137-4f95-a4a0-765676cb38dd"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{
     RowBox[{"entries", " ", "are", " ", "non"}], "-", 
     RowBox[{
     "zero", " ", "for", " ", "matching", " ", "spin", " ", "quantum", " ", 
      "numbers", " ", "only"}]}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "qd", ",", 
      RowBox[{"qD", "=", 
       RowBox[{"{", 
        RowBox[{"0", ",", "1", ",", 
         RowBox[{"-", "1"}], ",", 
         RowBox[{"-", "1"}], ",", "1", ",", "0"}], "}"}]}]}], "}"}], ",", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"{", 
       RowBox[{"0", ",", 
        RowBox[{"-", "1"}], ",", "1", ",", "0"}], "}"}]}], ";", 
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
         RowBox[{"qd", ",", "qd"}], "}"}]}], "]"}]}]}]}], "]"}]}]], "Input",Ex\
pressionUUID->"195f67dd-6b03-45f0-aeee-37e144509824"],

Cell[BoxData["0"], "Output",ExpressionUUID->"d9c89125-9d3f-4871-99d9-6428cc15462c"]
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
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input",Ex\
pressionUUID->"f5c49aaf-1b77-4ead-a78e-0df1416e1ebe"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1914, 964},
WindowMargins->{{51, Automatic}, {22, Automatic}},
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
Cell[1486, 35, 103, 0, 63, "Section", "ExpressionUUID" -> \
"be4704ea-c891-4e2e-938c-74292c69effb"],
Cell[1592, 37, 180, 4, 30, "Input", "ExpressionUUID" -> \
"c1cb6f1e-b6e3-4a31-b35e-a28ec44ee89b"],
Cell[1775, 43, 123, 1, 30, "Input", "ExpressionUUID" -> \
"54336e7e-52ae-4ff4-bb74-2c805a7a52d6"],
Cell[1901, 46, 231, 6, 30, "Input", "ExpressionUUID" -> \
"eb189ff9-e54a-486d-9046-fa8702d130d9"],
Cell[CellGroupData[{
Cell[2157, 56, 96, 0, 43, "Subsection", "ExpressionUUID" -> \
"cedb01fc-84e5-40d3-9256-b1e1e9758c3e"],
Cell[2256, 58, 435, 11, 30, "Input", "ExpressionUUID" -> \
"5f99962f-fa19-4412-9c7c-00aeca048e26"],
Cell[2694, 71, 1200, 40, 107, "Input", "ExpressionUUID" -> \
"8b7c3335-5172-434f-bb79-a7af9c3187a2"],
Cell[CellGroupData[{
Cell[3919, 115, 455, 14, 74, "Input", "ExpressionUUID" -> \
"ae472cd2-4a9a-4160-ab87-393fbf60ffaa"],
Cell[4377, 131, 228, 7, 30, "Output", "ExpressionUUID" -> \
"719b1322-04e0-415c-a7f4-6dde852a0a96"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4642, 143, 447, 13, 74, "Input", "ExpressionUUID" -> \
"8a5cae93-4cd8-445e-8826-7ed50cf9b26d"],
Cell[5092, 158, 228, 7, 30, "Output", "ExpressionUUID" -> \
"067add39-296b-4b25-b8cc-a3b9407bd309"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5357, 170, 329, 9, 50, "Input", "ExpressionUUID" -> \
"82c855f7-e66b-4c03-b460-48701de27335"],
Cell[5689, 181, 228, 7, 30, "Output", "ExpressionUUID" -> \
"054201b3-bcba-4bbe-b871-a03313865a8e"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5954, 193, 241, 6, 30, "Input", "ExpressionUUID" -> \
"29544b3f-51d4-4954-8194-e2339a7cd286"],
Cell[6198, 201, 716, 20, 94, "Output", "ExpressionUUID" -> \
"8c414901-3644-4011-826b-c497a9cb748d"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6951, 226, 258, 7, 30, "Input", "ExpressionUUID" -> \
"229365ec-1d35-42b4-b5e5-86c1cee86c97"],
Cell[7212, 235, 716, 20, 94, "Output", "ExpressionUUID" -> \
"5471ac3b-5dd8-4a01-a8da-127f95bd1ac6"]
}, Open  ]],
Cell[7943, 258, 354, 10, 30, "Input", "ExpressionUUID" -> \
"d24e3fd0-f826-4674-bfd3-555c303ad3d4"]
}, Open  ]],
Cell[CellGroupData[{
Cell[8334, 273, 160, 2, 43, "Subsection", "ExpressionUUID" -> \
"b2dbf992-1f26-4cc6-ba99-21dc85dcf87c"],
Cell[8497, 277, 1417, 38, 55, "Input", "ExpressionUUID" -> \
"cc83fdde-9b12-489b-bdc1-ee55306a82a5"],
Cell[9917, 317, 823, 22, 55, "Input", "ExpressionUUID" -> \
"420a4348-e5d2-455d-ad41-74385b37a913"],
Cell[10743, 341, 760, 21, 55, "Input", "ExpressionUUID" -> \
"56ae3577-7512-4e7e-b636-e74f706c2c34"],
Cell[11506, 364, 638, 17, 50, "Input", "ExpressionUUID" -> \
"8983d91b-0d91-4866-ad5c-78f10478deeb"],
Cell[12147, 383, 290, 8, 50, "Input", "ExpressionUUID" -> \
"0f2e57b0-a247-40f2-920d-d43457ebfb17"],
Cell[12440, 393, 327, 9, 50, "Input", "ExpressionUUID" -> \
"55e168fb-b678-4c40-8a15-1b56d1287944"],
Cell[12770, 404, 298, 9, 50, "Input", "ExpressionUUID" -> \
"091109bc-97cc-423d-ace2-f32e97861eba"],
Cell[13071, 415, 296, 8, 50, "Input", "ExpressionUUID" -> \
"52dbc719-c4d7-43cf-becc-982fea075f87"],
Cell[CellGroupData[{
Cell[13392, 427, 321, 9, 30, "Input", "ExpressionUUID" -> \
"eef359c3-737b-4dbb-8143-00b26af162f7"],
Cell[13716, 438, 9232, 190, 72, "Output", "ExpressionUUID" -> \
"dc230cd5-72cb-4134-9179-03e55901e8ae"]
}, Open  ]],
Cell[CellGroupData[{
Cell[22985, 633, 396, 10, 50, "Input", "ExpressionUUID" -> \
"b79bf649-6ad3-47bf-ac65-a476d9021e72"],
Cell[23384, 645, 83, 0, 30, "Output", "ExpressionUUID" -> \
"542f73c3-6129-440a-8ab1-442865c5fbca"]
}, Open  ]],
Cell[23482, 648, 332, 9, 30, "Input", "ExpressionUUID" -> \
"c4621fc3-e1cf-42e0-a4f7-97619dc6249d"],
Cell[CellGroupData[{
Cell[23839, 661, 333, 9, 30, "Input", "ExpressionUUID" -> \
"5e17015a-62d7-4993-9dac-27f55dae1f3a"],
Cell[24175, 672, 10721, 192, 246, "Output", "ExpressionUUID" -> \
"8598834c-0d11-4043-a4d7-7b73c8b0d7ab"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[34945, 870, 119, 0, 43, "Subsection", "ExpressionUUID" -> \
"ab8a7720-61f7-4fd9-99f1-818170df1b4e"],
Cell[35067, 872, 3608, 94, 151, "Input", "ExpressionUUID" -> \
"0890f983-3b8b-4933-828b-1b1ae2aa8216"],
Cell[CellGroupData[{
Cell[38700, 970, 321, 8, 52, "Input", "ExpressionUUID" -> \
"e98a498f-2391-481e-8c82-a0a0541f2278"],
Cell[39024, 980, 142, 3, 30, "Output", "ExpressionUUID" -> \
"7accea08-ae7d-4974-b343-1693bbcc04cb"]
}, Open  ]],
Cell[CellGroupData[{
Cell[39203, 988, 370, 11, 52, "Input", "ExpressionUUID" -> \
"2de7fa34-6333-4d13-8e6e-141993c0a2c0"],
Cell[39576, 1001, 150, 3, 30, "Output", "ExpressionUUID" -> \
"24842a2c-3c58-455e-b6f1-ed67588b7486"]
}, Open  ]],
Cell[CellGroupData[{
Cell[39763, 1009, 427, 11, 52, "Input", "ExpressionUUID" -> \
"9c486eec-c79e-4060-b1ac-16cae8239b8e"],
Cell[40193, 1022, 4347, 129, 139, "Output", "ExpressionUUID" -> \
"2debebe8-98df-4ca3-b148-8c55b07afcdb"]
}, Open  ]],
Cell[CellGroupData[{
Cell[44577, 1156, 1417, 36, 55, "Input", "ExpressionUUID" -> \
"fde4682d-c777-4702-8404-c73119d30b94"],
Cell[45997, 1194, 83, 0, 30, "Output", "ExpressionUUID" -> \
"796a98fd-c9a1-4df6-bda0-3e9c7b7b2c34"]
}, Open  ]],
Cell[CellGroupData[{
Cell[46117, 1199, 1509, 43, 71, "Input", "ExpressionUUID" -> \
"e03e0153-fc62-42bc-be4d-1ac44ef27e29"],
Cell[47629, 1244, 83, 0, 30, "Output", "ExpressionUUID" -> \
"0731216c-75c0-4f96-8e8d-9a24bdee4be1"]
}, Open  ]],
Cell[CellGroupData[{
Cell[47749, 1249, 1457, 43, 71, "Input", "ExpressionUUID" -> \
"0b0bd1b4-e563-497f-9475-f65bbd5dd190"],
Cell[49209, 1294, 83, 0, 30, "Output", "ExpressionUUID" -> \
"d9a303f4-808a-4711-968f-91b366488574"]
}, Open  ]],
Cell[49307, 1297, 1779, 46, 52, "Input", "ExpressionUUID" -> \
"3c7c2649-15da-4717-aae2-8539d85d27cf"]
}, Open  ]],
Cell[CellGroupData[{
Cell[51123, 1348, 130, 0, 43, "Subsection", "ExpressionUUID" -> \
"bcac7908-1436-4661-9af4-ed8a2ddb57e5"],
Cell[51256, 1350, 3986, 107, 88, "Input", "ExpressionUUID" -> \
"341f0c9f-4ab3-4088-a1c1-361ee73c358a"],
Cell[55245, 1459, 769, 20, 50, "Input", "ExpressionUUID" -> \
"26ca1e88-cae7-441d-97c0-ec74a5182b79"],
Cell[CellGroupData[{
Cell[56039, 1483, 352, 9, 69, "Input", "ExpressionUUID" -> \
"dad39351-d9a9-47b3-8fb1-22af86a71425"],
Cell[56394, 1494, 13839, 332, 438, "Output", "ExpressionUUID" -> \
"c6d4194a-04b1-405a-9f86-0cbc219eaa9c"],
Cell[70236, 1828, 150, 3, 30, "Output", "ExpressionUUID" -> \
"3b7c87fb-40e4-421e-aab2-18f7ca097b4a"]
}, Open  ]],
Cell[CellGroupData[{
Cell[70423, 1836, 1299, 34, 50, "Input", "ExpressionUUID" -> \
"62aa7ecf-baab-48ca-89d8-05940207fb90"],
Cell[71725, 1872, 83, 0, 30, "Output", "ExpressionUUID" -> \
"86b0ca94-ec30-423d-9bc4-03ac81b01011"]
}, Open  ]],
Cell[CellGroupData[{
Cell[71845, 1877, 1904, 51, 69, "Input", "ExpressionUUID" -> \
"8e5a974f-e1bc-4f84-9492-552c77107b1f"],
Cell[73752, 1930, 83, 0, 30, "Output", "ExpressionUUID" -> \
"66b022fc-7137-4f95-a4a0-765676cb38dd"]
}, Open  ]],
Cell[CellGroupData[{
Cell[73872, 1935, 1851, 51, 69, "Input", "ExpressionUUID" -> \
"195f67dd-6b03-45f0-aeee-37e144509824"],
Cell[75726, 1988, 83, 0, 30, "Output", "ExpressionUUID" -> \
"d9c89125-9d3f-4871-99d9-6428cc15462c"]
}, Open  ]],
Cell[75824, 1991, 2753, 71, 69, "Input", "ExpressionUUID" -> \
"f5c49aaf-1b77-4ead-a78e-0df1416e1ebe"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* NotebookSignature 4vTiSmqHtLiICBKdxk6oVvLR *)
