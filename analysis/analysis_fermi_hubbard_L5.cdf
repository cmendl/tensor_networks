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
NotebookDataLength[    335610,       7405]
NotebookOptionsPosition[    323713,       7106]
NotebookOutlinePosition[    324058,       7121]
CellTagsIndexPosition[    324015,       7118]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Fermi-Hubbard model simulation", "Section",ExpressionUUID->"23d4ce0c-01cd-4fe6-8d09-d6f63ad30678"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";"}]], "Input",ExpressionU\
UID->"7c83c872-d4e0-43fe-a07a-1e32d51e6824"],

Cell[BoxData[
 RowBox[{"<<", "../mathematica/tn_base.m"}]], "Input",ExpressionUUID->"bb32c657-aeb2-4fa8-ad29-c86830cbefb3"],

Cell[CellGroupData[{

Cell["General definitions", "Subsection",ExpressionUUID->"f6d8541c-f538-4de7-b393-cd9490cb304d"],

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
  "*)"}]], "Input",ExpressionUUID->"be8962ad-749e-466d-8f8c-f886982bdaa5"],

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
nUUID->"fc865819-6d0a-4f6c-8cc0-bf86e12f54f0"],

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
->"3560e00a-2d89-4b7e-b64f-67b9d0a78342"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0"}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"9d68ac50-25e1-4039-a9f2-5e31c895e940"]
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
->"e30db708-060e-45c4-8d09-d1c8669bc2b2"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "0"}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"ea570dfe-9704-4323-9c0f-788d0d6d8e6e"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  SubscriptBox["a", "create"], ".", 
  SubscriptBox["\[Sigma]", "3"]}]], "Input",ExpressionUUID->"d4b2811a-523d-\
47fc-8465-16d61ebb0515"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "0"}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"1b9c22b2-dc40-4dfc-b870-f65d8d3465a0"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  SubscriptBox["a", "annihil"], ".", 
  SubscriptBox["\[Sigma]", "3"]}]], "Input",ExpressionUUID->"759dfb0b-f315-\
461a-972b-600e45bb6e3a"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", 
     RowBox[{"-", "1"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0"}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"003f764d-b1d2-41dd-911b-db1245b7d6fa"]
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
    SubscriptBox["a", "annihil"]}]}]}]], "Input",ExpressionUUID->"9d6437b4-\
c321-430d-9cbf-4d98ac981d30"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "1"}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"39517527-55b0-4241-8187-5ed71504a966"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"KroneckerProduct", "[", 
   RowBox[{
    SubscriptBox["a", "number"], ",", 
    SubscriptBox["a", "number"]}], "]"}], "//", "MatrixForm"}]], "Input",Expre\
ssionUUID->"b4541db4-80d9-476f-9ead-4f48f4769a93"],

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
   MatrixForm[BoxForm`e$]]]], "Output",ExpressionUUID->"2fd8c620-a16b-4d2d-\
aa55-2be0dd487cc6"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"KroneckerProduct", "[", 
   RowBox[{
    SubscriptBox["a", "create"], ",", 
    RowBox[{"IdentityMatrix", "[", "2", "]"}]}], "]"}], "//", 
  "MatrixForm"}]], "Input",ExpressionUUID->"d088ab65-8168-415f-9ae0-\
d36098a55bc3"],

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
   MatrixForm[BoxForm`e$]]]], "Output",ExpressionUUID->"ef46bcc7-8f80-4f0a-\
b22d-c603361c3c68"]
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
"0d2bd98f-bd01-491b-9e25-c4ccd0ef6816"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Fermi-Hubbard Hamiltonian using Jordan-Wigner transformation", \
"Subsection",ExpressionUUID->"3599a0c7-7039-403a-90bf-7ef5223f62a7"],

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
ionUUID->"1a27ba07-c05c-44da-aa69-ef990e85cdb8"],

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
onUUID->"7b764b80-56bf-4f17-bc12-4e09eb7fe70d"],

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
"06c74b0c-8e36-4efc-bf52-db095dec2c9b"],

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
"36be7205-13ef-4c62-a927-236e82475250"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Simulation parameters", "Subsection",ExpressionUUID->"5f1f16de-31bd-4692-937f-05fd052f0e80"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"number", " ", "of", " ", "lattice", " ", "sites"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["L", "val"], "=", "5"}], ";"}]}]], "Input",ExpressionUUID->\
"c3af266f-f957-44db-b10a-1fa90cfa0fa4"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"nearest", " ", "neighbor", " ", "hopping", " ", "amplitude"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["t", "val"], "=", "1"}], ";"}]}]], "Input",ExpressionUUID->\
"3f9ffb97-c8db-4536-aeef-b6acfb9525a3"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"interaction", " ", "strength"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["U", "val"], "=", "2"}], ";"}]}]], "Input",ExpressionUUID->\
"f9f07118-bd34-45c1-9574-206e1e96da98"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"chemical", " ", "potential"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["\[Mu]", "val"], "=", 
    RowBox[{"1", "/", "7"}]}], ";"}]}]], "Input",ExpressionUUID->"cc4a49b0-\
a637-4845-85f5-df107f9c113e"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  SubscriptBox["H", "hubbard"], "=", 
  RowBox[{"HHubbard", "[", 
   RowBox[{
    SubscriptBox["t", "val"], ",", 
    SubscriptBox["U", "val"], ",", 
    SubscriptBox["\[Mu]", "val"], ",", 
    SubscriptBox["L", "val"]}], "]"}]}]], "Input",ExpressionUUID->"0acbcdf3-\
28e2-43c1-9831-bb98ba9e8d5f"],

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
                    FractionBox["1", "7"]}], ContentPadding -> False, 
                    FrameMargins -> 0, StripOnInput -> True, BaselinePosition -> 
                    Baseline, ImageSize -> {{1, 300}, Automatic}], 
                    LineBreakWithin -> False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"2", ",", "5"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{"-", "1"}], ContentPadding -> False, FrameMargins -> 
                    0, StripOnInput -> True, BaselinePosition -> Baseline, 
                    ImageSize -> {{1, 300}, Automatic}], LineBreakWithin -> 
                    False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"3", ",", "3"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{"-", 
                    FractionBox["1", "7"]}], ContentPadding -> False, 
                    FrameMargins -> 0, StripOnInput -> True, BaselinePosition -> 
                    Baseline, ImageSize -> {{1, 300}, Automatic}], 
                    LineBreakWithin -> False]}]}, {
                    RowBox[{
                    RowBox[{"{", 
                    RowBox[{"3", ",", "9"}], "}"}], "\[Rule]", 
                    StyleBox[
                    PaneBox[
                    RowBox[{"-", "1"}], ContentPadding -> False, FrameMargins -> 
                    0, StripOnInput -> True, BaselinePosition -> Baseline, 
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
   InterpretationFunction->("SparseArray[<5119>, {1024, 1024}]"& )],
  False,
  Editable->False,
  SelectWithContents->True,
  Selectable->False]], "Output",ExpressionUUID->"4fffe0d1-8dd7-479a-96d7-\
3c8c1ce387c8"]
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
onUUID->"1c6246be-9532-41ad-9870-70e7f7b434a8"],

Cell[BoxData["0"], "Output",ExpressionUUID->"4f749854-a918-4ee6-ba94-535409392084"]
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
  ";"}]], "Input",ExpressionUUID->"c5c12da9-eeb5-41d9-af46-264215b6974f"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListPlot", "[", 
  RowBox[{
   SubscriptBox["\[Lambda]", "list"], ",", 
   RowBox[{"AxesLabel", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{
     "\"\<i\>\"", ",", "\"\<\!\(\*SubscriptBox[\(\[Lambda]\), \(i\)]\)\>\""}],
      "}"}]}]}], "]"}]], "Input",ExpressionUUID->"e130869f-9d62-4175-b7ae-\
15bccdacb998"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
     0.0055000000000000005`], AbsoluteThickness[1.6], PointBox[CompressedData["
1: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
ZdX5i2QHzrwhOzX4irtcgzXcLg02cFdp8D23SIvduebdR6WNPPbSYh+3WAsH
t7cWlp3Kb3+fTJZo0aWk1+vbcWRfLdprDq5UZZKlWvhw+2nhyw0tenP7a/H0
wrb7pWqyTIuX3MFaev6T5W858i0rtJTTy/NT+ZYFLepw67Woz23VohF3gRZ/
ePZPemzTwsldqEUFt12LB9xFWowNPZUQMIzs0GIid7EWHX+JmfByFLm0+vxw
l1Wf32Y/Tn8YQHZWH88P2y6emk4u10Ln3j9Hdmlh5a7SYsaYDxscs5FFuZBz
e+Uioa3546anyOJcpHB75+KRNPiC/12y5C375qKKW5qLie75SmOP/XIh40Yu
4rn9c2k+Q5bl0nyGHJxL8xOyPJfmI+TI6nrcilxM4lbmwsez/9ZjIZfmJ2R9
LgZyW3PRqcX8HeJN5IJcPGjx335Isi0XTVsyF+ZCzG3PhbHpymWnHpOLclHA
7cjFOvd8pYnHxbk0nyGX5tJ6FbksF6u5nblQuucT5PK37MrFsY97fvpPBbkq
F6e4RToM6CjpU+HT1GMvHSa596eSxTrsde93JXvrsJ9bosMxbl8dzQfIUh16
fbbNqk0k++mwtXsjZ5SODB12cfvr8Lcy+U3YarJMhyhHyIOcls08DtYhhluu
w5abXa9cnEGO1FU/L3YWvZtAVuiwhlupw0ZuQYc4935gsl6HDG6rDo0r/9tf
TC7QoSW3TYe23IU6eHPbdZC8mNFrwSZykQ7duR3V54e7uPp4hk/7uGAvuVSH
VO4yHSa69z+TnTpM5y7XIZzbpUPeyuAvvviLXKXDtsi03c2ekkV67Of20lf/
Pv7T5NNNmnss1iOV21uPn42zWg1qSZboYVzzrjyuA9lXjxOPG/ieKyBL9TjP
7adH2CuhbtpmMvSYz+2vRza3TI+h7v3h5GA9xnPL9RjevU/isBpH6jGJW6HH
DG6lHqHcgh5b/MUBQ9u08Fivx8SYHVP/bU+26rHLvX5GLtDjMLdNj1LuQj2K
XngXD71PtlefX+4iPVa6n79khx7ruYv12Mtdqsf37v32LT0u0yNWnbhBnkd2
Vr/fNOF3WRm5XI8D3C49KtzPQ3KVnp6PZFEeXnJ75eFfbnEePR/FHnvnwYtb
kodKPFsoqkP2zcMTbmkeIr8ZUq9/a7JfHtK4kQeB2z8PKm5ZHqTbrIm7BpKD
8yC+d/f4qwiyPA+tuCPzsPRct5eubLIiD99+Pb2rt0BWvmUhD/u49XmYebTL
tUwV2ZqHaO6CPGwOrPf1LRPZlgc7d2EeirjteTg7eVms1kIuyoO3e75MduSh
M3dxHs2nyaV5WP3gVI+0jeSyPHzF7czDOu7yPLSYlP9KW0l25aE1d1Ue2nGL
8tHC++GF35+SvfLRiVucjz1XW+pGvaq5/vkQdbIqkju08liSj5anOnw41Yfs
m4+23NJ8Wr8l++UjmBv5kHfvG7lrCNk/HymXVlxtoyXL8mHhDs7HMm55PmzN
l2001DgyH3u5FdXH3yB8ZNI2sjIfh7mFfBzh1ufjOLc1HzPVwyqH7iUX5KNx
9oRFH5WQbfnozF2Yjzmn249scIpsz8dC7qJ83Gjh9WWDa2RHPv7iLs5HJXdp
PowHvLZF3SCX5WMptzMfobMnnnu/Q2uPy/Mxj9uVj0TuqnxcaDIget/nZJEB
L9pPa7hmJtnLgOTj7Zpc0pDFBozPUZuKl5C9DZBxSwyYye1rwHfBO/sGrSFL
DSji9jPgh1T/ZYpvyTBgD7e/AX7jY2eOKyHLDGjc5t19a++Tgw34gFtugJQ7
0oBB3AoDckbt9JnaqI3HSgM0K1cnv9ebLBiQz6034LR7/kK2Gmj9nFxgwBVu
mwFXuQsNuMNtf8tFBoyaXXj1bjbZYcBo7mIDZnCXVud5MlL+6hy5zIAx3M7q
68NdbkDqzKOvfr1Pdhlg5K4ywLNcShYZ0cz98x2PvYyY6h5/yWIjZnN7G4GP
DYu79iVLjBjJ7WtEbmPF7wtkZKkRNm4/I567/96PDCPq3mT2N2JG88RDaYvJ
sup2S++kuqnkYCOac8uN6MYdaUQf9/hJVhgxocWAbPsKstKIxnWufeuzjiwY
0YZbb0TX71YO7rKZbDXiwekmH/a7SS4w4hG3rTq/++8d23pcWH2+uO1GKLiL
qtu/dI4b1onsMGIhd7ERk6OuxIhGkUuNCOMuMyKe22lE3w0FrRKDyOVGDOJ2
GdFzYN6nXvPIVUas+enO/O5RZJEJEx8eu7H8B7KXCdHcYhNKLvn92aSE7G3C
NW6JCbM2Dgz9u5zsa0KdE+oV02a967HUhNbcfib4cMOEpar1FVviyf4mmIy5
s4PWkGUmaAfW9Vl5nBxsgoVbbqLvQ8mRJhzkVpjQzT0ekJUm9OIWTPiIW2/C
AG6rCa87LurtI27ncYEJR6Yfzor+jGwz4T53oQlzHIu7P44m200odn/+yUUm
lHI7TGizh7nYhHHuzz+51AQZd5kJMdxOE9qlf+vK3U0uN2E4t8uEHQcjdj4+
Ra4yoYhbZMY9bi8ztmpPGEedI4vNOMntbYbTPX6QJWbc4fY144PlXl183vX2
WGrG8Ervws3LyX5m9Op9K+LiATLMCOD2N6OBodBZcYYsM2OFXnqgyeD3PA42
48HDkFGDY8hyM95wR5rRw8WsMEN2zHzrsJKsNGM+t2CGX8nznnEast6MWdxW
M3buHdtq70ZygRlN6qf01TVs77HNjBjuQjMqS/67v8l2M93v5KLqetwOM92/
5GIz9nKXmiFy34/kMjOGcjvNWCzz6ZQzrIPH5WZs43aZ8SQtMLk8gFxlpvuR
LLLg9rWFMz66S/ayoLGTWWyBmNvbgiVDB9ya+IAssaCN1091t1SRfS3oxi21
YNP68KdJwzt67GfB4s/fWa7cSIYFK7j9LejaWuw98whZZkG/hxm29yZ28jjY
ggkvQtscUZLlFqxvM3JXwa/kSAvOcSss8D+6dlBZx84eKy0Yxy1Y8MB9vch6
C41XZKsF/bkLLHS9yDYL3nAXVvef+09IO0UXj+0WVBQc6jh6FbnIAq9VzA4L
MqrUX0zfQi62IMqh9Mu9JfG41II47jILfK+9rkhp1tVjpwUfc5dbEJm44t0t
rckuC33/R66y4LupuglXw8kiK17t7Hzbu5cP/g8sKO3y
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
  PlotRange->{{0., 1024.}, {-4.737468680812016, 9.082221183774884}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output",ExpressionUUID->"93e1c680-dafe-\
436d-b46a-2db961c865a2"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"inverse", " ", "temperature"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["\[Beta]", "val"], "=", 
    RowBox[{"1", "/", "10"}]}], ";"}]}]], "Input",ExpressionUUID->"b319e25a-\
7008-4dcb-93a6-7fa64fdb3fea"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["t", "list"], "=", 
   RowBox[{"Range", "[", 
    RowBox[{"0", ",", "5", ",", 
     RowBox[{"1", "/", "4"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Length", "[", "%", "]"}]}], "Input",ExpressionUUID->"f87866f5-405a-\
49bf-a79d-ebeabcb57cca"],

Cell[BoxData["21"], "Output",ExpressionUUID->"0e7ee2aa-47a9-4037-93be-ae27fb309498"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[{
 "Compare MPO representation of ",
 Cell[BoxData[
  FormBox[
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "\[Beta]"}], " ", 
     RowBox[{"H", "/", "2"}]}]], TraditionalForm]],ExpressionUUID->
  "5df3f8a5-4056-4a04-a11e-a6b1c7a2f71c"],
 " with reference calculation"
}], "Subsection",ExpressionUUID->"7c0d5a1e-238d-43e4-b509-3ebfc698e915"],

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
xpressionUUID->"245b2739-e49a-4ba4-b89d-5e21d796c922"],

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
      "]"}], "]"}]}], "]"}]}]], "Input",ExpressionUUID->"474d7d89-9161-4899-\
bf6c-272cc1d1cf9a"],

Cell[BoxData["0"], "Output",ExpressionUUID->"b9b8c1c3-572c-4c38-b33c-195bcfcad0ec"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"MPO", " ", "representing", " ", "identity", " ", "operation"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"IdMPO", "[", "L_", "]"}], ":=", 
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"ArrayReshape", "[", 
        RowBox[{
         RowBox[{"IdentityMatrix", "[", "4", "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"4", ",", "4", ",", "1", ",", "1"}], "}"}]}], "]"}], ",", 
       RowBox[{"{", "0", "}"}], ",", 
       RowBox[{"{", "0", "}"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"i", ",", "L"}], "}"}]}], "]"}]}]}]], "Input",ExpressionUUID->\
"010319b0-1f4c-4197-baac-fbbfad61010b"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "compute", " ", "reference", " ", "MPO", " ", "representation", " ", "of", 
    " ", 
    FormBox[
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "\[Beta]"}], " ", 
       RowBox[{"H", "/", "2"}]}]],
     TraditionalForm]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Block", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"qd", "=", 
         RowBox[{"{", 
          RowBox[{"0", ",", "1", ",", "1", ",", "2"}], "}"}]}], ",", 
        RowBox[{"L", "=", 
         SubscriptBox["L", "val"]}], ",", 
        RowBox[{"\[CapitalDelta]\[Tau]", "=", 
         FractionBox["1", "40"]}], ",", 
        RowBox[{"\[Beta]", "=", 
         SubscriptBox["\[Beta]", "val"]}], ",", 
        RowBox[{"tol", "=", 
         SuperscriptBox["10", 
          RowBox[{"-", "8"}]]}]}], "}"}], ",", 
      RowBox[{
       SubscriptBox["A", 
        RowBox[{"\[Rho]\[Beta]", ",", "ref"}]], "=", 
       RowBox[{"MPOStrangEvolution", "[", 
        RowBox[{
         RowBox[{"IdMPO", "[", "L", "]"}], ",", 
         RowBox[{"N", "[", 
          RowBox[{"h2", "[", 
           RowBox[{
            SubscriptBox["t", "val"], ",", 
            SubscriptBox["U", "val"], ",", 
            SubscriptBox["\[Mu]", "val"], ",", "L"}], "]"}], "]"}], ",", "qd",
          ",", 
         FractionBox["\[Beta]", "2"], ",", 
         FractionBox["\[Beta]", 
          RowBox[{"2", "\[CapitalDelta]\[Tau]"}]], ",", "tol"}], "]"}]}]}], 
     "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "/@", 
    RowBox[{"(", 
     RowBox[{"First", "/@", "%"}], ")"}]}]}]}]], "Input",ExpressionUUID->\
"890a0df2-128e-449a-a2da-642354114ae2"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "1", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "11", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "11", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "11", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "11", ",", "1"}], "}"}]}], "}"}]], "Output",Ex\
pressionUUID->"fd90cd8c-a715-494b-9b26-bedb81d26339"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"compare", " ", "with", " ", "\"\<exact\>\"", " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Beta]"}], " ", 
      RowBox[{"H", "/", "2"}]}]]}], " ", "*)"}], "\[IndentingNewLine]", 
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
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", "\[Rho]", ",", "H"}], "}"}], 
    ",", 
    RowBox[{
     RowBox[{"H", "=", 
      RowBox[{"N", "[", 
       RowBox[{"HHubbard", "[", 
        RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "L"}], "]"}], "]"}]}], ";", 
     RowBox[{"\[Rho]", "=", 
      RowBox[{"MatrixExp", "[", 
       RowBox[{
        RowBox[{"-", 
         FractionBox["\[Beta]", "2"]}], "H"}], "]"}]}], ";", 
     RowBox[{"Norm", "[", 
      FractionBox[
       RowBox[{
        RowBox[{"MPOMergeFull", "[", 
         RowBox[{"First", "/@", 
          SubscriptBox["A", 
           RowBox[{"\[Rho]\[Beta]", ",", "ref"}]]}], "]"}], "-", "\[Rho]"}], 
       RowBox[{"Norm", "[", 
        RowBox[{"\[Rho]", ",", "\"\<Frobenius\>\""}], "]"}]], "]"}]}]}], 
   "]"}]}]], "Input",ExpressionUUID->"878b071b-175a-40d5-917b-97f66a445f0c"],

Cell[BoxData["0.000028217707834728355`"], "Output",ExpressionUUID->"5b513e3f-477a-4bd9-8309-96f4687d1d93"]
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
     RowBox[{"qd", "=", 
      RowBox[{"{", 
       RowBox[{"0", ",", "1", ",", "1", ",", "2"}], "}"}]}], "}"}], ",", 
    RowBox[{
     RowBox[{
      RowBox[{"MPOBlockStructureError", "[", 
       RowBox[{"#", ",", 
        RowBox[{"{", 
         RowBox[{"qd", ",", "qd"}], "}"}]}], "]"}], "&"}], "/@", 
     SubscriptBox["A", 
      RowBox[{"\[Rho]\[Beta]", ",", "ref"}]]}]}], "]"}]}]], "Input",Expression\
UUID->"72a0ffae-f502-43c1-9e0f-ac754cd6c4f2"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.`", ",", "0.`", ",", "0.`", ",", "0.`", ",", "0.`"}], 
  "}"}]], "Output",ExpressionUUID->"0f50c94a-4c31-4e16-b64a-389c4babac37"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["A", 
     RowBox[{"\[Rho]\[Beta]", ",", "ref"}]], "\[LeftDoubleBracket]", 
    RowBox[{"3", ",", "1", ",", "2", ",", "3", ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "2", ",", 
       RowBox[{"-", "1"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "2", ",", 
       RowBox[{"-", "1"}]}], "}"}]}], "\[RightDoubleBracket]"}], "//", 
   "MatrixForm"}]}]], "Input",ExpressionUUID->"e9bc47b2-3937-4d94-b179-\
2228cbcbb38f"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"1.2409544906009364`*^-16", "0", "0"},
     {"0", 
      RowBox[{"-", "3.310810134372931`*^-16"}], "0"},
     {"0", "0", 
      RowBox[{"-", "6.961543736803409`*^-19"}]}
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
   MatrixForm[BoxForm`e$]]]], "Output",ExpressionUUID->"d6afc5ec-e0da-4452-\
b7e4-c104855378cd"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"ToFileString", "[", "x_", "]"}], ":=", 
  RowBox[{"ToString", "[", 
   RowBox[{"If", "[", 
    RowBox[{
     RowBox[{"IntegerQ", "[", "x", "]"}], ",", "x", ",", 
     RowBox[{"N", "[", "x", "]"}]}], "]"}], "]"}]}]], "Input",ExpressionUUID->\
"7051b2da-fb1d-4b58-8680-c941a5095f1c"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "virtual", " ", "bond", " ", "dimensions", " ", "obtained", " ", "by", " ",
     "C", " ", "implementation"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["D", "\[Rho]\[Beta]"], "=", 
   RowBox[{"Import", "[", 
    RowBox[{
     RowBox[{"\"\<../output/fermi_hubbard/L\>\"", "<>", 
      RowBox[{"ToString", "[", 
       SubscriptBox["L", "val"], "]"}], "<>", "\"\<_rho/fermi_hubbard_L\>\"", 
      "<>", 
      RowBox[{"ToString", "[", 
       SubscriptBox["L", "val"], "]"}], "<>", "\"\<_beta\>\"", "<>", 
      RowBox[{"ToFileString", "[", 
       SubscriptBox["\[Beta]", "val"], "]"}], "<>", "\"\<_D.dat\>\""}], ",", 
     "\"\<Integer64\>\""}], "]"}]}]}]], "Input",ExpressionUUID->"efdbb2f3-\
e088-4f63-83f0-ba7ab0c1e894"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "11", ",", "11", ",", "11", ",", "11", ",", "1"}], 
  "}"}]], "Output",ExpressionUUID->"c5a57806-8cbf-435d-8896-1eb316fa8996"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"read", " ", "MPO", " ", "tensors", " ", "of", " ", 
    FormBox[
     SuperscriptBox["\[ExponentialE]", 
      RowBox[{
       RowBox[{"-", "\[Beta]"}], " ", 
       RowBox[{"H", "/", "2"}]}]],
     TraditionalForm], " ", "from", " ", "disk"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["A", "\[Rho]\[Beta]"], "=", 
     RowBox[{"Block", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"L", "=", 
          SubscriptBox["L", "val"]}], ",", 
         RowBox[{"D", "=", 
          SubscriptBox["D", "\[Rho]\[Beta]"]}]}], "}"}], ",", 
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"ArrayReshape", "[", 
          RowBox[{
           RowBox[{"Transpose", "[", 
            RowBox[{
             RowBox[{"ArrayReshape", "[", 
              RowBox[{
               RowBox[{"Import", "[", 
                RowBox[{
                 RowBox[{"\"\<../output/fermi_hubbard/L\>\"", "<>", 
                  RowBox[{"ToString", "[", "L", "]"}], "<>", 
                  "\"\<_rho/fermi_hubbard_L\>\"", "<>", 
                  RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<_beta\>\"", 
                  "<>", 
                  RowBox[{"ToFileString", "[", 
                   SubscriptBox["\[Beta]", "val"], "]"}], "<>", "\"\<_A\>\"", 
                  "<>", 
                  RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}],
                  ",", "\"\<Complex128\>\""}], "]"}], ",", 
               RowBox[{"{", 
                RowBox[{
                 RowBox[{"D", "\[LeftDoubleBracket]", 
                  RowBox[{"i", "+", "2"}], "\[RightDoubleBracket]"}], ",", 
                 RowBox[{"D", "\[LeftDoubleBracket]", 
                  RowBox[{"i", "+", "1"}], "\[RightDoubleBracket]"}], ",", 
                 "2", ",", "2", ",", "2", ",", "2"}], "}"}]}], "]"}], ",", 
             RowBox[{"Reverse", "[", 
              RowBox[{"Range", "[", "6", "]"}], "]"}]}], "]"}], ",", 
           RowBox[{"{", 
            RowBox[{"4", ",", "4", ",", 
             RowBox[{"D", "\[LeftDoubleBracket]", 
              RowBox[{"i", "+", "1"}], "\[RightDoubleBracket]"}], ",", 
             RowBox[{"D", "\[LeftDoubleBracket]", 
              RowBox[{"i", "+", "2"}], "\[RightDoubleBracket]"}]}], "}"}]}], 
          "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"i", ",", "0", ",", 
           RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}], "]"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "/@", "%"}]}]}]], "Input",ExpressionUUID->"d1fedb47-\
a79a-4a95-9053-b343e19962ac"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "1", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "11", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "11", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "11", ",", "11"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "11", ",", "1"}], "}"}]}], "}"}]], "Output",Ex\
pressionUUID->"f4da2457-6542-48ed-82b4-a073e407b88b"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", " ", "normalization"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{"MPOMergeFull", "[", 
      SubscriptBox["A", "\[Rho]\[Beta]"], "]"}], ",", "\"\<Frobenius\>\""}], 
    "]"}], "-", "1"}]}]], "Input",ExpressionUUID->"09b32bed-c275-4fdf-a598-\
1dcfabd1df4c"],

Cell[BoxData[
 RowBox[{"-", "8.326672684688674`*^-15"}]], "Output",ExpressionUUID->"34bc8aed-1f2d-4f46-ac73-e253ac918383"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"compare", " ", "with", " ", "reference"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"\[Rho]\[Beta]ref", "=", 
      RowBox[{"MPOMergeFull", "[", 
       RowBox[{"First", "/@", 
        SubscriptBox["A", 
         RowBox[{"\[Rho]\[Beta]", ",", "ref"}]]}], "]"}]}], "}"}], ",", 
    RowBox[{"Norm", "[", 
     RowBox[{
      RowBox[{"MPOMergeFull", "[", 
       SubscriptBox["A", "\[Rho]\[Beta]"], "]"}], "-", 
      FractionBox["\[Rho]\[Beta]ref", 
       RowBox[{"Norm", "[", 
        RowBox[{"\[Rho]\[Beta]ref", ",", "\"\<Frobenius\>\""}], "]"}]]}], 
     "]"}]}], "]"}]}]], "Input",ExpressionUUID->"93dcc7f6-70d3-410d-8503-\
a2d8984b75eb"],

Cell[BoxData["1.0331872165766032`*^-15"], "Output",ExpressionUUID->"56eb9588-7808-4fb2-b50f-1acd613249e8"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Response function", "Subsection",ExpressionUUID->"a7125d2a-c5c7-4c13-8e6f-2bcfcf3d70fc"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"local", " ", "density", " ", "operator"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"nloc", "[", 
    RowBox[{"j_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"KroneckerProduct", "[", 
    RowBox[{
     RowBox[{"SparseIdentityMatrix", "[", 
      SuperscriptBox["4", 
       RowBox[{"j", "-", "1"}]], "]"}], ",", 
     RowBox[{
      RowBox[{"KroneckerProduct", "[", 
       RowBox[{
        SubscriptBox["a", "number"], ",", 
        RowBox[{"IdentityMatrix", "[", "2", "]"}]}], "]"}], "+", 
      RowBox[{"KroneckerProduct", "[", 
       RowBox[{
        RowBox[{"IdentityMatrix", "[", "2", "]"}], ",", 
        SubscriptBox["a", "number"]}], "]"}]}], ",", 
     RowBox[{"SparseIdentityMatrix", "[", 
      SuperscriptBox["4", 
       RowBox[{"L", "-", "j"}]], "]"}]}], "]"}]}]}]], "Input",ExpressionUUID->\
"a543a029-7590-4297-bab6-e853959217fb"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"local", " ", 
    SubscriptBox["S", "z"], " ", "spin", " ", "operator"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Szloc", "[", 
    RowBox[{"j_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"KroneckerProduct", "[", 
    RowBox[{
     RowBox[{"SparseIdentityMatrix", "[", 
      SuperscriptBox["4", 
       RowBox[{"j", "-", "1"}]], "]"}], ",", 
     RowBox[{
      RowBox[{"KroneckerProduct", "[", 
       RowBox[{
        SubscriptBox["a", "number"], ",", 
        RowBox[{"IdentityMatrix", "[", "2", "]"}]}], "]"}], "-", 
      RowBox[{"KroneckerProduct", "[", 
       RowBox[{
        RowBox[{"IdentityMatrix", "[", "2", "]"}], ",", 
        SubscriptBox["a", "number"]}], "]"}]}], ",", 
     RowBox[{"SparseIdentityMatrix", "[", 
      SuperscriptBox["4", 
       RowBox[{"L", "-", "j"}]], "]"}]}], "]"}]}]}]], "Input",ExpressionUUID->\
"ed7758b2-8c98-4a1f-b880-0e6a0c06e531"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"local", " ", "charge", " ", 
     RowBox[{"(", "density", ")"}], " ", "current", " ", "operator", " ", 
     "between", " ", "site", " ", "j", " ", "and", " ", "j"}], "+", "1"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"jcloc", "[", 
    RowBox[{"j_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"\[ImaginaryI]", " ", 
    RowBox[{"KroneckerProduct", "[", 
     RowBox[{
      RowBox[{"SparseIdentityMatrix", "[", 
       SuperscriptBox["4", 
        RowBox[{"j", "-", "1"}]], "]"}], ",", 
      RowBox[{
       RowBox[{"-", 
        RowBox[{"KroneckerProduct", "[", 
         RowBox[{
          SubscriptBox["a", "create"], ",", 
          SubscriptBox["\[Sigma]", "3"], ",", 
          SubscriptBox["a", "annihil"], ",", 
          SubscriptBox["\[Sigma]", "0"]}], "]"}]}], "+", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         SubscriptBox["a", "annihil"], ",", 
         SubscriptBox["\[Sigma]", "3"], ",", 
         SubscriptBox["a", "create"], ",", 
         SubscriptBox["\[Sigma]", "0"]}], "]"}], "-", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         SubscriptBox["\[Sigma]", "0"], ",", 
         SubscriptBox["a", "create"], ",", 
         SubscriptBox["\[Sigma]", "3"], ",", 
         SubscriptBox["a", "annihil"]}], "]"}], "+", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         SubscriptBox["\[Sigma]", "0"], ",", 
         SubscriptBox["a", "annihil"], ",", 
         SubscriptBox["\[Sigma]", "3"], ",", 
         SubscriptBox["a", "create"]}], "]"}]}], ",", 
      RowBox[{"SparseIdentityMatrix", "[", 
       SuperscriptBox["4", 
        RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}]}]}]}]], "Input",Exp\
ressionUUID->"259c98b9-c042-4f0a-843e-8f2c7ac50b3c"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"local", " ", 
     SubscriptBox["S", "z"], " ", "spin", " ", "current", " ", "operator", 
     " ", "between", " ", "site", " ", "j", " ", "and", " ", "j"}], "+", 
    "1"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"jsloc", "[", 
    RowBox[{"j_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"\[ImaginaryI]", " ", 
    RowBox[{"KroneckerProduct", "[", 
     RowBox[{
      RowBox[{"SparseIdentityMatrix", "[", 
       SuperscriptBox["4", 
        RowBox[{"j", "-", "1"}]], "]"}], ",", 
      RowBox[{
       RowBox[{"-", 
        RowBox[{"KroneckerProduct", "[", 
         RowBox[{
          SubscriptBox["a", "create"], ",", 
          SubscriptBox["\[Sigma]", "3"], ",", 
          SubscriptBox["a", "annihil"], ",", 
          SubscriptBox["\[Sigma]", "0"]}], "]"}]}], "+", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         SubscriptBox["a", "annihil"], ",", 
         SubscriptBox["\[Sigma]", "3"], ",", 
         SubscriptBox["a", "create"], ",", 
         SubscriptBox["\[Sigma]", "0"]}], "]"}], "+", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         SubscriptBox["\[Sigma]", "0"], ",", 
         SubscriptBox["a", "create"], ",", 
         SubscriptBox["\[Sigma]", "3"], ",", 
         SubscriptBox["a", "annihil"]}], "]"}], "-", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         SubscriptBox["\[Sigma]", "0"], ",", 
         SubscriptBox["a", "annihil"], ",", 
         SubscriptBox["\[Sigma]", "3"], ",", 
         SubscriptBox["a", "create"]}], "]"}]}], ",", 
      RowBox[{"SparseIdentityMatrix", "[", 
       SuperscriptBox["4", 
        RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}]}]}]}]], "Input",Exp\
ressionUUID->"d594538d-58d0-4892-9dba-f72d61e54ecf"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", "Hermitian"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"j", "=", "3"}]}], "}"}], ",", 
     RowBox[{"Norm", "[", 
      RowBox[{"Flatten", "[", 
       RowBox[{
        RowBox[{"jcloc", "[", 
         RowBox[{"j", ",", "L"}], "]"}], "-", 
        RowBox[{"ConjugateTranspose", "[", 
         RowBox[{"jcloc", "[", 
          RowBox[{"j", ",", "L"}], "]"}], "]"}]}], "]"}], "]"}]}], "]"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"j", "=", "3"}]}], "}"}], ",", 
     RowBox[{"Norm", "[", 
      RowBox[{"Flatten", "[", 
       RowBox[{
        RowBox[{"jsloc", "[", 
         RowBox[{"j", ",", "L"}], "]"}], "-", 
        RowBox[{"ConjugateTranspose", "[", 
         RowBox[{"jsloc", "[", 
          RowBox[{"j", ",", "L"}], "]"}], "]"}]}], "]"}], "]"}]}], 
    "]"}]}]}]], "Input",ExpressionUUID->"c6047a03-8468-4f60-91bb-\
996945d1ea9a"],

Cell[BoxData["0"], "Output",ExpressionUUID->"c4c0febc-b2c0-4807-9524-564097f7a5a6"],

Cell[BoxData["0"], "Output",ExpressionUUID->"9fbe9bbc-a1ab-477a-aa0e-007cdfc82f14"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "commutator", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Comm", "[", 
    RowBox[{"A_", ",", "B_"}], "]"}], ":=", 
   RowBox[{
    RowBox[{"A", ".", "B"}], "-", 
    RowBox[{"B", ".", "A"}]}]}]}]], "Input",ExpressionUUID->"3b2f25fc-2746-\
44af-a4d0-8cde6dea0acb"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", " ", "continuity", " ", "equation"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"t", ",", "U", ",", "\[Mu]", ",", 
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"j", "=", "3"}]}], "}"}], ",", 
     RowBox[{"Norm", "[", 
      RowBox[{"Flatten", "[", 
       RowBox[{
        RowBox[{"\[ImaginaryI]", " ", 
         RowBox[{"Comm", "[", 
          RowBox[{
           RowBox[{"HHubbard", "[", 
            RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "L"}], "]"}], ",", 
           RowBox[{"nloc", "[", 
            RowBox[{"j", ",", "L"}], "]"}]}], "]"}]}], "+", 
        RowBox[{"t", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"jcloc", "[", 
            RowBox[{"j", ",", "L"}], "]"}], "-", 
           RowBox[{"jcloc", "[", 
            RowBox[{
             RowBox[{"j", "-", "1"}], ",", "L"}], "]"}]}], ")"}]}]}], "]"}], 
      "]"}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"t", ",", "U", ",", "\[Mu]", ",", 
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"j", "=", "3"}]}], "}"}], ",", 
     RowBox[{"Norm", "[", 
      RowBox[{"Flatten", "[", 
       RowBox[{
        RowBox[{"\[ImaginaryI]", " ", 
         RowBox[{"Comm", "[", 
          RowBox[{
           RowBox[{"HHubbard", "[", 
            RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "L"}], "]"}], ",", 
           RowBox[{"Szloc", "[", 
            RowBox[{"j", ",", "L"}], "]"}]}], "]"}]}], "+", 
        RowBox[{"t", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"jsloc", "[", 
            RowBox[{"j", ",", "L"}], "]"}], "-", 
           RowBox[{"jsloc", "[", 
            RowBox[{
             RowBox[{"j", "-", "1"}], ",", "L"}], "]"}]}], ")"}]}]}], "]"}], 
      "]"}]}], "]"}]}]}]], "Input",ExpressionUUID->"2278a51e-5d71-4a73-808d-\
a1c2fec12754"],

Cell[BoxData["0"], "Output",ExpressionUUID->"b6efa349-8e8a-4e57-a7c5-426a5eb72696"],

Cell[BoxData["0"], "Output",ExpressionUUID->"de47de28-68d3-480e-aec9-3fcfcee256be"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"\[Chi]C", "[", 
   RowBox[{"A_", ",", "B_", ",", "H_", ",", "\[Beta]_", ",", "t_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"tA", "=", 
       FractionBox["t", "2"]}], ",", 
      RowBox[{"tB", "=", 
       FractionBox["t", "2"]}], ",", 
      RowBox[{"\[Rho]\[Beta]", "=", 
       RowBox[{"MatrixExp", "[", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["\[Beta]", "2"]}], "H"}], "]"}]}], ",", "Z"}], "}"}], 
    ",", 
    RowBox[{
     RowBox[{"Z", "=", 
      SuperscriptBox[
       RowBox[{"Norm", "[", 
        RowBox[{"\[Rho]\[Beta]", ",", "\"\<Frobenius\>\""}], "]"}], "2"]}], 
     ";", 
     RowBox[{
      FractionBox["1", "Z"], 
      RowBox[{"Tr", "[", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"MatrixExp", "[", 
           RowBox[{"\[ImaginaryI]", " ", "tB", " ", "H"}], "]"}], ".", 
          "\[Rho]\[Beta]", ".", "B", ".", 
          RowBox[{"MatrixExp", "[", 
           RowBox[{
            RowBox[{"-", "\[ImaginaryI]"}], " ", "tB", " ", "H"}], "]"}]}], 
         ")"}], ".", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"MatrixExp", "[", 
           RowBox[{
            RowBox[{"-", "\[ImaginaryI]"}], " ", "tA", " ", "H"}], "]"}], ".",
           "A", ".", "\[Rho]\[Beta]", ".", 
          RowBox[{"MatrixExp", "[", 
           RowBox[{"\[ImaginaryI]", " ", "tA", " ", "H"}], "]"}]}], ")"}]}], 
       "]"}]}]}]}], "]"}]}]], "Input",ExpressionUUID->"03a392f5-021a-462c-\
80dc-8cdf858e3e9f"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["j", "A"], "=", "2"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["j", "B"], "=", "3"}], ";"}]}], "Input",ExpressionUUID->\
"db0ba0a5-68db-4a53-aa62-ac85273fa127"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "charge", " ", "current", " ", "correlation", " ", "reference", " ", 
    "calculation"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"tH", "=", 
        SubscriptBox["t", "val"]}], ",", 
       RowBox[{"U", "=", 
        SubscriptBox["U", "val"]}], ",", 
       RowBox[{"\[Mu]", "=", 
        SubscriptBox["\[Mu]", "val"]}], ",", 
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"\[Beta]", "=", 
        SubscriptBox["\[Beta]", "val"]}], ",", "H"}], "}"}], ",", 
     RowBox[{
      RowBox[{"H", "=", 
       RowBox[{"N", "[", 
        RowBox[{"HHubbard", "[", 
         RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "L"}], "]"}], "]"}]}], 
      ";", 
      RowBox[{
       SubscriptBox["\[Chi]", 
        RowBox[{"charge", ",", "ref"}]], "=", 
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"\[Chi]C", "[", 
          RowBox[{
           RowBox[{"N", "[", 
            RowBox[{"jcloc", "[", 
             RowBox[{
              StyleBox[
               SubscriptBox["j", "A"],
               FontWeight->"Plain"], ",", "L"}], "]"}], "]"}], ",", 
           RowBox[{"N", "[", 
            RowBox[{"jcloc", "[", 
             RowBox[{
              SubscriptBox["j", "B"], ",", "L"}], "]"}], "]"}], ",", "H", ",",
            "\[Beta]", ",", "t"}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"t", ",", 
           SubscriptBox["t", "list"]}], "}"}]}], "]"}]}]}]}], "]"}], 
   ";"}]}]], "Input",ExpressionUUID->"c5d93a58-79a9-47ca-95cd-f3600717bfa5"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "spin", " ", "current", " ", "correlation", " ", "reference", " ", 
    "calculation"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"tH", "=", 
        SubscriptBox["t", "val"]}], ",", 
       RowBox[{"U", "=", 
        SubscriptBox["U", "val"]}], ",", 
       RowBox[{"\[Mu]", "=", 
        SubscriptBox["\[Mu]", "val"]}], ",", 
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"\[Beta]", "=", 
        SubscriptBox["\[Beta]", "val"]}], ",", "H"}], "}"}], ",", 
     RowBox[{
      RowBox[{"H", "=", 
       RowBox[{"N", "[", 
        RowBox[{"HHubbard", "[", 
         RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "L"}], "]"}], "]"}]}], 
      ";", 
      RowBox[{
       SubscriptBox["\[Chi]", 
        RowBox[{"spin", ",", "ref"}]], "=", 
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"\[Chi]C", "[", 
          RowBox[{
           RowBox[{"N", "[", 
            RowBox[{"jsloc", "[", 
             RowBox[{
              StyleBox[
               SubscriptBox["j", "A"],
               FontWeight->"Plain"], ",", "L"}], "]"}], "]"}], ",", 
           RowBox[{"N", "[", 
            RowBox[{"jsloc", "[", 
             RowBox[{
              SubscriptBox["j", "B"], ",", "L"}], "]"}], "]"}], ",", "H", ",",
            "\[Beta]", ",", "t"}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"t", ",", 
           SubscriptBox["t", "list"]}], "}"}]}], "]"}]}]}]}], "]"}], 
   ";"}]}]], "Input",ExpressionUUID->"7a637694-424e-44c6-a260-5191bd7d042a"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "read", " ", "simulation", " ", "results", " ", "from", " ", "disk"}], " ",
    "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["\[Chi]", "charge"], "=", 
     RowBox[{"Import", "[", 
      RowBox[{
       RowBox[{"\"\<../output/fermi_hubbard/L\>\"", "<>", 
        RowBox[{"ToString", "[", 
         SubscriptBox["L", "val"], "]"}], "<>", 
        "\"\<_charge_current/fermi_hubbard_L\>\"", "<>", 
        RowBox[{"ToString", "[", 
         SubscriptBox["L", "val"], "]"}], "<>", "\"\<_chi.dat\>\""}], ",", 
       "\"\<Complex128\>\""}], "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["\[Chi]", "spin"], "=", 
     RowBox[{"Import", "[", 
      RowBox[{
       RowBox[{"\"\<../output/fermi_hubbard/L\>\"", "<>", 
        RowBox[{"ToString", "[", 
         SubscriptBox["L", "val"], "]"}], "<>", 
        "\"\<_spin_current/fermi_hubbard_L\>\"", "<>", 
        RowBox[{"ToString", "[", 
         SubscriptBox["L", "val"], "]"}], "<>", "\"\<_chi.dat\>\""}], ",", 
       "\"\<Complex128\>\""}], "]"}]}], ";"}]}]}]], "Input",ExpressionUUID->\
"2a7c90c7-e9c5-483c-914b-ef0118b12bcd"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Abs", "[", 
   RowBox[{
    SubscriptBox["\[Chi]", "charge"], "-", 
    SubscriptBox["\[Chi]", 
     RowBox[{"charge", ",", "ref"}]]}], "]"}]}]], "Input",ExpressionUUID->\
"c773d820-2db6-433f-b9d4-2bd9c2fd08ef"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "1.964201430644432`*^-6", ",", "8.566888454683925`*^-6", ",", 
   "0.000027055706247361497`", ",", "0.00004339095909112309`", ",", 
   "0.00008110344466655644`", ",", "0.00007645973338887707`", ",", 
   "0.00005498831158317631`", ",", "0.000031438249830662464`", ",", 
   "0.000031468070157784785`", ",", "0.00005101459881351995`", ",", 
   "0.00006829207824547998`", ",", "0.00007129785114073075`", ",", 
   "0.00005057326280187604`", ",", "0.00008458089636847221`", ",", 
   "0.00007962809825900684`", ",", "0.0000657169461552731`", ",", 
   "0.00005388635305364753`", ",", "0.000011405514257062734`", ",", 
   "0.000042818356429444555`", ",", "0.00003269581455798601`", ",", 
   "0.00006801163767140423`"}], "}"}]], "Output",ExpressionUUID->"731e46df-\
c21f-4174-9c71-aa54bfc31b51"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Abs", "[", 
   RowBox[{
    SubscriptBox["\[Chi]", "spin"], "-", 
    SubscriptBox["\[Chi]", 
     RowBox[{"spin", ",", "ref"}]]}], "]"}]}]], "Input",ExpressionUUID->\
"259d109b-1790-47d5-89a7-70ceaf07f12a"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "2.95115944762888`*^-7", ",", "6.899307383268115`*^-6", ",", 
   "0.00004968038561981571`", ",", "0.00012145084910089663`", ",", 
   "0.0001395367335969585`", ",", "0.00007357270925163787`", ",", 
   "0.00004633252396995058`", ",", "0.00013519084192497924`", ",", 
   "0.00014970834152112914`", ",", "0.00010196284558440158`", ",", 
   "0.00004899061644059656`", ",", "0.00002463048839944684`", ",", 
   "0.00002386713273839988`", ",", "0.000035917867238145814`", ",", 
   "0.00006299032022341428`", ",", "0.0001438159463750773`", ",", 
   "0.00019077107836717102`", ",", "0.0001095975418791597`", ",", 
   "0.00011165734577561325`", ",", "0.00024455925485411284`", ",", 
   "0.00022819072790108952`"}], "}"}]], "Output",ExpressionUUID->"8969212f-\
f59d-4462-beb9-f62eac23f8dd"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["plot", "label"], "[", "type_", "]"}], ":=", 
  RowBox[{"\"\<Fermi-Hubbard model with\\nt=\>\"", "<>", 
   RowBox[{"ToString", "[", 
    SubscriptBox["t", "val"], "]"}], "<>", "\"\<, U=\>\"", "<>", 
   RowBox[{"ToString", "[", 
    SubscriptBox["U", "val"], "]"}], "<>", "\"\<, \[Mu]=\>\"", "<>", 
   RowBox[{"ToString", "[", 
    RowBox[{"InputForm", "[", 
     SubscriptBox["\[Mu]", "val"], "]"}], "]"}], "<>", "\"\<, L=\>\"", "<>", 
   RowBox[{"ToString", "[", 
    SubscriptBox["L", "val"], "]"}], "<>", "\"\<, \[Beta]=\>\"", "<>", 
   RowBox[{"ToString", "[", 
    RowBox[{"N", "[", 
     SubscriptBox["\[Beta]", "val"], "]"}], "]"}], "<>", 
   "\"\< (scheme C)\\n\!\(\*SubscriptBox[\(J\), \(A\)]\): \>\"", "<>", 
   RowBox[{"ToString", "[", "type", "]"}], "<>", "\"\< current sites (\>\"", "<>", 
   RowBox[{"ToString", "[", 
    SubscriptBox["j", "A"], "]"}], "<>", "\"\<,\>\"", "<>", 
   RowBox[{"ToString", "[", 
    RowBox[{
     SubscriptBox["j", "A"], "+", "1"}], "]"}], "<>", 
   "\"\<), \!\(\*SubscriptBox[\(J\), \(B\)]\): \>\"", "<>", 
   RowBox[{"ToString", "[", "type", "]"}], "<>", "\"\< current sites (\>\"", "<>", 
   RowBox[{"ToString", "[", 
    SubscriptBox["j", "B"], "]"}], "<>", "\"\<,\>\"", "<>", 
   RowBox[{"ToString", "[", 
    RowBox[{
     SubscriptBox["j", "B"], "+", "1"}], "]"}], "<>", 
   "\"\<)\>\""}]}]], "Input",ExpressionUUID->"e90cd907-7ea8-4121-9e21-\
3d7a8cffa4ff"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["fn", "export"], "=", 
   RowBox[{
    RowBox[{
     RowBox[{
     "\"\<plots/\>\"", "<>", "#", "<>", "\"\</\>\"", "<>", "#", "<>", 
      "\"\<_\>\""}], "&"}], "[", 
    RowBox[{"FileBaseName", "[", 
     RowBox[{"NotebookFileName", "[", "]"}], "]"}], "]"}]}], ";"}]], "Input",E\
xpressionUUID->"f2adc1a7-446b-4327-b7d3-818a4b469841"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Show", "[", 
  RowBox[{
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["t", "list"], ",", 
          RowBox[{"Re", "[", 
           SubscriptBox["\[Chi]", "charge"], "]"}]}], "}"}], "]"}], ",", 
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["t", "list"], ",", 
          RowBox[{"Im", "[", 
           SubscriptBox["\[Chi]", "charge"], "]"}]}], "}"}], "]"}]}], "}"}], 
     ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<t\>\"", ",", 
        "\"\<\[LeftAngleBracket]\!\(\*SubscriptBox[\(J\), \
\(A\)]\)[t]\!\(\*SubscriptBox[\(J\), \(B\)]\)[0]\!\(\*SubscriptBox[\(\
\[RightAngleBracket]\), \(\[Beta]\)]\)\>\""}], "}"}]}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<Re\>\"", ",", "\"\<Im\>\""}], "}"}]}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", 
      RowBox[{
       RowBox[{
        SubscriptBox["plot", "label"], "[", "\"\<charge\>\"", "]"}], "<>", 
       "\"\<\\nred: independent reference calculation\>\""}]}]}], "]"}], ",", 
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{
        RowBox[{"Interpolation", "[", 
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            SubscriptBox["t", "list"], ",", 
            RowBox[{"Re", "[", 
             SubscriptBox["\[Chi]", 
              RowBox[{"charge", ",", "ref"}]], "]"}]}], "}"}], "]"}], "]"}], 
        "[", "\[Tau]", "]"}], ",", 
       RowBox[{
        RowBox[{"Interpolation", "[", 
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            SubscriptBox["t", "list"], ",", 
            RowBox[{"Im", "[", 
             SubscriptBox["\[Chi]", 
              RowBox[{"charge", ",", "ref"}]], "]"}]}], "}"}], "]"}], "]"}], 
        "[", "\[Tau]", "]"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"\[Tau]", ",", "0", ",", "5"}], "}"}], ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{
       RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}]}]}], "]"}]}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Export", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["fn", "export"], "<>", "\"\<Jc_corr_L\>\"", "<>", 
     RowBox[{"ToString", "[", 
      SubscriptBox["L", "val"], "]"}], "<>", "\"\<.pdf\>\""}], ",", "%"}], 
   "]"}], ";"}]}], "Input",ExpressionUUID->"387d4a36-0dca-4657-9a5e-\
77b7b794b6d2"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{{}, {{{}, {
         Hue[0.67, 0.6, 0.6], 
         Directive[
          PointSize[0.012833333333333334`], 
          RGBColor[0.368417, 0.506779, 0.709798], 
          AbsoluteThickness[1.6]], 
         PointBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQObD+tcDPucsh/Cu2A/2yb93DfObfYQ/gN7/RMX
d8RNvgDlv7C/obMkQLX1KpT/wf6gC1+cbOk5KP+L/ecE4/zVIquh/B/22TO5
f725vwlq/h97mTVpkafyt0H5DA5MXXlrnzOugPKZHJacOnF7veIcKJ/FIZbd
89aTi0uhfDaHsJetqhxnVkP5HA7XJuZn7pwAk+dyeJN5/j33uSVQPo/D9V2n
vp0z2wHl8zmwMbKGKU8+DuULOLyJmOaZ+uEMlC/ocPnu9okJ6UehfCGHHW9P
fM/jXQPlCzuwfJBOcc/phvpPxGHBya4993bl7AcA76hriw==
          "]]}, {
         Hue[0.9060679774997897, 0.6, 0.6], 
         Directive[
          PointSize[0.012833333333333334`], 
          RGBColor[0.880722, 0.611041, 0.142051], 
          AbsoluteThickness[1.6]], 
         PointBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQPTsgwL53io20B4F+xTf4lM3yq3wB7Cf2C/im/D
3bX75kH5L+yldBekT3ucvB/C/2D/uYmVJ+vxAij/i73fl1M8HPcWQvk/7K2Z
p5heYuuB8v/Yp1l1VlwwLoOax+Cwp7Pw+mn7eiifyeFCtM9kSQ0jqHoWB1/3
tWt/FxZA+WwODbLXzwu90IOq53DYIcDGf259BpTP5bCfO3TZhXVFUPU8DmWK
0ae2bZwA5fM5xF3IvdTuAeMLOOSIqnz5HhoJ1S/o8Ob1Dm72hilQvpDDvB17
PlrbTIXyhR1yTh3/t2hXMZQv4jBl2Xz/D8bN+wFQLWF3
          "]]}, {}}}, {}, {}, {{}, {}}, {{}, {}}}, {{{{}, {}, 
        TagBox[{
          Directive[
           Opacity[1.], 
           AbsoluteThickness[1.6], 
           RGBColor[0.922526, 0.385626, 0.209179]], 
          LineBox[CompressedData["
1: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
           "]]}, Annotation[#, "Charting`Private`Tag$4900#1"]& ], 
        TagBox[{
          Directive[
           Opacity[1.], 
           AbsoluteThickness[1.6], 
           RGBColor[0.922526, 0.385626, 0.209179]], 
          LineBox[CompressedData["
1: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
0w==
           "]]}, 
         Annotation[#, "Charting`Private`Tag$4900#2"]& ]}}, {}, {}}}, {
    DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {-0.22608629315499884`, 0.3362515723717485}}, 
     PlotRangeClipping -> True, ImagePadding -> All, DisplayFunction -> 
     Identity, AspectRatio -> NCache[GoldenRatio^(-1), 0.6180339887498948], 
     Axes -> {True, True}, AxesLabel -> {
       FormBox["\"t\"", TraditionalForm], 
       FormBox[
       "\"\[LeftAngleBracket]\\!\\(\\*SubscriptBox[\\(J\\), \\(A\\)]\\)[t]\\!\
\\(\\*SubscriptBox[\\(J\\), \\(B\\)]\\)[0]\\!\\(\\*SubscriptBox[\\(\
\[RightAngleBracket]\\), \\(\[Beta]\\)]\\)\"", TraditionalForm]}, 
     AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], 
     Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
           (Identity[#]& )[
            Part[#, 1]], 
           (Identity[#]& )[
            Part[#, 2]]}& ), "CopiedValueFunction" -> ({
           (Identity[#]& )[
            Part[#, 1]], 
           (Identity[#]& )[
            Part[#, 2]]}& )}}, PlotLabel -> 
     FormBox["\"Fermi-Hubbard model with\\nt=1, U=2, \[Mu]=1/7, L=5, \
\[Beta]=0.1 (scheme C)\\n\\!\\(\\*SubscriptBox[\\(J\\), \\(A\\)]\\): charge \
current sites (2,3), \\!\\(\\*SubscriptBox[\\(J\\), \\(B\\)]\\): charge \
current sites (3,4)\\nred: independent reference calculation\"", 
       TraditionalForm], 
     PlotRange -> {{0, 5.}, {-0.22608629315499884`, 0.3362515723717485}}, 
     PlotRangeClipping -> True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{"\"Re\"", "\"Im\""}, "PointLegend", 
      DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{{}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.462], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.462], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], 
                    PointBox[
                    NCache[{
                    Scaled[{
                    Rational[1, 2], 
                    Rational[1, 2]}]}, {
                    Scaled[{0.5, 0.5}]}]]}}}, AspectRatio -> Full, 
                    ImageSize -> {10, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{{}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.462], 
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    AbsoluteThickness[1.6]], {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.462], 
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    AbsoluteThickness[1.6]], 
                    PointBox[
                    NCache[{
                    Scaled[{
                    Rational[1, 2], 
                    Rational[1, 2]}]}, {
                    Scaled[{0.5, 0.5}]}]]}}}, AspectRatio -> Full, 
                    ImageSize -> {10, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
         FontFamily -> "Arial"}, Background -> Automatic, StripOnInput -> 
         False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"PointLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.012833333333333334`", "]"}], 
                   ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.24561133333333335`, 0.3378526666666667, 
                    0.4731986666666667], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0.368417, 0.506779, 0.709798]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.368417, 0.506779, 0.709798]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.368417, 0.506779, 0.709798], Editable -> False,
                     Selectable -> False], ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}]}], "]"}], 
               ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.012833333333333334`", "]"}], 
                   ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.587148, 0.40736066666666665`, 0.09470066666666668], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0.880722, 0.611041, 0.142051]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.880722, 0.611041, 0.142051]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.880722, 0.611041, 0.142051], Editable -> False,
                     Selectable -> False], ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}]}], "]"}]}],
              "}"}], ",", 
           RowBox[{"{", 
             RowBox[{#, ",", #2}], "}"}], ",", 
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}], ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{"False", ",", "False"}], "}"}]}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& ), 
      Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output",ExpressionU\
UID->"e5bc6249-e061-40b7-9aef-ccd8921d1ad9"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Show", "[", 
  RowBox[{
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["t", "list"], ",", 
          RowBox[{"Re", "[", 
           SubscriptBox["\[Chi]", "spin"], "]"}]}], "}"}], "]"}], ",", 
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["t", "list"], ",", 
          RowBox[{"Im", "[", 
           SubscriptBox["\[Chi]", "spin"], "]"}]}], "}"}], "]"}]}], "}"}], 
     ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<t\>\"", ",", 
        "\"\<\[LeftAngleBracket]\!\(\*SubscriptBox[\(J\), \
\(A\)]\)[t]\!\(\*SubscriptBox[\(J\), \(B\)]\)[0]\!\(\*SubscriptBox[\(\
\[RightAngleBracket]\), \(\[Beta]\)]\)\>\""}], "}"}]}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<Re\>\"", ",", "\"\<Im\>\""}], "}"}]}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", 
      RowBox[{
       RowBox[{
        SubscriptBox["plot", "label"], "[", "\"\<spin\>\"", "]"}], "<>", 
       "\"\<\\nred: independent reference calculation\>\""}]}]}], "]"}], ",", 
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{
        RowBox[{"Interpolation", "[", 
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            SubscriptBox["t", "list"], ",", 
            RowBox[{"Re", "[", 
             SubscriptBox["\[Chi]", 
              RowBox[{"spin", ",", "ref"}]], "]"}]}], "}"}], "]"}], "]"}], 
        "[", "\[Tau]", "]"}], ",", 
       RowBox[{
        RowBox[{"Interpolation", "[", 
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            SubscriptBox["t", "list"], ",", 
            RowBox[{"Im", "[", 
             SubscriptBox["\[Chi]", 
              RowBox[{"spin", ",", "ref"}]], "]"}]}], "}"}], "]"}], "]"}], 
        "[", "\[Tau]", "]"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"\[Tau]", ",", "0", ",", "5"}], "}"}], ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{
       RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}]}]}], "]"}]}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Export", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["fn", "export"], "<>", "\"\<Js_corr_L\>\"", "<>", 
     RowBox[{"ToString", "[", 
      SubscriptBox["L", "val"], "]"}], "<>", "\"\<.pdf\>\""}], ",", "%"}], 
   "]"}], ";"}]}], "Input",ExpressionUUID->"dc602268-701f-4df7-a9b8-\
8684ed46caa9"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{{}, {{{}, {
         Hue[0.67, 0.6, 0.6], 
         Directive[
          PointSize[0.012833333333333334`], 
          RGBColor[0.368417, 0.506779, 0.709798], 
          AbsoluteThickness[1.6]], 
         PointBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQONr5fZ3ZufvB/Cu2DvU+0X/nftFnsI/4H9k3uJ
TJ2F56H8F/ZtKg02be+uQPkf7E8IryioWg6T/2J/TG7pwcQOmP4f9gmzJ4SL
8y+Hmv/H/uKzXY9t7m+C8hkcrlzZbxTatALKZ3II+b7eJvfKXCifxWG6x6oP
i+YsgPLZHKRlJy6ft38hlM/h0CXjaH3y8ywon8thI9eE4wtTF0H5PA5O2iLX
bA5sh/L5HKYorf13X+gYlC/g8HD6++DAgFNQvqCDje4unoXPD0P5Qg7fzA+a
2ZVthPKFHVY8rO0wt5wO5Ys4vMrh96vetnQ/ANOFaqQ=
          "]]}, {
         Hue[0.9060679774997897, 0.6, 0.6], 
         Directive[
          PointSize[0.012833333333333334`], 
          RGBColor[0.880722, 0.611041, 0.142051], 
          AbsoluteThickness[1.6]], 
         PointBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQOhp17ZGN2RtIHwLtj3VZV8ORE7zx7Cf2CfwGoQ
HvFxLpT/wr5hssmPxg9H9kH4H+xv/lDwntowdz+E/8V+bpXwLJ49C6D8H/Z3
wxz+ZoX2Q/l/7HPUmPQFb8VDzWNwsN1wWSlXtALKZ3JoCK7lihAOhvJZHDzO
tyjz7wiD6mdzcJDxUCws8IPKczg4fL7o/elpEJTP5TDlgdz2tfcroep5HI77
rH9zphVmP5+DmLT825O53VC+gIPDtlL1pmaYewQdXpd9yAvbMwHKF3LYkt62
pyqtH8oXdhBI1Hpq7AdTL+JwftXl6y5f6vcDADpMX6E=
          "]]}, {}}}, {}, {}, {{}, {}}, {{}, {}}}, {{{{}, {}, 
        TagBox[{
          Directive[
           Opacity[1.], 
           AbsoluteThickness[1.6], 
           RGBColor[0.922526, 0.385626, 0.209179]], 
          LineBox[CompressedData["
1:eJwVl3k8lN8Xx+3Gkm3aUyQhihbZknspKUtJIX0l2cuSlJKEIlqQZGsYjCXK
EoOy5dj33aBEKbLLviu/5/fXvN6vZ55zz/l8zj33PrstbhpYszAxMa2xMjH9
/5fqacFxyOqBWl8ULVIj1hIq2kV1jUVNUNz7Y/GXla1gvarYR1T0OjIPLGDl
LbECvpCPmdxfXBDO3CRvf8QaqCWBIuyi95Go18n3Aa+tYf+kVdC6rRcyt1Hr
9e2zhl6+mH9rXY9RXOvKCbvtNiD+lkthZfUJYjpwy1BH3QYcjrs6Loo8Q3ED
kU81DG0gm9GXOHciAMVZXb9oYWQDK/a6PdO2L1Hf1m45OGkDccw9zxY1XyFz
x1+vHEVt4GTjq70LXSHIvOn+9KMRaxiO1Cqdux6KvJMjKgXirCHA6q/p7GoY
wtZHnsietIaDB7OXpgMjkPntk8mTHVbQvmoXOiXyBvUdL4u3M7SCu9W7Dk5m
URDTocQ/6WWWsP01o37iRDTyzvvJzNhpCcVmz23HO6jIG7tcmLSxAAtpzDpm
G4vwUb3LG2OuAcuqe/OcRxzyZrkRaFxuDow+w51zmjRUIuVdTUm/Cm5pPPkz
XfGIyWEsVfPVf6AdMsgxE5eAmFSfgtFZExB2K704fT0R4XmDVudhIyg5cW9q
cjUJefseSLbMOQ8h+wzUJiveIu9NCkHCjXpgxX8g4E9gMvLO6VeuH9cCzm+/
JCdE3iGmnstPl4oV4EvJZ9fxYYITyTeeNYjB+7eR5WNZ7xHT6baY3AFBdNbl
7NXRE2mIaVqz+fsARuFcBeFDth8Qk98Z95HkSyjnnrbL7a2ZqKTry+pWziso
elRx26xHJvK+KqF/qdwcObUI2c5oZiF8j6ynctsaCUXXsEx30RGOKEsafXUT
rfJ9fOesmo2mLPwWXURvoYFHCfpTcdnIe5KjNs/LBX209YyZvJ6DnINT2e4Y
uqLLR+RV/qzmInOuVdPnpg8QrS721phIPsqrzdfYbeeL5iJzpX8E5CPRva33
zS2foFO29f1ty/moZCUzo9XCD42zLhoWtBcgqZwH/+ScniKl42dVnvkXIbeC
rR/2fgxALR/WWCQnAeUsJAXGsbxGQojLbINsCVqo750/HfcaHZMIVfG3KkF/
hK8odKJQFDT3bta9tQSlMb9QCPENQ/KvOqwtUkvRoI/glLx4JPKq26996Go5
utGlIKOTT0UpWZ8kUsPK0fPPZxfyb8egtkgN1r0N5WjpiuDtr3KxSNz2UtFW
5QqU2bRYGGQUh+pYfWWZyJVo4Wfx0Q+9NLT5+Deh5qoqxM6X/GdOMAllfHj2
zUG2DrXtD2OV4UxDo0KjAdrX6lDU0E73h3fSkORdbTWp0Dqkz+118OqvNBSn
ykPrX65DZSqqfPWQjkJqA2wuV9ajctliW5FHH9Dd/pfTWqaNKKXxR9bpoCwU
y1PvI6jZgiz2mPikGOUiW9T6ZtylHeneEYpcdv2MnH7v68/J+Io4vpQdVVOs
Rn1mX0mltV+Rd6sJWc60Gl348lS2ceArkqcc6Nv6qBop1Q/d/729G/l+In3o
qKtGrFlJApv9u9HH+aX54Ss1KNJjt9q9q9/QKxHRBuHHtaiUvO2NskAvqhHz
zPkD9Ug+sKZYU6YXtaSdoSj216O3HG4D50/1IpUllVQHjgYUsNwpd8OjF3lN
83x8o9uAjH6EVlGGe1GKevuJua4GNPpeYG615Dv6uGjYf360EXHv9pX8odSH
OMrLWd5ONKMa1Vdynpp9qPpV6IezbC3I71KM4k6DPuS370lykWALYgnO0/rP
vg/VfbolcXN/C1r5N27bRe1DQSNHju+/1oLGegxTmll+Iv/byjnz1S2oIVJy
X0nDT/QxTW5R9Xkrep4jf+jq159oV3vav29hreh0i7ryv98/kdce1+83aK2o
gtP0jOr6T/RoNO+LcV4rKrobfD3v0C/0LrUm1OF3K0q/uPwuM/wXYmv4LeCs
2oaCBOqlaeb9yErgr5ZRbxvKV9yZe9apH+mo3NMIHWpDA2Y30dqDfjS7dsKy
aLoNHUsnXzSO6Ef4xoWcOvZ2NHzG9OGGpn5Un1P0rWd/OzrhM9F8/9gAanl2
7kHp3Xbk9B5dljwzgM4WFhwK92pHlNZXAwyjAeSw5ux94Wk7mhJRWJZzGUCq
9ao+/m/aUUyRp9hgygBSsa+wbitoR0vz/K4Gm3+jRnnp7t6ldrRnp8X6+p7f
qPLbBoeDTAx09mTOs/RDv5EK11HSDU4GSgq5FEPS+40MNzWsvtrEQAZytOpi
n9/IoOzlFvpBBvI0mj3v8Oo3UnVkOaGiyEDvHmr2bIv9jYS6c7JSjjMQU8PI
1J2C3+j4FuN5RW0GSrc7vF1m+jcKmmS9stOCgb689E388u836r8/NMKwZSC2
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
JZbX18n46x+OnXujkuB/8HrbPg==
           "]]}, Annotation[#, "Charting`Private`Tag$5118#1"]& ], 
        TagBox[{
          Directive[
           Opacity[1.], 
           AbsoluteThickness[1.6], 
           RGBColor[0.922526, 0.385626, 0.209179]], 
          LineBox[CompressedData["
1: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
KKnm0a1XO1yx1atZ4btxvEjfnnfrzAlP7Biss6YWz4uYuFIlG296Yi+dt+2k
RCJep+qnXGWeOGLBK5aawovumukoZ6l64ecn/62mZvKia+8G6icveuN/Xzbb
HhXyolNjTzf5TvhihkSL13bPeJG89LMtx1x9Menql5hDL3iRMXe7zL0nvliQ
5Y7K89e8qMun8pCcwA2sosby+t1HXhRWNf7x3uwNTG0ixVRU8aLfnLtJbwJu
4vSHTnZh33lRkaGBQOHTm/ihZ4Py+VpedHWL7GRL501cxE9dqW3gRbIvmXU+
HPXHPca8ds2tvKjY6wNzars/Hhb3VE5u50XZ1YvHFzf88dRai6BBJy+64rqd
yX/fLcyQndLa1cOLFN6KDi+43MJiv3coD/zmRTe/niy6uXILH3nrJ5g7xIuk
PR1qRgUCsHxo9z+bEV40eLVU100+AKuLZb78M8aLzFeHZX94B2D95fWownFe
xLarrjInMQCbfzezdZok2H1GNvJFAHZ3EBacmeFFVW92Hk4dDMD+p27/ez3H
i84KHBn5sB6AQ7kGWjwXiPoXPpwa2xqI0148jFpe5kXuKlUGfsqB+EEQk23x
Ci/6UBk20WIYiAu1bJT813iR9vWK0/JOgfjt3srdihuEHv6E/84PCsSlc/v/
bW4S+mHuvCGUGIj/B0sBiNg=
           "]]}, 
         Annotation[#, "Charting`Private`Tag$5118#2"]& ]}}, {}, {}}}, {
    DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {-0.2055761012881581, 0.3270583716226344}}, 
     PlotRangeClipping -> True, ImagePadding -> All, DisplayFunction -> 
     Identity, AspectRatio -> NCache[GoldenRatio^(-1), 0.6180339887498948], 
     Axes -> {True, True}, AxesLabel -> {
       FormBox["\"t\"", TraditionalForm], 
       FormBox[
       "\"\[LeftAngleBracket]\\!\\(\\*SubscriptBox[\\(J\\), \\(A\\)]\\)[t]\\!\
\\(\\*SubscriptBox[\\(J\\), \\(B\\)]\\)[0]\\!\\(\\*SubscriptBox[\\(\
\[RightAngleBracket]\\), \\(\[Beta]\\)]\\)\"", TraditionalForm]}, 
     AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], 
     Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
           (Identity[#]& )[
            Part[#, 1]], 
           (Identity[#]& )[
            Part[#, 2]]}& ), "CopiedValueFunction" -> ({
           (Identity[#]& )[
            Part[#, 1]], 
           (Identity[#]& )[
            Part[#, 2]]}& )}}, PlotLabel -> 
     FormBox["\"Fermi-Hubbard model with\\nt=1, U=2, \[Mu]=1/7, L=5, \
\[Beta]=0.1 (scheme C)\\n\\!\\(\\*SubscriptBox[\\(J\\), \\(A\\)]\\): spin \
current sites (2,3), \\!\\(\\*SubscriptBox[\\(J\\), \\(B\\)]\\): spin current \
sites (3,4)\\nred: independent reference calculation\"", TraditionalForm], 
     PlotRange -> {{0, 5.}, {-0.2055761012881581, 0.3270583716226344}}, 
     PlotRangeClipping -> True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{"\"Re\"", "\"Im\""}, "PointLegend", 
      DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{{}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.462], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.462], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], 
                    PointBox[
                    NCache[{
                    Scaled[{
                    Rational[1, 2], 
                    Rational[1, 2]}]}, {
                    Scaled[{0.5, 0.5}]}]]}}}, AspectRatio -> Full, 
                    ImageSize -> {10, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{{}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.462], 
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    AbsoluteThickness[1.6]], {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.462], 
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    AbsoluteThickness[1.6]], 
                    PointBox[
                    NCache[{
                    Scaled[{
                    Rational[1, 2], 
                    Rational[1, 2]}]}, {
                    Scaled[{0.5, 0.5}]}]]}}}, AspectRatio -> Full, 
                    ImageSize -> {10, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
         FontFamily -> "Arial"}, Background -> Automatic, StripOnInput -> 
         False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"PointLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.012833333333333334`", "]"}], 
                   ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.24561133333333335`, 0.3378526666666667, 
                    0.4731986666666667], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0.368417, 0.506779, 0.709798]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.368417, 0.506779, 0.709798]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.368417, 0.506779, 0.709798], Editable -> False,
                     Selectable -> False], ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}]}], "]"}], 
               ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.012833333333333334`", "]"}], 
                   ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.587148, 0.40736066666666665`, 0.09470066666666668], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0.880722, 0.611041, 0.142051]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.880722, 0.611041, 0.142051]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.880722, 0.611041, 0.142051], Editable -> False,
                     Selectable -> False], ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}]}], "]"}]}],
              "}"}], ",", 
           RowBox[{"{", 
             RowBox[{#, ",", #2}], "}"}], ",", 
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}], ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{"False", ",", "False"}], "}"}]}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& ), 
      Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output",ExpressionU\
UID->"721898a4-8d3d-408f-b8eb-c60e9c52378e"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Virtual bond dimensions", "Subsection",ExpressionUUID->"f73cd99e-d483-464f-8ee9-81b99942e3fe"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["t", "plot"], "=", 
   RowBox[{"Range", "[", 
    RowBox[{"0", ",", "5"}], "]"}]}], ";"}]], "Input",ExpressionUUID->\
"31224136-8e99-4b26-8a99-38bd58a9c135"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"virtual", " ", "bond", " ", "dimension", " ", 
    RowBox[{"for", " ", "'"}], 
    RowBox[{
     SubscriptBox["J", "A"], "'"}], " ", "charge", " ", "current", " ", 
    "operator"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"Lv", "=", 
       SubscriptBox["L", "val"]}], ",", "data"}], "}"}], ",", 
    RowBox[{
     RowBox[{"data", "=", 
      RowBox[{"Partition", "[", 
       RowBox[{
        RowBox[{"Import", "[", 
         RowBox[{
          RowBox[{"\"\<../output/fermi_hubbard/L\>\"", "<>", 
           RowBox[{"ToString", "[", "Lv", "]"}], "<>", 
           "\"\<_charge_current/fermi_hubbard_L\>\"", "<>", 
           RowBox[{"ToString", "[", "Lv", "]"}], "<>", "\"\<_DXA.dat\>\""}], 
          ",", "\"\<Integer64\>\""}], "]"}], ",", 
        RowBox[{"Lv", "+", "1"}]}], "]"}]}], ";", 
     RowBox[{"data", "=", 
      RowBox[{
       RowBox[{
        RowBox[{
        "data", "\[LeftDoubleBracket]", "#", "\[RightDoubleBracket]"}], "&"}],
        "/@", 
       RowBox[{"Flatten", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"Position", "[", 
           RowBox[{
            SubscriptBox["t", "list"], ",", "#"}], "]"}], "&"}], "/@", 
         SubscriptBox["t", "plot"]}], "]"}]}]}], ";", 
     RowBox[{"ListLinePlot", "[", 
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"Range", "[", 
             RowBox[{"0", ",", "Lv"}], "]"}], ",", "#"}], "}"}], "]"}], "&"}],
         "/@", "data"}], ",", 
       RowBox[{"AxesLabel", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{
         "\"\<j\>\"", ",", 
          "\"\<\!\(\*SubscriptBox[\(D\), \(A, j\)]\)(t)\>\""}], "}"}]}], ",", 
       RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
       RowBox[{"PlotLabel", "\[Rule]", 
        RowBox[{
        "\"\<virtual bond dimension of \!\(\*SuperscriptBox[\(\[ExponentialE]\
\), \(\(-\[ImaginaryI]\)\\\ H\\\ t/2\)]\) \!\(\*SubscriptBox[\(J\), \(A\)]\) \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[Beta]\)\\\ H/2\)]\) \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\[ImaginaryI]\\\ H\\\ t/2\)]\)\\n\
\>\"", "<>", 
         RowBox[{
          SubscriptBox["plot", "label"], "[", "\"\<charge\>\"", "]"}]}]}], 
       ",", 
       RowBox[{"PlotStyle", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Lighter", "[", 
           RowBox[{"Blue", ",", 
            RowBox[{"2", "/", "3"}]}], "]"}], ",", 
          RowBox[{"Lighter", "[", 
           RowBox[{"Blue", ",", 
            RowBox[{"1", "/", "3"}]}], "]"}], ",", "Blue", ",", 
          RowBox[{"Darker", "[", 
           RowBox[{"Blue", ",", 
            RowBox[{"1", "/", "3"}]}], "]"}], ",", 
          RowBox[{"Darker", "[", 
           RowBox[{"Blue", ",", 
            RowBox[{"2", "/", "3"}]}], "]"}], ",", "Black"}], "}"}]}], ",", 
       RowBox[{"PlotLegends", "\[Rule]", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           RowBox[{"\"\<t=\>\"", "<>", 
            RowBox[{"ToString", "[", 
             RowBox[{"InputForm", "[", "#", "]"}], "]"}]}], "&"}], "/@", 
          SubscriptBox["t", "plot"]}], ")"}]}]}], "]"}]}]}], "]"}]}]], "Input",\
ExpressionUUID->"db66731d-0e47-49ce-8c4e-cbc5251e211e"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{}, {{{}, {}, {
        Hue[0.67, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[
          NCache[
           Rational[2, 3], 0.6666666666666666], 
          NCache[
           Rational[2, 3], 0.6666666666666666], 1]], 
        LineBox[{{0., 1.}, {1., 11.}, {2., 24.}, {3., 11.}, {4., 11.}, {5., 
         1.}}]}, {
        Hue[0.9060679774997897, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[
          NCache[
           Rational[1, 3], 0.3333333333333333], 
          NCache[
           Rational[1, 3], 0.3333333333333333], 1]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 59.}, {3., 42.}, {4., 16.}, {5., 
         1.}}]}, {
        Hue[0.1421359549995791, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 1]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 171.}, {3., 123.}, {4., 16.}, {5., 
         1.}}]}, {
        Hue[0.37820393249936934`, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[2, 3], 0.6666666666666666]]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 252.}, {3., 237.}, {4., 16.}, {5., 
         1.}}]}, {
        Hue[0.6142719099991583, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[1, 3], 0.3333333333333333]]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 256.}, {3., 256.}, {4., 16.}, {5., 
         1.}}]}, {
        Hue[0.8503398874989481, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         GrayLevel[0]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 256.}, {3., 256.}, {4., 16.}, {5., 
         1.}}]}}}, {}, {}, {{}, {}}, {{}, {}}}, {
    DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {0, 256.}}, PlotRangeClipping -> True, 
     ImagePadding -> All, DisplayFunction -> Identity, AspectRatio -> 
     NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> {True, True}, 
     AxesLabel -> {
       FormBox["\"j\"", TraditionalForm], 
       FormBox[
       "\"\\!\\(\\*SubscriptBox[\\(D\\), \\(A, j\\)]\\)(t)\"", 
        TraditionalForm]}, AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], 
     Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
           (Identity[#]& )[
            Part[#, 1]], 
           (Identity[#]& )[
            Part[#, 2]]}& ), "CopiedValueFunction" -> ({
           (Identity[#]& )[
            Part[#, 1]], 
           (Identity[#]& )[
            Part[#, 2]]}& )}}, PlotLabel -> 
     FormBox["\"virtual bond dimension of \\!\\(\\*SuperscriptBox[\\(\
\[ExponentialE]\\), \\(\\(-\[ImaginaryI]\\)\\\\ H\\\\ t/2\\)]\\) \
\\!\\(\\*SubscriptBox[\\(J\\), \\(A\\)]\\) \\!\\(\\*SuperscriptBox[\\(\
\[ExponentialE]\\), \\(\\(-\[Beta]\\)\\\\ H/2\\)]\\) \\!\\(\\*SuperscriptBox[\
\\(\[ExponentialE]\\), \\(\[ImaginaryI]\\\\ H\\\\ t/2\\)]\\)\\nFermi-Hubbard \
model with\\nt=1, U=2, \[Mu]=1/7, L=5, \[Beta]=0.1 (scheme \
C)\\n\\!\\(\\*SubscriptBox[\\(J\\), \\(A\\)]\\): charge current sites (2,3), \
\\!\\(\\*SubscriptBox[\\(J\\), \\(B\\)]\\): charge current sites (3,4)\"", 
       TraditionalForm], PlotRange -> {{0, 5.}, {0, 256.}}, PlotRangeClipping -> 
     True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{
      "\"t=0\"", "\"t=1\"", "\"t=2\"", "\"t=3\"", "\"t=4\"", "\"t=5\""}, 
      "LineLegend", DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 1]], {}}}, 
                    AspectRatio -> Full, ImageSize -> {20, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 1]], {}}}, 
                    AspectRatio -> Full, ImageSize -> {20, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 1]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #3}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[2, 3], 0.6666666666666666]]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[2, 3], 0.6666666666666666]]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #4}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[1, 3], 0.3333333333333333]]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[1, 3], 0.3333333333333333]]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #5}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    GrayLevel[0]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    GrayLevel[0]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #6}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
         FontFamily -> "Arial"}, Background -> Automatic, StripOnInput -> 
         False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"LineLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.4444444444444444, 0.4444444444444444, 
                    0.6666666666666666], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[2/3, 2/3, 1]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.2222222222222222, 0.2222222222222222, 
                    0.6666666666666666], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[1/3, 1/3, 1]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.6666666666666666], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0, 0, 1]"], Appearance -> None, BaseStyle -> {},
                     BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 
                    Rational[2, 3]], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.4444444444444444], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0, 0, 2/3]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 
                    Rational[2, 3]]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 
                    Rational[2, 3]], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 
                    Rational[1, 3]], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.2222222222222222], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0, 0, 1/3]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 
                    Rational[1, 3]]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 
                    Rational[1, 3]], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> GrayLevel[0.], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], "GrayLevel[0]"], 
                    Appearance -> None, BaseStyle -> {}, BaselinePosition -> 
                    Baseline, DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[0], Editable -> False, Selectable -> False]}], 
                 "]"}]}], "}"}], ",", 
           RowBox[{"{", 
             RowBox[{#, ",", #2, ",", #3, ",", #4, ",", #5, ",", #6}], "}"}], 
           ",", 
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}], ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               
               RowBox[{
                "True", ",", "True", ",", "True", ",", "True", ",", "True", 
                 ",", "True"}], "}"}]}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& ), 
      Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output",ExpressionU\
UID->"9bbe2ef7-26c7-4ec7-a513-1dc1088f536a"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"virtual", " ", "bond", " ", "dimension", " ", 
    RowBox[{"for", " ", "'"}], 
    RowBox[{
     SubscriptBox["J", "A"], "'"}], " ", "spin", " ", "current", " ", 
    "operator"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"Lv", "=", 
       SubscriptBox["L", "val"]}], ",", "data"}], "}"}], ",", 
    RowBox[{
     RowBox[{"data", "=", 
      RowBox[{"Partition", "[", 
       RowBox[{
        RowBox[{"Import", "[", 
         RowBox[{
          RowBox[{"\"\<../output/fermi_hubbard/L\>\"", "<>", 
           RowBox[{"ToString", "[", "Lv", "]"}], "<>", 
           "\"\<_spin_current/fermi_hubbard_L\>\"", "<>", 
           RowBox[{"ToString", "[", "Lv", "]"}], "<>", "\"\<_DXA.dat\>\""}], 
          ",", "\"\<Integer64\>\""}], "]"}], ",", 
        RowBox[{"Lv", "+", "1"}]}], "]"}]}], ";", 
     RowBox[{"data", "=", 
      RowBox[{
       RowBox[{
        RowBox[{
        "data", "\[LeftDoubleBracket]", "#", "\[RightDoubleBracket]"}], "&"}],
        "/@", 
       RowBox[{"Flatten", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"Position", "[", 
           RowBox[{
            SubscriptBox["t", "list"], ",", "#"}], "]"}], "&"}], "/@", 
         SubscriptBox["t", "plot"]}], "]"}]}]}], ";", 
     RowBox[{"ListLinePlot", "[", 
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"Range", "[", 
             RowBox[{"0", ",", "Lv"}], "]"}], ",", "#"}], "}"}], "]"}], "&"}],
         "/@", "data"}], ",", 
       RowBox[{"AxesLabel", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{
         "\"\<j\>\"", ",", 
          "\"\<\!\(\*SubscriptBox[\(D\), \(A, j\)]\)(t)\>\""}], "}"}]}], ",", 
       RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
       RowBox[{"PlotLabel", "\[Rule]", 
        RowBox[{
        "\"\<virtual bond dimension of \!\(\*SuperscriptBox[\(\[ExponentialE]\
\), \(\(-\[ImaginaryI]\)\\\ H\\\ t/2\)]\) \!\(\*SubscriptBox[\(J\), \(A\)]\) \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[Beta]\)\\\ H/2\)]\) \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\[ImaginaryI]\\\ H\\\ t/2\)]\)\\n\
\>\"", "<>", 
         RowBox[{
          SubscriptBox["plot", "label"], "[", "\"\<spin\>\"", "]"}]}]}], ",", 
       RowBox[{"PlotStyle", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Lighter", "[", 
           RowBox[{"Blue", ",", 
            RowBox[{"2", "/", "3"}]}], "]"}], ",", 
          RowBox[{"Lighter", "[", 
           RowBox[{"Blue", ",", 
            RowBox[{"1", "/", "3"}]}], "]"}], ",", "Blue", ",", 
          RowBox[{"Darker", "[", 
           RowBox[{"Blue", ",", 
            RowBox[{"1", "/", "3"}]}], "]"}], ",", 
          RowBox[{"Darker", "[", 
           RowBox[{"Blue", ",", 
            RowBox[{"2", "/", "3"}]}], "]"}], ",", "Black"}], "}"}]}], ",", 
       RowBox[{"PlotLegends", "\[Rule]", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           RowBox[{"\"\<t=\>\"", "<>", 
            RowBox[{"ToString", "[", 
             RowBox[{"InputForm", "[", "#", "]"}], "]"}]}], "&"}], "/@", 
          SubscriptBox["t", "plot"]}], ")"}]}]}], "]"}]}]}], "]"}]}]], "Input",\
ExpressionUUID->"62252575-e61d-45dc-b7df-292f9c7ac695"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{}, {{{}, {}, {
        Hue[0.67, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[
          NCache[
           Rational[2, 3], 0.6666666666666666], 
          NCache[
           Rational[2, 3], 0.6666666666666666], 1]], 
        LineBox[{{0., 1.}, {1., 11.}, {2., 24.}, {3., 11.}, {4., 11.}, {5., 
         1.}}]}, {
        Hue[0.9060679774997897, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[
          NCache[
           Rational[1, 3], 0.3333333333333333], 
          NCache[
           Rational[1, 3], 0.3333333333333333], 1]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 55.}, {3., 38.}, {4., 16.}, {5., 
         1.}}]}, {
        Hue[0.1421359549995791, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 1]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 167.}, {3., 122.}, {4., 16.}, {5., 
         1.}}]}, {
        Hue[0.37820393249936934`, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[2, 3], 0.6666666666666666]]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 253.}, {3., 240.}, {4., 16.}, {5., 
         1.}}]}, {
        Hue[0.6142719099991583, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[1, 3], 0.3333333333333333]]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 256.}, {3., 256.}, {4., 16.}, {5., 
         1.}}]}, {
        Hue[0.8503398874989481, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         GrayLevel[0]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 256.}, {3., 256.}, {4., 16.}, {5., 
         1.}}]}}}, {}, {}, {{}, {}}, {{}, {}}}, {
    DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {0, 256.}}, PlotRangeClipping -> True, 
     ImagePadding -> All, DisplayFunction -> Identity, AspectRatio -> 
     NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> {True, True}, 
     AxesLabel -> {
       FormBox["\"j\"", TraditionalForm], 
       FormBox[
       "\"\\!\\(\\*SubscriptBox[\\(D\\), \\(A, j\\)]\\)(t)\"", 
        TraditionalForm]}, AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], 
     Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
           (Identity[#]& )[
            Part[#, 1]], 
           (Identity[#]& )[
            Part[#, 2]]}& ), "CopiedValueFunction" -> ({
           (Identity[#]& )[
            Part[#, 1]], 
           (Identity[#]& )[
            Part[#, 2]]}& )}}, PlotLabel -> 
     FormBox["\"virtual bond dimension of \\!\\(\\*SuperscriptBox[\\(\
\[ExponentialE]\\), \\(\\(-\[ImaginaryI]\\)\\\\ H\\\\ t/2\\)]\\) \
\\!\\(\\*SubscriptBox[\\(J\\), \\(A\\)]\\) \\!\\(\\*SuperscriptBox[\\(\
\[ExponentialE]\\), \\(\\(-\[Beta]\\)\\\\ H/2\\)]\\) \\!\\(\\*SuperscriptBox[\
\\(\[ExponentialE]\\), \\(\[ImaginaryI]\\\\ H\\\\ t/2\\)]\\)\\nFermi-Hubbard \
model with\\nt=1, U=2, \[Mu]=1/7, L=5, \[Beta]=0.1 (scheme \
C)\\n\\!\\(\\*SubscriptBox[\\(J\\), \\(A\\)]\\): spin current sites (2,3), \
\\!\\(\\*SubscriptBox[\\(J\\), \\(B\\)]\\): spin current sites (3,4)\"", 
       TraditionalForm], PlotRange -> {{0, 5.}, {0, 256.}}, PlotRangeClipping -> 
     True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{
      "\"t=0\"", "\"t=1\"", "\"t=2\"", "\"t=3\"", "\"t=4\"", "\"t=5\""}, 
      "LineLegend", DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 1]], {}}}, 
                    AspectRatio -> Full, ImageSize -> {20, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 1]], {}}}, 
                    AspectRatio -> Full, ImageSize -> {20, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 1]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #3}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[2, 3], 0.6666666666666666]]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[2, 3], 0.6666666666666666]]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #4}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[1, 3], 0.3333333333333333]]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[1, 3], 0.3333333333333333]]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #5}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    GrayLevel[0]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    GrayLevel[0]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #6}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
         FontFamily -> "Arial"}, Background -> Automatic, StripOnInput -> 
         False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"LineLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.4444444444444444, 0.4444444444444444, 
                    0.6666666666666666], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[2/3, 2/3, 1]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.2222222222222222, 0.2222222222222222, 
                    0.6666666666666666], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[1/3, 1/3, 1]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.6666666666666666], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0, 0, 1]"], Appearance -> None, BaseStyle -> {},
                     BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 
                    Rational[2, 3]], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.4444444444444444], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0, 0, 2/3]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 
                    Rational[2, 3]]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 
                    Rational[2, 3]], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 
                    Rational[1, 3]], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.2222222222222222], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0, 0, 1/3]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 
                    Rational[1, 3]]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 
                    Rational[1, 3]], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> GrayLevel[0.], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], "GrayLevel[0]"], 
                    Appearance -> None, BaseStyle -> {}, BaselinePosition -> 
                    Baseline, DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[0], Editable -> False, Selectable -> False]}], 
                 "]"}]}], "}"}], ",", 
           RowBox[{"{", 
             RowBox[{#, ",", #2, ",", #3, ",", #4, ",", #5, ",", #6}], "}"}], 
           ",", 
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}], ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               
               RowBox[{
                "True", ",", "True", ",", "True", ",", "True", ",", "True", 
                 ",", "True"}], "}"}]}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& ), 
      Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output",ExpressionU\
UID->"2ac0a7f3-d227-41d5-800a-ebf98ed4d55b"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"virtual", " ", "bond", " ", "dimension", " ", 
    RowBox[{"for", " ", "'"}], 
    RowBox[{
     SubscriptBox["J", "B"], "'"}], " ", "charge", " ", "current", " ", 
    "operator"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"Lv", "=", 
       SubscriptBox["L", "val"]}], ",", "data"}], "}"}], ",", 
    RowBox[{
     RowBox[{"data", "=", 
      RowBox[{"Partition", "[", 
       RowBox[{
        RowBox[{"Import", "[", 
         RowBox[{
          RowBox[{"\"\<../output/fermi_hubbard/L\>\"", "<>", 
           RowBox[{"ToString", "[", "Lv", "]"}], "<>", 
           "\"\<_charge_current/fermi_hubbard_L\>\"", "<>", 
           RowBox[{"ToString", "[", "Lv", "]"}], "<>", "\"\<_DXB.dat\>\""}], 
          ",", "\"\<Integer64\>\""}], "]"}], ",", 
        RowBox[{"Lv", "+", "1"}]}], "]"}]}], ";", 
     RowBox[{"data", "=", 
      RowBox[{
       RowBox[{
        RowBox[{
        "data", "\[LeftDoubleBracket]", "#", "\[RightDoubleBracket]"}], "&"}],
        "/@", 
       RowBox[{"Flatten", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"Position", "[", 
           RowBox[{
            SubscriptBox["t", "list"], ",", "#"}], "]"}], "&"}], "/@", 
         SubscriptBox["t", "plot"]}], "]"}]}]}], ";", 
     RowBox[{"ListLinePlot", "[", 
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"Range", "[", 
             RowBox[{"0", ",", "Lv"}], "]"}], ",", "#"}], "}"}], "]"}], "&"}],
         "/@", "data"}], ",", 
       RowBox[{"AxesLabel", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{
         "\"\<j\>\"", ",", 
          "\"\<\!\(\*SubscriptBox[\(D\), \(B, j\)]\)(t)\>\""}], "}"}]}], ",", 
       RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
       RowBox[{"PlotLabel", "\[Rule]", 
        RowBox[{
        "\"\<virtual bond dimension of \!\(\*SuperscriptBox[\(\[ExponentialE]\
\), \(\[ImaginaryI]\\\ H\\\ t/2\)]\) \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[Beta]\)\\\ H/2\)]\) \
\!\(\*SubscriptBox[\(J\), \(B\)]\) \!\(\*SuperscriptBox[\(\[ExponentialE]\), \
\(\(-\[ImaginaryI]\)\\\ H\\\ t/2\)]\)\\n\>\"", "<>", 
         RowBox[{
          SubscriptBox["plot", "label"], "[", "\"\<charge\>\"", "]"}]}]}], 
       ",", 
       RowBox[{"PlotStyle", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Lighter", "[", 
           RowBox[{"Blue", ",", 
            RowBox[{"2", "/", "3"}]}], "]"}], ",", 
          RowBox[{"Lighter", "[", 
           RowBox[{"Blue", ",", 
            RowBox[{"1", "/", "3"}]}], "]"}], ",", "Blue", ",", 
          RowBox[{"Darker", "[", 
           RowBox[{"Blue", ",", 
            RowBox[{"1", "/", "3"}]}], "]"}], ",", 
          RowBox[{"Darker", "[", 
           RowBox[{"Blue", ",", 
            RowBox[{"2", "/", "3"}]}], "]"}], ",", "Black"}], "}"}]}], ",", 
       RowBox[{"PlotLegends", "\[Rule]", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           RowBox[{"\"\<t=\>\"", "<>", 
            RowBox[{"ToString", "[", 
             RowBox[{"InputForm", "[", "#", "]"}], "]"}]}], "&"}], "/@", 
          SubscriptBox["t", "plot"]}], ")"}]}]}], "]"}]}]}], "]"}]}]], "Input",\
ExpressionUUID->"3f423ee4-ac84-4a0c-ae45-1a4bdaf4dffa"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{}, {{{}, {}, {
        Hue[0.67, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[
          NCache[
           Rational[2, 3], 0.6666666666666666], 
          NCache[
           Rational[2, 3], 0.6666666666666666], 1]], 
        LineBox[{{0., 1.}, {1., 11.}, {2., 11.}, {3., 24.}, {4., 11.}, {5., 
         1.}}]}, {
        Hue[0.9060679774997897, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[
          NCache[
           Rational[1, 3], 0.3333333333333333], 
          NCache[
           Rational[1, 3], 0.3333333333333333], 1]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 41.}, {3., 61.}, {4., 16.}, {5., 
         1.}}]}, {
        Hue[0.1421359549995791, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 1]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 119.}, {3., 175.}, {4., 16.}, {5., 
         1.}}]}, {
        Hue[0.37820393249936934`, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[2, 3], 0.6666666666666666]]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 237.}, {3., 251.}, {4., 16.}, {5., 
         1.}}]}, {
        Hue[0.6142719099991583, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[1, 3], 0.3333333333333333]]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 256.}, {3., 256.}, {4., 16.}, {5., 
         1.}}]}, {
        Hue[0.8503398874989481, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         GrayLevel[0]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 256.}, {3., 256.}, {4., 16.}, {5., 
         1.}}]}}}, {}, {}, {{}, {}}, {{}, {}}}, {
    DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {0, 256.}}, PlotRangeClipping -> True, 
     ImagePadding -> All, DisplayFunction -> Identity, AspectRatio -> 
     NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> {True, True}, 
     AxesLabel -> {
       FormBox["\"j\"", TraditionalForm], 
       FormBox[
       "\"\\!\\(\\*SubscriptBox[\\(D\\), \\(B, j\\)]\\)(t)\"", 
        TraditionalForm]}, AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], 
     Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
           (Identity[#]& )[
            Part[#, 1]], 
           (Identity[#]& )[
            Part[#, 2]]}& ), "CopiedValueFunction" -> ({
           (Identity[#]& )[
            Part[#, 1]], 
           (Identity[#]& )[
            Part[#, 2]]}& )}}, PlotLabel -> 
     FormBox["\"virtual bond dimension of \\!\\(\\*SuperscriptBox[\\(\
\[ExponentialE]\\), \\(\[ImaginaryI]\\\\ H\\\\ t/2\\)]\\) \
\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \\(\\(-\[Beta]\\)\\\\ \
H/2\\)]\\) \\!\\(\\*SubscriptBox[\\(J\\), \\(B\\)]\\) \
\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \\(\\(-\[ImaginaryI]\\)\\\\ \
H\\\\ t/2\\)]\\)\\nFermi-Hubbard model with\\nt=1, U=2, \[Mu]=1/7, L=5, \
\[Beta]=0.1 (scheme C)\\n\\!\\(\\*SubscriptBox[\\(J\\), \\(A\\)]\\): charge \
current sites (2,3), \\!\\(\\*SubscriptBox[\\(J\\), \\(B\\)]\\): charge \
current sites (3,4)\"", TraditionalForm], PlotRange -> {{0, 5.}, {0, 256.}}, 
     PlotRangeClipping -> True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{
      "\"t=0\"", "\"t=1\"", "\"t=2\"", "\"t=3\"", "\"t=4\"", "\"t=5\""}, 
      "LineLegend", DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 1]], {}}}, 
                    AspectRatio -> Full, ImageSize -> {20, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 1]], {}}}, 
                    AspectRatio -> Full, ImageSize -> {20, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 1]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #3}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[2, 3], 0.6666666666666666]]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[2, 3], 0.6666666666666666]]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #4}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[1, 3], 0.3333333333333333]]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[1, 3], 0.3333333333333333]]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #5}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    GrayLevel[0]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    GrayLevel[0]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #6}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
         FontFamily -> "Arial"}, Background -> Automatic, StripOnInput -> 
         False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"LineLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.4444444444444444, 0.4444444444444444, 
                    0.6666666666666666], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[2/3, 2/3, 1]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.2222222222222222, 0.2222222222222222, 
                    0.6666666666666666], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[1/3, 1/3, 1]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.6666666666666666], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0, 0, 1]"], Appearance -> None, BaseStyle -> {},
                     BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 
                    Rational[2, 3]], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.4444444444444444], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0, 0, 2/3]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 
                    Rational[2, 3]]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 
                    Rational[2, 3]], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 
                    Rational[1, 3]], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.2222222222222222], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0, 0, 1/3]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 
                    Rational[1, 3]]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 
                    Rational[1, 3]], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> GrayLevel[0.], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], "GrayLevel[0]"], 
                    Appearance -> None, BaseStyle -> {}, BaselinePosition -> 
                    Baseline, DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[0], Editable -> False, Selectable -> False]}], 
                 "]"}]}], "}"}], ",", 
           RowBox[{"{", 
             RowBox[{#, ",", #2, ",", #3, ",", #4, ",", #5, ",", #6}], "}"}], 
           ",", 
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}], ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               
               RowBox[{
                "True", ",", "True", ",", "True", ",", "True", ",", "True", 
                 ",", "True"}], "}"}]}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& ), 
      Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output",ExpressionU\
UID->"a2e11446-0bda-474a-aacd-11b39c9e426e"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"virtual", " ", "bond", " ", "dimension", " ", 
    RowBox[{"for", " ", "'"}], 
    RowBox[{
     SubscriptBox["J", "B"], "'"}], " ", "spin", " ", "current", " ", 
    "operator"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"Lv", "=", 
       SubscriptBox["L", "val"]}], ",", "data"}], "}"}], ",", 
    RowBox[{
     RowBox[{"data", "=", 
      RowBox[{"Partition", "[", 
       RowBox[{
        RowBox[{"Import", "[", 
         RowBox[{
          RowBox[{"\"\<../output/fermi_hubbard/L\>\"", "<>", 
           RowBox[{"ToString", "[", "Lv", "]"}], "<>", 
           "\"\<_spin_current/fermi_hubbard_L\>\"", "<>", 
           RowBox[{"ToString", "[", "Lv", "]"}], "<>", "\"\<_DXB.dat\>\""}], 
          ",", "\"\<Integer64\>\""}], "]"}], ",", 
        RowBox[{"Lv", "+", "1"}]}], "]"}]}], ";", 
     RowBox[{"data", "=", 
      RowBox[{
       RowBox[{
        RowBox[{
        "data", "\[LeftDoubleBracket]", "#", "\[RightDoubleBracket]"}], "&"}],
        "/@", 
       RowBox[{"Flatten", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"Position", "[", 
           RowBox[{
            SubscriptBox["t", "list"], ",", "#"}], "]"}], "&"}], "/@", 
         SubscriptBox["t", "plot"]}], "]"}]}]}], ";", 
     RowBox[{"ListLinePlot", "[", 
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"Range", "[", 
             RowBox[{"0", ",", "Lv"}], "]"}], ",", "#"}], "}"}], "]"}], "&"}],
         "/@", "data"}], ",", 
       RowBox[{"AxesLabel", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{
         "\"\<j\>\"", ",", 
          "\"\<\!\(\*SubscriptBox[\(D\), \(B, j\)]\)(t)\>\""}], "}"}]}], ",", 
       RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
       RowBox[{"PlotLabel", "\[Rule]", 
        RowBox[{
        "\"\<virtual bond dimension of \!\(\*SuperscriptBox[\(\[ExponentialE]\
\), \(\[ImaginaryI]\\\ H\\\ t/2\)]\) \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[Beta]\)\\\ H/2\)]\) \
\!\(\*SubscriptBox[\(J\), \(B\)]\) \!\(\*SuperscriptBox[\(\[ExponentialE]\), \
\(\(-\[ImaginaryI]\)\\\ H\\\ t/2\)]\)\\n\>\"", "<>", 
         RowBox[{
          SubscriptBox["plot", "label"], "[", "\"\<spin\>\"", "]"}]}]}], ",", 
       RowBox[{"PlotStyle", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Lighter", "[", 
           RowBox[{"Blue", ",", 
            RowBox[{"2", "/", "3"}]}], "]"}], ",", 
          RowBox[{"Lighter", "[", 
           RowBox[{"Blue", ",", 
            RowBox[{"1", "/", "3"}]}], "]"}], ",", "Blue", ",", 
          RowBox[{"Darker", "[", 
           RowBox[{"Blue", ",", 
            RowBox[{"1", "/", "3"}]}], "]"}], ",", 
          RowBox[{"Darker", "[", 
           RowBox[{"Blue", ",", 
            RowBox[{"2", "/", "3"}]}], "]"}], ",", "Black"}], "}"}]}], ",", 
       RowBox[{"PlotLegends", "\[Rule]", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           RowBox[{"\"\<t=\>\"", "<>", 
            RowBox[{"ToString", "[", 
             RowBox[{"InputForm", "[", "#", "]"}], "]"}]}], "&"}], "/@", 
          SubscriptBox["t", "plot"]}], ")"}]}]}], "]"}]}]}], "]"}]}]], "Input",\
ExpressionUUID->"72c5f34c-6bf7-45ab-81d6-049576a44131"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{}, {{{}, {}, {
        Hue[0.67, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[
          NCache[
           Rational[2, 3], 0.6666666666666666], 
          NCache[
           Rational[2, 3], 0.6666666666666666], 1]], 
        LineBox[{{0., 1.}, {1., 11.}, {2., 11.}, {3., 24.}, {4., 11.}, {5., 
         1.}}]}, {
        Hue[0.9060679774997897, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[
          NCache[
           Rational[1, 3], 0.3333333333333333], 
          NCache[
           Rational[1, 3], 0.3333333333333333], 1]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 36.}, {3., 58.}, {4., 16.}, {5., 
         1.}}]}, {
        Hue[0.1421359549995791, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 1]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 117.}, {3., 170.}, {4., 16.}, {5., 
         1.}}]}, {
        Hue[0.37820393249936934`, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[2, 3], 0.6666666666666666]]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 240.}, {3., 253.}, {4., 16.}, {5., 
         1.}}]}, {
        Hue[0.6142719099991583, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[1, 3], 0.3333333333333333]]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 256.}, {3., 256.}, {4., 16.}, {5., 
         1.}}]}, {
        Hue[0.8503398874989481, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         GrayLevel[0]], 
        LineBox[{{0., 1.}, {1., 16.}, {2., 256.}, {3., 256.}, {4., 16.}, {5., 
         1.}}]}}}, {}, {}, {{}, {}}, {{}, {}}}, {
    DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {0, 256.}}, PlotRangeClipping -> True, 
     ImagePadding -> All, DisplayFunction -> Identity, AspectRatio -> 
     NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> {True, True}, 
     AxesLabel -> {
       FormBox["\"j\"", TraditionalForm], 
       FormBox[
       "\"\\!\\(\\*SubscriptBox[\\(D\\), \\(B, j\\)]\\)(t)\"", 
        TraditionalForm]}, AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], 
     Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
           (Identity[#]& )[
            Part[#, 1]], 
           (Identity[#]& )[
            Part[#, 2]]}& ), "CopiedValueFunction" -> ({
           (Identity[#]& )[
            Part[#, 1]], 
           (Identity[#]& )[
            Part[#, 2]]}& )}}, PlotLabel -> 
     FormBox["\"virtual bond dimension of \\!\\(\\*SuperscriptBox[\\(\
\[ExponentialE]\\), \\(\[ImaginaryI]\\\\ H\\\\ t/2\\)]\\) \
\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \\(\\(-\[Beta]\\)\\\\ \
H/2\\)]\\) \\!\\(\\*SubscriptBox[\\(J\\), \\(B\\)]\\) \
\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \\(\\(-\[ImaginaryI]\\)\\\\ \
H\\\\ t/2\\)]\\)\\nFermi-Hubbard model with\\nt=1, U=2, \[Mu]=1/7, L=5, \
\[Beta]=0.1 (scheme C)\\n\\!\\(\\*SubscriptBox[\\(J\\), \\(A\\)]\\): spin \
current sites (2,3), \\!\\(\\*SubscriptBox[\\(J\\), \\(B\\)]\\): spin current \
sites (3,4)\"", TraditionalForm], PlotRange -> {{0, 5.}, {0, 256.}}, 
     PlotRangeClipping -> True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{
      "\"t=0\"", "\"t=1\"", "\"t=2\"", "\"t=3\"", "\"t=4\"", "\"t=5\""}, 
      "LineLegend", DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 1]], {}}}, 
                    AspectRatio -> Full, ImageSize -> {20, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 1]], {}}}, 
                    AspectRatio -> Full, ImageSize -> {20, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 1]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #3}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[2, 3], 0.6666666666666666]]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[2, 3], 0.6666666666666666]]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #4}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[1, 3], 0.3333333333333333]]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[1, 3], 0.3333333333333333]]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #5}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    GrayLevel[0]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    GrayLevel[0]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #6}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
         FontFamily -> "Arial"}, Background -> Automatic, StripOnInput -> 
         False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"LineLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.4444444444444444, 0.4444444444444444, 
                    0.6666666666666666], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[2/3, 2/3, 1]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.2222222222222222, 0.2222222222222222, 
                    0.6666666666666666], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[1/3, 1/3, 1]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.6666666666666666], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0, 0, 1]"], Appearance -> None, BaseStyle -> {},
                     BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 
                    Rational[2, 3]], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.4444444444444444], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0, 0, 2/3]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 
                    Rational[2, 3]]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 
                    Rational[2, 3]], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 
                    Rational[1, 3]], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.2222222222222222], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "RGBColor[0, 0, 1/3]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 
                    Rational[1, 3]]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 
                    Rational[1, 3]], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> GrayLevel[0.], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], "GrayLevel[0]"], 
                    Appearance -> None, BaseStyle -> {}, BaselinePosition -> 
                    Baseline, DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[0], Editable -> False, Selectable -> False]}], 
                 "]"}]}], "}"}], ",", 
           RowBox[{"{", 
             RowBox[{#, ",", #2, ",", #3, ",", #4, ",", #5, ",", #6}], "}"}], 
           ",", 
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}], ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               
               RowBox[{
                "True", ",", "True", ",", "True", ",", "True", ",", "True", 
                 ",", "True"}], "}"}]}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& ), 
      Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output",ExpressionU\
UID->"44e2595e-f2ae-4974-93e1-43a30e25a02d"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Effective truncation weight", "Subsection",ExpressionUUID->"91b72f4c-63e8-46da-a475-f3ec917b56ad"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"tolerance", " ", 
    RowBox[{"(", 
     RowBox[{"truncation", " ", "weight"}], ")"}], " ", "for", " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Beta]"}], " ", 
      RowBox[{"H", "/", "2"}]}]]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"Partition", "[", 
     RowBox[{
      RowBox[{"Import", "[", 
       RowBox[{
        RowBox[{"\"\<../output/fermi_hubbard/L\>\"", "<>", 
         RowBox[{"ToString", "[", 
          SubscriptBox["L", "val"], "]"}], "<>", 
         "\"\<_rho/fermi_hubbard_L\>\"", "<>", 
         RowBox[{"ToString", "[", 
          SubscriptBox["L", "val"], "]"}], "<>", "\"\<_beta\>\"", "<>", 
         RowBox[{"ToFileString", "[", 
          SubscriptBox["\[Beta]", "val"], "]"}], "<>", 
         "\"\<_tol_eff.dat\>\""}], ",", "\"\<Real64\>\""}], "]"}], ",", 
      RowBox[{
       SubscriptBox["L", "val"], "-", "1"}]}], "]"}], "-", 
    SuperscriptBox["10", 
     RowBox[{"-", "8"}]]}], "]"}]}]], "Input",ExpressionUUID->"1a812da6-882e-\
45cd-be69-52302a3414d7"],

Cell[BoxData["0.`"], "Output",ExpressionUUID->"62659461-c25a-4270-8155-0774da82b521"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"tolerance", " ", 
    RowBox[{"(", 
     RowBox[{"truncation", " ", "weight"}], ")"}], " ", "for", " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[ImaginaryI]"}], " ", "H", " ", 
      RowBox[{"t", "/", "2"}]}]], " ", 
    SubscriptBox["J", "A"], " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Beta]"}], " ", 
      RowBox[{"H", "/", "2"}]}]], " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{"\[ImaginaryI]", " ", "H", " ", 
      RowBox[{"t", "/", "2"}]}]]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{"Partition", "[", 
      RowBox[{
       RowBox[{"Import", "[", 
        RowBox[{
         RowBox[{"\"\<../output/fermi_hubbard/L\>\"", "<>", 
          RowBox[{"ToString", "[", 
           SubscriptBox["L", "val"], "]"}], "<>", 
          "\"\<_charge_current/fermi_hubbard_L\>\"", "<>", 
          RowBox[{"ToString", "[", 
           SubscriptBox["L", "val"], "]"}], "<>", "\"\<_tol_eff_A.dat\>\""}], 
         ",", "\"\<Real64\>\""}], "]"}], ",", 
       RowBox[{
        SubscriptBox["L", "val"], "-", "1"}]}], "]"}], "-", 
     SuperscriptBox["10", 
      RowBox[{"-", "8"}]]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{"Partition", "[", 
      RowBox[{
       RowBox[{"Import", "[", 
        RowBox[{
         RowBox[{"\"\<../output/fermi_hubbard/L\>\"", "<>", 
          RowBox[{"ToString", "[", 
           SubscriptBox["L", "val"], "]"}], "<>", 
          "\"\<_spin_current/fermi_hubbard_L\>\"", "<>", 
          RowBox[{"ToString", "[", 
           SubscriptBox["L", "val"], "]"}], "<>", "\"\<_tol_eff_A.dat\>\""}], 
         ",", "\"\<Real64\>\""}], "]"}], ",", 
       RowBox[{
        SubscriptBox["L", "val"], "-", "1"}]}], "]"}], "-", 
     SuperscriptBox["10", 
      RowBox[{"-", "8"}]]}], "]"}]}]}]], "Input",ExpressionUUID->"6c56a30d-1350-4013-b0e0-0a968ffd10c0"],

Cell[BoxData["0.`"], "Output",ExpressionUUID->"1b3b2614-405d-4067-9eb3-a7bbee18fe88"],

Cell[BoxData["0.`"], "Output",ExpressionUUID->"c7b28538-5803-4c5f-8376-36afcf458401"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"tolerance", " ", 
    RowBox[{"(", 
     RowBox[{"truncation", " ", "weight"}], ")"}], " ", "for", " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{"\[ImaginaryI]", " ", "H", " ", 
      RowBox[{"t", "/", "2"}]}]], " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Beta]"}], " ", 
      RowBox[{"H", "/", "2"}]}]], " ", "B", " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[ImaginaryI]"}], " ", "H", " ", 
      RowBox[{"t", "/", "2"}]}]]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{"Partition", "[", 
      RowBox[{
       RowBox[{"Import", "[", 
        RowBox[{
         RowBox[{"\"\<../output/fermi_hubbard/L\>\"", "<>", 
          RowBox[{"ToString", "[", 
           SubscriptBox["L", "val"], "]"}], "<>", 
          "\"\<_charge_current/fermi_hubbard_L\>\"", "<>", 
          RowBox[{"ToString", "[", 
           SubscriptBox["L", "val"], "]"}], "<>", "\"\<_tol_eff_B.dat\>\""}], 
         ",", "\"\<Real64\>\""}], "]"}], ",", 
       RowBox[{
        SubscriptBox["L", "val"], "-", "1"}]}], "]"}], "-", 
     SuperscriptBox["10", 
      RowBox[{"-", "8"}]]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{"Partition", "[", 
      RowBox[{
       RowBox[{"Import", "[", 
        RowBox[{
         RowBox[{"\"\<../output/fermi_hubbard/L\>\"", "<>", 
          RowBox[{"ToString", "[", 
           SubscriptBox["L", "val"], "]"}], "<>", 
          "\"\<_spin_current/fermi_hubbard_L\>\"", "<>", 
          RowBox[{"ToString", "[", 
           SubscriptBox["L", "val"], "]"}], "<>", "\"\<_tol_eff_B.dat\>\""}], 
         ",", "\"\<Real64\>\""}], "]"}], ",", 
       RowBox[{
        SubscriptBox["L", "val"], "-", "1"}]}], "]"}], "-", 
     SuperscriptBox["10", 
      RowBox[{"-", "8"}]]}], "]"}]}]}]], "Input",ExpressionUUID->"9ac91642-7fa8-47ab-8acd-d37cf0c4dce3"],

Cell[BoxData["0.`"], "Output",ExpressionUUID->"a7711f6a-c68a-46e7-9d01-25c1362fbb87"],

Cell[BoxData["0.`"], "Output",ExpressionUUID->"a13e74e1-9531-477e-9373-6057058d8ba1"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1626, 920},
WindowMargins->{{Automatic, 168}, {58, Automatic}},
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
Cell[1486, 35, 104, 0, 63, "Section", "ExpressionUUID" -> \
"23d4ce0c-01cd-4fe6-8d09-d6f63ad30678"],
Cell[1593, 37, 180, 4, 30, "Input", "ExpressionUUID" -> \
"7c83c872-d4e0-43fe-a07a-1e32d51e6824"],
Cell[1776, 43, 123, 1, 30, "Input", "ExpressionUUID" -> \
"bb32c657-aeb2-4fa8-ad29-c86830cbefb3"],
Cell[CellGroupData[{
Cell[1924, 48, 96, 0, 43, "Subsection", "ExpressionUUID" -> \
"f6d8541c-f538-4de7-b393-cd9490cb304d"],
Cell[2023, 50, 435, 11, 30, "Input", "ExpressionUUID" -> \
"be8962ad-749e-466d-8f8c-f886982bdaa5"],
Cell[2461, 63, 1200, 40, 107, "Input", "ExpressionUUID" -> \
"fc865819-6d0a-4f6c-8cc0-bf86e12f54f0"],
Cell[CellGroupData[{
Cell[3686, 107, 455, 14, 74, "Input", "ExpressionUUID" -> \
"3560e00a-2d89-4b7e-b64f-67b9d0a78342"],
Cell[4144, 123, 228, 7, 30, "Output", "ExpressionUUID" -> \
"9d68ac50-25e1-4039-a9f2-5e31c895e940"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4409, 135, 447, 13, 74, "Input", "ExpressionUUID" -> \
"e30db708-060e-45c4-8d09-d1c8669bc2b2"],
Cell[4859, 150, 228, 7, 30, "Output", "ExpressionUUID" -> \
"ea570dfe-9704-4323-9c0f-788d0d6d8e6e"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5124, 162, 162, 4, 30, "Input", "ExpressionUUID" -> \
"d4b2811a-523d-47fc-8465-16d61ebb0515"],
Cell[5289, 168, 228, 7, 30, "Output", "ExpressionUUID" -> \
"1b9c22b2-dc40-4dfc-b870-f65d8d3465a0"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5554, 180, 163, 4, 30, "Input", "ExpressionUUID" -> \
"759dfb0b-f315-461a-972b-600e45bb6e3a"],
Cell[5720, 186, 249, 8, 30, "Output", "ExpressionUUID" -> \
"003f764d-b1d2-41dd-911b-db1245b7d6fa"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6006, 199, 329, 9, 50, "Input", "ExpressionUUID" -> \
"9d6437b4-c321-430d-9cbf-4d98ac981d30"],
Cell[6338, 210, 228, 7, 30, "Output", "ExpressionUUID" -> \
"39517527-55b0-4241-8187-5ed71504a966"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6603, 222, 241, 6, 30, "Input", "ExpressionUUID" -> \
"b4541db4-80d9-476f-9ead-4f48f4769a93"],
Cell[6847, 230, 716, 20, 94, "Output", "ExpressionUUID" -> \
"2fd8c620-a16b-4d2d-aa55-2be0dd487cc6"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7600, 255, 258, 7, 30, "Input", "ExpressionUUID" -> \
"d088ab65-8168-415f-9ae0-d36098a55bc3"],
Cell[7861, 264, 716, 20, 94, "Output", "ExpressionUUID" -> \
"ef46bcc7-8f80-4f0a-b22d-c603361c3c68"]
}, Open  ]],
Cell[8592, 287, 354, 10, 30, "Input", "ExpressionUUID" -> \
"0d2bd98f-bd01-491b-9e25-c4ccd0ef6816"]
}, Open  ]],
Cell[CellGroupData[{
Cell[8983, 302, 139, 1, 43, "Subsection", "ExpressionUUID" -> \
"3599a0c7-7039-403a-90bf-7ef5223f62a7"],
Cell[9125, 305, 1417, 38, 78, "Input", "ExpressionUUID" -> \
"1a27ba07-c05c-44da-aa69-ef990e85cdb8"],
Cell[10545, 345, 823, 22, 55, "Input", "ExpressionUUID" -> \
"7b764b80-56bf-4f17-bc12-4e09eb7fe70d"],
Cell[11371, 369, 760, 21, 55, "Input", "ExpressionUUID" -> \
"06c74b0c-8e36-4efc-bf52-db095dec2c9b"],
Cell[12134, 392, 638, 17, 50, "Input", "ExpressionUUID" -> \
"36be7205-13ef-4c62-a927-236e82475250"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12809, 414, 98, 0, 43, "Subsection", "ExpressionUUID" -> \
"5f1f16de-31bd-4692-937f-05fd052f0e80"],
Cell[12910, 416, 290, 8, 50, "Input", "ExpressionUUID" -> \
"c3af266f-f957-44db-b10a-1fa90cfa0fa4"],
Cell[13203, 426, 302, 8, 50, "Input", "ExpressionUUID" -> \
"3f9ffb97-c8db-4536-aeef-b6acfb9525a3"],
Cell[13508, 436, 271, 8, 50, "Input", "ExpressionUUID" -> \
"f9f07118-bd34-45c1-9574-206e1e96da98"],
Cell[13782, 446, 295, 8, 50, "Input", "ExpressionUUID" -> \
"cc4a49b0-a637-4845-85f5-df107f9c113e"],
Cell[CellGroupData[{
Cell[14102, 458, 321, 9, 30, "Input", "ExpressionUUID" -> \
"0acbcdf3-28e2-43c1-9831-bb98ba9e8d5f"],
Cell[14426, 469, 9152, 188, 72, "Output", "ExpressionUUID" -> \
"4fffe0d1-8dd7-479a-96d7-3c8c1ce387c8"]
}, Open  ]],
Cell[CellGroupData[{
Cell[23615, 662, 396, 10, 50, "Input", "ExpressionUUID" -> \
"1c6246be-9532-41ad-9870-70e7f7b434a8"],
Cell[24014, 674, 83, 0, 30, "Output", "ExpressionUUID" -> \
"4f749854-a918-4ee6-ba94-535409392084"]
}, Open  ]],
Cell[24112, 677, 332, 9, 30, "Input", "ExpressionUUID" -> \
"c5c12da9-eeb5-41d9-af46-264215b6974f"],
Cell[CellGroupData[{
Cell[24469, 690, 333, 9, 30, "Input", "ExpressionUUID" -> \
"e130869f-9d62-4175-b7ae-15bccdacb998"],
Cell[24805, 701, 10678, 191, 246, "Output", "ExpressionUUID" -> \
"93e1c680-dafe-436d-b46a-2db961c865a2"]
}, Open  ]],
Cell[35498, 895, 302, 9, 50, "Input", "ExpressionUUID" -> \
"b319e25a-7008-4dcb-93a6-7fa64fdb3fea"],
Cell[CellGroupData[{
Cell[35825, 908, 306, 8, 50, "Input", "ExpressionUUID" -> \
"f87866f5-405a-49bf-a79d-ebeabcb57cca"],
Cell[36134, 918, 84, 0, 30, "Output", "ExpressionUUID" -> \
"0e7ee2aa-47a9-4037-93be-ae27fb309498"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[36267, 924, 379, 10, 45, "Subsection", "ExpressionUUID" -> \
"7c0d5a1e-238d-43e4-b509-3ebfc698e915"],
Cell[36649, 936, 3608, 94, 189, "Input", "ExpressionUUID" -> \
"245b2739-e49a-4ba4-b89d-5e21d796c922"],
Cell[CellGroupData[{
Cell[40282, 1034, 1417, 36, 55, "Input", "ExpressionUUID" -> \
"474d7d89-9161-4899-bf6c-272cc1d1cf9a"],
Cell[41702, 1072, 83, 0, 30, "Output", "ExpressionUUID" -> \
"b9b8c1c3-572c-4c38-b33c-195bcfcad0ec"]
}, Open  ]],
Cell[41800, 1075, 725, 20, 50, "Input", "ExpressionUUID" -> \
"010319b0-1f4c-4197-baac-fbbfad61010b"],
Cell[CellGroupData[{
Cell[42550, 1099, 1746, 50, 97, "Input", "ExpressionUUID" -> \
"890a0df2-128e-449a-a2da-642354114ae2"],
Cell[44299, 1151, 513, 13, 30, "Output", "ExpressionUUID" -> \
"fd90cd8c-a715-494b-9b26-bedb81d26339"]
}, Open  ]],
Cell[CellGroupData[{
Cell[44849, 1169, 1486, 42, 81, "Input", "ExpressionUUID" -> \
"878b071b-175a-40d5-917b-97f66a445f0c"],
Cell[46338, 1213, 106, 0, 30, "Output", "ExpressionUUID" -> \
"5b513e3f-477a-4bd9-8309-96f4687d1d93"]
}, Open  ]],
Cell[CellGroupData[{
Cell[46481, 1218, 807, 23, 52, "Input", "ExpressionUUID" -> \
"72a0ffae-f502-43c1-9e0f-ac754cd6c4f2"],
Cell[47291, 1243, 171, 3, 30, "Output", "ExpressionUUID" -> \
"0f50c94a-4c31-4e16-b64a-389c4babac37"]
}, Open  ]],
Cell[CellGroupData[{
Cell[47499, 1251, 571, 15, 52, "Input", "ExpressionUUID" -> \
"e9bc47b2-3937-4d94-b179-2228cbcbb38f"],
Cell[48073, 1268, 785, 21, 83, "Output", "ExpressionUUID" -> \
"d6afc5ec-e0da-4452-b7e4-c104855378cd"]
}, Open  ]],
Cell[48873, 1292, 316, 8, 30, "Input", "ExpressionUUID" -> \
"7051b2da-fb1d-4b58-8680-c941a5095f1c"],
Cell[CellGroupData[{
Cell[49214, 1304, 807, 19, 51, "Input", "ExpressionUUID" -> \
"efdbb2f3-e088-4f63-83f0-ba7ab0c1e894"],
Cell[50024, 1325, 175, 3, 30, "Output", "ExpressionUUID" -> \
"c5a57806-8cbf-435d-8896-1eb316fa8996"]
}, Open  ]],
Cell[CellGroupData[{
Cell[50236, 1333, 2658, 64, 128, "Input", "ExpressionUUID" -> \
"d1fedb47-a79a-4a95-9053-b343e19962ac"],
Cell[52897, 1399, 513, 13, 30, "Output", "ExpressionUUID" -> \
"f4da2457-6542-48ed-82b4-a073e407b88b"]
}, Open  ]],
Cell[CellGroupData[{
Cell[53447, 1417, 383, 11, 51, "Input", "ExpressionUUID" -> \
"09b32bed-c275-4fdf-a598-1dcfabd1df4c"],
Cell[53833, 1430, 122, 1, 30, "Output", "ExpressionUUID" -> \
"34bc8aed-1f2d-4f46-ac73-e253ac918383"]
}, Open  ]],
Cell[CellGroupData[{
Cell[53992, 1436, 766, 21, 79, "Input", "ExpressionUUID" -> \
"93dcc7f6-70d3-410d-8503-a2d8984b75eb"],
Cell[54761, 1459, 106, 0, 30, "Output", "ExpressionUUID" -> \
"56eb9588-7808-4fb2-b50f-1acd613249e8"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[54916, 1465, 94, 0, 43, "Subsection", "ExpressionUUID" -> \
"a7125d2a-c5c7-4c13-8e6f-2bcfcf3d70fc"],
Cell[55013, 1467, 923, 25, 55, "Input", "ExpressionUUID" -> \
"a543a029-7590-4297-bab6-e853959217fb"],
Cell[55939, 1494, 955, 26, 55, "Input", "ExpressionUUID" -> \
"ed7758b2-8c98-4a1f-b880-0e6a0c06e531"],
Cell[56897, 1522, 1820, 46, 98, "Input", "ExpressionUUID" -> \
"259c98b9-c042-4f0a-843e-8f2c7ac50b3c"],
Cell[58720, 1570, 1812, 46, 98, "Input", "ExpressionUUID" -> \
"d594538d-58d0-4892-9dba-f72d61e54ecf"],
Cell[CellGroupData[{
Cell[60557, 1620, 1225, 38, 69, "Input", "ExpressionUUID" -> \
"c6047a03-8468-4f60-91bb-996945d1ea9a"],
Cell[61785, 1660, 83, 0, 30, "Output", "ExpressionUUID" -> \
"c4c0febc-b2c0-4807-9524-564097f7a5a6"],
Cell[61871, 1662, 83, 0, 30, "Output", "ExpressionUUID" -> \
"9fbe9bbc-a1ab-477a-aa0e-007cdfc82f14"]
}, Open  ]],
Cell[61969, 1665, 325, 9, 50, "Input", "ExpressionUUID" -> \
"3b2f25fc-2746-44af-a4d0-8cde6dea0acb"],
Cell[CellGroupData[{
Cell[62319, 1678, 2036, 58, 69, "Input", "ExpressionUUID" -> \
"2278a51e-5d71-4a73-808d-a1c2fec12754"],
Cell[64358, 1738, 83, 0, 30, "Output", "ExpressionUUID" -> \
"b6efa349-8e8a-4e57-a7c5-426a5eb72696"],
Cell[64444, 1740, 83, 0, 30, "Output", "ExpressionUUID" -> \
"de47de28-68d3-480e-aec9-3fcfcee256be"]
}, Open  ]],
Cell[64542, 1743, 1570, 46, 98, "Input", "ExpressionUUID" -> \
"03a392f5-021a-462c-80dc-8cdf858e3e9f"],
Cell[66115, 1791, 240, 7, 50, "Input", "ExpressionUUID" -> \
"db0ba0a5-68db-4a53-aa62-ac85273fa127"],
Cell[66358, 1800, 1664, 48, 71, "Input", "ExpressionUUID" -> \
"c5d93a58-79a9-47ca-95cd-f3600717bfa5"],
Cell[68025, 1850, 1660, 48, 71, "Input", "ExpressionUUID" -> \
"7a637694-424e-44c6-a260-5191bd7d042a"],
Cell[69688, 1900, 1216, 31, 74, "Input", "ExpressionUUID" -> \
"2a7c90c7-e9c5-483c-914b-ef0118b12bcd"],
Cell[CellGroupData[{
Cell[70929, 1935, 315, 8, 52, "Input", "ExpressionUUID" -> \
"c773d820-2db6-433f-b9d4-2bd9c2fd08ef"],
Cell[71247, 1945, 827, 14, 57, "Output", "ExpressionUUID" -> \
"731e46df-c21f-4174-9c71-aa54bfc31b51"]
}, Open  ]],
Cell[CellGroupData[{
Cell[72111, 1964, 311, 8, 52, "Input", "ExpressionUUID" -> \
"259d109b-1790-47d5-89a7-70ceaf07f12a"],
Cell[72425, 1974, 820, 14, 57, "Output", "ExpressionUUID" -> \
"8969212f-f59d-4462-beb9-f62eac23f8dd"]
}, Open  ]],
Cell[73260, 1991, 1459, 32, 51, "Input", "ExpressionUUID" -> \
"e90cd907-7ea8-4121-9e21-3d7a8cffa4ff"],
Cell[74722, 2025, 386, 11, 33, "Input", "ExpressionUUID" -> \
"f2adc1a7-446b-4327-b7d3-818a4b469841"],
Cell[CellGroupData[{
Cell[75133, 2040, 2697, 75, 98, "Input", "ExpressionUUID" -> \
"387d4a36-0dca-4657-9a5e-77b7b794b6d2"],
Cell[77833, 2117, 55046, 970, 314, "Output", "ExpressionUUID" -> \
"e5bc6249-e061-40b7-9aef-ccd8921d1ad9"]
}, Open  ]],
Cell[CellGroupData[{
Cell[132916, 3092, 2687, 75, 98, "Input", "ExpressionUUID" -> \
"dc602268-701f-4df7-a9b8-8684ed46caa9"],
Cell[135606, 3169, 56360, 991, 314, "Output", "ExpressionUUID" -> \
"721898a4-8d3d-408f-b8eb-c60e9c52378e"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[192015, 4166, 100, 0, 43, "Subsection", "ExpressionUUID" -> \
"f73cd99e-d483-464f-8ee9-81b99942e3fe"],
Cell[192118, 4168, 208, 6, 33, "Input", "ExpressionUUID" -> \
"31224136-8e99-4b26-8a99-38bd58a9c135"],
Cell[CellGroupData[{
Cell[192351, 4178, 3373, 88, 122, "Input", "ExpressionUUID" -> \
"db66731d-0e47-49ce-8c4e-cbc5251e211e"],
Cell[195727, 4268, 27980, 597, 332, "Output", "ExpressionUUID" -> \
"9bbe2ef7-26c7-4ec7-a513-1dc1088f536a"]
}, Open  ]],
Cell[CellGroupData[{
Cell[223744, 4870, 3359, 87, 122, "Input", "ExpressionUUID" -> \
"62252575-e61d-45dc-b7df-292f9c7ac695"],
Cell[227106, 4959, 27976, 597, 332, "Output", "ExpressionUUID" -> \
"2ac0a7f3-d227-41d5-800a-ebf98ed4d55b"]
}, Open  ]],
Cell[CellGroupData[{
Cell[255119, 5561, 3373, 88, 122, "Input", "ExpressionUUID" -> \
"3f423ee4-ac84-4a0c-ae45-1a4bdaf4dffa"],
Cell[258495, 5651, 27974, 597, 332, "Output", "ExpressionUUID" -> \
"a2e11446-0bda-474a-aacd-11b39c9e426e"]
}, Open  ]],
Cell[CellGroupData[{
Cell[286506, 6253, 3359, 87, 122, "Input", "ExpressionUUID" -> \
"72c5f34c-6bf7-45ab-81d6-049576a44131"],
Cell[289868, 6342, 27970, 597, 332, "Output", "ExpressionUUID" -> \
"44e2595e-f2ae-4974-93e1-43a30e25a02d"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[317887, 6945, 104, 0, 43, "Subsection", "ExpressionUUID" -> \
"91b72f4c-63e8-46da-a475-f3ec917b56ad"],
Cell[CellGroupData[{
Cell[318016, 6949, 1127, 29, 54, "Input", "ExpressionUUID" -> \
"1a812da6-882e-45cd-be69-52302a3414d7"],
Cell[319146, 6980, 85, 0, 30, "Output", "ExpressionUUID" -> \
"62659461-c25a-4270-8155-0774da82b521"]
}, Open  ]],
Cell[CellGroupData[{
Cell[319268, 6985, 2020, 52, 77, "Input", "ExpressionUUID" -> \
"6c56a30d-1350-4013-b0e0-0a968ffd10c0"],
Cell[321291, 7039, 85, 0, 30, "Output", "ExpressionUUID" -> \
"1b3b2614-405d-4067-9eb3-a7bbee18fe88"],
Cell[321379, 7041, 85, 0, 30, "Output", "ExpressionUUID" -> \
"c7b28538-5803-4c5f-8376-36afcf458401"]
}, Open  ]],
Cell[CellGroupData[{
Cell[321501, 7046, 1996, 51, 77, "Input", "ExpressionUUID" -> \
"9ac91642-7fa8-47ab-8acd-d37cf0c4dce3"],
Cell[323500, 7099, 85, 0, 30, "Output", "ExpressionUUID" -> \
"a7711f6a-c68a-46e7-9d01-25c1362fbb87"],
Cell[323588, 7101, 85, 0, 30, "Output", "ExpressionUUID" -> \
"a13e74e1-9531-477e-9373-6057058d8ba1"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* NotebookSignature CvDTJ2xO6bpybB1Qmff69ZeE *)
