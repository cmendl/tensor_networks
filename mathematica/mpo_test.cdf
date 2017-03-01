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
NotebookDataLength[     39899,       1403]
NotebookOptionsPosition[     36147,       1253]
NotebookOutlinePosition[     36490,       1268]
CellTagsIndexPosition[     36447,       1265]
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
 RowBox[{"<<", "tn_base.m"}]], "Input"],

Cell[CellGroupData[{

Cell["Merge two MPO tensors", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"fictitious", " ", "physical", " ", "dimensions"}], " ", "*)"}], 
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
   SubscriptBox["A", "0"], "=", 
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
   SubscriptBox["A", "1"], "=", 
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
  SubscriptBox["A", "0"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"2", ",", "3", ",", "6", ",", "7"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["A", "1"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "5", ",", "7", ",", "8"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"consistency", " ", "check"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Norm", "[", 
    RowBox[{"Flatten", "[", 
     RowBox[{
      RowBox[{"MPOMergeTensors", "[", 
       RowBox[{
        RowBox[{"ArrayReshape", "[", 
         RowBox[{
          RowBox[{"IdentityMatrix", "[", 
           SubscriptBox["D", "1"], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{"1", ",", "1", ",", 
            SubscriptBox["D", "1"], ",", 
            SubscriptBox["D", "1"]}], "}"}]}], "]"}], ",", 
        SubscriptBox["A", "0"]}], "]"}], "-", 
      SubscriptBox["A", "0"]}], "]"}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{"Flatten", "[", 
     RowBox[{
      RowBox[{"MPOMergeTensors", "[", 
       RowBox[{
        SubscriptBox["A", "0"], ",", 
        RowBox[{"ArrayReshape", "[", 
         RowBox[{
          RowBox[{"IdentityMatrix", "[", 
           SubscriptBox["D", "2"], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{"1", ",", "1", ",", 
            SubscriptBox["D", "2"], ",", 
            SubscriptBox["D", "2"]}], "}"}]}], "]"}]}], "]"}], "-", 
      SubscriptBox["A", "0"]}], "]"}], "]"}]}]}]], "Input"],

Cell[BoxData["0.`"], "Output"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Dimensions", "[", 
   RowBox[{"MPOMergeTensors", "[", 
    RowBox[{
     SubscriptBox["A", "0"], ",", 
     SubscriptBox["A", "1"]}], "]"}], "]"}], "-", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{
     SubscriptBox["d", 
      RowBox[{"0", ",", "1"}]], 
     SubscriptBox["d", 
      RowBox[{"1", ",", "1"}]]}], ",", 
    RowBox[{
     SubscriptBox["d", 
      RowBox[{"0", ",", "2"}]], 
     SubscriptBox["d", 
      RowBox[{"1", ",", "2"}]]}], ",", 
    SubscriptBox["D", "1"], ",", 
    SubscriptBox["D", "3"]}], "}"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "check", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"Sum", "[", 
       RowBox[{
        RowBox[{
         RowBox[{
          SubscriptBox["A", "0"], "\[LeftDoubleBracket]", 
          RowBox[{
           RowBox[{
            RowBox[{"Floor", "[", 
             RowBox[{
              RowBox[{"(", 
               RowBox[{
                SubscriptBox["i", "1"], "-", "1"}], ")"}], "/", 
              SubscriptBox["d", 
               RowBox[{"1", ",", "1"}]]}], "]"}], "+", "1"}], ",", 
           RowBox[{
            RowBox[{"Floor", "[", 
             RowBox[{
              RowBox[{"(", 
               RowBox[{
                SubscriptBox["i", "2"], "-", "1"}], ")"}], "/", 
              SubscriptBox["d", 
               RowBox[{"1", ",", "2"}]]}], "]"}], "+", "1"}], ",", 
           SubscriptBox["j", "1"], ",", 
           SubscriptBox["j", "2"]}], "\[RightDoubleBracket]"}], 
         RowBox[{
          SubscriptBox["A", "1"], "\[LeftDoubleBracket]", 
          RowBox[{
           RowBox[{
            RowBox[{"Mod", "[", 
             RowBox[{
              RowBox[{
               SubscriptBox["i", "1"], "-", "1"}], ",", 
              SubscriptBox["d", 
               RowBox[{"1", ",", "1"}]]}], "]"}], "+", "1"}], ",", 
           RowBox[{
            RowBox[{"Mod", "[", 
             RowBox[{
              RowBox[{
               SubscriptBox["i", "2"], "-", "1"}], ",", 
              SubscriptBox["d", 
               RowBox[{"1", ",", "2"}]]}], "]"}], "+", "1"}], ",", 
           SubscriptBox["j", "2"], ",", 
           SubscriptBox["j", "3"]}], "\[RightDoubleBracket]"}]}], ",", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["j", "2"], ",", 
          SubscriptBox["D", "2"]}], "}"}]}], "]"}], ",", 
      RowBox[{"{", 
       RowBox[{
        SubscriptBox["i", "1"], ",", 
        RowBox[{
         SubscriptBox["d", 
          RowBox[{"0", ",", "1"}]], 
         SubscriptBox["d", 
          RowBox[{"1", ",", "1"}]]}]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        SubscriptBox["i", "2"], ",", 
        RowBox[{
         SubscriptBox["d", 
          RowBox[{"0", ",", "2"}]], 
         SubscriptBox["d", 
          RowBox[{"1", ",", "2"}]]}]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        SubscriptBox["j", "1"], ",", 
        SubscriptBox["D", "1"]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        SubscriptBox["j", "3"], ",", 
        SubscriptBox["D", "3"]}], "}"}]}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{"Flatten", "[", 
     RowBox[{"%", "-", 
      RowBox[{"MPOMergeTensors", "[", 
       RowBox[{
        SubscriptBox["A", "0"], ",", 
        SubscriptBox["A", "1"]}], "]"}]}], "]"}], "]"}]}]}]], "Input"],

Cell[BoxData["4.315570528840465`*^-16"], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Compress virtual bonds", "Subsection"],

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
   "fictitious", " ", "virtual", " ", "bond", " ", "quantum", " ", 
    "numbers"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["qB", "0"], "=", 
     RowBox[{"{", 
      RowBox[{"1", ",", "2", ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "3"}], ",", "0"}], "}"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["qB", "1"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "2"}], ",", "0", ",", 
       RowBox[{"-", "2"}], ",", "3", ",", 
       RowBox[{"-", "5"}], ",", 
       RowBox[{"-", "5"}], ",", "1"}], "}"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["qB", "2"], "=", 
     RowBox[{"{", 
      RowBox[{"4", ",", 
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "2"}], ",", "0", ",", "3", ",", 
       RowBox[{"-", "5"}], ",", 
       RowBox[{"-", "2"}]}], "}"}]}], ";"}]}]}]], "Input"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "43", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["B", "0"], "=", 
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
     SubscriptBox["qB", "0"], ",", 
     SubscriptBox["qB", "1"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["B", "1"], "=", 
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
     SubscriptBox["qB", "1"], ",", 
     SubscriptBox["qB", "2"]}], "]"}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Dimensions", "[", 
  SubscriptBox["B", "0"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["B", "1"], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "5", ",", "8"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "5", ",", "8", ",", "7"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["cB", "0"], ",", 
       SubscriptBox["qcB", "0"], ",", 
       SubscriptBox["qcB", "1"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["cB", "1"], ",", 
       SubscriptBox["qcB", 
        RowBox[{"1", ",", "alt"}]], ",", 
       SubscriptBox["qcB", "2"]}], "}"}], ",", 
     SubscriptBox["\[Sigma]", 
      RowBox[{"B", ",", "val"}]]}], "}"}], "=", 
   RowBox[{"MPOCompressTensors", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["B", "0"], ",", 
       SubscriptBox["qB", "0"], ",", 
       SubscriptBox["qB", "1"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["B", "1"], ",", 
       SubscriptBox["qB", "1"], ",", 
       SubscriptBox["qB", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["qd", "0"], ",", 
       SubscriptBox["qd", "1"]}], "}"}], ",", "0"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["cB", "0"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["cB", "1"], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "5", ",", "7"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "5", ",", "7", ",", "7"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"consistency", " ", "check"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    SubscriptBox["qcB", "1"], "-", 
    SubscriptBox["qcB", 
     RowBox[{"1", ",", "alt"}]]}], "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  SubscriptBox["\[Sigma]", 
   RowBox[{"B", ",", "val"}]]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "4.0077191979846525`", ",", "10.518261309207697`", ",", 
   "9.386760491369403`", ",", "4.797794869366393`", ",", "9.172305938550947`",
    ",", "7.250798429144742`", ",", "4.565350186869165`"}], "}"}]], "Output"]
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
    RowBox[{"Flatten", "[", 
     RowBox[{
      SubscriptBox["cB", "0"], 
      RowBox[{"Outer", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"#1", "-", "#2", "+", "#3", "-", "#4"}], "\[NotEqual]", 
            "0"}], ",", "1", ",", "0"}], "]"}], "&"}], ",", 
        SubscriptBox["qd", "0"], ",", 
        SubscriptBox["qd", "0"], ",", 
        SubscriptBox["qB", "0"], ",", 
        SubscriptBox["qcB", "1"]}], "]"}]}], "]"}], "]"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{"Flatten", "[", 
     RowBox[{
      SubscriptBox["cB", "1"], 
      RowBox[{"Outer", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"#1", "-", "#2", "+", "#3", "-", "#4"}], "\[NotEqual]", 
            "0"}], ",", "1", ",", "0"}], "]"}], "&"}], ",", 
        SubscriptBox["qd", "1"], ",", 
        SubscriptBox["qd", "1"], ",", 
        SubscriptBox["qcB", "1"], ",", 
        SubscriptBox["qB", "2"]}], "]"}]}], "]"}], "]"}]}]}]], "Input"],

Cell[BoxData["0.`"], "Output"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{
    "compressed", " ", "tensors", " ", "describe", " ", "the", " ", "same", 
     " ", "state"}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"Flatten", "[", 
     RowBox[{
      RowBox[{"MPOMergeTensors", "[", 
       RowBox[{
        SubscriptBox["B", "0"], ",", 
        SubscriptBox["B", "1"]}], "]"}], "-", 
      RowBox[{"MPOMergeTensors", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["cB", "0"], ".", 
         RowBox[{"DiagonalMatrix", "[", 
          SubscriptBox["\[Sigma]", 
           RowBox[{"B", ",", "val"}]], "]"}]}], ",", 
        SubscriptBox["cB", "1"]}], "]"}]}], "]"}], ",", "\[Infinity]"}], 
   "]"}]}]], "Input"],

Cell[BoxData["3.1558467846863662`*^-15"], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Composition of MPO pairs", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "fictitious", " ", "virtual", " ", "bond", " ", "quantum", " ", 
    "numbers"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["qC", "0"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "1"}], ",", "0", ",", "4", ",", 
       RowBox[{"-", "2"}], ",", "2", ",", "1"}], "}"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["qC", "1"], "=", 
     RowBox[{"{", 
      RowBox[{"4", ",", "1", ",", "4", ",", 
       RowBox[{"-", "3"}], ",", 
       RowBox[{"-", "5"}], ",", "0", ",", 
       RowBox[{"-", "2"}], ",", "4", ",", 
       RowBox[{"-", "4"}], ",", "2"}], "}"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["qC", "2"], "=", 
     RowBox[{"{", 
      RowBox[{"2", ",", "1", ",", "3", ",", 
       RowBox[{"-", "3"}], ",", "0", ",", 
       RowBox[{"-", "2"}]}], "}"}]}], ";"}]}]}]], "Input"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "44", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["C", "0"], "=", 
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
     SubscriptBox["qC", "0"], ",", 
     SubscriptBox["qC", "1"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["C", "1"], "=", 
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
     SubscriptBox["qC", "1"], ",", 
     SubscriptBox["qC", "2"]}], "]"}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Dimensions", "[", 
  SubscriptBox["C", "0"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["C", "1"], "]"}]}], "Input"],

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
       SubscriptBox["B", "0"], ",", 
       SubscriptBox["qB", "0"], ",", 
       SubscriptBox["qB", "1"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["B", "1"], ",", 
       SubscriptBox["qB", "1"], ",", 
       SubscriptBox["qB", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["C", "0"], ",", 
       SubscriptBox["qC", "0"], ",", 
       SubscriptBox["qC", "1"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["C", "1"], ",", 
       SubscriptBox["qC", "1"], ",", 
       SubscriptBox["qC", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["qd", "0"], ",", 
       SubscriptBox["qd", "1"]}], "}"}], ",", "0"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["P", "0"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["P", "1"], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "30", ",", "61"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "5", ",", "61", ",", "42"}], "}"}]], "Output"]
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
   RowBox[{"Sort", "[", 
    SubscriptBox["\[Sigma]", 
     RowBox[{"P", ",", "val"}]], "]"}], "\[LeftDoubleBracket]", 
   RowBox[{"{", 
    RowBox[{"1", ",", "2", ",", "3", ",", 
     RowBox[{"-", "1"}]}], "}"}], "\[RightDoubleBracket]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.7188345568709417`", ",", "0.8846601068508088`", ",", 
   "1.5495887573484586`", ",", "35.10120963487162`"}], "}"}]], "Output"]
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
    RowBox[{"Flatten", "[", 
     RowBox[{
      SubscriptBox["P", "0"], 
      RowBox[{"Outer", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"#1", "-", "#2", "+", "#3", "-", "#4"}], "\[NotEqual]", 
            "0"}], ",", "1", ",", "0"}], "]"}], "&"}], ",", 
        SubscriptBox["qd", "0"], ",", 
        SubscriptBox["qd", "0"], ",", 
        SubscriptBox["qP", "0"], ",", 
        SubscriptBox["qP", "1"]}], "]"}]}], "]"}], "]"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{"Flatten", "[", 
     RowBox[{
      SubscriptBox["P", "1"], 
      RowBox[{"Outer", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"#1", "-", "#2", "+", "#3", "-", "#4"}], "\[NotEqual]", 
            "0"}], ",", "1", ",", "0"}], "]"}], "&"}], ",", 
        SubscriptBox["qd", "1"], ",", 
        SubscriptBox["qd", "1"], ",", 
        SubscriptBox["qP", "1"], ",", 
        SubscriptBox["qP", "2"]}], "]"}]}], "]"}], "]"}]}]}]], "Input"],

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
   RowBox[{"reference", " ", "calculation"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["P", 
        RowBox[{"0", ",", "1", ",", "ref"}]], ",", 
       SubscriptBox["qP", 
        RowBox[{"0", ",", "ref"}]], ",", 
       SubscriptBox["qP", 
        RowBox[{"2", ",", "ref"}]]}], "}"}], "=", 
     RowBox[{"MPOComposition", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"MPOMergeTensors", "[", 
          RowBox[{
           SubscriptBox["B", "0"], ",", 
           SubscriptBox["B", "1"]}], "]"}], ",", 
         SubscriptBox["qB", "0"], ",", 
         SubscriptBox["qB", "2"]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"MPOMergeTensors", "[", 
          RowBox[{
           SubscriptBox["C", "0"], ",", 
           SubscriptBox["C", "1"]}], "]"}], ",", 
         SubscriptBox["qC", "0"], ",", 
         SubscriptBox["qC", "2"]}], "}"}]}], "]"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "/@", "%"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"20", ",", "20", ",", "30", ",", "42"}], "}"}], ",", 
   RowBox[{"{", "30", "}"}], ",", 
   RowBox[{"{", "42", "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{"MPOMergeTensors", "[", 
   RowBox[{
    SubscriptBox["B", "0"], ",", 
    SubscriptBox["B", "1"]}], "]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"20", ",", "20", ",", "5", ",", "7"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{"MPOMergeTensors", "[", 
   RowBox[{
    SubscriptBox["C", "0"], ",", 
    SubscriptBox["C", "1"]}], "]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"20", ",", "20", ",", "6", ",", "6"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{
    "tensors", " ", "describe", " ", "the", " ", "same", " ", "state"}]}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"Flatten", "[", 
     RowBox[{
      RowBox[{"MPOMergeTensors", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["P", "0"], ".", 
         RowBox[{"DiagonalMatrix", "[", 
          SubscriptBox["\[Sigma]", 
           RowBox[{"P", ",", "val"}]], "]"}]}], ",", 
        SubscriptBox["P", "1"]}], "]"}], "-", 
      SubscriptBox["P", 
       RowBox[{"0", ",", "1", ",", "ref"}]]}], "]"}], ",", "\[Infinity]"}], 
   "]"}]}]], "Input"],

Cell[BoxData["8.427645867090657`*^-15"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{"quantum", " ", "numbers", " ", "match"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Norm", "[", 
    RowBox[{
     SubscriptBox["qP", "0"], "-", 
     SubscriptBox["qP", 
      RowBox[{"0", ",", "ref"}]]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     SubscriptBox["qP", "2"], "-", 
     SubscriptBox["qP", 
      RowBox[{"2", ",", "ref"}]]}], "]"}]}]}]], "Input"],

Cell[BoxData["0"], "Output"],

Cell[BoxData["0"], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["MPO trace product", "Subsection"],

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
  RowBox[{"SeedRandom", "[", "44", "]"}], ";"}], "\[IndentingNewLine]", 
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
         RowBox[{"D", "=", "5"}], ",", "zmax"}], "}"}], ",", 
       RowBox[{
        RowBox[{"zmax", "=", 
         RowBox[{
          RowBox[{"(", 
           RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "D"}]}], ";", 
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
          RowBox[{"If", "[", 
           RowBox[{
            RowBox[{"j", "\[Equal]", "1"}], ",", 
            RowBox[{"RandomComplex", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{"d1", ",", "d2", ",", "1", ",", "D"}], "}"}]}], "]"}], 
            ",", 
            RowBox[{"If", "[", 
             RowBox[{
              RowBox[{"j", "<", "L"}], ",", 
              RowBox[{"RandomComplex", "[", 
               RowBox[{
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
                RowBox[{"{", 
                 RowBox[{"d1", ",", "d2", ",", "D", ",", "D"}], "}"}]}], 
               "]"}], ",", 
              RowBox[{"RandomComplex", "[", 
               RowBox[{
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
                RowBox[{"{", 
                 RowBox[{"d1", ",", "d2", ",", "D", ",", "1"}], "}"}]}], 
               "]"}]}], "]"}]}], "]"}], ",", 
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
   "\[RightDoubleBracket]"}], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "4", ",", "1", ",", "5"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "4", ",", "5", ",", "5"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{"MPOMergeFull", "[", 
   SubscriptBox["A", 
    RowBox[{"1", ",", "list"}]], "]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"729", ",", "4096"}], "}"}]], "Output"]
}, Open  ]],

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
  RowBox[{"-", "0.0013215064851208433`"}], "-", 
  RowBox[{"0.001167895406782836`", " ", "\[ImaginaryI]"}]}]], "Output"],

Cell[BoxData["1.920569013897986`*^-15"], "Output"]
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

Cell[BoxData["1.757620893345322`"], "Output"],

Cell[BoxData["4.440892098500626`*^-16"], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1654, 920},
WindowMargins->{{Automatic, 135}, {65, Automatic}},
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
Cell[1664, 42, 53, 1, 31, "Input"],
Cell[CellGroupData[{
Cell[1742, 47, 43, 0, 43, "Subsection"],
Cell[1788, 49, 645, 21, 112, "Input"],
Cell[2436, 72, 488, 15, 92, "Input"],
Cell[2927, 89, 1527, 50, 72, "Input"],
Cell[CellGroupData[{
Cell[4479, 143, 85, 2, 31, "Input"],
Cell[4567, 147, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4697, 154, 85, 2, 31, "Input"],
Cell[4785, 158, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4915, 165, 1229, 34, 72, "Input"],
Cell[6147, 201, 30, 0, 31, "Output"],
Cell[6180, 203, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6247, 208, 567, 20, 31, "Input"],
Cell[6817, 230, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6947, 237, 2861, 85, 72, "Input"],
Cell[9811, 324, 50, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[9910, 330, 44, 0, 43, "Subsection"],
Cell[9957, 332, 566, 18, 72, "Input"],
Cell[10526, 352, 1026, 32, 92, "Input"],
Cell[11555, 386, 1630, 50, 72, "Input"],
Cell[CellGroupData[{
Cell[13210, 440, 173, 4, 52, "Input"],
Cell[13386, 446, 93, 2, 31, "Output"],
Cell[13482, 450, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13612, 457, 1187, 38, 74, "Input"],
Cell[14802, 497, 93, 2, 31, "Output"],
Cell[14898, 501, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15028, 508, 275, 8, 54, "Input"],
Cell[15306, 518, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15371, 523, 163, 4, 52, "Input"],
Cell[15537, 529, 255, 5, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15829, 539, 1437, 42, 72, "Input"],
Cell[17269, 583, 30, 0, 31, "Output"],
Cell[17302, 585, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17369, 590, 784, 23, 52, "Input"],
Cell[18156, 615, 51, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[18256, 621, 46, 0, 43, "Subsection"],
Cell[18305, 623, 981, 30, 92, "Input"],
Cell[19289, 655, 1630, 50, 72, "Input"],
Cell[CellGroupData[{
Cell[20944, 709, 173, 4, 52, "Input"],
Cell[21120, 715, 94, 2, 31, "Output"],
Cell[21217, 719, 94, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[21348, 726, 1491, 48, 74, "Input"],
Cell[22842, 776, 95, 2, 31, "Output"],
Cell[22940, 780, 95, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[23072, 787, 273, 8, 54, "Input"],
Cell[23348, 797, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[23413, 802, 356, 9, 52, "Input"],
Cell[23772, 813, 171, 4, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[23980, 822, 1433, 42, 72, "Input"],
Cell[25416, 866, 30, 0, 31, "Output"],
Cell[25449, 868, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[25516, 873, 131, 3, 52, "Input"],
Cell[25650, 878, 566, 14, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[26253, 897, 1128, 35, 75, "Input"],
Cell[27384, 934, 206, 6, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[27627, 945, 177, 5, 31, "Input"],
Cell[27807, 952, 95, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[27939, 959, 177, 5, 31, "Input"],
Cell[28119, 966, 95, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[28251, 973, 697, 21, 52, "Input"],
Cell[28951, 996, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[29038, 1001, 506, 16, 76, "Input"],
Cell[29547, 1019, 28, 0, 31, "Output"],
Cell[29578, 1021, 28, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[29655, 1027, 39, 0, 43, "Subsection"],
Cell[29697, 1029, 233, 7, 52, "Input"],
Cell[29933, 1038, 363, 12, 72, "Input"],
Cell[30299, 1052, 2607, 73, 92, "Input"],
Cell[CellGroupData[{
Cell[32931, 1129, 112, 3, 31, "Input"],
Cell[33046, 1134, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[33166, 1141, 112, 3, 31, "Input"],
Cell[33281, 1146, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[33401, 1153, 373, 10, 52, "Input"],
Cell[33777, 1165, 93, 2, 31, "Output"],
Cell[33873, 1169, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[34003, 1176, 153, 4, 31, "Input"],
Cell[34159, 1182, 78, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[34274, 1189, 907, 27, 92, "Input"],
Cell[35184, 1218, 144, 3, 31, "Output"],
Cell[35331, 1223, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[35418, 1228, 588, 16, 92, "Input"],
Cell[36009, 1246, 45, 0, 31, "Output"],
Cell[36057, 1248, 50, 0, 31, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Ru0DfIc6YzXpsB1DDexMYDug *)
