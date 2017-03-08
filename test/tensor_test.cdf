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
NotebookDataLength[     23387,        818]
NotebookOptionsPosition[     21176,        715]
NotebookOutlinePosition[     21519,        730]
CellTagsIndexPosition[     21476,        727]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Tensor operations test", "Section"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["fn", "base"], "=", 
   RowBox[{
    RowBox[{"NotebookDirectory", "[", "]"}], "<>", 
    RowBox[{"FileBaseName", "[", 
     RowBox[{"NotebookFileName", "[", "]"}], "]"}]}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell["Common functions", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"reshape", " ", "array"}], ",", " ", 
    RowBox[{
    "similar", " ", "to", " ", "the", " ", "Matlab", " ", "command"}]}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Reshape", "[", 
    RowBox[{"A_", ",", "dim_"}], "]"}], ":=", 
   RowBox[{"Fold", "[", 
    RowBox[{"Partition", ",", 
     RowBox[{"Flatten", "[", "A", "]"}], ",", 
     RowBox[{"Reverse", "[", 
      RowBox[{"Rest", "[", "dim", "]"}], "]"}]}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"ColumnMajorLayout", "[", "A_", "]"}], ":=", 
  RowBox[{"Flatten", "[", 
   RowBox[{"Transpose", "[", 
    RowBox[{"A", ",", 
     RowBox[{"Reverse", "[", 
      RowBox[{"Range", "[", 
       RowBox[{"ArrayDepth", "[", "A", "]"}], "]"}], "]"}]}], "]"}], 
   "]"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Generalized transpose", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "41", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["t", "1"], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"z", "=", 
       RowBox[{"1", "+", "\[ImaginaryI]"}]}], "}"}], ",", 
     RowBox[{"RandomComplex", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "z"}], ",", "z"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"2", ",", "3", ",", "4", ",", "5"}], "}"}]}], "]"}]}], 
    "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"2", ",", "3", ",", "4", ",", "5"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["t", 
    RowBox[{"1", ",", "T"}]], "=", 
   RowBox[{"Transpose", "[", 
    RowBox[{
     SubscriptBox["t", "1"], ",", 
     RowBox[{"{", 
      RowBox[{"2", ",", "4", ",", "3", ",", "1"}], "}"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "2", ",", "4", ",", "3"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "to", " ", "disk"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "base"], "<>", "\"\<_t1T.dat\>\""}], ",", 
     RowBox[{"ColumnMajorLayout", "[", 
      SubscriptBox["t", 
       RowBox[{"1", ",", "T"}]], "]"}], ",", "\"\<Complex128\>\""}], "]"}], 
   ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Subtensor", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["t", 
    RowBox[{"1", ",", "sub"}]], "=", 
   RowBox[{
    SubscriptBox["t", "1"], "\[LeftDoubleBracket]", 
    RowBox[{
     RowBox[{"{", "2", "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "3"}], "}"}], ",", ";;", ",", 
     RowBox[{"{", 
      RowBox[{"2", ",", "5", ",", "5"}], "}"}]}], "\[RightDoubleBracket]"}]}],
   ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "2", ",", "4", ",", "3"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "to", " ", "disk"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "base"], "<>", "\"\<_t1sub.dat\>\""}], ",", 
     RowBox[{"ColumnMajorLayout", "[", 
      SubscriptBox["t", 
       RowBox[{"1", ",", "sub"}]], "]"}], ",", "\"\<Complex128\>\""}], "]"}], 
   ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["General multiplication of tensors", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "42", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["t", "2"], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"z", "=", 
       RowBox[{"1", "+", "\[ImaginaryI]"}]}], "}"}], ",", 
     RowBox[{"RandomComplex", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "z"}], ",", "z"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"4", ",", "5", ",", "7", ",", "6"}], "}"}]}], "]"}]}], 
    "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "5", ",", "7", ",", "6"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["t", 
    RowBox[{"1", ",", "2"}]], "=", 
   RowBox[{
    RowBox[{"Reshape", "[", 
     RowBox[{
      SubscriptBox["t", "1"], ",", 
      RowBox[{"{", 
       RowBox[{"2", ",", "3", ",", 
        RowBox[{"4", " ", "5"}]}], "}"}]}], "]"}], ".", 
    RowBox[{"Reshape", "[", 
     RowBox[{
      SubscriptBox["t", "2"], ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"4", " ", "5"}], ",", "7", ",", "6"}], "}"}]}], "]"}]}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"2", ",", "3", ",", "7", ",", "6"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{"Flatten", "[", 
    RowBox[{
     SubscriptBox["t", 
      RowBox[{"1", ",", "2"}]], "-", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"Sum", "[", 
        RowBox[{
         RowBox[{
          RowBox[{
           SubscriptBox["t", "1"], "\[LeftDoubleBracket]", 
           RowBox[{"i", ",", "j", ",", "k", ",", "l"}], 
           "\[RightDoubleBracket]"}], 
          RowBox[{
           SubscriptBox["t", "2"], "\[LeftDoubleBracket]", 
           RowBox[{"k", ",", "l", ",", "m", ",", "n"}], 
           "\[RightDoubleBracket]"}]}], ",", 
         RowBox[{"{", 
          RowBox[{"k", ",", "4"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"l", ",", "5"}], "}"}]}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"i", ",", "2"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "3"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"m", ",", "7"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"n", ",", "6"}], "}"}]}], "]"}]}], "]"}], "]"}]}]], "Input"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "to", " ", "disk"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "base"], "<>", "\"\<_t12prod.dat\>\""}], ",", 
     RowBox[{"ColumnMajorLayout", "[", 
      SubscriptBox["t", 
       RowBox[{"1", ",", "2"}]], "]"}], ",", "\"\<Complex128\>\""}], "]"}], 
   ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Multiplication with a vector", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "43", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["t", "3"], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"z", "=", 
       RowBox[{"1", "+", "\[ImaginaryI]"}]}], "}"}], ",", 
     RowBox[{"RandomComplex", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "z"}], ",", "z"}], "}"}], ",", "5"}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", "5", "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["t", 
    RowBox[{"1", ",", "3"}]], "=", 
   RowBox[{
    SubscriptBox["t", "1"], ".", 
    SubscriptBox["t", "3"]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"%", "\[LeftDoubleBracket]", 
   RowBox[{";;", ",", "2", ",", ";;"}], "\[RightDoubleBracket]"}], "//", 
  "MatrixForm"}]}], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{
       RowBox[{"-", "0.1936977882738952`"}], "-", 
       RowBox[{"1.1035356090704795`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.2351658851801245`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.09712221523104547`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.9830538446520359`"}], "-", 
       RowBox[{"1.7504805131261858`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.3675925396242219`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.52859715589829`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.9912056425690476`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.5091005896080469`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.17077466380128822`"}], "+", 
       RowBox[{"0.2648267139653375`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.8530495157813447`"}], "+", 
       RowBox[{"1.346151483406798`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.29583961046799373`"}], "+", 
       RowBox[{"0.1815315475011936`", " ", "\[ImaginaryI]"}]}]}
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

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "44", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["t", "4"], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"z", "=", 
       RowBox[{"1", "+", "\[ImaginaryI]"}]}], "}"}], ",", 
     RowBox[{"RandomComplex", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "z"}], ",", "z"}], "}"}], ",", "2"}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", "2", "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["t", 
    RowBox[{"4", ",", "1"}]], "=", 
   RowBox[{
    SubscriptBox["t", "4"], ".", 
    SubscriptBox["t", "1"]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"%", "\[LeftDoubleBracket]", "2", "\[RightDoubleBracket]"}], "//", 
  "MatrixForm"}]}], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{
       RowBox[{"-", "0.9098817668445154`"}], "-", 
       RowBox[{"0.5852913351414719`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"1.2151101729860077`", "\[VeryThinSpace]", "-", 
       RowBox[{"1.033248916131173`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.019931287438861522`"}], "-", 
       RowBox[{"0.64415680903098`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.7453282936782383`"}], "+", 
       RowBox[{"0.6355093206430691`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.16002369534385774`", "\[VeryThinSpace]", "+", 
       RowBox[{"1.2971896936364775`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"2.0926712028867858`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.16004966308109936`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.27783361244119176`"}], "+", 
       RowBox[{"1.1474027437671124`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.19126817907409233`", "\[VeryThinSpace]", "-", 
       RowBox[{"1.639229447826512`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "1.08641282250751`"}], "-", 
       RowBox[{"0.6959455709635323`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.8229952421260864`", "\[VeryThinSpace]", "+", 
       RowBox[{"1.639344492712979`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.1536445406652413`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.3411846420108551`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.8525480815376592`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.38306823560837644`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.4823328993062496`"}], "-", 
       RowBox[{"0.4798874860142457`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.8017960594814597`"}], "+", 
       RowBox[{"0.10533760895587674`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.9053924887458226`", "\[VeryThinSpace]", "+", 
       RowBox[{"1.0913922541636345`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "1.1055309903167645`"}], "+", 
       RowBox[{"0.8971843184928668`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.9549568394206257`"}], "+", 
       RowBox[{"1.2410350738154827`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.030347658545045064`"}], "+", 
       RowBox[{"1.6651893650451361`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.7469195452008799`"}], "+", 
       RowBox[{"1.3328774503335519`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.09203301111270362`"}], "-", 
       RowBox[{"0.8231239920857663`", " ", "\[ImaginaryI]"}]}]}
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
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_t13prod.dat\>\""}], ",", 
      RowBox[{"ColumnMajorLayout", "[", 
       SubscriptBox["t", 
        RowBox[{"1", ",", "3"}]], "]"}], ",", "\"\<Complex128\>\""}], "]"}], 
    ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_t41prod.dat\>\""}], ",", 
      RowBox[{"ColumnMajorLayout", "[", 
       SubscriptBox["t", 
        RowBox[{"4", ",", "1"}]], "]"}], ",", "\"\<Complex128\>\""}], "]"}], 
    ";"}]}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Inner product of two vectors", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "45", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["t", "5"], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"z", "=", 
       RowBox[{"1", "+", "\[ImaginaryI]"}]}], "}"}], ",", 
     RowBox[{"RandomComplex", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "z"}], ",", "z"}], "}"}], ",", 
       RowBox[{"2", " ", "3", " ", "4", " ", "5"}]}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", "120", "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"ColumnMajorLayout", "[", 
   SubscriptBox["t", "1"], "]"}], ".", 
  SubscriptBox["t", "5"]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"-", "5.730605734864588`"}], "+", 
  RowBox[{"2.495227138171611`", " ", "\[ImaginaryI]"}]}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Kronecker product of two tensors", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "46", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["t", "6"], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"z", "=", 
       RowBox[{"1", "+", "\[ImaginaryI]"}]}], "}"}], ",", 
     RowBox[{"RandomComplex", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "z"}], ",", "z"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"6", ",", "5", ",", "7", ",", "2"}], "}"}]}], "]"}]}], 
    "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"6", ",", "5", ",", "7", ",", "2"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "flip", " ", "order", " ", "due", " ", "to", " ", "different", " ", 
    "matrix", " ", "layout"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["tkron", 
      RowBox[{"1", ",", "6"}]], "=", 
     RowBox[{"KroneckerProduct", "[", 
      RowBox[{
       SubscriptBox["t", "6"], ",", 
       SubscriptBox["t", "1"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"12", ",", "15", ",", "28", ",", "10"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "to", " ", "disk"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "base"], "<>", "\"\<_t16prod.dat\>\""}], ",", 
     RowBox[{"ColumnMajorLayout", "[", 
      SubscriptBox["tkron", 
       RowBox[{"1", ",", "6"}]], "]"}], ",", "\"\<Complex128\>\""}], "]"}], 
   ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Tensor trace", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "47", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["t", "7"], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"z", "=", 
       RowBox[{"1", "+", "\[ImaginaryI]"}]}], "}"}], ",", 
     RowBox[{"RandomComplex", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "z"}], ",", "z"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"5", ",", "5", ",", "5"}], "}"}]}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "5", ",", "5"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Tr", "[", 
  SubscriptBox["t", "7"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"0.10510088120116468`", "\[VeryThinSpace]", "+", 
  RowBox[{"1.05270644643872`", " ", "\[ImaginaryI]"}]}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Save individual tensors to disk", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"Table", "[", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_t\>\"", "<>", 
       RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}], ",", 
      RowBox[{"ColumnMajorLayout", "[", 
       SubscriptBox["t", "i"], "]"}], ",", "\"\<Complex128\>\""}], "]"}], ",", 
    RowBox[{"{", 
     RowBox[{"i", ",", "7"}], "}"}]}], "]"}], ";"}]], "Input"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1219, 827},
WindowMargins->{{444, Automatic}, {94, Automatic}},
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
Cell[1656, 42, 242, 7, 31, "Input"],
Cell[CellGroupData[{
Cell[1923, 53, 38, 0, 43, "Subsection"],
Cell[1964, 55, 524, 15, 52, "Input"],
Cell[2491, 72, 310, 9, 31, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[2838, 86, 43, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[2906, 90, 624, 19, 72, "Input"],
Cell[3533, 111, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[3663, 118, 344, 11, 52, "Input"],
Cell[4010, 131, 93, 2, 31, "Output"]
}, Open  ]],
Cell[4118, 136, 427, 13, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4582, 154, 31, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[4638, 158, 466, 14, 52, "Input"],
Cell[5107, 174, 93, 2, 31, "Output"]
}, Open  ]],
Cell[5215, 179, 431, 13, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5683, 197, 55, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[5763, 201, 624, 19, 72, "Input"],
Cell[6390, 222, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6520, 229, 572, 19, 52, "Input"],
Cell[7095, 250, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7225, 257, 1132, 32, 52, "Input"],
Cell[8360, 291, 30, 0, 31, "Output"]
}, Open  ]],
Cell[8405, 294, 431, 13, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[8873, 312, 50, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[8948, 316, 545, 17, 72, "Input"],
Cell[9496, 335, 50, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[9583, 341, 355, 11, 52, "Input"],
Cell[9941, 354, 1604, 38, 58, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11582, 397, 545, 17, 72, "Input"],
Cell[12130, 416, 50, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12217, 422, 319, 10, 52, "Input"],
Cell[12539, 434, 3179, 71, 90, "Output"]
}, Open  ]],
Cell[15733, 508, 775, 23, 72, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16545, 536, 50, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[16620, 540, 593, 18, 72, "Input"],
Cell[17216, 560, 52, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17305, 566, 138, 4, 31, "Input"],
Cell[17446, 572, 137, 3, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[17632, 581, 54, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[17711, 585, 624, 19, 72, "Input"],
Cell[18338, 606, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[18468, 613, 519, 15, 72, "Input"],
Cell[18990, 630, 97, 2, 31, "Output"]
}, Open  ]],
Cell[19102, 635, 435, 13, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[19574, 653, 34, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[19633, 657, 612, 19, 72, "Input"],
Cell[20248, 678, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20368, 685, 77, 2, 31, "Input"],
Cell[20448, 689, 140, 2, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[20637, 697, 53, 0, 43, "Subsection"],
Cell[20693, 699, 455, 12, 31, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 9xpdLx6vgG3chB19SqgB7xFQ *)
