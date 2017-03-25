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
NotebookDataLength[     50327,       1610]
NotebookOptionsPosition[     46734,       1468]
NotebookOutlinePosition[     47077,       1483]
CellTagsIndexPosition[     47034,       1480]
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

Cell[CellGroupData[{

Cell["Matrix representation on full Hilbert space", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"number", " ", "of", " ", "lattice", " ", "sites"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["L", "val"], "=", "6"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"made", "-", 
    RowBox[{"up", " ", "physical", " ", "dimensions"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["d", "1"], "=", "3"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["d", "2"], "=", "4"}], ";"}]}]}]], "Input"],

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
          SubscriptBox["L", "val"]}], ",", "d1", ",", "d2", ",", 
         RowBox[{"D", "=", 
          RowBox[{"{", 
           RowBox[{
           "1", ",", "5", ",", "6", ",", "4", ",", "7", ",", "4", ",", "1"}], 
           "}"}]}], ",", 
         RowBox[{"zmax", "=", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "5"}]}]}], "}"}],
        ",", 
       RowBox[{
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"i", "\[Equal]", "1"}], ",", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"d1", ",", "d2"}], "}"}], "=", 
           RowBox[{"{", 
            RowBox[{
             SubscriptBox["d", "1"], ",", 
             SubscriptBox["d", "2"]}], "}"}]}], ",", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"d1", ",", "d2"}], "}"}], "=", 
           RowBox[{"{", 
            RowBox[{
             SubscriptBox["d", "2"], ",", 
             SubscriptBox["d", "1"]}], "}"}]}]}], "]"}], ";", 
        RowBox[{"Table", "[", 
         RowBox[{
          RowBox[{"RandomComplex", "[", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{
              RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"d1", ",", "d2", ",", 
              RowBox[{
              "D", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], 
              ",", 
              RowBox[{"D", "\[LeftDoubleBracket]", 
               RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "}"}]}], 
           "]"}], ",", 
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
  RowBox[{"6", ",", "3", ",", "4"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["A", 
   RowBox[{"2", ",", "list"}]], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"6", ",", "4", ",", "3"}], "}"}]], "Output"]
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
  RowBox[{"3", ",", "4", ",", "1", ",", "5"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "4", ",", "5", ",", "6"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "4", ",", "6", ",", "4"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "4", ",", "4", ",", "1"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["A", 
    RowBox[{"1", ",", "merged"}]], "=", 
   RowBox[{"MPOMergeFull", "[", 
    SubscriptBox["A", 
     RowBox[{"1", ",", "list"}]], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}], "\[IndentingNewLine]", 
 RowBox[{"Times", "@@", "%"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"729", ",", "4096"}], "}"}]], "Output"],

Cell[BoxData["2985984"], "Output"]
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
      RowBox[{
       RowBox[{"-", "0.0005623239483169764`"}], "-", 
       RowBox[{"0.00016435477992478916`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.000466974691149151`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.0003016387487137435`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.0013623861127450383`"}], "-", 
       RowBox[{"0.0003460097344132692`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.0014819825412765327`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.00015175728097527563`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.00046223156253130063`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.0002253395438414058`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.0000931942440477078`"}], "-", 
       RowBox[{"0.0002827861951260681`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.00018413293480552055`"}], "+", 
       RowBox[{"0.0000793411201960945`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.00017769057659698678`"}], "-", 
       RowBox[{"0.000578330681827536`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.0023313197288550402`"}], "+", 
       RowBox[{"0.00014126785568340108`", " ", "\[ImaginaryI]"}]}]}
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
         RowBox[{"Transpose", "[", 
          RowBox[{
           RowBox[{
            SubscriptBox["A", 
             RowBox[{"i", ",", "list"}]], "\[LeftDoubleBracket]", "j", 
            "\[RightDoubleBracket]"}], ",", 
           RowBox[{"Reverse", "[", 
            RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], ",", 
         "\"\<Complex128\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"i", ",", "2"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"save", " ", "first", " ", "few", " ", "entries", " ", "of", " ", 
     RowBox[{"merged", " ", "'"}], 
     RowBox[{"A", "'"}], " ", "tensors", " ", "to", " ", "disk"}], ",", " ", 
    RowBox[{"after", " ", "appropriate", " ", "reordering"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], "}"}], ",", 
     RowBox[{"Export", "[", 
      RowBox[{
       RowBox[{
        SubscriptBox["fn", "base"], "<>", "\"\<_A_merged.dat\>\""}], ",", 
       RowBox[{
        RowBox[{"Flatten", "[", 
         RowBox[{"Transpose", "[", 
          RowBox[{
           RowBox[{"ArrayReshape", "[", 
            RowBox[{
             SubscriptBox["A", 
              RowBox[{"1", ",", "merged"}]], ",", 
             RowBox[{"Join", "[", 
              RowBox[{
               RowBox[{"ConstantArray", "[", 
                RowBox[{
                 SubscriptBox["d", "1"], ",", "L"}], "]"}], ",", 
               RowBox[{"ConstantArray", "[", 
                RowBox[{
                 SubscriptBox["d", "2"], ",", "L"}], "]"}]}], "]"}]}], "]"}], 
           ",", 
           RowBox[{"Reverse", "[", 
            RowBox[{"Range", "[", 
             RowBox[{"2", "L"}], "]"}], "]"}]}], "]"}], "]"}], 
        "\[LeftDoubleBracket]", 
        RowBox[{"1", ";;", "1764"}], "\[RightDoubleBracket]"}], ",", 
       "\"\<Complex128\>\""}], "]"}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["MPO trace", "Subsection"],

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
       RowBox[{"d", "=", "4"}], ",", 
       RowBox[{"D", "=", 
        RowBox[{"{", 
         RowBox[{
         "1", ",", "5", ",", "6", ",", "3", ",", "7", ",", "4", ",", "1"}], 
         "}"}]}], ",", 
       RowBox[{"zmax", "=", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "5"}]}]}], "}"}], 
     ",", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"RandomComplex", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"d", ",", "d", ",", 
           RowBox[{
           "D", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], ",", 
           RowBox[{"D", "\[LeftDoubleBracket]", 
            RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "}"}]}], 
        "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"6", ",", "4", ",", "4"}], "}"}]], "Output"]
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
     {
      RowBox[{
       RowBox[{"-", "0.03679479832555066`"}], "-", 
       RowBox[{"0.19301059185817554`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.03981940980361931`"}], "-", 
       RowBox[{"0.01693788152456943`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.15165076365551583`"}], "-", 
       RowBox[{"0.049287339913171246`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.19633982467131028`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.0071541139881335924`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.02814005594485569`"}], "-", 
       RowBox[{"0.1874993456173622`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.028427282227076356`"}], "-", 
       RowBox[{"0.08572985108253539`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.1777097700730932`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.06740975366379054`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.06882124337253348`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.10838582288212262`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.022451397399102735`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.0010152821077169527`", " ", "\[ImaginaryI]"}]}]}
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
  RowBox[{"-", "0.018380127839321195`"}], "+", 
  RowBox[{"0.023927449138618842`", " ", "\[ImaginaryI]"}]}]], "Output"]
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
         RowBox[{"Transpose", "[", 
          RowBox[{
           RowBox[{
            SubscriptBox["B", "list"], "\[LeftDoubleBracket]", "j", 
            "\[RightDoubleBracket]"}], ",", 
           RowBox[{"Reverse", "[", 
            RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], ",", 
         "\"\<Complex128\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"]
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
      RowBox[{"4", ",", "4"}], "}"}]}], "]"}]}], ";"}]}], "Input"],

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
  RowBox[{"6", ",", "6"}], "}"}]], "Output"]
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
       RowBox[{"Transpose", "[", 
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
 RowBox[{
  RowBox[{"-", "0.002196494532973509`"}], "-", 
  RowBox[{"0.0006521869447454243`", " ", "\[ImaginaryI]"}]}]], "Output"],

Cell[BoxData["1.9302338513189635`*^-15"], "Output"]
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

Cell[BoxData["1.891276051987931`"], "Output"],

Cell[BoxData["2.7533531010703882`*^-14"], "Output"]
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
        RowBox[{"3", ",", "5", ",", "4", ",", "2", ",", "3"}], "}"}]}], ",", 
      RowBox[{"D", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
          "1", ",", "5", ",", "6", ",", "4", ",", "7", ",", "4", ",", "1"}], 
          "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
          "1", ",", "6", ",", "2", ",", "7", ",", "8", ",", "5", ",", "1"}], 
          "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
          "1", ",", "5", ",", "6", ",", "7", ",", "3", ",", "4", ",", "1"}], 
          "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
          "1", ",", "5", ",", "7", ",", "3", ",", "1", ",", "4", ",", "1"}], 
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
  RowBox[{"6", ",", "3", ",", "5"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["F", 
   RowBox[{"2", ",", "list"}]], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"6", ",", "5", ",", "4"}], "}"}]], "Output"]
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
  RowBox[{"3", ",", "5", ",", "1", ",", "5"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "5", ",", "5", ",", "6"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "5", ",", "4", ",", "1"}], "}"}]], "Output"]
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
     RowBox[{"-", "0.18259003403974683`"}], "-", 
     RowBox[{"0.2534466298800935`", " ", "\[ImaginaryI]"}]}], ",", 
    RowBox[{
     RowBox[{"-", "0.0676228335468283`"}], "-", 
     RowBox[{"0.2577295195283369`", " ", "\[ImaginaryI]"}]}], ",", 
    RowBox[{
     RowBox[{"-", "0.18529150618079748`"}], "+", 
     RowBox[{"0.09238600900327643`", " ", "\[ImaginaryI]"}]}], ",", 
    RowBox[{"0.12286187243282409`", "\[VeryThinSpace]", "-", 
     RowBox[{"0.1992924074879352`", " ", "\[ImaginaryI]"}]}], ",", 
    RowBox[{"0.2858202952934352`", "\[VeryThinSpace]", "-", 
     RowBox[{"0.10263507269162497`", " ", "\[ImaginaryI]"}]}]}], "}"}], 
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
  RowBox[{"-", "0.23230111591311567`"}], "+", 
  RowBox[{"0.04966814423773235`", " ", "\[ImaginaryI]"}]}]], "Output"]
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
         RowBox[{"Transpose", "[", 
          RowBox[{
           RowBox[{
            SubscriptBox["F", 
             RowBox[{"i", ",", "list"}]], "\[LeftDoubleBracket]", "j", 
            "\[RightDoubleBracket]"}], ",", 
           RowBox[{"Reverse", "[", 
            RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], ",", 
         "\"\<Complex128\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"i", ",", "4"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"]
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
       SubscriptBox["L", "val"]}], ",", "Aj", ",", "Bj"}], "}"}], ",", 
    RowBox[{
     SubscriptBox["A1B", "list"], "=", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"Aj", "=", 
         RowBox[{
          SubscriptBox["A", 
           RowBox[{"1", ",", "list"}]], "\[LeftDoubleBracket]", "j", 
          "\[RightDoubleBracket]"}]}], ";", 
        RowBox[{"Bj", "=", 
         RowBox[{
          SubscriptBox["B", "list"], "\[LeftDoubleBracket]", "j", 
          "\[RightDoubleBracket]"}]}], ";", 
        RowBox[{"First", "[", 
         RowBox[{"MPOComposition", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"Aj", ",", 
             RowBox[{"ConstantArray", "[", 
              RowBox[{"0", ",", 
               RowBox[{
                RowBox[{"Dimensions", "[", "Aj", "]"}], 
                "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}]}], 
              "]"}], ",", 
             RowBox[{"ConstantArray", "[", 
              RowBox[{"0", ",", 
               RowBox[{
                RowBox[{"Dimensions", "[", "Aj", "]"}], 
                "\[LeftDoubleBracket]", "4", "\[RightDoubleBracket]"}]}], 
              "]"}]}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"Bj", ",", 
             RowBox[{"ConstantArray", "[", 
              RowBox[{"0", ",", 
               RowBox[{
                RowBox[{"Dimensions", "[", "Bj", "]"}], 
                "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}]}], 
              "]"}], ",", 
             RowBox[{"ConstantArray", "[", 
              RowBox[{"0", ",", 
               RowBox[{
                RowBox[{"Dimensions", "[", "Bj", "]"}], 
                "\[LeftDoubleBracket]", "4", "\[RightDoubleBracket]"}]}], 
              "]"}]}], "}"}]}], "]"}], "]"}]}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}]}], "]"}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", "%"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"3", ",", "4", ",", "1", ",", "25"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "4", ",", "25", ",", "36"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "4", ",", "36", ",", "12"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "4", ",", "12", ",", "49"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "4", ",", "49", ",", "16"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "4", ",", "16", ",", "1"}], "}"}]}], "}"}]], "Output"]
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
      RowBox[{
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", "Aj", ",", "Bj", ",", "ABj"}], "}"}],
      ",", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"Aj", "=", 
         RowBox[{
          SubscriptBox["A", 
           RowBox[{"1", ",", "list"}]], "\[LeftDoubleBracket]", "j", 
          "\[RightDoubleBracket]"}]}], ";", 
        RowBox[{"Bj", "=", 
         RowBox[{
          SubscriptBox["B", "list"], "\[LeftDoubleBracket]", "j", 
          "\[RightDoubleBracket]"}]}], ";", 
        RowBox[{"ABj", "=", 
         RowBox[{
          SubscriptBox["A1B", "list"], "\[LeftDoubleBracket]", "j", 
          "\[RightDoubleBracket]"}]}], ";", 
        RowBox[{"Export", "[", 
         RowBox[{
          RowBox[{
           SubscriptBox["fn", "base"], "<>", "\"\<_A0B\>\"", "<>", 
           "\"\<_\>\"", "<>", 
           RowBox[{"ToString", "[", 
            RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
          RowBox[{"Transpose", "[", 
           RowBox[{
            RowBox[{"ArrayReshape", "[", 
             RowBox[{"ABj", ",", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{
                 RowBox[{"Dimensions", "[", "ABj", "]"}], 
                 "\[LeftDoubleBracket]", "1", "\[RightDoubleBracket]"}], ",", 
                RowBox[{
                 RowBox[{"Dimensions", "[", "ABj", "]"}], 
                 "\[LeftDoubleBracket]", "2", "\[RightDoubleBracket]"}], ",", 
                RowBox[{
                 RowBox[{"Dimensions", "[", "Aj", "]"}], 
                 "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}], ",", 
                RowBox[{
                 RowBox[{"Dimensions", "[", "Bj", "]"}], 
                 "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}], ",", 
                RowBox[{
                 RowBox[{"Dimensions", "[", "Aj", "]"}], 
                 "\[LeftDoubleBracket]", "4", "\[RightDoubleBracket]"}], ",", 
                RowBox[{
                 RowBox[{"Dimensions", "[", "Bj", "]"}], 
                 "\[LeftDoubleBracket]", "4", "\[RightDoubleBracket]"}]}], 
               "}"}]}], "]"}], ",", 
            RowBox[{"Reverse", "[", 
             RowBox[{"Range", "[", "6", "]"}], "]"}]}], "]"}], ",", 
          "\"\<Complex128\>\""}], "]"}]}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"]
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
      RowBox[{
       SubscriptBox["d", "1"], ",", 
       SubscriptBox["d", "1"], ",", 
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
      RowBox[{
       SubscriptBox["d", "2"], ",", 
       SubscriptBox["d", "2"], ",", 
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
      RowBox[{"D", "=", "13"}], "}"}], ",", 
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
          RowBox[{
           SubscriptBox["d", "1"], ",", 
           SubscriptBox["d", "1"], ",", "1", ",", "D"}], "}"}]}], "]"}], ",", 
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
          RowBox[{
           SubscriptBox["d", "2"], ",", 
           SubscriptBox["d", "2"], ",", "D", ",", "1"}], "}"}]}], "]"}]}], 
      "}"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["op", "B"], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"D", "=", "15"}], "}"}], ",", 
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
          RowBox[{
           SubscriptBox["d", "1"], ",", 
           SubscriptBox["d", "1"], ",", "1", ",", "D"}], "}"}]}], "]"}], ",", 
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
          RowBox[{
           SubscriptBox["d", "2"], ",", 
           SubscriptBox["d", "2"], ",", "D", ",", "1"}], "}"}]}], "]"}]}], 
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
        RowBox[{"DB", "=", "15"}]}], "}"}], ",", 
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
           RowBox[{"0", ",", 
            SubscriptBox["d", "1"]}], "]"}], ",", 
          RowBox[{"ConstantArray", "[", 
           RowBox[{"0", ",", 
            SubscriptBox["d", "2"]}], "]"}]}], "}"}], ",", "0.1"}], "]"}]}], 
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
       RowBox[{"Transpose", "[", 
        RowBox[{
         SubscriptBox["C", "i"], ",", 
         RowBox[{"Reverse", "[", 
          RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], ",", 
       "\"\<Complex128\>\""}], "]"}], ",", 
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
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"Export", "[", 
      RowBox[{
       RowBox[{
        SubscriptBox["fn", "base"], "<>", "\"\<_op\>\"", "<>", 
        RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}], ",", 
       RowBox[{"Transpose", "[", 
        RowBox[{
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
            RowBox[{
             SubscriptBox["d", "1"], ",", 
             SubscriptBox["d", "2"], ",", 
             SubscriptBox["d", "1"], ",", 
             SubscriptBox["d", "2"]}], "}"}]}], "]"}], ",", 
         RowBox[{"Reverse", "[", 
          RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], ",", 
       "\"\<Complex128\>\""}], "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"i", ",", 
       RowBox[{"{", 
        RowBox[{"T", ",", "B"}], "}"}]}], "}"}]}], "]"}], ";"}]}]], "Input"],

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
     RowBox[{"Transpose", "[", 
      RowBox[{
       RowBox[{
        SubscriptBox["M", "0"], ".", 
        RowBox[{"DiagonalMatrix", "[", 
         SubscriptBox["S", "val"], "]"}], ".", 
        RowBox[{"Transpose", "[", 
         RowBox[{
          SubscriptBox["M", "1"], ",", 
          RowBox[{"{", 
           RowBox[{"2", ",", "3", ",", "1", ",", "4"}], "}"}]}], "]"}]}], ",", 
       RowBox[{"Reverse", "[", 
        RowBox[{"Range", "[", "6", "]"}], "]"}]}], "]"}], ",", 
     "\"\<Complex128\>\""}], "]"}], ";"}]}]], "Input"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1560, 920},
WindowMargins->{{227, Automatic}, {84, Automatic}},
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
Cell[CellGroupData[{
Cell[1934, 54, 65, 0, 43, "Subsection"],
Cell[2002, 56, 233, 7, 52, "Input"],
Cell[2238, 65, 363, 12, 72, "Input"],
Cell[2604, 79, 2083, 61, 72, "Input"],
Cell[CellGroupData[{
Cell[4712, 144, 112, 3, 31, "Input"],
Cell[4827, 149, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4947, 156, 112, 3, 31, "Input"],
Cell[5062, 161, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5182, 168, 760, 20, 92, "Input"],
Cell[5945, 190, 93, 2, 31, "Output"],
Cell[6041, 194, 93, 2, 31, "Output"],
Cell[6137, 198, 93, 2, 31, "Output"],
Cell[6233, 202, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6363, 209, 334, 9, 72, "Input"],
Cell[6700, 220, 78, 2, 31, "Output"],
Cell[6781, 224, 34, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6852, 229, 465, 14, 52, "Input"],
Cell[7320, 245, 1800, 42, 74, "Output"]
}, Open  ]],
Cell[9135, 290, 1264, 35, 52, "Input"],
Cell[10402, 327, 1546, 41, 72, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11985, 373, 31, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[12041, 377, 1332, 40, 72, "Input"],
Cell[13376, 419, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13496, 426, 467, 13, 52, "Input"],
Cell[13966, 441, 1762, 41, 74, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15765, 487, 202, 5, 52, "Input"],
Cell[15970, 494, 143, 3, 31, "Output"]
}, Open  ]],
Cell[16128, 500, 1058, 30, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17223, 535, 39, 0, 43, "Subsection"],
Cell[17265, 537, 510, 16, 52, "Input"],
Cell[CellGroupData[{
Cell[17800, 557, 539, 15, 52, "Input"],
Cell[18342, 574, 73, 2, 31, "Output"]
}, Open  ]],
Cell[18430, 579, 660, 19, 52, "Input"],
Cell[CellGroupData[{
Cell[19115, 602, 907, 27, 92, "Input"],
Cell[20025, 631, 144, 3, 31, "Output"],
Cell[20172, 636, 51, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20260, 641, 588, 16, 92, "Input"],
Cell[20851, 659, 45, 0, 31, "Output"],
Cell[20899, 661, 51, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[20999, 667, 44, 0, 43, "Subsection"],
Cell[21046, 669, 2267, 64, 72, "Input"],
Cell[CellGroupData[{
Cell[23338, 737, 112, 3, 31, "Input"],
Cell[23453, 742, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[23573, 749, 112, 3, 31, "Input"],
Cell[23688, 754, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[23808, 761, 574, 15, 72, "Input"],
Cell[24385, 778, 93, 2, 31, "Output"],
Cell[24481, 782, 93, 2, 31, "Output"],
Cell[24577, 786, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[24707, 793, 260, 6, 52, "Input"],
Cell[24970, 801, 733, 17, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[25740, 823, 470, 14, 31, "Input"],
Cell[26213, 839, 141, 3, 31, "Output"]
}, Open  ]],
Cell[26369, 845, 1264, 35, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[27670, 885, 37, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[27732, 889, 2093, 56, 112, "Input"],
Cell[29828, 947, 537, 14, 31, "Output"]
}, Open  ]],
Cell[30380, 964, 2808, 70, 152, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[33225, 1039, 46, 0, 43, "Subsection"],
Cell[33274, 1041, 488, 15, 92, "Input"],
Cell[33765, 1058, 1411, 46, 72, "Input"],
Cell[CellGroupData[{
Cell[35201, 1108, 85, 2, 31, "Input"],
Cell[35289, 1112, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[35419, 1119, 85, 2, 31, "Input"],
Cell[35507, 1123, 93, 2, 31, "Output"]
}, Open  ]],
Cell[35615, 1128, 2408, 74, 89, "Input"],
Cell[CellGroupData[{
Cell[38048, 1206, 167, 4, 52, "Input"],
Cell[38218, 1212, 213, 6, 31, "Output"],
Cell[38434, 1220, 213, 6, 31, "Output"]
}, Open  ]],
Cell[38662, 1229, 3243, 91, 95, "Input"],
Cell[CellGroupData[{
Cell[41930, 1324, 85, 2, 31, "Input"],
Cell[42018, 1328, 94, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[42149, 1335, 85, 2, 31, "Input"],
Cell[42237, 1339, 94, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[42368, 1346, 162, 4, 52, "Input"],
Cell[42533, 1352, 1067, 19, 52, "Output"]
}, Open  ]],
Cell[43615, 1374, 773, 22, 52, "Input"],
Cell[44391, 1398, 1428, 39, 52, "Input"],
Cell[45822, 1439, 884, 25, 52, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature CvpdasaS#4IJZBw00OOU@BjU *)
