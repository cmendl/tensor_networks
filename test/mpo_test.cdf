(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 11.0' *)

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
NotebookDataLength[    129446,       3912]
NotebookOptionsPosition[    120816,       3605]
NotebookOutlinePosition[    121165,       3620]
CellTagsIndexPosition[    121122,       3617]
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

Cell["Define some MPOs", "Subsection"],

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
    SubscriptBox["qA", "list"], "=", 
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
    SubscriptBox["qB", "list"], "=", 
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
         "]"}], "&"}], "/@", "D"}]}], "]"}]}], "\[IndentingNewLine]", 
   RowBox[{
    SubscriptBox["qC", "list"], "=", 
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
   RowBox[{"{", "0", "}"}]}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", 
     RowBox[{"-", "1"}], ",", 
     RowBox[{"-", "1"}], ",", "0", ",", 
     RowBox[{"-", "1"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "1"}], ",", "0", ",", "0", ",", 
     RowBox[{"-", "1"}], ",", "0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "0", ",", 
     RowBox[{"-", "1"}], ",", "0", ",", "1", ",", 
     RowBox[{"-", "1"}], ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", 
     RowBox[{"-", "1"}], ",", "0", ",", 
     RowBox[{"-", "1"}], ",", "1", ",", "1", ",", 
     RowBox[{"-", "1"}]}], "}"}], ",", 
   RowBox[{"{", "0", "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "42", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["A", "list"], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"qA", "=", 
        SubscriptBox["qA", "list"]}], ",", 
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
            "]"}], "&"}], ",", 
         SubscriptBox["qd", "0"], ",", 
         SubscriptBox["qd", "1"], ",", 
         RowBox[{"qA", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}],
          ",", 
         RowBox[{"qA", "\[LeftDoubleBracket]", 
          RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["B", "list"], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
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
            "]"}], "&"}], ",", 
         SubscriptBox["qd", "1"], ",", 
         SubscriptBox["qd", "0"], ",", 
         RowBox[{"qB", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}],
          ",", 
         RowBox[{"qB", "\[LeftDoubleBracket]", 
          RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["C", "list"], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"qC", "=", 
        SubscriptBox["qC", "list"]}], ",", 
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
            "]"}], "&"}], ",", 
         SubscriptBox["qd", "0"], ",", 
         SubscriptBox["qd", "0"], ",", 
         RowBox[{"qC", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}],
          ",", 
         RowBox[{"qC", "\[LeftDoubleBracket]", 
          RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["A", "list"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "4", ",", "5"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["B", "list"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "5", ",", "4"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["C", "list"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "4", ",", "4"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "1", 
   "\[RightDoubleBracket]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "2", 
   "\[RightDoubleBracket]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "3", 
   "\[RightDoubleBracket]"}], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", "list"], "\[LeftDoubleBracket]", 
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

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "tensors", " ", "to", " ", "disk"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
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
            RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
          RowBox[{"ColumnMajorLayout", "[", 
           RowBox[{
            SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "j", 
            "\[RightDoubleBracket]"}], "]"}], ",", "\"\<Complex128\>\""}], 
         "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}], ";"}], 
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
         RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}], ";"}], 
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
           SubscriptBox["fn", "base"], "<>", "\"\<_C\>\"", "<>", 
           RowBox[{"ToString", "[", 
            RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
          RowBox[{"ColumnMajorLayout", "[", 
           RowBox[{
            SubscriptBox["C", "list"], "\[LeftDoubleBracket]", "j", 
            "\[RightDoubleBracket]"}], "]"}], ",", "\"\<Complex128\>\""}], 
         "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}], ";"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "save", " ", "virtual", " ", "bond", " ", "quantum", " ", "numbers", " ", 
    "to", " ", "disk"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
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
            RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
          RowBox[{
           SubscriptBox["qA", "list"], "\[LeftDoubleBracket]", "j", 
           "\[RightDoubleBracket]"}], ",", "\"\<Integer32\>\""}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", 
          RowBox[{"L", "+", "1"}]}], "}"}]}], "]"}]}], "]"}], ";"}], 
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
           SubscriptBox["fn", "base"], "<>", "\"\<_qB\>\"", "<>", 
           RowBox[{"ToString", "[", 
            RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
          RowBox[{
           SubscriptBox["qB", "list"], "\[LeftDoubleBracket]", "j", 
           "\[RightDoubleBracket]"}], ",", "\"\<Integer32\>\""}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", 
          RowBox[{"L", "+", "1"}]}], "}"}]}], "]"}]}], "]"}], ";"}], 
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
           SubscriptBox["fn", "base"], "<>", "\"\<_qC\>\"", "<>", 
           RowBox[{"ToString", "[", 
            RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
          RowBox[{
           SubscriptBox["qC", "list"], "\[LeftDoubleBracket]", "j", 
           "\[RightDoubleBracket]"}], ",", "\"\<Integer32\>\""}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", 
          RowBox[{"L", "+", "1"}]}], "}"}]}], "]"}]}], "]"}], 
    ";"}]}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Matrix representation on full Hilbert space", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  SubscriptBox["A", "merged"], "=", 
  RowBox[{"SparseArray", "[", 
   RowBox[{"MPOMergeFull", "[", 
    SubscriptBox["A", "list"], "]"}], "]"}]}]], "Input"],

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
    SubscriptBox["A", "merged"], "\[LeftDoubleBracket]", 
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
              SubscriptBox["A", "merged"], "]"}], ",", 
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
        "\"\<Integer64\>\""}], "]"}]}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["MPO trace", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["C", "list"], "\[LeftDoubleBracket]", 
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
     {"0", 
      RowBox[{"0.18203876076032643`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.24584559811895068`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.20379045752312708`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.17349711958408132`", " ", "\[ImaginaryI]"}]}]},
     {"0", 
      RowBox[{
       RowBox[{"-", "0.17997776111729213`"}], "-", 
       RowBox[{"0.34355069998139687`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.46113570976288143`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.15158536259503497`", " ", "\[ImaginaryI]"}]}]}
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
    SubscriptBox["C", "list"], "]"}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"-", "0.3918459574696666`"}], "-", 
  RowBox[{"2.4900774855912697`", " ", "\[ImaginaryI]"}]}]], "Output"]
}, Open  ]]
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
      SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "3", 
      "\[RightDoubleBracket]"}], ",", 
     RowBox[{
      SubscriptBox["B", "list"], "\[LeftDoubleBracket]", "3", 
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
     SubscriptBox["A", "list"], ",", 
     SubscriptBox["B", "list"]}], "]"}], "\[IndentingNewLine]", 
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
         SubscriptBox[
          StyleBox["B",
           FontWeight->"Plain"], "list"], "]"}], ".", 
        RowBox[{"MPOMergeFull", "[", 
         SubscriptBox["A", "list"], "]"}]}], "]"}]}], "]"}], "/", 
    RowBox[{"Abs", "[", "%", "]"}]}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"0.0034089965364192724`", "\[VeryThinSpace]", "+", 
  RowBox[{"0.0010843561394613549`", " ", "\[ImaginaryI]"}]}]], "Output"],

Cell[BoxData["6.528504767293412`*^-16"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"Frobenius", " ", "norm"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"MPOFrobeniusNorm", "[", 
    SubscriptBox["A", "list"], "]"}], "\[IndentingNewLine]", 
   RowBox[{"(*", " ", "check", " ", "*)"}], "\[IndentingNewLine]", 
   RowBox[{"Abs", "[", 
    RowBox[{"%", "-", 
     RowBox[{"Norm", "[", 
      RowBox[{
       RowBox[{"MPOMergeFull", "[", 
        SubscriptBox["A", "list"], "]"}], ",", "\"\<Frobenius\>\""}], "]"}]}],
     "]"}]}]}]], "Input"],

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
  RowBox[{"-", "0.1825614124016619`"}], "-", 
  RowBox[{"0.039345450590946414`", " ", "\[ImaginaryI]"}]}]], "Output"]
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

Cell["Add two MPOs", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  SubscriptBox["AB", 
   RowBox[{"sum", ",", "merged"}]], "=", 
  RowBox[{"SparseArray", "[", 
   RowBox[{
    RowBox[{"MPOMergeFull", "[", 
     SubscriptBox["A", "list"], "]"}], "+", 
    RowBox[{"ConjugateTranspose", "[", 
     RowBox[{"MPOMergeFull", "[", 
      SubscriptBox["B", "list"], "]"}], "]"}]}], "]"}]}]], "Input"],

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
                   TagBox["75233", "SummaryItem"]}]}, {
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
                   TagBox["75233", "SummaryItem"]}]}, {
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
                   TagBox["0.0235103125`", "SummaryItem"]}]}, {
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
   InterpretationFunction->("SparseArray[<75233>, {1024, 3125}]"& )],
  False,
  Editable->False,
  SelectWithContents->True,
  Selectable->False]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"save", " ", "non"}], "-", 
     RowBox[{"zero", " ", "entries", " ", "of", " ", 
      RowBox[{"merged", " ", "'"}], "A"}], "+", 
     RowBox[{
      RowBox[{
       RowBox[{"B", "\[Conjugate]"}], "'"}], " ", "tensors", " ", "to", " ", 
      "disk"}]}], ",", " ", 
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
              SubscriptBox["AB", 
               RowBox[{"sum", ",", "merged"}]], "]"}], ",", 
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
         SubscriptBox["fn", "base"], "<>", "\"\<_ABsum_merged_val.dat\>\""}], 
        ",", 
        RowBox[{"Last", "/@", "ar"}], ",", "\"\<Complex128\>\""}], "]"}], ";", 
      RowBox[{"Export", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "base"], "<>", "\"\<_ABsum_merged_ind.dat\>\""}], 
        ",", 
        RowBox[{
         RowBox[{"Flatten", "[", 
          RowBox[{"First", "/@", "ar"}], "]"}], "-", "1"}], ",", 
        "\"\<Integer64\>\""}], "]"}]}]}], "]"}], ";"}]}]], "Input"]
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
  "1.0161942167676605`", ",", "1.1210294261494167`", ",", 
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

Cell[BoxData["48.779422450127996`"], "Output"]
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

Cell[BoxData["4.770317493788061`"], "Output"]
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

Cell[BoxData["6.797396568525725`*^-15"], "Output"]
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
  "3.203847696309703`", ",", "3.9799166848088485`", ",", "2.861353137011202`",
    ",", "3.5825854957175083`"}], "}"}]], "Output"]
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

Cell[BoxData["46.34516400687226`"], "Output"]
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

Cell[BoxData["4.494454792110368`"], "Output"]
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

Cell[BoxData["0.3119558106532559`"], "Output"]
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
  "4.756782906426508`", ",", "10.088597257987622`", ",", "8.333541121970534`",
    ",", "4.69808501071879`", ",", "7.882556927835049`", ",", 
   "10.805500112558821`", ",", "8.177908455108156`", ",", 
   "4.870331027612784`", ",", "5.0716797127521716`", ",", 
   "4.024141348772295`"}], "}"}]], "Output"]
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

Cell[BoxData["22.963758071744888`"], "Output"]
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

Cell[BoxData["2.0939196367649684`"], "Output"]
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

Cell[BoxData["0.13829071543520183`"], "Output"]
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

Cell["Compress a MPO", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
     RowBox[{"modify", " ", 
      RowBox[{"a", " ", "'"}], 
      RowBox[{"C", "'"}], " ", "tensor", " ", "to", " ", "a", " ", "low"}], 
     "-", 
     RowBox[{"rank", " ", "version"}]}], ",", " ", 
    RowBox[{
     RowBox[{"such", " ", "that", " ", "loss"}], "-", 
     RowBox[{
     "free", " ", "compression", " ", "should", " ", "be", " ", 
      "possible"}]}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"SeedRandom", "[", "47", "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Block", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"idx", "=", 
         RowBox[{"Flatten", "[", 
          RowBox[{"Position", "[", 
           RowBox[{
            RowBox[{
             SubscriptBox["qC", "list"], "\[LeftDoubleBracket]", "4", 
             "\[RightDoubleBracket]"}], ",", "0"}], "]"}], "]"}]}], ",", 
        RowBox[{"C3", "=", 
         RowBox[{
          SubscriptBox["C", "list"], "\[LeftDoubleBracket]", "3", 
          "\[RightDoubleBracket]"}]}], ",", 
        RowBox[{"zmax", "=", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "2"}]}], ",", 
        "lowrank"}], "}"}], ",", 
      RowBox[{
       RowBox[{"lowrank", "=", 
        RowBox[{
         RowBox[{"RandomComplex", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"Length", "[", "idx", "]"}], ",", "1"}], "}"}]}], "]"}], 
         ".", 
         RowBox[{"RandomComplex", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"1", ",", 
             RowBox[{"Length", "[", "idx", "]"}]}], "}"}]}], "]"}]}]}], ";", 
       RowBox[{
        RowBox[{"C3", "\[LeftDoubleBracket]", 
         RowBox[{";;", ",", ";;", ",", ";;", ",", "idx"}], 
         "\[RightDoubleBracket]"}], "=", 
        RowBox[{
         RowBox[{"C3", "\[LeftDoubleBracket]", 
          RowBox[{";;", ",", ";;", ",", ";;", ",", "idx"}], 
          "\[RightDoubleBracket]"}], ".", "lowrank"}]}], ";", 
       RowBox[{
        SubscriptBox["C", 
         RowBox[{"3", ",", "mod"}]], "=", "C3"}]}]}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "6", ",", "7"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "compare", " ", "virtual", " ", "bond", " ", "quantum", " ", "numbers", 
    " ", "before", " ", "and", " ", "after", " ", "compression"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Sort", "[", 
    RowBox[{
     SubscriptBox["qC", "list"], "\[LeftDoubleBracket]", "4", 
     "\[RightDoubleBracket]"}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"Last", "[", 
    RowBox[{"MPOCompressTensors", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{
         SubscriptBox["C", "list"], "\[LeftDoubleBracket]", "3", 
         "\[RightDoubleBracket]"}], ",", 
        RowBox[{
         SubscriptBox["qC", "list"], "\[LeftDoubleBracket]", "3", 
         "\[RightDoubleBracket]"}], ",", 
        RowBox[{
         SubscriptBox["qC", "list"], "\[LeftDoubleBracket]", "4", 
         "\[RightDoubleBracket]"}]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{
         SubscriptBox["C", "list"], "\[LeftDoubleBracket]", "4", 
         "\[RightDoubleBracket]"}], ",", 
        RowBox[{
         SubscriptBox["qC", "list"], "\[LeftDoubleBracket]", "4", 
         "\[RightDoubleBracket]"}], ",", 
        RowBox[{
         SubscriptBox["qC", "list"], "\[LeftDoubleBracket]", "5", 
         "\[RightDoubleBracket]"}]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        SubscriptBox["qd", "0"], ",", 
        SubscriptBox["qd", "0"]}], "}"}], ",", "0"}], "]"}], "]"}], 
   "\[IndentingNewLine]", 
   RowBox[{"(*", " ", 
    RowBox[{
     RowBox[{
     "singular", " ", "values", " ", "corresponding", " ", "to", " ", 
      "quantum", " ", "numbers"}], " ", "-", 
     RowBox[{"1", " ", "and", " ", "1", " ", "agree"}]}], " ", "*)"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Last", "[", 
    RowBox[{"MPOCompressTensors", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        SubscriptBox["C", 
         RowBox[{"3", ",", "mod"}]], ",", 
        RowBox[{
         SubscriptBox["qC", "list"], "\[LeftDoubleBracket]", "3", 
         "\[RightDoubleBracket]"}], ",", 
        RowBox[{
         SubscriptBox["qC", "list"], "\[LeftDoubleBracket]", "4", 
         "\[RightDoubleBracket]"}]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{
         SubscriptBox["C", "list"], "\[LeftDoubleBracket]", "4", 
         "\[RightDoubleBracket]"}], ",", 
        RowBox[{
         SubscriptBox["qC", "list"], "\[LeftDoubleBracket]", "4", 
         "\[RightDoubleBracket]"}], ",", 
        RowBox[{
         SubscriptBox["qC", "list"], "\[LeftDoubleBracket]", "5", 
         "\[RightDoubleBracket]"}]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        SubscriptBox["qd", "0"], ",", 
        SubscriptBox["qd", "0"]}], "}"}], ",", "0"}], "]"}], 
    "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "1"}], ",", 
   RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "0", ",", "1", ",", "1"}], 
  "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "4.260611768085694`", ",", "3.40110653652344`", ",", "5.636846223782697`", 
   ",", "4.432282046522102`", ",", "3.3199049914929577`", ",", 
   "3.13935158440081`", ",", "1.812249146786157`"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "4.260611768085694`", ",", "3.40110653652344`", ",", "2.929490347604505`", 
   ",", "3.13935158440081`", ",", "1.812249146786157`"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", 
    RowBox[{"modified", " ", "'"}], 
    RowBox[{"C", "'"}], " ", "tensor", " ", "to", " ", "disk"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"j", "=", "3"}], "}"}], ",", 
     RowBox[{"Export", "[", 
      RowBox[{
       RowBox[{
        SubscriptBox["fn", "base"], "<>", "\"\<_C\>\"", "<>", 
        RowBox[{"ToString", "[", 
         RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<_mod.dat\>\""}], ",", 
       RowBox[{"ColumnMajorLayout", "[", 
        SubscriptBox["C", 
         RowBox[{"j", ",", "mod"}]], "]"}], ",", "\"\<Complex128\>\""}], 
      "]"}]}], "]"}], ";"}]}]], "Input"]
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
       SubscriptBox["qA", "list"]}], ",", 
      RowBox[{"qC", "=", 
       SubscriptBox["qC", "list"]}], ",", "CAq"}], "}"}], ",", 
    RowBox[{
     RowBox[{"CAq", "=", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"MPOComposition", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             SubscriptBox["C", "list"], "\[LeftDoubleBracket]", "j", 
             "\[RightDoubleBracket]"}], ",", 
            RowBox[{
            "qC", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], ",", 
            RowBox[{"qC", "\[LeftDoubleBracket]", 
             RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             SubscriptBox["A", "list"], "\[LeftDoubleBracket]", "j", 
             "\[RightDoubleBracket]"}], ",", 
            RowBox[{
            "qA", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], ",", 
            RowBox[{"qA", "\[LeftDoubleBracket]", 
             RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "}"}]}], 
         "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], ";", 
     RowBox[{
      SubscriptBox["CA", "list"], "=", 
      RowBox[{"First", "/@", "CAq"}]}], ";", 
     RowBox[{
      SubscriptBox["qCA", "list"], "=", 
      RowBox[{"Prepend", "[", 
       RowBox[{
        RowBox[{"Last", "/@", "CAq"}], ",", 
        RowBox[{"CAq", "\[LeftDoubleBracket]", 
         RowBox[{"1", ",", "2"}], "\[RightDoubleBracket]"}]}], "]"}]}]}]}], 
   "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", 
  SubscriptBox["CA", "list"]}], "\[IndentingNewLine]", 
 RowBox[{"Length", "/@", 
  SubscriptBox["qCA", "list"]}]}], "Input"],

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
    RowBox[{"A", "'"}], " ", 
    RowBox[{"and", " ", "'"}], 
    RowBox[{"C", "'"}], " ", "tensors", " ", "to", " ", "disk"}], " ", "*)"}],
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
          SubscriptBox["fn", "base"], "<>", "\"\<_CA\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{"ColumnMajorLayout", "[", 
          RowBox[{"ArrayReshape", "[", 
           RowBox[{
            RowBox[{
             SubscriptBox["CA", "list"], "\[LeftDoubleBracket]", "j", 
             "\[RightDoubleBracket]"}], ",", 
            RowBox[{"{", 
             RowBox[{
              RowBox[{
               RowBox[{"Dimensions", "[", 
                RowBox[{
                 SubscriptBox["CA", "list"], "\[LeftDoubleBracket]", "j", 
                 "\[RightDoubleBracket]"}], "]"}], "\[LeftDoubleBracket]", 
               "1", "\[RightDoubleBracket]"}], ",", 
              RowBox[{
               RowBox[{"Dimensions", "[", 
                RowBox[{
                 SubscriptBox["CA", "list"], "\[LeftDoubleBracket]", "j", 
                 "\[RightDoubleBracket]"}], "]"}], "\[LeftDoubleBracket]", 
               "2", "\[RightDoubleBracket]"}], ",", 
              RowBox[{"Length", "[", 
               RowBox[{
                SubscriptBox["qC", "list"], "\[LeftDoubleBracket]", "j", 
                "\[RightDoubleBracket]"}], "]"}], ",", 
              RowBox[{"Length", "[", 
               RowBox[{
                SubscriptBox["qA", "list"], "\[LeftDoubleBracket]", "j", 
                "\[RightDoubleBracket]"}], "]"}], ",", 
              RowBox[{"Length", "[", 
               RowBox[{
                SubscriptBox["qC", "list"], "\[LeftDoubleBracket]", 
                RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}], "]"}], 
              ",", 
              RowBox[{"Length", "[", 
               RowBox[{
                SubscriptBox["qA", "list"], "\[LeftDoubleBracket]", 
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
          SubscriptBox["fn", "base"], "<>", "\"\<_qCA\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{"ColumnMajorLayout", "[", 
          RowBox[{"ArrayReshape", "[", 
           RowBox[{
            RowBox[{
             SubscriptBox["qCA", "list"], "\[LeftDoubleBracket]", "j", 
             "\[RightDoubleBracket]"}], ",", 
            RowBox[{"{", 
             RowBox[{
              RowBox[{"Length", "[", 
               RowBox[{
                SubscriptBox["qC", "list"], "\[LeftDoubleBracket]", "j", 
                "\[RightDoubleBracket]"}], "]"}], ",", 
              RowBox[{"Length", "[", 
               RowBox[{
                SubscriptBox["qA", "list"], "\[LeftDoubleBracket]", "j", 
                "\[RightDoubleBracket]"}], "]"}]}], "}"}]}], "]"}], "]"}], 
         ",", "\"\<Integer32\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", 
         RowBox[{"L", "+", "1"}]}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Construct MPO representation of a sum of operator chains", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"fictitious", " ", "operator", " ", "chains"}], ";", " ", 
    RowBox[{
     RowBox[{
     "note", " ", "that", " ", "some", " ", "chains", " ", "could", " ", "be",
       " ", "zero", " ", "due", " ", "to", " ", "non"}], "-", 
     RowBox[{"matching", " ", "quantum", " ", "numbers"}]}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"SeedRandom", "[", "55", "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["opchain", "list"], "=", 
     RowBox[{"Block", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"qd", "=", 
          RowBox[{"{", 
           RowBox[{"1", ",", "0", ",", 
            RowBox[{"-", "2"}], ",", "0"}], "}"}]}], ",", 
         RowBox[{"L", "=", 
          SubscriptBox["L", "val"]}], ",", "i", ",", "len", ",", "qD"}], 
        "}"}], ",", 
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"i", "=", 
           RowBox[{"RandomInteger", "[", 
            RowBox[{"{", 
             RowBox[{"1", ",", "L"}], "}"}], "]"}]}], ";", 
          RowBox[{"len", "=", 
           RowBox[{"RandomInteger", "[", 
            RowBox[{"{", 
             RowBox[{"1", ",", 
              RowBox[{"L", "-", "i", "+", "1"}]}], "}"}], "]"}]}], ";", 
          RowBox[{"qD", "=", 
           RowBox[{"RandomInteger", "[", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{
               RowBox[{"-", "2"}], ",", "2"}], "}"}], ",", 
             RowBox[{"len", "-", "1"}]}], "]"}]}], ";", 
          RowBox[{"{", 
           RowBox[{"i", ",", 
            RowBox[{"Table", "[", 
             RowBox[{
              RowBox[{"Outer", "[", 
               RowBox[{
                RowBox[{
                 RowBox[{"If", "[", 
                  RowBox[{
                   RowBox[{
                    RowBox[{"#1", "-", "#2", "+", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{"j", "\[Equal]", "1"}], ",", "0", ",", 
                    RowBox[{"qD", "\[LeftDoubleBracket]", 
                    RowBox[{"j", "-", "1"}], "\[RightDoubleBracket]"}]}], 
                    "]"}], "-", 
                    RowBox[{"If", "[", 
                    RowBox[{
                    RowBox[{"j", "\[Equal]", "len"}], ",", "0", ",", 
                    RowBox[{
                    "qD", "\[LeftDoubleBracket]", "j", 
                    "\[RightDoubleBracket]"}]}], "]"}]}], "\[Equal]", "0"}], 
                   ",", 
                   RowBox[{"RandomComplex", "[", 
                    RowBox[{"{", 
                    RowBox[{
                    RowBox[{"-", 
                    RowBox[{"(", 
                    RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], ",", 
                    RowBox[{"(", 
                    RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], "}"}], 
                    "]"}], ",", "0"}], "]"}], "&"}], ",", "qd", ",", "qd"}], 
               "]"}], ",", 
              RowBox[{"{", 
               RowBox[{"j", ",", "len"}], "}"}]}], "]"}], ",", "qD"}], 
           "}"}]}], ",", "10"}], "]"}]}], "]"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"First", "[", "#", "]"}], ",", 
       RowBox[{"Dimensions", "[", 
        RowBox[{"#", "\[LeftDoubleBracket]", "2", "\[RightDoubleBracket]"}], 
        "]"}], ",", 
       RowBox[{"Length", "[", 
        RowBox[{"Last", "[", "#", "]"}], "]"}]}], "}"}], "&"}], "/@", 
    "%"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"3", ",", 
     RowBox[{"{", 
      RowBox[{"2", ",", "4", ",", "4"}], "}"}], ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", 
     RowBox[{"{", 
      RowBox[{"5", ",", "4", ",", "4"}], "}"}], ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", 
     RowBox[{"{", 
      RowBox[{"2", ",", "4", ",", "4"}], "}"}], ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "4", ",", "4"}], "}"}], ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "4", ",", "4"}], "}"}], ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "4", ",", "4"}], "}"}], ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", 
     RowBox[{"{", 
      RowBox[{"4", ",", "4", ",", "4"}], "}"}], ",", "3"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", 
     RowBox[{"{", 
      RowBox[{"3", ",", "4", ",", "4"}], "}"}], ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", 
     RowBox[{"{", 
      RowBox[{"2", ",", "4", ",", "4"}], "}"}], ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "4", ",", "4"}], "}"}], ",", "0"}], "}"}]}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "construct", " ", "MPO", " ", "representation", " ", "corresponding", " ", 
    "to", " ", "operator", " ", "chains"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["W", "list"], "=", 
     RowBox[{"MPOFromOpChains", "[", 
      RowBox[{"4", ",", 
       SubscriptBox["L", "val"], ",", 
       SubscriptBox["opchain", "list"]}], "]"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{"Dimensions", "[", 
      RowBox[{"First", "[", "#", "]"}], "]"}], "&"}], "/@", 
    "%"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "1", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "4", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "4", ",", "6"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "6", ",", "5"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "5", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"virtual", " ", "bond", " ", "quantum", " ", "numbers"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], "}"}], ",", 
    RowBox[{
     SubscriptBox["qW", "list"], "=", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"If", "[", 
        RowBox[{
         RowBox[{"j", "\[LessEqual]", "L"}], ",", 
         RowBox[{
          SubscriptBox["W", "list"], "\[LeftDoubleBracket]", 
          RowBox[{"j", ",", "2"}], "\[RightDoubleBracket]"}], ",", 
         RowBox[{
          SubscriptBox["W", "list"], "\[LeftDoubleBracket]", 
          RowBox[{"L", ",", "3"}], "\[RightDoubleBracket]"}]}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", 
         RowBox[{"L", "+", "1"}]}], "}"}]}], "]"}]}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", "0", "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", 
     RowBox[{"-", "2"}], ",", "0", ",", 
     RowBox[{"-", "1"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "2", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", 
     RowBox[{"-", "2"}], ",", "0", ",", 
     RowBox[{"-", "1"}], ",", "0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", "0", "}"}]}], "}"}]], "Output"]
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
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"qd", "=", 
      RowBox[{"{", 
       RowBox[{"1", ",", "0", ",", 
        RowBox[{"-", "2"}], ",", "0"}], "}"}]}], "}"}], ",", 
    RowBox[{
     RowBox[{
      RowBox[{"MPOBlockStructureError", "[", 
       RowBox[{"#", ",", 
        RowBox[{"{", 
         RowBox[{"qd", ",", "qd"}], "}"}]}], "]"}], "&"}], "/@", 
     SubscriptBox["W", "list"]}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.`", ",", "0.`", ",", "0.`", ",", "0.`", ",", "0.`"}], 
  "}"}]], "Output"]
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
     RowBox[{"d", ",", "d"}], "}"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "construct", " ", "full", " ", "Hamiltonian", " ", "from", " ", "operator",
     " ", "chains"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"HamiltonianFromOpchains", "[", 
    RowBox[{"d_", ",", "L_", ",", "opchains_"}], "]"}], ":=", 
   RowBox[{"Total", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"KroneckerProduct", "@@", 
       RowBox[{"Join", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"SparseIdentityMatrix", "[", 
           SuperscriptBox["d", 
            RowBox[{
             RowBox[{"First", "[", "#", "]"}], "-", "1"}]], "]"}], "}"}], ",", 
         RowBox[{"#", "\[LeftDoubleBracket]", "2", "\[RightDoubleBracket]"}], 
         ",", 
         RowBox[{"{", 
          RowBox[{"SparseIdentityMatrix", "[", 
           SuperscriptBox["d", 
            RowBox[{"L", "-", 
             RowBox[{"OpChainRightIndex", "[", "#", "]"}]}]], "]"}], "}"}]}], 
        "]"}]}], "&"}], "/@", "opchains"}], "]"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "compare", " ", "with", " ", "full", " ", "reference", " ", 
    "Hamiltonian"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"MPOMergeFull", "[", 
     RowBox[{"First", "/@", 
      SubscriptBox["W", "list"]}], "]"}], "-", 
    RowBox[{"HamiltonianFromOpchains", "[", 
     RowBox[{"4", ",", 
      SubscriptBox["L", "val"], ",", 
      SubscriptBox["opchain", "list"]}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["5.202661259178794`*^-16"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "operator", " ", "chains", " ", "to", " ", "disk"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_opc_start.dat\>\""}], ",", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{"First", "/@", 
         SubscriptBox["opchain", "list"]}], ")"}], "-", "1"}], ",", 
      "\"\<Integer32\>\""}], "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_opc_length.dat\>\""}], ",", 
      RowBox[{
       RowBox[{
        RowBox[{"Length", "[", 
         RowBox[{"#", "\[LeftDoubleBracket]", "2", "\[RightDoubleBracket]"}], 
         "]"}], "&"}], "/@", 
       SubscriptBox["opchain", "list"]}], ",", "\"\<Integer32\>\""}], "]"}], 
    ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Block", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], "}"}], ",", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"Table", "[", 
         RowBox[{
          RowBox[{"Export", "[", 
           RowBox[{
            RowBox[{
             SubscriptBox["fn", "base"], "<>", "\"\<_opc\>\"", "<>", 
             RowBox[{"ToString", "[", 
              RowBox[{"i", "-", "1"}], "]"}], "<>", "\"\<_\>\"", "<>", 
             RowBox[{"ToString", "[", 
              RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
            RowBox[{"ColumnMajorLayout", "[", 
             RowBox[{
              SubscriptBox["opchain", "list"], "\[LeftDoubleBracket]", 
              RowBox[{"i", ",", "2", ",", "j"}], "\[RightDoubleBracket]"}], 
             "]"}], ",", "\"\<Complex128\>\""}], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{"j", ",", 
            RowBox[{"Length", "[", 
             RowBox[{
              SubscriptBox["opchain", "list"], "\[LeftDoubleBracket]", 
              RowBox[{"i", ",", "2"}], "\[RightDoubleBracket]"}], "]"}]}], 
           "}"}]}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"i", ",", 
          RowBox[{"Length", "[", 
           SubscriptBox["opchain", "list"], "]"}]}], "}"}]}], "]"}]}], "]"}], 
    ";"}], "\[IndentingNewLine]", 
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
           SubscriptBox["fn", "base"], "<>", "\"\<_opc\>\"", "<>", 
           RowBox[{"ToString", "[", 
            RowBox[{"i", "-", "1"}], "]"}], "<>", "\"\<_qD.dat\>\""}], ",", 
          RowBox[{
           SubscriptBox["opchain", "list"], "\[LeftDoubleBracket]", 
           RowBox[{"i", ",", "3"}], "\[RightDoubleBracket]"}], ",", 
          "\"\<Integer32\>\""}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"i", ",", 
          RowBox[{"Length", "[", 
           SubscriptBox["opchain", "list"], "]"}]}], "}"}]}], "]"}]}], "]"}], 
    ";"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "save", " ", "MPO", " ", "tensors", " ", "and", " ", "quantum", " ", 
    "numbers", " ", "to", " ", "disk"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
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
           SubscriptBox["fn", "base"], "<>", "\"\<_W\>\"", "<>", 
           RowBox[{"ToString", "[", 
            RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
          RowBox[{"ColumnMajorLayout", "[", 
           RowBox[{"First", "[", 
            RowBox[{
             SubscriptBox["W", "list"], "\[LeftDoubleBracket]", "j", 
             "\[RightDoubleBracket]"}], "]"}], "]"}], ",", 
          "\"\<Complex128\>\""}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}], "]"}], ";"}], 
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
           SubscriptBox["fn", "base"], "<>", "\"\<_qW\>\"", "<>", 
           RowBox[{"ToString", "[", 
            RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
          RowBox[{
           SubscriptBox["qW", "list"], "\[LeftDoubleBracket]", "j", 
           "\[RightDoubleBracket]"}], ",", "\"\<Integer32\>\""}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", 
          RowBox[{"L", "+", "1"}]}], "}"}]}], "]"}]}], "]"}], 
    ";"}]}]}]], "Input"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1560, 920},
WindowMargins->{{239, Automatic}, {71, Automatic}},
FrontEndVersion->"11.0 for Microsoft Windows (64-bit) (September 21, 2016)",
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
Cell[1538, 37, 123, 3, 30, "Input"],
Cell[1664, 42, 68, 1, 30, "Input"],
Cell[1735, 45, 174, 5, 30, "Input"],
Cell[1912, 52, 310, 9, 30, "Input"],
Cell[2225, 63, 233, 7, 50, "Input"],
Cell[2461, 72, 566, 18, 71, "Input"],
Cell[3030, 92, 602, 16, 51, "Input"],
Cell[CellGroupData[{
Cell[3657, 112, 38, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[3720, 116, 2602, 80, 110, "Input"],
Cell[6325, 198, 722, 22, 30, "Output"],
Cell[7050, 222, 860, 25, 30, "Output"],
Cell[7913, 249, 747, 22, 30, "Output"]
}, Open  ]],
Cell[8675, 274, 4059, 121, 91, "Input"],
Cell[CellGroupData[{
Cell[12759, 399, 88, 2, 30, "Input"],
Cell[12850, 403, 83, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12970, 410, 88, 2, 30, "Input"],
Cell[13061, 414, 83, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13181, 421, 88, 2, 30, "Input"],
Cell[13272, 425, 83, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13392, 432, 660, 16, 88, "Input"],
Cell[14055, 450, 93, 2, 30, "Output"],
Cell[14151, 454, 93, 2, 30, "Output"],
Cell[14247, 458, 93, 2, 30, "Output"],
Cell[14343, 462, 93, 2, 30, "Output"]
}, Open  ]],
Cell[14451, 467, 2504, 70, 88, "Input"],
Cell[16958, 539, 2461, 69, 91, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[19456, 613, 65, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[19546, 617, 181, 5, 33, "Input"],
Cell[19730, 624, 9924, 205, 72, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[29691, 834, 325, 9, 52, "Input"],
Cell[30019, 845, 5123, 114, 128, "Output"]
}, Open  ]],
Cell[35157, 962, 1953, 52, 90, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[37147, 1019, 31, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[37203, 1023, 467, 13, 50, "Input"],
Cell[37673, 1038, 1120, 27, 77, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[38830, 1070, 202, 5, 50, "Input"],
Cell[39035, 1077, 139, 3, 30, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[39223, 1086, 39, 0, 43, "Subsection"],
Cell[39265, 1088, 510, 16, 50, "Input"],
Cell[CellGroupData[{
Cell[39800, 1108, 483, 13, 50, "Input"],
Cell[40286, 1123, 73, 2, 30, "Output"]
}, Open  ]],
Cell[40374, 1128, 668, 19, 50, "Input"],
Cell[CellGroupData[{
Cell[41067, 1151, 844, 25, 88, "Input"],
Cell[41914, 1178, 147, 2, 30, "Output"],
Cell[42064, 1182, 50, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[42151, 1187, 530, 14, 88, "Input"],
Cell[42684, 1203, 46, 0, 30, "Output"],
Cell[42733, 1205, 51, 0, 30, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[42833, 1211, 44, 0, 43, "Subsection"],
Cell[42880, 1213, 2183, 60, 71, "Input"],
Cell[CellGroupData[{
Cell[45088, 1277, 112, 3, 33, "Input"],
Cell[45203, 1282, 83, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[45323, 1289, 112, 3, 33, "Input"],
Cell[45438, 1294, 83, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[45558, 1301, 574, 15, 77, "Input"],
Cell[46135, 1318, 93, 2, 30, "Output"],
Cell[46231, 1322, 93, 2, 30, "Output"],
Cell[46327, 1326, 93, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[46457, 1333, 260, 6, 52, "Input"],
Cell[46720, 1341, 732, 15, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[47489, 1361, 470, 14, 33, "Input"],
Cell[47962, 1377, 141, 3, 30, "Output"]
}, Open  ]],
Cell[48118, 1383, 1151, 32, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[49306, 1420, 34, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[49365, 1424, 352, 10, 33, "Input"],
Cell[49720, 1436, 9929, 205, 72, "Output"]
}, Open  ]],
Cell[59664, 1644, 2080, 57, 90, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[61781, 1706, 40, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[61846, 1710, 543, 16, 74, "Input"],
Cell[62392, 1728, 351, 8, 30, "Output"],
Cell[62746, 1738, 29, 0, 30, "Output"]
}, Open  ]],
Cell[62790, 1741, 912, 26, 71, "Input"],
Cell[CellGroupData[{
Cell[63727, 1771, 978, 29, 74, "Input"],
Cell[64708, 1802, 97, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[64842, 1809, 690, 21, 54, "Input"],
Cell[65535, 1832, 30, 0, 30, "Output"]
}, Open  ]],
Cell[65580, 1835, 1063, 29, 52, "Input"],
Cell[66646, 1866, 627, 17, 51, "Input"],
Cell[CellGroupData[{
Cell[67298, 1887, 43, 0, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[67366, 1891, 1022, 33, 73, "Input"],
Cell[68391, 1926, 96, 2, 30, "Output"],
Cell[68490, 1930, 96, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[68623, 1937, 273, 8, 54, "Input"],
Cell[68899, 1947, 28, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[68964, 1952, 322, 8, 52, "Input"],
Cell[69289, 1962, 171, 4, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[69497, 1971, 253, 7, 52, "Input"],
Cell[69753, 1980, 46, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[69836, 1985, 300, 8, 52, "Input"],
Cell[70139, 1995, 45, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[70221, 2000, 676, 20, 52, "Input"],
Cell[70900, 2022, 50, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[70987, 2027, 1013, 31, 71, "Input"],
Cell[72003, 2060, 30, 0, 30, "Output"],
Cell[72036, 2062, 30, 0, 30, "Output"]
}, Open  ]],
Cell[72081, 2065, 418, 12, 51, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[72536, 2082, 65, 0, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[72626, 2086, 1255, 40, 78, "Input"],
Cell[73884, 2128, 96, 2, 30, "Output"],
Cell[73983, 2132, 96, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[74116, 2139, 313, 9, 54, "Input"],
Cell[74432, 2150, 28, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[74497, 2155, 334, 8, 52, "Input"],
Cell[74834, 2165, 170, 4, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[75041, 2174, 721, 21, 52, "Input"],
Cell[75765, 2197, 30, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[75832, 2202, 265, 7, 52, "Input"],
Cell[76100, 2211, 45, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[76182, 2216, 312, 8, 52, "Input"],
Cell[76497, 2226, 45, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[76579, 2231, 758, 22, 71, "Input"],
Cell[77340, 2255, 97, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[77474, 2262, 565, 17, 76, "Input"],
Cell[78042, 2281, 46, 0, 30, "Output"]
}, Open  ]],
Cell[78103, 2284, 451, 13, 54, "Input"],
Cell[78557, 2299, 1124, 30, 52, "Input"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[79730, 2335, 44, 0, 43, "Subsection"],
Cell[79777, 2337, 1132, 34, 91, "Input"],
Cell[80912, 2373, 1630, 50, 71, "Input"],
Cell[CellGroupData[{
Cell[82567, 2427, 173, 4, 50, "Input"],
Cell[82743, 2433, 94, 2, 30, "Output"],
Cell[82840, 2437, 94, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[82971, 2444, 1190, 38, 73, "Input"],
Cell[84164, 2484, 94, 2, 30, "Output"],
Cell[84261, 2488, 94, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[84392, 2495, 569, 17, 95, "Input"],
Cell[84964, 2514, 28, 0, 30, "Output"],
Cell[84995, 2516, 28, 0, 30, "Output"],
Cell[85026, 2518, 28, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[85091, 2523, 163, 4, 52, "Input"],
Cell[85257, 2529, 344, 7, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[85638, 2541, 253, 7, 52, "Input"],
Cell[85894, 2550, 46, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[85977, 2555, 300, 8, 52, "Input"],
Cell[86280, 2565, 46, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[86363, 2570, 1019, 31, 71, "Input"],
Cell[87385, 2603, 30, 0, 30, "Output"],
Cell[87418, 2605, 30, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[87485, 2610, 657, 19, 71, "Input"],
Cell[88145, 2631, 95, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[88277, 2638, 773, 21, 74, "Input"],
Cell[89053, 2661, 47, 0, 30, "Output"]
}, Open  ]],
Cell[89115, 2664, 1604, 44, 71, "Input"],
Cell[90722, 2710, 850, 24, 71, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[91609, 2739, 36, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[91670, 2743, 2515, 71, 129, "Input"],
Cell[94188, 2816, 93, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[94318, 2823, 2806, 77, 111, "Input"],
Cell[97127, 2902, 164, 5, 30, "Output"],
Cell[97294, 2909, 252, 5, 30, "Output"],
Cell[97549, 2916, 193, 4, 30, "Output"]
}, Open  ]],
Cell[97757, 2923, 741, 21, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[98535, 2949, 37, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[98597, 2953, 1954, 53, 110, "Input"],
Cell[100554, 3008, 456, 12, 30, "Output"],
Cell[101013, 3022, 120, 3, 30, "Output"]
}, Open  ]],
Cell[101148, 3028, 2591, 62, 89, "Input"],
Cell[103742, 3092, 1522, 40, 51, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[105301, 3137, 78, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[105404, 3141, 3600, 95, 146, "Input"],
Cell[109007, 3238, 1376, 43, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[110420, 3286, 626, 20, 70, "Input"],
Cell[111049, 3308, 448, 12, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[111534, 3325, 899, 25, 51, "Input"],
Cell[112436, 3352, 551, 16, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[113024, 3373, 736, 22, 50, "Input"],
Cell[113763, 3397, 116, 3, 30, "Output"]
}, Open  ]],
Cell[113894, 3403, 297, 9, 30, "Input"],
Cell[114194, 3414, 1029, 27, 55, "Input"],
Cell[CellGroupData[{
Cell[115248, 3445, 502, 14, 51, "Input"],
Cell[115753, 3461, 50, 0, 30, "Output"]
}, Open  ]],
Cell[115818, 3464, 3171, 85, 131, "Input"],
Cell[118992, 3551, 1796, 50, 70, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* NotebookSignature SwTZ9zOhy7kodC1cNHKYnYxy *)
