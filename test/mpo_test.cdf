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
NotebookDataLength[     42207,       1386]
NotebookOptionsPosition[     38773,       1250]
NotebookOutlinePosition[     39116,       1265]
CellTagsIndexPosition[     39073,       1262]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Matrix Product Operators (MPO)", "Section"],

Cell[TextData[{
 "References:\n\tF. Verstraete, V. Murg, J. I. Cirac\n\tMatrix product \
states, projected entangled pair states, and variational renormalization \
group methods for quantum spin systems\n\tAdvances in Physics 57, 143-224 \
(2008) ",
 ButtonBox["DOI",
  BaseStyle->"Hyperlink",
  ButtonData->{
    URL["http://dx.doi.org/10.1080/14789940801912366"], None},
  ButtonNote->"http://dx.doi.org/10.1080/14789940801912366"],
 "\n\n\tUlrich Schollw\[ODoubleDot]ck\n\tThe density-matrix renormalization \
group in the age of matrix product states\n\tAnnals of Physics 326, 96-192 \
(2011) ",
 ButtonBox["DOI",
  BaseStyle->"Hyperlink",
  ButtonData->{
    URL["http://dx.doi.org/10.1016/j.aop.2010.09.012"], None},
  ButtonNote->"http://dx.doi.org/10.1016/j.aop.2010.09.012"],
 "\n\n\tThomas Barthel\n\tPrecise evaluation of thermal response functions by \
optimized density matrix renormalization group schemes\n\tNew Journal of \
Physics 15, 073010 (2013) ",
 ButtonBox["DOI",
  BaseStyle->"Hyperlink",
  ButtonData->{
    URL["http://dx.doi.org/10.1088/1367-2630/15/7/073010"], None},
  ButtonNote->"http://dx.doi.org/10.1088/1367-2630/15/7/073010"]
}], "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";"}]], "Input"],

Cell[BoxData[
 RowBox[{"<<", "../mathematica/mps_base.m"}]], "Input"],

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

Cell["Apply two-site operators", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"made", "-", 
    RowBox[{"up", " ", "physical", " ", "dimensions"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["d", 
      RowBox[{"0", ",", "1"}]], "=", "2"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["d", 
      RowBox[{"0", ",", "2"}]], "=", "3"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["d", 
      RowBox[{"1", ",", "1"}]], "=", "4"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["d", 
      RowBox[{"1", ",", "2"}]], "=", "5"}], ";"}]}]}]], "Input"],

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
       SubscriptBox["d", 
        RowBox[{"0", ",", "1"}]], ",", 
       SubscriptBox["d", 
        RowBox[{"0", ",", "2"}]], ",", 
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
       SubscriptBox["d", 
        RowBox[{"1", ",", "1"}]], ",", 
       SubscriptBox["d", 
        RowBox[{"1", ",", "2"}]], ",", 
       SubscriptBox["D", "2"], ",", 
       SubscriptBox["D", "3"]}], "}"}]}], "]"}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["C", "0"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"2", ",", "3", ",", "6", ",", "7"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["C", "1"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "5", ",", "7", ",", "8"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "43", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["op", "T"], "=", 
   RowBox[{"RandomComplex", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{
        RowBox[{"-", "1"}], "-", "\[ImaginaryI]"}], ",", 
       RowBox[{"1", "+", "\[ImaginaryI]"}]}], "}"}], ",", 
     RowBox[{
      SubscriptBox["d", 
       RowBox[{"0", ",", "1"}]], 
      SubscriptBox["d", 
       RowBox[{"1", ",", "1"}]], 
      RowBox[{"{", 
       RowBox[{"1", ",", "1"}], "}"}]}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["op", "B"], "=", 
   RowBox[{"RandomComplex", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{
        RowBox[{"-", "1"}], "-", "\[ImaginaryI]"}], ",", 
       RowBox[{"1", "+", "\[ImaginaryI]"}]}], "}"}], ",", 
     RowBox[{
      SubscriptBox["d", 
       RowBox[{"0", ",", "2"}]], 
      SubscriptBox["d", 
       RowBox[{"1", ",", "2"}]], 
      RowBox[{"{", 
       RowBox[{"1", ",", "1"}], "}"}]}]}], "]"}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Dimensions", "[", 
  SubscriptBox["op", "T"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["op", "B"], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"8", ",", "8"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"15", ",", "15"}], "}"}]], "Output"]
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
      SubscriptBox["M", "0"], ",", 
      SubscriptBox["M", "1"], ",", 
      SubscriptBox["S", "val"]}], "}"}], "=", 
    RowBox[{"ApplyTwoSiteOperator", "[", 
     RowBox[{
      SubscriptBox["C", "0"], ",", 
      SubscriptBox["C", "1"], ",", 
      SubscriptBox["op", "T"], ",", 
      SubscriptBox["op", "B"], ",", "0.05"}], "]"}]}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["M", "0"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"2", ",", "3", ",", "6", ",", "30"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["M", "1"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "5", ",", "30", ",", "8"}], "}"}]], "Output"]
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
  "5.266083076786887`", ",", "5.071136696209511`", ",", "4.87494187751684`", 
   ",", "4.562279077956953`", ",", "4.449442092020395`", ",", 
   "4.3641990511877085`", ",", "4.220089408689989`", ",", 
   "3.991555444759896`", ",", "3.8801772149673566`", ",", 
   "3.8253978813905913`", ",", "3.66900889088937`", ",", 
   "3.5481288269303275`", ",", "3.433495824710207`", ",", 
   "3.263439160920515`", ",", "3.121474715904257`", ",", 
   "3.0371882824758036`", ",", "2.995414261118278`", ",", 
   "2.8967888012975234`", ",", "2.8456664584890756`", ",", 
   "2.689098110017175`", ",", "2.65688696938488`", ",", "2.5340261849340897`",
    ",", "2.501344981868176`", ",", "2.3865795569164265`", ",", 
   "2.3229241288673794`", ",", "2.2072327448930977`", ",", 
   "2.144233572913567`", ",", "2.1036165976383456`", ",", 
   "1.933425840957368`", ",", "1.8846650875087247`"}], "}"}]], "Output"]
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
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_opT.dat\>\""}], ",", 
      RowBox[{"Transpose", "[", 
       RowBox[{
        RowBox[{"ArrayReshape", "[", 
         RowBox[{
          SubscriptBox["op", "T"], ",", 
          RowBox[{"{", 
           RowBox[{"2", ",", "4", ",", "2", ",", "4"}], "}"}]}], "]"}], ",", 
        RowBox[{"Reverse", "[", 
         RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], ",", 
      "\"\<Complex128\>\""}], "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_opB.dat\>\""}], ",", 
      RowBox[{"Transpose", "[", 
       RowBox[{
        RowBox[{"ArrayReshape", "[", 
         RowBox[{
          SubscriptBox["op", "B"], ",", 
          RowBox[{"{", 
           RowBox[{"3", ",", "5", ",", "3", ",", "5"}], "}"}]}], "]"}], ",", 
        RowBox[{"Reverse", "[", 
         RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], ",", 
      "\"\<Complex128\>\""}], "]"}], ";"}]}]}]], "Input"],

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
Cell[1538, 37, 1172, 26, 239, "Text"],
Cell[2713, 65, 123, 3, 31, "Input"],
Cell[2839, 70, 69, 1, 31, "Input"],
Cell[2911, 73, 174, 5, 31, "Input"],
Cell[CellGroupData[{
Cell[3110, 82, 65, 0, 43, "Subsection"],
Cell[3178, 84, 233, 7, 52, "Input"],
Cell[3414, 93, 363, 12, 72, "Input"],
Cell[3780, 107, 2083, 61, 72, "Input"],
Cell[CellGroupData[{
Cell[5888, 172, 112, 3, 31, "Input"],
Cell[6003, 177, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6123, 184, 112, 3, 31, "Input"],
Cell[6238, 189, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6358, 196, 760, 20, 92, "Input"],
Cell[7121, 218, 93, 2, 31, "Output"],
Cell[7217, 222, 93, 2, 31, "Output"],
Cell[7313, 226, 93, 2, 31, "Output"],
Cell[7409, 230, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7539, 237, 334, 9, 72, "Input"],
Cell[7876, 248, 78, 2, 31, "Output"],
Cell[7957, 252, 34, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[8028, 257, 465, 14, 52, "Input"],
Cell[8496, 273, 1800, 42, 74, "Output"]
}, Open  ]],
Cell[10311, 318, 1264, 35, 52, "Input"],
Cell[11578, 355, 1546, 41, 72, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13161, 401, 31, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[13217, 405, 1332, 40, 72, "Input"],
Cell[14552, 447, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14672, 454, 467, 13, 52, "Input"],
Cell[15142, 469, 1762, 41, 74, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16941, 515, 202, 5, 52, "Input"],
Cell[17146, 522, 143, 3, 31, "Output"]
}, Open  ]],
Cell[17304, 528, 1058, 30, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[18399, 563, 39, 0, 43, "Subsection"],
Cell[18441, 565, 510, 16, 52, "Input"],
Cell[CellGroupData[{
Cell[18976, 585, 539, 15, 52, "Input"],
Cell[19518, 602, 73, 2, 31, "Output"]
}, Open  ]],
Cell[19606, 607, 660, 19, 52, "Input"],
Cell[CellGroupData[{
Cell[20291, 630, 907, 27, 92, "Input"],
Cell[21201, 659, 144, 3, 31, "Output"],
Cell[21348, 664, 51, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[21436, 669, 588, 16, 92, "Input"],
Cell[22027, 687, 45, 0, 31, "Output"],
Cell[22075, 689, 51, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[22175, 695, 44, 0, 43, "Subsection"],
Cell[22222, 697, 2267, 64, 72, "Input"],
Cell[CellGroupData[{
Cell[24514, 765, 112, 3, 31, "Input"],
Cell[24629, 770, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[24749, 777, 112, 3, 31, "Input"],
Cell[24864, 782, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[24984, 789, 574, 15, 72, "Input"],
Cell[25561, 806, 93, 2, 31, "Output"],
Cell[25657, 810, 93, 2, 31, "Output"],
Cell[25753, 814, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[25883, 821, 260, 6, 52, "Input"],
Cell[26146, 829, 733, 17, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[26916, 851, 470, 14, 31, "Input"],
Cell[27389, 867, 141, 3, 31, "Output"]
}, Open  ]],
Cell[27545, 873, 1264, 35, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[28846, 913, 46, 0, 43, "Subsection"],
Cell[28895, 915, 665, 22, 112, "Input"],
Cell[29563, 939, 488, 15, 92, "Input"],
Cell[30054, 956, 1527, 50, 72, "Input"],
Cell[CellGroupData[{
Cell[31606, 1010, 85, 2, 31, "Input"],
Cell[31694, 1014, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[31824, 1021, 85, 2, 31, "Input"],
Cell[31912, 1025, 93, 2, 31, "Output"]
}, Open  ]],
Cell[32020, 1030, 1095, 37, 72, "Input"],
Cell[CellGroupData[{
Cell[33140, 1071, 175, 4, 52, "Input"],
Cell[33318, 1077, 73, 2, 31, "Output"],
Cell[33394, 1081, 75, 2, 31, "Output"]
}, Open  ]],
Cell[33484, 1086, 724, 21, 52, "Input"],
Cell[CellGroupData[{
Cell[34233, 1111, 85, 2, 31, "Input"],
Cell[34321, 1115, 94, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[34452, 1122, 85, 2, 31, "Input"],
Cell[34540, 1126, 94, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[34671, 1133, 162, 4, 52, "Input"],
Cell[34836, 1139, 928, 16, 52, "Output"]
}, Open  ]],
Cell[35779, 1158, 773, 22, 52, "Input"],
Cell[36555, 1182, 1303, 37, 72, "Input"],
Cell[37861, 1221, 884, 25, 52, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 9wT5A4ur4AQ5sDgS7y1tYpqW *)
