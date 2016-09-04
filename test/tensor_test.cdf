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
NotebookDataLength[     22147,        792]
NotebookOptionsPosition[     20052,        693]
NotebookOutlinePosition[     20395,        708]
CellTagsIndexPosition[     20352,        705]
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
        RowBox[{"2", ",", "3", ",", "4"}], "}"}]}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"2", ",", "3", ",", "4"}], "}"}]], "Output"]
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
      RowBox[{"2", ",", "3", ",", "1"}], "}"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "2", ",", "3"}], "}"}]], "Output"]
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
     RowBox[{"Flatten", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Re", "[", "#", "]"}], ",", 
          RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
       RowBox[{"ColumnMajorLayout", "[", 
        SubscriptBox["t", 
         RowBox[{"1", ",", "T"}]], "]"}]}], "]"}], ",", "\"\<Real64\>\""}], 
    "]"}], ";"}]}]], "Input"]
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
        RowBox[{"4", ",", "5", ",", "3"}], "}"}]}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "5", ",", "3"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["t", "1"], ".", 
   SubscriptBox["t", "2"]}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"2", ",", "3", ",", "5", ",", "3"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{"Flatten", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["t", "1"], ".", 
      SubscriptBox["t", "2"]}], "-", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"Sum", "[", 
        RowBox[{
         RowBox[{
          RowBox[{
           SubscriptBox["t", "1"], "\[LeftDoubleBracket]", 
           RowBox[{"i", ",", "j", ",", "k"}], "\[RightDoubleBracket]"}], 
          RowBox[{
           SubscriptBox["t", "2"], "\[LeftDoubleBracket]", 
           RowBox[{"k", ",", "l", ",", "m"}], "\[RightDoubleBracket]"}]}], 
         ",", 
         RowBox[{"{", 
          RowBox[{"k", ",", "4"}], "}"}]}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"i", ",", "2"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "3"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"l", ",", "5"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"m", ",", "3"}], "}"}]}], "]"}]}], "]"}], "]"}]}]], "Input"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{"Flatten", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["t", "1"], ".", 
      SubscriptBox["t", "2"]}], "-", 
     RowBox[{"Reshape", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"Reshape", "[", 
         RowBox[{
          SubscriptBox["t", "1"], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"2", " ", "3"}], ",", "4"}], "}"}]}], "]"}], ".", 
        RowBox[{"Reshape", "[", 
         RowBox[{
          SubscriptBox["t", "2"], ",", 
          RowBox[{"{", 
           RowBox[{"4", ",", 
            RowBox[{"5", " ", "3"}]}], "}"}]}], "]"}]}], ",", 
       RowBox[{"{", 
        RowBox[{"2", ",", "3", ",", "5", ",", "3"}], "}"}]}], "]"}]}], "]"}], 
   "]"}]}]], "Input"],

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
     RowBox[{"Flatten", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Re", "[", "#", "]"}], ",", 
          RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
       RowBox[{"ColumnMajorLayout", "[", 
        RowBox[{
         SubscriptBox["t", "1"], ".", 
         SubscriptBox["t", "2"]}], "]"}]}], "]"}], ",", "\"\<Real64\>\""}], 
    "]"}], ";"}]}]], "Input"]
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
         RowBox[{"-", "z"}], ",", "z"}], "}"}], ",", "4"}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", "4", "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["t", "1"], ".", 
   SubscriptBox["t", "3"]}], "//", "MatrixForm"}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{
       RowBox[{"-", "0.6339867966447745`"}], "-", 
       RowBox[{"1.0796804061568046`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.6613131200865122`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.6832444419938644`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.34831528781729454`"}], "+", 
       RowBox[{"0.8923499688312718`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.43566390551098844`", "\[VeryThinSpace]", "-", 
       RowBox[{"1.5002569299208377`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"1.262852416060662`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.428007148806091`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.16716193055244621`", "\[VeryThinSpace]", "+", 
       RowBox[{"2.4598643329295573`", " ", "\[ImaginaryI]"}]}]}
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

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["t", "4"], ".", 
   SubscriptBox["t", "1"]}], "//", "MatrixForm"}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{
       RowBox[{"-", "1.5968544497170711`"}], "+", 
       RowBox[{"0.9141466533677309`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.4837824019332557`"}], "+", 
       RowBox[{"1.6309342094419559`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "1.3554680075199623`"}], "+", 
       RowBox[{"0.874487021606132`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.00972003640864455`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.19339882485570803`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.6949477006836139`"}], "-", 
       RowBox[{"0.5582080662121855`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "1.0557657002884386`"}], "+", 
       RowBox[{"1.2069323116228796`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "1.3027674469902841`"}], "-", 
       RowBox[{"0.6518968852676337`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.4185056168229581`"}], "+", 
       RowBox[{"1.0126168913546705`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"1.0587471348727404`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.653684503678757`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "1.2840934283154368`"}], "-", 
       RowBox[{"1.5232511000591107`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.4892745956086423`"}], "-", 
       RowBox[{"0.5149506927082255`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.734370636131677`"}], "+", 
       RowBox[{"0.42465242766284683`", " ", "\[ImaginaryI]"}]}]}
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
      RowBox[{"Flatten", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"Re", "[", "#", "]"}], ",", 
           RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
        RowBox[{"ColumnMajorLayout", "[", 
         RowBox[{
          SubscriptBox["t", "1"], ".", 
          SubscriptBox["t", "3"]}], "]"}]}], "]"}], ",", "\"\<Real64\>\""}], 
     "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_t41prod.dat\>\""}], ",", 
      RowBox[{"Flatten", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"Re", "[", "#", "]"}], ",", 
           RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
        RowBox[{"ColumnMajorLayout", "[", 
         RowBox[{
          SubscriptBox["t", "4"], ".", 
          SubscriptBox["t", "1"]}], "]"}]}], "]"}], ",", "\"\<Real64\>\""}], 
     "]"}], ";"}]}]}]], "Input"]
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
         RowBox[{"-", "z"}], ",", "z"}], "}"}], ",", "24"}], "]"}]}], "]"}]}],
   ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", "24", "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"ColumnMajorLayout", "[", 
   SubscriptBox["t", "1"], "]"}], ".", 
  SubscriptBox["t", "5"]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"-", "2.9489743859546906`"}], "+", 
  RowBox[{"1.6345915563191087`", " ", "\[ImaginaryI]"}]}]], "Output"]
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
        RowBox[{"6", ",", "5", ",", "7"}], "}"}]}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"6", ",", "5", ",", "7"}], "}"}]], "Output"]
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
    RowBox[{"KroneckerProduct", "[", 
     RowBox[{
      SubscriptBox["t", "6"], ",", 
      SubscriptBox["t", "1"]}], "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"12", ",", "15", ",", "28"}], "}"}]], "Output"]
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
     RowBox[{"Flatten", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Re", "[", "#", "]"}], ",", 
          RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
       RowBox[{"ColumnMajorLayout", "[", 
        RowBox[{"KroneckerProduct", "[", 
         RowBox[{
          SubscriptBox["t", "6"], ",", 
          SubscriptBox["t", "1"]}], "]"}], "]"}]}], "]"}], ",", 
     "\"\<Real64\>\""}], "]"}], ";"}]}]], "Input"]
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
      RowBox[{"Flatten", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"Re", "[", "#", "]"}], ",", 
           RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
        RowBox[{"ColumnMajorLayout", "[", 
         SubscriptBox["t", "i"], "]"}]}], "]"}], ",", "\"\<Real64\>\""}], 
     "]"}], ",", 
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
Cell[2906, 90, 612, 19, 72, "Input"],
Cell[3521, 111, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[3641, 118, 334, 11, 52, "Input"],
Cell[3978, 131, 83, 2, 31, "Output"]
}, Open  ]],
Cell[4076, 136, 651, 20, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4764, 161, 55, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[4844, 165, 612, 19, 72, "Input"],
Cell[5459, 186, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5579, 193, 132, 4, 31, "Input"],
Cell[5714, 199, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5844, 206, 1053, 30, 52, "Input"],
Cell[6900, 238, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6967, 243, 842, 26, 52, "Input"],
Cell[7812, 271, 30, 0, 31, "Output"]
}, Open  ]],
Cell[7857, 274, 684, 21, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[8578, 300, 50, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[8653, 304, 545, 17, 72, "Input"],
Cell[9201, 323, 50, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[9288, 329, 128, 4, 31, "Input"],
Cell[9419, 335, 1340, 31, 58, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[10796, 371, 545, 17, 72, "Input"],
Cell[11344, 390, 50, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11431, 396, 128, 4, 31, "Input"],
Cell[11562, 402, 2138, 52, 74, "Output"]
}, Open  ]],
Cell[13715, 457, 1297, 39, 72, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15049, 501, 50, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[15124, 505, 546, 17, 72, "Input"],
Cell[15673, 524, 51, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15761, 530, 138, 4, 31, "Input"],
Cell[15902, 536, 139, 3, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[16090, 545, 54, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[16169, 549, 612, 19, 72, "Input"],
Cell[16784, 570, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16904, 577, 434, 12, 72, "Input"],
Cell[17341, 591, 86, 2, 31, "Output"]
}, Open  ]],
Cell[17442, 596, 737, 22, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[18216, 623, 34, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[18275, 627, 612, 19, 72, "Input"],
Cell[18890, 648, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[19010, 655, 77, 2, 31, "Input"],
Cell[19090, 659, 140, 2, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[19279, 667, 53, 0, 43, "Subsection"],
Cell[19335, 669, 689, 20, 31, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature suD3Ju7AL4Ob9DKoRgz3XPID *)
