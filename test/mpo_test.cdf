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
NotebookDataLength[     44019,       1441]
NotebookOptionsPosition[     40586,       1305]
NotebookOutlinePosition[     40929,       1320]
CellTagsIndexPosition[     40886,       1317]
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
         RowBox[{
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"Re", "[", "#", "]"}], ",", 
             RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
          RowBox[{"Flatten", "[", 
           RowBox[{"Transpose", "[", 
            RowBox[{
             RowBox[{
              SubscriptBox["A", 
               RowBox[{"i", ",", "list"}]], "\[LeftDoubleBracket]", "j", 
              "\[RightDoubleBracket]"}], ",", 
             RowBox[{"Reverse", "[", 
              RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], "]"}]}], ",", 
         "\"\<Real64\>\""}], "]"}], ",", 
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
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"Re", "[", "#", "]"}], ",", 
           RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
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
         RowBox[{"1", ";;", "1764"}], "\[RightDoubleBracket]"}]}], ",", 
       "\"\<Real64\>\""}], "]"}]}], "]"}], ";"}]}]], "Input"]
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
         RowBox[{
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"Re", "[", "#", "]"}], ",", 
             RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
          RowBox[{"Flatten", "[", 
           RowBox[{"Transpose", "[", 
            RowBox[{
             RowBox[{
              SubscriptBox["B", "list"], "\[LeftDoubleBracket]", "j", 
              "\[RightDoubleBracket]"}], ",", 
             RowBox[{"Reverse", "[", 
              RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], "]"}]}], ",", 
         "\"\<Real64\>\""}], "]"}], ",", 
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
       RowBox[{
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"Re", "[", "#", "]"}], ",", 
           RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
        RowBox[{"Flatten", "[", 
         RowBox[{"Transpose", "[", 
          SubscriptBox["R", "i"], "]"}], "]"}]}], ",", "\"\<Real64\>\""}], 
      "]"}], ",", 
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
         RowBox[{
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"Re", "[", "#", "]"}], ",", 
             RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
          RowBox[{"Flatten", "[", 
           RowBox[{"Transpose", "[", 
            RowBox[{
             RowBox[{
              SubscriptBox["F", 
               RowBox[{"i", ",", "list"}]], "\[LeftDoubleBracket]", "j", 
              "\[RightDoubleBracket]"}], ",", 
             RowBox[{"Reverse", "[", 
              RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], "]"}]}], ",", 
         "\"\<Real64\>\""}], "]"}], ",", 
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
       RowBox[{
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"Re", "[", "#", "]"}], ",", 
           RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
        RowBox[{"Flatten", "[", 
         RowBox[{"Transpose", "[", 
          RowBox[{
           SubscriptBox["C", "i"], ",", 
           RowBox[{"Reverse", "[", 
            RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], "]"}]}], ",", 
       "\"\<Real64\>\""}], "]"}], ",", 
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
      RowBox[{
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Re", "[", "#", "]"}], ",", 
          RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
       RowBox[{"Flatten", "[", 
        RowBox[{"Transpose", "[", 
         RowBox[{
          RowBox[{"ArrayReshape", "[", 
           RowBox[{
            SubscriptBox["op", "T"], ",", 
            RowBox[{"{", 
             RowBox[{"2", ",", "4", ",", "2", ",", "4"}], "}"}]}], "]"}], ",", 
          RowBox[{"Reverse", "[", 
           RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], "]"}]}], ",", 
      "\"\<Real64\>\""}], "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_opB.dat\>\""}], ",", 
      RowBox[{
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Re", "[", "#", "]"}], ",", 
          RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
       RowBox[{"Flatten", "[", 
        RowBox[{"Transpose", "[", 
         RowBox[{
          RowBox[{"ArrayReshape", "[", 
           RowBox[{
            SubscriptBox["op", "B"], ",", 
            RowBox[{"{", 
             RowBox[{"3", ",", "5", ",", "3", ",", "5"}], "}"}]}], "]"}], ",", 
          RowBox[{"Reverse", "[", 
           RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], "]"}]}], ",", 
      "\"\<Real64\>\""}], "]"}], ";"}]}]}]], "Input"],

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
     RowBox[{
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"Re", "[", "#", "]"}], ",", 
         RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
      RowBox[{"Flatten", "[", 
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
             RowBox[{"2", ",", "3", ",", "1", ",", "4"}], "}"}]}], "]"}]}], 
         ",", 
         RowBox[{"Reverse", "[", 
          RowBox[{"Range", "[", "6", "]"}], "]"}]}], "]"}], "]"}]}], ",", 
     "\"\<Real64\>\""}], "]"}], ";"}]}]], "Input"]
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
Cell[1538, 37, 822, 18, 163, "Text"],
Cell[2363, 57, 123, 3, 31, "Input"],
Cell[2489, 62, 69, 1, 31, "Input"],
Cell[2561, 65, 174, 5, 31, "Input"],
Cell[CellGroupData[{
Cell[2760, 74, 65, 0, 43, "Subsection"],
Cell[2828, 76, 233, 7, 52, "Input"],
Cell[3064, 85, 363, 12, 72, "Input"],
Cell[3430, 99, 2083, 61, 72, "Input"],
Cell[CellGroupData[{
Cell[5538, 164, 112, 3, 31, "Input"],
Cell[5653, 169, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5773, 176, 112, 3, 31, "Input"],
Cell[5888, 181, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6008, 188, 760, 20, 92, "Input"],
Cell[6771, 210, 93, 2, 31, "Output"],
Cell[6867, 214, 93, 2, 31, "Output"],
Cell[6963, 218, 93, 2, 31, "Output"],
Cell[7059, 222, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7189, 229, 334, 9, 72, "Input"],
Cell[7526, 240, 78, 2, 31, "Output"],
Cell[7607, 244, 34, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7678, 249, 465, 14, 52, "Input"],
Cell[8146, 265, 1800, 42, 74, "Output"]
}, Open  ]],
Cell[9961, 310, 1520, 42, 72, "Input"],
Cell[11484, 354, 1754, 47, 92, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13275, 406, 31, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[13331, 410, 1332, 40, 72, "Input"],
Cell[14666, 452, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14786, 459, 467, 13, 52, "Input"],
Cell[15256, 474, 1762, 41, 74, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17055, 520, 202, 5, 52, "Input"],
Cell[17260, 527, 143, 3, 31, "Output"]
}, Open  ]],
Cell[17418, 533, 1312, 37, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[18767, 575, 39, 0, 43, "Subsection"],
Cell[18809, 577, 510, 16, 52, "Input"],
Cell[CellGroupData[{
Cell[19344, 597, 539, 15, 52, "Input"],
Cell[19886, 614, 73, 2, 31, "Output"]
}, Open  ]],
Cell[19974, 619, 891, 26, 52, "Input"],
Cell[CellGroupData[{
Cell[20890, 649, 907, 27, 92, "Input"],
Cell[21800, 678, 144, 3, 31, "Output"],
Cell[21947, 683, 51, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[22035, 688, 588, 16, 92, "Input"],
Cell[22626, 706, 45, 0, 31, "Output"],
Cell[22674, 708, 51, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[22774, 714, 44, 0, 43, "Subsection"],
Cell[22821, 716, 2267, 64, 72, "Input"],
Cell[CellGroupData[{
Cell[25113, 784, 112, 3, 31, "Input"],
Cell[25228, 789, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[25348, 796, 112, 3, 31, "Input"],
Cell[25463, 801, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[25583, 808, 574, 15, 72, "Input"],
Cell[26160, 825, 93, 2, 31, "Output"],
Cell[26256, 829, 93, 2, 31, "Output"],
Cell[26352, 833, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[26482, 840, 260, 6, 52, "Input"],
Cell[26745, 848, 733, 17, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[27515, 870, 470, 14, 31, "Input"],
Cell[27988, 886, 141, 3, 31, "Output"]
}, Open  ]],
Cell[28144, 892, 1520, 42, 72, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[29701, 939, 46, 0, 43, "Subsection"],
Cell[29750, 941, 665, 22, 112, "Input"],
Cell[30418, 965, 488, 15, 92, "Input"],
Cell[30909, 982, 1527, 50, 72, "Input"],
Cell[CellGroupData[{
Cell[32461, 1036, 85, 2, 31, "Input"],
Cell[32549, 1040, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[32679, 1047, 85, 2, 31, "Input"],
Cell[32767, 1051, 93, 2, 31, "Output"]
}, Open  ]],
Cell[32875, 1056, 1095, 37, 72, "Input"],
Cell[CellGroupData[{
Cell[33995, 1097, 175, 4, 52, "Input"],
Cell[34173, 1103, 73, 2, 31, "Output"],
Cell[34249, 1107, 75, 2, 31, "Output"]
}, Open  ]],
Cell[34339, 1112, 724, 21, 52, "Input"],
Cell[CellGroupData[{
Cell[35088, 1137, 85, 2, 31, "Input"],
Cell[35176, 1141, 94, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[35307, 1148, 85, 2, 31, "Input"],
Cell[35395, 1152, 94, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[35526, 1159, 162, 4, 52, "Input"],
Cell[35691, 1165, 928, 16, 52, "Output"]
}, Open  ]],
Cell[36634, 1184, 1009, 29, 52, "Input"],
Cell[37646, 1215, 1777, 51, 72, "Input"],
Cell[39426, 1268, 1132, 33, 52, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature #u0QycmCiaiumA1fETxbiYVN *)
