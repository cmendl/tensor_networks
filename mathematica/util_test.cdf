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
NotebookDataLength[     44097,       1537]
NotebookOptionsPosition[     38999,       1339]
NotebookOutlinePosition[     39342,       1354]
CellTagsIndexPosition[     39299,       1351]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Utility functions", "Section"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";"}]], "Input"],

Cell[BoxData[
 RowBox[{"<<", "tn_base.m"}]], "Input"],

Cell[CellGroupData[{

Cell["Distribute matrix entries along first dimension", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"SeedRandom", "[", "42", "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"DistributeEntries", "[", 
   RowBox[{
    RowBox[{"RandomReal", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"-", "1"}], ",", "1"}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"3", ",", "4"}], "}"}]}], "]"}], ",", "7", ",", 
    RowBox[{"{", 
     RowBox[{"1", ",", "4", ",", "6"}], "}"}]}], "]"}], "//", 
  "MatrixForm"}]}], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"-", "0.14818943256807504`"}], 
      RowBox[{"-", "0.21795368025166306`"}], 
      RowBox[{"-", "0.3058612929806812`"}], 
      RowBox[{"-", "0.09251873862870985`"}]},
     {"0", "0", "0", "0"},
     {"0", "0", "0", "0"},
     {"0.11192668407624007`", 
      RowBox[{"-", "0.42166149326522095`"}], 
      RowBox[{"-", "0.40630387470991236`"}], 
      RowBox[{"-", "0.5871847110722168`"}]},
     {"0", "0", "0", "0"},
     {
      RowBox[{"-", "0.34966058843392167`"}], "0.9466493772228066`", 
      RowBox[{"-", "0.48240795699145744`"}], "0.10116320880771523`"},
     {"0", "0", "0", "0"}
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
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Truncated bond indices", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["\[Sigma]", "list"], "=", 
   RowBox[{"{", 
    RowBox[{
    "2.8", ",", "3.7", ",", "8.0", ",", "1.3", ",", "6.2", ",", "9.1", ",", 
     "0.4"}], "}"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 FractionBox[
  SuperscriptBox[
   SubscriptBox["\[Sigma]", "list"], "2"], 
  RowBox[{"Total", "[", 
   SuperscriptBox[
    SubscriptBox["\[Sigma]", "list"], "2"], "]"}]], "\[IndentingNewLine]", 
 RowBox[{"Sort", "[", "%", "]"}], "\[IndentingNewLine]", 
 RowBox[{"Accumulate", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.03757848823275655`", ",", "0.06561855917173945`", ",", 
   "0.30676316924699226`", ",", "0.00810046493792839`", ",", 
   "0.18424962852897475`", ",", "0.396922781958491`", ",", 
   "0.0007669079231174808`"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.0007669079231174808`", ",", "0.00810046493792839`", ",", 
   "0.03757848823275655`", ",", "0.06561855917173945`", ",", 
   "0.18424962852897475`", ",", "0.30676316924699226`", ",", 
   "0.396922781958491`"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.0007669079231174808`", ",", "0.00886737286104587`", ",", 
   "0.04644586109380242`", ",", "0.11206442026554186`", ",", 
   "0.2963140487945166`", ",", "0.6030772180415089`", ",", "1.`"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"TruncatedBondIndices", "[", 
  RowBox[{
   SubscriptBox["\[Sigma]", "list"], ",", "0.2"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{
  SubscriptBox["\[Sigma]", "list"], "\[LeftDoubleBracket]", "%", 
  "\[RightDoubleBracket]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "5", ",", "6"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"8.`", ",", "6.2`", ",", "9.1`"}], "}"}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Split a matrix", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"fictitious", " ", "quantum", " ", "numbers"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["q", "0"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "5"}], ",", 
       RowBox[{"-", "5"}], ",", 
       RowBox[{"-", "7"}], ",", "4", ",", "3", ",", "3", ",", 
       RowBox[{"-", "5"}], ",", 
       RowBox[{"-", "2"}], ",", "6", ",", "0", ",", 
       RowBox[{"-", "2"}], ",", "3", ",", "6"}], "}"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["q", "2"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "7"}], ",", "4", ",", 
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "2"}], ",", "0", ",", "3", ",", "3", ",", "2", ",", 
       RowBox[{"-", "2"}], ",", "6", ",", "2", ",", "3"}], "}"}]}], 
    ";"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"common", " ", "quantum", " ", "numbers"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Intersection", "[", 
   RowBox[{
    SubscriptBox["q", "0"], ",", 
    SubscriptBox["q", "2"]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "7"}], ",", 
   RowBox[{"-", "2"}], ",", "0", ",", "3", ",", "4", ",", "6"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "42", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["A", "mat"], "=", 
   RowBox[{"Outer", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"#1", "\[Equal]", "#2"}], ",", 
        RowBox[{"RandomReal", "[", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"-", "1"}], ",", "1"}], "}"}], "]"}], ",", "0"}], "]"}], 
      "&"}], ",", 
     SubscriptBox["q", "0"], ",", 
     SubscriptBox["q", "2"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"13", ",", "12"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  SubscriptBox["A", "mat"], "//", "MatrixForm"}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"},
     {
      RowBox[{"-", "0.14818943256807504`"}], "0", "0", "0", "0", "0", "0", 
      "0", "0", "0", "0", "0"},
     {"0", 
      RowBox[{"-", "0.21795368025166306`"}], "0", "0", "0", "0", "0", "0", 
      "0", "0", "0", "0"},
     {"0", "0", "0", "0", "0", 
      RowBox[{"-", "0.3058612929806812`"}], 
      RowBox[{"-", "0.09251873862870985`"}], "0", "0", "0", "0", 
      "0.11192668407624007`"},
     {"0", "0", "0", "0", "0", 
      RowBox[{"-", "0.42166149326522095`"}], 
      RowBox[{"-", "0.40630387470991236`"}], "0", "0", "0", "0", 
      RowBox[{"-", "0.5871847110722168`"}]},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"},
     {"0", "0", 
      RowBox[{"-", "0.34966058843392167`"}], "0.9466493772228066`", "0", "0", 
      "0", "0", 
      RowBox[{"-", "0.48240795699145744`"}], "0", "0", "0"},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0.10116320880771523`", 
      "0", "0"},
     {"0", "0", "0", "0", "0.4345732974888721`", "0", "0", "0", "0", "0", "0",
       "0"},
     {"0", "0", "0.5087052010942732`", "0.7206975987469231`", "0", "0", "0", 
      "0", "0.9939316893743566`", "0", "0", "0"},
     {"0", "0", "0", "0", "0", "0.4784521923178975`", 
      RowBox[{"-", "0.9232708884461172`"}], "0", "0", "0", "0", 
      RowBox[{"-", "0.24774568200958402`"}]},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", 
      RowBox[{"-", "0.40760270489211115`"}], "0", "0"}
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

Cell["Splitting without truncation", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     SubscriptBox["A", "0"], ",", 
     SubscriptBox["A", "1"], ",", 
     SubscriptBox["S", "val"], ",", 
     SubscriptBox["q", "1"]}], "}"}], "=", 
   RowBox[{"SplitMatrix", "[", 
    RowBox[{
     SubscriptBox["A", "mat"], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["q", "0"], ",", 
       SubscriptBox["q", "2"]}], "}"}], ",", "0"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", "%"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"13", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"9", ",", "12"}], "}"}], ",", 
   RowBox[{"{", "9", "}"}], ",", 
   RowBox[{"{", "9", "}"}]}], "}"}]], "Output"]
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
  "0.14818943256807504`", ",", "1.3293933776499767`", ",", 
   "1.1180002095401638`", ",", "0.4345732974888721`", ",", 
   "1.1435984473351932`", ",", "0.7492212313679473`", ",", 
   "0.2754619084987657`", ",", "0.21795368025166306`", ",", 
   "0.4199689986792345`"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"corresponding", " ", "quantum", " ", "numbers"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  SubscriptBox["q", "1"]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "7"}], ",", 
   RowBox[{"-", "2"}], ",", 
   RowBox[{"-", "2"}], ",", "0", ",", "3", ",", "3", ",", "3", ",", "4", ",", 
   "6"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "check", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["A", "0"], ".", 
     RowBox[{"DiagonalMatrix", "[", 
      SubscriptBox["S", "val"], "]"}], ".", 
     SubscriptBox["A", "1"]}], "-", 
    SubscriptBox["A", "mat"]}], "]"}]}]], "Input"],

Cell[BoxData["4.931502666987411`*^-16"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "check", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"Sort", "[", 
     RowBox[{
      SubscriptBox["S", "val"], ",", "Greater"}], "]"}], "-", 
    RowBox[{"SingularValueList", "[", 
     SubscriptBox["A", "mat"], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["7.11431226040132`*^-16"], "Output"]
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
   RowBox[{"Norm", "[", 
    RowBox[{
     SubscriptBox["A", "0"], 
     RowBox[{"Outer", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"#1", "\[NotEqual]", "#2"}], ",", "1", ",", "0"}], "]"}], 
        "&"}], ",", 
       SubscriptBox["q", "0"], ",", 
       SubscriptBox["q", "1"]}], "]"}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     SubscriptBox["A", "1"], 
     RowBox[{"Outer", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"#1", "\[NotEqual]", "#2"}], ",", "1", ",", "0"}], "]"}], 
        "&"}], ",", 
       SubscriptBox["q", "1"], ",", 
       SubscriptBox["q", "2"]}], "]"}]}], "]"}]}]}]], "Input"],

Cell[BoxData["0.`"], "Output"],

Cell[BoxData["0.`"], "Output"]
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
     RowBox[{
      RowBox[{"Transpose", "[", 
       SubscriptBox["A", "0"], "]"}], ".", 
      SubscriptBox["A", "0"]}], "-", 
     RowBox[{"IdentityMatrix", "[", 
      RowBox[{"Length", "[", 
       SubscriptBox["q", "1"], "]"}], "]"}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["A", "1"], ".", 
      RowBox[{"Transpose", "[", 
       SubscriptBox["A", "1"], "]"}]}], "-", 
     RowBox[{"IdentityMatrix", "[", 
      RowBox[{"Length", "[", 
       SubscriptBox["q", "1"], "]"}], "]"}]}], "]"}]}]}]], "Input"],

Cell[BoxData["8.734921707049764`*^-16"], "Output"],

Cell[BoxData["4.592835899272544`*^-16"], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Splitting with truncation", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     SubscriptBox["At", "0"], ",", 
     SubscriptBox["At", "1"], ",", 
     SubscriptBox["St", "val"], ",", 
     SubscriptBox["qt", "1"]}], "}"}], "=", 
   RowBox[{"SplitMatrix", "[", 
    RowBox[{
     SubscriptBox["A", "mat"], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["q", "0"], ",", 
       SubscriptBox["q", "2"]}], "}"}], ",", "0.02"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", "%"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"13", ",", "7"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"7", ",", "12"}], "}"}], ",", 
   RowBox[{"{", "7", "}"}], ",", 
   RowBox[{"{", "7", "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"singular", " ", "values"}], " ", "*)"}], "\[IndentingNewLine]", 
  SubscriptBox["St", "val"]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "1.3293933776499767`", ",", "1.1180002095401638`", ",", 
   "0.4345732974888721`", ",", "1.1435984473351932`", ",", 
   "0.7492212313679473`", ",", "0.2754619084987657`", ",", 
   "0.4199689986792345`"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"corresponding", " ", "quantum", " ", "numbers"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["qt", "1"], "\[IndentingNewLine]", 
   RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
   SubscriptBox["q", "1"]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "2"}], ",", 
   RowBox[{"-", "2"}], ",", "0", ",", "3", ",", "3", ",", "3", ",", "6"}], 
  "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "7"}], ",", 
   RowBox[{"-", "2"}], ",", 
   RowBox[{"-", "2"}], ",", "0", ",", "3", ",", "3", ",", "3", ",", "4", ",", 
   "6"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"approximation", " ", "error"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  FractionBox[
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["At", "0"], ".", 
      RowBox[{"DiagonalMatrix", "[", 
       SubscriptBox["St", "val"], "]"}], ".", 
      SubscriptBox["At", "1"]}], "-", 
     SubscriptBox["A", "mat"]}], "]"}], 
   RowBox[{"Norm", "[", 
    SubscriptBox["A", "mat"], "]"}]]}]], "Input"],

Cell[BoxData["0.16394972618033402`"], "Output"]
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
   RowBox[{"Norm", "[", 
    RowBox[{
     SubscriptBox["At", "0"], 
     RowBox[{"Outer", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"#1", "\[NotEqual]", "#2"}], ",", "1", ",", "0"}], "]"}], 
        "&"}], ",", 
       SubscriptBox["q", "0"], ",", 
       SubscriptBox["qt", "1"]}], "]"}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     SubscriptBox["At", "1"], 
     RowBox[{"Outer", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"#1", "\[NotEqual]", "#2"}], ",", "1", ",", "0"}], "]"}], 
        "&"}], ",", 
       SubscriptBox["qt", "1"], ",", 
       SubscriptBox["q", "2"]}], "]"}]}], "]"}]}]}]], "Input"],

Cell[BoxData["0.`"], "Output"],

Cell[BoxData["0.`"], "Output"]
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
     RowBox[{
      RowBox[{"Transpose", "[", 
       SubscriptBox["At", "0"], "]"}], ".", 
      SubscriptBox["At", "0"]}], "-", 
     RowBox[{"IdentityMatrix", "[", 
      RowBox[{"Length", "[", 
       SubscriptBox["qt", "1"], "]"}], "]"}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["At", "1"], ".", 
      RowBox[{"Transpose", "[", 
       SubscriptBox["At", "1"], "]"}]}], "-", 
     RowBox[{"IdentityMatrix", "[", 
      RowBox[{"Length", "[", 
       SubscriptBox["qt", "1"], "]"}], "]"}]}], "]"}]}]}]], "Input"],

Cell[BoxData["8.734921707049766`*^-16"], "Output"],

Cell[BoxData["4.592835899272544`*^-16"], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Compress virtual bonds", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"fictitious", " ", "quantum", " ", "numbers"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["q", "0"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "5"}], ",", 
       RowBox[{"-", "5"}], ",", 
       RowBox[{"-", "7"}], ",", "4", ",", "3", ",", 
       RowBox[{"-", "5"}], ",", 
       RowBox[{"-", "2"}], ",", "6", ",", "0", ",", 
       RowBox[{"-", "2"}], ",", "6"}], "}"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["q", "1"], "=", 
     RowBox[{"{", 
      RowBox[{"4", ",", "0", ",", 
       RowBox[{"-", "5"}], ",", "1", ",", 
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "2"}], ",", "2", ",", "0", ",", 
       RowBox[{"-", "2"}], ",", "3", ",", 
       RowBox[{"-", "5"}], ",", 
       RowBox[{"-", "5"}], ",", "9", ",", "9", ",", "2", ",", 
       RowBox[{"-", "2"}], ",", "0", ",", 
       RowBox[{"-", "7"}], ",", "6", ",", "1", ",", 
       RowBox[{"-", "7"}], ",", 
       RowBox[{"-", "5"}]}], "}"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["q", "2"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "7"}], ",", "4", ",", 
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "2"}], ",", "0", ",", "3", ",", "2", ",", 
       RowBox[{"-", "2"}], ",", "6", ",", "2"}], "}"}]}], ";"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"common", " ", "quantum", " ", "numbers"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Intersection", "[", 
   RowBox[{
    SubscriptBox["q", "0"], ",", 
    SubscriptBox["q", "1"], ",", 
    SubscriptBox["q", "2"]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "7"}], ",", 
   RowBox[{"-", "2"}], ",", "0", ",", "3", ",", "4", ",", "6"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Union", "[", 
  SubscriptBox["q", "0"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Union", "[", 
  SubscriptBox["q", "1"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Union", "[", 
  SubscriptBox["q", "2"], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "7"}], ",", 
   RowBox[{"-", "5"}], ",", 
   RowBox[{"-", "2"}], ",", "0", ",", "3", ",", "4", ",", "6"}], 
  "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "7"}], ",", 
   RowBox[{"-", "5"}], ",", 
   RowBox[{"-", "2"}], ",", "0", ",", "1", ",", "2", ",", "3", ",", "4", ",", 
   "6", ",", "9"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "7"}], ",", 
   RowBox[{"-", "2"}], ",", "0", ",", "2", ",", "3", ",", "4", ",", "6"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Sort", "[", 
  SubscriptBox["q", "0"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Sort", "[", 
  SubscriptBox["q", "1"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Sort", "[", 
  SubscriptBox["q", "2"], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "7"}], ",", 
   RowBox[{"-", "5"}], ",", 
   RowBox[{"-", "5"}], ",", 
   RowBox[{"-", "5"}], ",", 
   RowBox[{"-", "2"}], ",", 
   RowBox[{"-", "2"}], ",", "0", ",", "3", ",", "4", ",", "6", ",", "6"}], 
  "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "7"}], ",", 
   RowBox[{"-", "7"}], ",", 
   RowBox[{"-", "5"}], ",", 
   RowBox[{"-", "5"}], ",", 
   RowBox[{"-", "5"}], ",", 
   RowBox[{"-", "5"}], ",", 
   RowBox[{"-", "2"}], ",", 
   RowBox[{"-", "2"}], ",", 
   RowBox[{"-", "2"}], ",", 
   RowBox[{"-", "2"}], ",", "0", ",", "0", ",", "0", ",", "1", ",", "1", ",", 
   "2", ",", "2", ",", "3", ",", "4", ",", "6", ",", "9", ",", "9"}], 
  "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "7"}], ",", 
   RowBox[{"-", "2"}], ",", 
   RowBox[{"-", "2"}], ",", 
   RowBox[{"-", "2"}], ",", "0", ",", "2", ",", "2", ",", "3", ",", "4", ",", 
   "6"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "42", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["A", "0"], "=", 
   RowBox[{"Outer", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"#1", "\[Equal]", "#2"}], ",", 
        RowBox[{"RandomReal", "[", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"-", "1"}], ",", "1"}], "}"}], "]"}], ",", "0"}], "]"}], 
      "&"}], ",", 
     SubscriptBox["q", "0"], ",", 
     SubscriptBox["q", "1"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["A", "1"], "=", 
   RowBox[{"Outer", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"#1", "\[Equal]", "#2"}], ",", 
        RowBox[{"RandomReal", "[", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"-", "1"}], ",", "1"}], "}"}], "]"}], ",", "0"}], "]"}], 
      "&"}], ",", 
     SubscriptBox["q", "1"], ",", 
     SubscriptBox["q", "2"]}], "]"}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Dimensions", "[", 
  SubscriptBox["A", "0"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["A", "1"], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"11", ",", "22"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"22", ",", "10"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["A", "0"], "//", "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0", "0", 
      RowBox[{"-", "0.14818943256807504`"}], "0", "0", "0", "0", "0", "0", 
      "0", 
      RowBox[{"-", "0.21795368025166306`"}], 
      RowBox[{"-", "0.3058612929806812`"}], "0", "0", "0", "0", "0", "0", "0",
       "0", "0", 
      RowBox[{"-", "0.09251873862870985`"}]},
     {"0", "0", "0.11192668407624007`", "0", "0", "0", "0", "0", "0", "0", 
      RowBox[{"-", "0.42166149326522095`"}], 
      RowBox[{"-", "0.40630387470991236`"}], "0", "0", "0", "0", "0", "0", 
      "0", "0", "0", 
      RowBox[{"-", "0.5871847110722168`"}]},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", 
      "0", "0", "0", 
      RowBox[{"-", "0.34966058843392167`"}], "0", "0", "0.9466493772228066`", 
      "0"},
     {
      RowBox[{"-", "0.48240795699145744`"}], "0", "0", "0", "0", "0", "0", 
      "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", 
      "0"},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0.10116320880771523`", 
      "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"},
     {"0", "0", "0.4345732974888721`", "0", "0", "0", "0", "0", "0", "0", 
      "0.5087052010942732`", "0.7206975987469231`", "0", "0", "0", "0", "0", 
      "0", "0", "0", "0", "0.9939316893743566`"},
     {"0", "0", "0", "0", "0.4784521923178975`", 
      RowBox[{"-", "0.9232708884461172`"}], "0", "0", 
      RowBox[{"-", "0.24774568200958402`"}], "0", "0", "0", "0", "0", "0", 
      RowBox[{"-", "0.40760270489211115`"}], "0", "0", "0", "0", "0", "0"},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", 
      "0", "0", "0", "0", "0.05628381788398151`", "0", "0", "0"},
     {"0", "0.21470361552642458`", "0", "0", "0", "0", "0", 
      "0.805589214547942`", "0", "0", "0", "0", "0", "0", "0", "0", 
      "0.6813652154760748`", "0", "0", "0", "0", "0"},
     {"0", "0", "0", "0", "0.7715044018645734`", "0.05416610261032684`", "0", 
      "0", "0.12120917563017741`", "0", "0", "0", "0", "0", "0", 
      "0.8488420393389275`", "0", "0", "0", "0", "0", "0"},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", 
      "0", "0", "0", "0", 
      RowBox[{"-", "0.996845911847545`"}], "0", "0", "0"}
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
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["A", "0"], ".", 
    SubscriptBox["A", "1"]}], "//", "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`"},
     {"0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`"},
     {
      RowBox[{"-", "0.6767670979166788`"}], "0.`", "0.`", "0.`", "0.`", "0.`",
       "0.`", "0.`", "0.`", "0.`"},
     {"0.`", 
      RowBox[{"-", "0.3865247941924206`"}], "0.`", "0.`", "0.`", "0.`", "0.`",
       "0.`", "0.`", "0.`"},
     {"0.`", "0.`", "0.`", "0.`", "0.`", 
      RowBox[{"-", "0.0679255173478498`"}], "0.`", "0.`", "0.`", "0.`"},
     {"0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`"},
     {"0.`", "0.`", 
      RowBox[{"-", "0.19101362776164635`"}], 
      RowBox[{"-", "0.6059587468449024`"}], "0.`", "0.`", "0.`", 
      "0.6796505360484814`", "0.`", "0.`"},
     {"0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", 
      "0.049564103428800715`", "0.`"},
     {"0.`", "0.`", "0.`", "0.`", "0.8468646315475756`", "0.`", "0.`", "0.`", 
      "0.`", "0.`"},
     {"0.`", "0.`", 
      RowBox[{"-", "0.5500963203159568`"}], "1.4028376941687972`", "0.`", 
      "0.`", "0.`", "0.735894191639765`", "0.`", "0.`"},
     {"0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", 
      RowBox[{"-", "0.8778326654960347`"}], "0.`"}
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

Cell["Compression without truncation", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     SubscriptBox["B", "0"], ",", 
     SubscriptBox["B", "1"], ",", 
     SubscriptBox["S", "val"], ",", 
     SubscriptBox["q", 
      RowBox[{"1", ",", "new"}]]}], "}"}], "=", 
   RowBox[{"CompressVirtualBonds", "[", 
    RowBox[{
     SubscriptBox["A", "0"], ",", 
     SubscriptBox["A", "1"], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["q", "0"], ",", 
       SubscriptBox["q", "1"], ",", 
       SubscriptBox["q", "2"]}], "}"}], ",", "0"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", "%"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"11", ",", "7"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"7", ",", "10"}], "}"}], ",", 
   RowBox[{"{", "7", "}"}], ",", 
   RowBox[{"{", "7", "}"}]}], "}"}]], "Output"]
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
  "0.6767670979166788`", ",", "1.6859487718502992`", ",", 
   "0.9139330488668697`", ",", "0.8468646315475756`", ",", 
   "0.0679255173478498`", ",", "0.3865247941924206`", ",", 
   "0.8792307939105489`"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"corresponding", " ", "quantum", " ", "numbers"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  SubscriptBox["q", 
   RowBox[{"1", ",", "new"}]]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "7"}], ",", 
   RowBox[{"-", "2"}], ",", 
   RowBox[{"-", "2"}], ",", "0", ",", "3", ",", "4", ",", "6"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "check", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["B", "0"], ".", 
     RowBox[{"DiagonalMatrix", "[", 
      SubscriptBox["S", "val"], "]"}], ".", 
     SubscriptBox["B", "1"]}], "-", 
    RowBox[{
     SubscriptBox["A", "0"], ".", 
     SubscriptBox["A", "1"]}]}], "]"}]}]], "Input"],

Cell[BoxData["4.1884310143427037`*^-16"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "check", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"Sort", "[", 
     RowBox[{
      SubscriptBox["S", "val"], ",", "Greater"}], "]"}], "-", 
    RowBox[{"SingularValueList", "[", 
     RowBox[{
      SubscriptBox["A", "0"], ".", 
      SubscriptBox["A", "1"]}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["2.2247786310271853`*^-16"], "Output"]
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
   RowBox[{"Norm", "[", 
    RowBox[{
     SubscriptBox["B", "0"], 
     RowBox[{"Outer", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"#1", "\[NotEqual]", "#2"}], ",", "1", ",", "0"}], "]"}], 
        "&"}], ",", 
       SubscriptBox["q", "0"], ",", 
       SubscriptBox["q", 
        RowBox[{"1", ",", "new"}]]}], "]"}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     SubscriptBox["B", "1"], 
     RowBox[{"Outer", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"#1", "\[NotEqual]", "#2"}], ",", "1", ",", "0"}], "]"}], 
        "&"}], ",", 
       SubscriptBox["q", 
        RowBox[{"1", ",", "new"}]], ",", 
       SubscriptBox["q", "2"]}], "]"}]}], "]"}]}]}]], "Input"],

Cell[BoxData["0.`"], "Output"],

Cell[BoxData["0.`"], "Output"]
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
     RowBox[{
      RowBox[{"Transpose", "[", 
       SubscriptBox["B", "0"], "]"}], ".", 
      SubscriptBox["B", "0"]}], "-", 
     RowBox[{"IdentityMatrix", "[", 
      RowBox[{"Length", "[", 
       SubscriptBox["q", 
        RowBox[{"1", ",", "new"}]], "]"}], "]"}]}], "]"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["B", "1"], ".", 
      RowBox[{"Transpose", "[", 
       SubscriptBox["B", "1"], "]"}]}], "-", 
     RowBox[{"IdentityMatrix", "[", 
      RowBox[{"Length", "[", 
       SubscriptBox["q", 
        RowBox[{"1", ",", "new"}]], "]"}], "]"}]}], "]"}]}]}]], "Input"],

Cell[BoxData["1.1102230246251565`*^-16"], "Output"],

Cell[BoxData["2.9066016135613714`*^-16"], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Compression with truncation", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     SubscriptBox["Bt", "0"], ",", 
     SubscriptBox["Bt", "1"], ",", 
     SubscriptBox["St", "val"], ",", 
     SubscriptBox["qt", 
      RowBox[{"1", ",", "new"}]]}], "}"}], "=", 
   RowBox[{"CompressVirtualBonds", "[", 
    RowBox[{
     SubscriptBox["A", "0"], ",", 
     SubscriptBox["A", "1"], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["q", "0"], ",", 
       SubscriptBox["q", "1"], ",", 
       SubscriptBox["q", "2"]}], "}"}], ",", "0.035"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", "%"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"11", ",", "5"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "10"}], "}"}], ",", 
   RowBox[{"{", "5", "}"}], ",", 
   RowBox[{"{", "5", "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"singular", " ", "values"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["St", "val"], "\[IndentingNewLine]", 
   RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
   RowBox[{"Complement", "[", 
    RowBox[{
     SubscriptBox["S", "val"], ",", "%"}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.6767670979166788`", ",", "1.6859487718502992`", ",", 
   "0.9139330488668697`", ",", "0.8468646315475756`", ",", 
   "0.8792307939105489`"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.0679255173478498`", ",", "0.3865247941924206`"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"corresponding", " ", "quantum", " ", "numbers"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["qt", 
    RowBox[{"1", ",", "new"}]], "\[IndentingNewLine]", 
   RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
   SubscriptBox["q", 
    RowBox[{"1", ",", "new"}]]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "7"}], ",", 
   RowBox[{"-", "2"}], ",", 
   RowBox[{"-", "2"}], ",", "0", ",", "6"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "7"}], ",", 
   RowBox[{"-", "2"}], ",", 
   RowBox[{"-", "2"}], ",", "0", ",", "3", ",", "4", ",", "6"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"approximation", " ", "error"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  FractionBox[
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["Bt", "0"], ".", 
      RowBox[{"DiagonalMatrix", "[", 
       SubscriptBox["St", "val"], "]"}], ".", 
      SubscriptBox["Bt", "1"]}], "-", 
     RowBox[{
      SubscriptBox["A", "0"], ".", 
      SubscriptBox["A", "1"]}]}], "]"}], 
   RowBox[{"Norm", "[", 
    RowBox[{
     SubscriptBox["A", "0"], ".", 
     SubscriptBox["A", "1"]}], "]"}]]}]], "Input"],

Cell[BoxData["0.22926247857947452`"], "Output"]
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
     RowBox[{
      RowBox[{"Transpose", "[", 
       SubscriptBox["B", "0"], "]"}], ".", 
      SubscriptBox["B", "0"]}], "-", 
     RowBox[{"IdentityMatrix", "[", 
      RowBox[{"Length", "[", 
       SubscriptBox["q", 
        RowBox[{"1", ",", "new"}]], "]"}], "]"}]}], "]"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["B", "1"], ".", 
      RowBox[{"Transpose", "[", 
       SubscriptBox["B", "1"], "]"}]}], "-", 
     RowBox[{"IdentityMatrix", "[", 
      RowBox[{"Length", "[", 
       SubscriptBox["q", 
        RowBox[{"1", ",", "new"}]], "]"}], "]"}]}], "]"}]}]}]], "Input"],

Cell[BoxData["1.1102230246251565`*^-16"], "Output"],

Cell[BoxData["2.9066016135613714`*^-16"], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1540, 955},
WindowMargins->{{264, Automatic}, {52, Automatic}},
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
Cell[1486, 35, 36, 0, 63, "Section"],
Cell[1525, 37, 123, 3, 31, "Input"],
Cell[1651, 42, 53, 1, 31, "Input"],
Cell[CellGroupData[{
Cell[1729, 47, 69, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[1823, 51, 467, 14, 52, "Input"],
Cell[2293, 67, 1163, 31, 131, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[3505, 104, 44, 0, 43, "Subsection"],
Cell[3552, 106, 224, 7, 31, "Input"],
Cell[CellGroupData[{
Cell[3801, 117, 319, 8, 98, "Input"],
Cell[4123, 127, 271, 6, 31, "Output"],
Cell[4397, 135, 271, 6, 31, "Output"],
Cell[4671, 143, 253, 6, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4961, 154, 265, 7, 52, "Input"],
Cell[5229, 163, 83, 2, 31, "Output"],
Cell[5315, 167, 91, 2, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[5455, 175, 36, 0, 43, "Subsection"],
Cell[5494, 177, 894, 27, 72, "Input"],
Cell[CellGroupData[{
Cell[6413, 208, 267, 8, 52, "Input"],
Cell[6683, 218, 154, 5, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6874, 228, 627, 19, 72, "Input"],
Cell[7504, 249, 75, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7616, 256, 83, 2, 31, "Input"],
Cell[7702, 260, 2106, 47, 221, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[9845, 312, 53, 0, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[9923, 316, 511, 17, 52, "Input"],
Cell[10437, 335, 241, 8, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[10715, 348, 162, 4, 52, "Input"],
Cell[10880, 354, 326, 7, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11243, 366, 185, 5, 52, "Input"],
Cell[11431, 373, 204, 6, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11672, 384, 344, 10, 52, "Input"],
Cell[12019, 396, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12106, 401, 327, 9, 52, "Input"],
Cell[12436, 412, 49, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12522, 417, 1059, 33, 72, "Input"],
Cell[13584, 452, 30, 0, 31, "Output"],
Cell[13617, 454, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13684, 459, 754, 23, 72, "Input"],
Cell[14441, 484, 50, 0, 31, "Output"],
Cell[14494, 486, 50, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[14593, 492, 50, 0, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[14668, 496, 518, 17, 52, "Input"],
Cell[15189, 515, 241, 8, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15467, 528, 163, 4, 52, "Input"],
Cell[15633, 534, 264, 6, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15934, 545, 321, 8, 92, "Input"],
Cell[16258, 555, 164, 5, 31, "Output"],
Cell[16425, 562, 204, 6, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16666, 573, 473, 15, 69, "Input"],
Cell[17142, 590, 47, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17226, 595, 1063, 33, 72, "Input"],
Cell[18292, 630, 30, 0, 31, "Output"],
Cell[18325, 632, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[18392, 637, 760, 23, 72, "Input"],
Cell[19155, 662, 50, 0, 31, "Output"],
Cell[19208, 664, 50, 0, 31, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[19319, 671, 44, 0, 43, "Subsection"],
Cell[19366, 673, 1425, 40, 92, "Input"],
Cell[CellGroupData[{
Cell[20816, 717, 301, 9, 52, "Input"],
Cell[21120, 728, 154, 5, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[21311, 738, 244, 6, 72, "Input"],
Cell[21558, 746, 183, 6, 31, "Output"],
Cell[21744, 754, 214, 6, 31, "Output"],
Cell[21961, 762, 164, 5, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[22162, 772, 241, 6, 72, "Input"],
Cell[22406, 780, 280, 9, 31, "Output"],
Cell[22689, 791, 470, 14, 31, "Output"],
Cell[23162, 807, 233, 7, 31, "Output"]
}, Open  ]],
Cell[23410, 817, 1038, 34, 72, "Input"],
Cell[CellGroupData[{
Cell[24473, 855, 173, 4, 52, "Input"],
Cell[24649, 861, 75, 2, 31, "Output"],
Cell[24727, 865, 75, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[24839, 872, 164, 4, 52, "Input"],
Cell[25006, 878, 2771, 55, 191, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[27814, 938, 213, 6, 52, "Input"],
Cell[28030, 946, 1788, 39, 191, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[29855, 990, 55, 0, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[29935, 994, 619, 20, 52, "Input"],
Cell[30557, 1016, 241, 8, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[30835, 1029, 162, 4, 52, "Input"],
Cell[31000, 1035, 264, 6, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[31301, 1046, 211, 6, 52, "Input"],
Cell[31515, 1054, 183, 6, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[31735, 1065, 393, 12, 52, "Input"],
Cell[32131, 1079, 51, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[32219, 1084, 378, 11, 52, "Input"],
Cell[32600, 1097, 51, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[32688, 1102, 1121, 35, 72, "Input"],
Cell[33812, 1139, 30, 0, 31, "Output"],
Cell[33845, 1141, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[33912, 1146, 820, 26, 72, "Input"],
Cell[34735, 1174, 51, 0, 31, "Output"],
Cell[34789, 1176, 51, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[34889, 1182, 52, 0, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[34966, 1186, 627, 20, 54, "Input"],
Cell[35596, 1208, 241, 8, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[35874, 1221, 365, 9, 92, "Input"],
Cell[36242, 1232, 204, 5, 31, "Output"],
Cell[36449, 1239, 112, 3, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[36598, 1247, 375, 10, 95, "Input"],
Cell[36976, 1259, 160, 5, 31, "Output"],
Cell[37139, 1266, 183, 6, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[37359, 1277, 573, 19, 69, "Input"],
Cell[37935, 1298, 47, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[38019, 1303, 820, 26, 72, "Input"],
Cell[38842, 1331, 51, 0, 31, "Output"],
Cell[38896, 1333, 51, 0, 31, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature vx0vc8nYDLYWABKdRRBudOIG *)
