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
NotebookDataLength[     47700,       1681]
NotebookOptionsPosition[     42804,       1492]
NotebookOutlinePosition[     43147,       1507]
CellTagsIndexPosition[     43104,       1504]
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
}, Open  ]],

Cell[CellGroupData[{

Cell["Split a tensor", "Subsection"],

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
     SubscriptBox["qB", "0"], "=", 
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
     SubscriptBox["qB", "2"], "=", 
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
   SubscriptBox["B", "pair"], "=", 
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
     SubscriptBox["qB", "0"], ",", 
     SubscriptBox["qB", "2"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
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
      SubscriptBox["B", "pair"], ",", 
      SubscriptBox["qB", "0"], ",", 
      SubscriptBox["qB", "2"]}], "}"}], ",", 
    SubscriptBox["qd", 
     RowBox[{"0", ",", "1"}]]}], "]"}]}]], "Input"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["B", "0"], ",", 
       SubscriptBox["qB", "0"], ",", 
       SubscriptBox["qB", "1"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["B", "1"], ",", 
       SubscriptBox["qB", 
        RowBox[{"1", ",", "alt"}]], ",", 
       SubscriptBox["qB", "2"]}], "}"}], ",", 
     SubscriptBox["\[Sigma]", 
      RowBox[{"B", ",", "val"}]]}], "}"}], "=", 
   RowBox[{"MPOSplitTensor", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["B", "pair"], ",", 
       SubscriptBox["qB", "0"], ",", 
       SubscriptBox["qB", "2"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["qd", "0"], ",", 
       SubscriptBox["qd", "1"]}], "}"}], ",", "0"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["B", "0"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["B", "1"], "]"}]}], "Input"],

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
    SubscriptBox["qB", "1"], "-", 
    SubscriptBox["qB", 
     RowBox[{"1", ",", "alt"}]]}], "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["\[Sigma]", 
    RowBox[{"B", ",", "val"}]], "\[LeftDoubleBracket]", 
   RowBox[{"{", 
    RowBox[{"1", ",", "2", ",", "3", ",", 
     RowBox[{"-", "1"}]}], "}"}], "\[RightDoubleBracket]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "1.0161942167676605`", ",", "1.1210294261494165`", ",", 
   "3.203847696309703`", ",", "1.7316272958499028`"}], "}"}]], "Output"]
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
       SubscriptBox["B", "0"], ",", 
       SubscriptBox["qB", "0"], ",", 
       SubscriptBox["qB", "1"]}], "}"}], ",", 
     SubscriptBox["qd", "0"]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"MPOBlockStructureError", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["B", "1"], ",", 
       SubscriptBox["qB", "1"], ",", 
       SubscriptBox["qB", "2"]}], "}"}], ",", 
     SubscriptBox["qd", "1"]}], "]"}]}]}]], "Input"],

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
      SubscriptBox["B", "pair"], "-", 
      RowBox[{"MPOMergeTensors", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["B", "0"], ".", 
         RowBox[{"DiagonalMatrix", "[", 
          SubscriptBox["\[Sigma]", 
           RowBox[{"B", ",", "val"}]], "]"}]}], ",", 
        SubscriptBox["B", "1"]}], "]"}]}], "]"}], ",", "\[Infinity]"}], 
   "]"}]}]], "Input"],

Cell[BoxData["6.072067428425779`*^-15"], "Output"]
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
     SubscriptBox["qC", "0"], "=", 
     RowBox[{"{", 
      RowBox[{"1", ",", "2", ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "3"}], ",", "0"}], "}"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["qC", "1"], "=", 
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
     SubscriptBox["qC", "2"], "=", 
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
       SubscriptBox["cC", "0"], ",", 
       SubscriptBox["qcC", "0"], ",", 
       SubscriptBox["qcC", "1"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["cC", "1"], ",", 
       SubscriptBox["qcC", 
        RowBox[{"1", ",", "alt"}]], ",", 
       SubscriptBox["qcC", "2"]}], "}"}], ",", 
     SubscriptBox["\[Sigma]", 
      RowBox[{"C", ",", "val"}]]}], "}"}], "=", 
   RowBox[{"MPOCompressTensors", "[", 
    RowBox[{
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
  SubscriptBox["cC", "0"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["cC", "1"], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "5", ",", "12"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "5", ",", "12", ",", "7"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"consistency", " ", "check"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    SubscriptBox["qcC", "1"], "-", 
    SubscriptBox["qcC", 
     RowBox[{"1", ",", "alt"}]]}], "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  SubscriptBox["\[Sigma]", 
   RowBox[{"C", ",", "val"}]]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "2.349236386408253`", ",", "4.756782906426508`", ",", "10.088597257987622`",
    ",", "8.33354112197053`", ",", "4.698085010718789`", ",", 
   "7.882556927835047`", ",", "10.805500112558825`", ",", 
   "8.177908455108158`", ",", "4.870331027612785`", ",", "5.071679712752171`",
    ",", "4.024141348772294`", ",", "2.1823438195788496`"}], "}"}]], "Output"]
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
       SubscriptBox["cC", "0"], ",", 
       SubscriptBox["qcC", "0"], ",", 
       SubscriptBox["qcC", "1"]}], "}"}], ",", 
     SubscriptBox["qd", "0"]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"MPOBlockStructureError", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["cC", "1"], ",", 
       SubscriptBox["qcC", "1"], ",", 
       SubscriptBox["qcC", "2"]}], "}"}], ",", 
     SubscriptBox["qd", "1"]}], "]"}]}]}]], "Input"],

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
        SubscriptBox["C", "0"], ",", 
        SubscriptBox["C", "1"]}], "]"}], "-", 
      RowBox[{"MPOMergeTensors", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["cC", "0"], ".", 
         RowBox[{"DiagonalMatrix", "[", 
          SubscriptBox["\[Sigma]", 
           RowBox[{"C", ",", "val"}]], "]"}]}], ",", 
        SubscriptBox["cC", "1"]}], "]"}]}], "]"}], ",", "\[Infinity]"}], 
   "]"}]}]], "Input"],

Cell[BoxData["1.6930901125533637`*^-15"], "Output"]
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
     SubscriptBox["qD", "0"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "1"}], ",", "0", ",", "4", ",", 
       RowBox[{"-", "2"}], ",", "2", ",", "1"}], "}"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["qD", "1"], "=", 
     RowBox[{"{", 
      RowBox[{"4", ",", "1", ",", "4", ",", 
       RowBox[{"-", "3"}], ",", 
       RowBox[{"-", "5"}], ",", "0", ",", 
       RowBox[{"-", "2"}], ",", "4", ",", 
       RowBox[{"-", "4"}], ",", "2"}], "}"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["qD", "2"], "=", 
     RowBox[{"{", 
      RowBox[{"2", ",", "1", ",", "3", ",", 
       RowBox[{"-", "3"}], ",", "0", ",", 
       RowBox[{"-", "2"}]}], "}"}]}], ";"}]}]}]], "Input"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "45", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["D", "0"], "=", 
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
     SubscriptBox["qD", "0"], ",", 
     SubscriptBox["qD", "1"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["D", "1"], "=", 
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
     SubscriptBox["qD", "1"], ",", 
     SubscriptBox["qD", "2"]}], "]"}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Dimensions", "[", 
  SubscriptBox["D", "0"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["D", "1"], "]"}]}], "Input"],

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
       SubscriptBox["D", "0"], ",", 
       SubscriptBox["qD", "0"], ",", 
       SubscriptBox["qD", "1"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["D", "1"], ",", 
       SubscriptBox["qD", "1"], ",", 
       SubscriptBox["qD", "2"]}], "}"}], ",", 
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
  RowBox[{"4", ",", "4", ",", "30", ",", "102"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "5", ",", "102", ",", "42"}], "}"}]], "Output"]
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
  "0.23451696014869725`", ",", "0.6491749263403473`", ",", 
   "0.8094400094789076`", ",", "32.20308763933812`"}], "}"}]], "Output"]
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
       SubscriptBox["P", "0"], ",", 
       SubscriptBox["qP", "0"], ",", 
       SubscriptBox["qP", "1"]}], "}"}], ",", 
     SubscriptBox["qd", "0"]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"MPOBlockStructureError", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["P", "1"], ",", 
       SubscriptBox["qP", "1"], ",", 
       SubscriptBox["qP", "2"]}], "}"}], ",", 
     SubscriptBox["qd", "1"]}], "]"}]}]}]], "Input"],

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
           SubscriptBox["C", "0"], ",", 
           SubscriptBox["C", "1"]}], "]"}], ",", 
         SubscriptBox["qC", "0"], ",", 
         SubscriptBox["qC", "2"]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"MPOMergeTensors", "[", 
          RowBox[{
           SubscriptBox["D", "0"], ",", 
           SubscriptBox["D", "1"]}], "]"}], ",", 
         SubscriptBox["qD", "0"], ",", 
         SubscriptBox["qD", "2"]}], "}"}]}], "]"}]}], ";"}], 
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
    SubscriptBox["C", "0"], ",", 
    SubscriptBox["C", "1"]}], "]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"20", ",", "20", ",", "5", ",", "7"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{"MPOMergeTensors", "[", 
   RowBox[{
    SubscriptBox["D", "0"], ",", 
    SubscriptBox["D", "1"]}], "]"}], "]"}]], "Input"],

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

Cell[BoxData["3.167663967383141`*^-14"], "Output"]
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
Cell[9910, 330, 39, 0, 43, "Subsection"],
Cell[9952, 332, 233, 7, 52, "Input"],
Cell[10188, 341, 363, 12, 72, "Input"],
Cell[10554, 355, 2607, 73, 92, "Input"],
Cell[CellGroupData[{
Cell[13186, 432, 112, 3, 31, "Input"],
Cell[13301, 437, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13421, 444, 112, 3, 31, "Input"],
Cell[13536, 449, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13656, 456, 373, 10, 52, "Input"],
Cell[14032, 468, 93, 2, 31, "Output"],
Cell[14128, 472, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14258, 479, 153, 4, 31, "Input"],
Cell[14414, 485, 78, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14529, 492, 907, 27, 92, "Input"],
Cell[15439, 521, 144, 3, 31, "Output"],
Cell[15586, 526, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15673, 531, 588, 16, 92, "Input"],
Cell[16264, 549, 45, 0, 31, "Output"],
Cell[16312, 551, 50, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[16411, 557, 36, 0, 43, "Subsection"],
Cell[16450, 559, 566, 18, 72, "Input"],
Cell[CellGroupData[{
Cell[17041, 581, 543, 16, 75, "Input"],
Cell[17587, 599, 351, 8, 31, "Output"],
Cell[17941, 609, 29, 0, 31, "Output"]
}, Open  ]],
Cell[17985, 612, 912, 26, 72, "Input"],
Cell[CellGroupData[{
Cell[18922, 642, 978, 29, 75, "Input"],
Cell[19903, 673, 97, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20037, 680, 580, 17, 54, "Input"],
Cell[20620, 699, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20687, 704, 1022, 33, 74, "Input"],
Cell[21712, 739, 96, 2, 31, "Output"],
Cell[21811, 743, 96, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[21944, 750, 273, 8, 54, "Input"],
Cell[22220, 760, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[22285, 765, 322, 8, 52, "Input"],
Cell[22610, 775, 171, 4, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[22818, 784, 847, 25, 72, "Input"],
Cell[23668, 811, 30, 0, 31, "Output"],
Cell[23701, 813, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[23768, 818, 681, 20, 52, "Input"],
Cell[24452, 840, 50, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[24551, 846, 44, 0, 43, "Subsection"],
Cell[24598, 848, 1132, 34, 92, "Input"],
Cell[25733, 884, 1630, 50, 72, "Input"],
Cell[CellGroupData[{
Cell[27388, 938, 173, 4, 52, "Input"],
Cell[27564, 944, 94, 2, 31, "Output"],
Cell[27661, 948, 94, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[27792, 955, 1187, 38, 74, "Input"],
Cell[28982, 995, 94, 2, 31, "Output"],
Cell[29079, 999, 94, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[29210, 1006, 275, 8, 54, "Input"],
Cell[29488, 1016, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[29553, 1021, 163, 4, 52, "Input"],
Cell[29719, 1027, 398, 7, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[30154, 1039, 853, 25, 72, "Input"],
Cell[31010, 1066, 30, 0, 31, "Output"],
Cell[31043, 1068, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[31110, 1073, 784, 23, 52, "Input"],
Cell[31897, 1098, 51, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[31997, 1104, 46, 0, 43, "Subsection"],
Cell[32046, 1106, 981, 30, 92, "Input"],
Cell[33030, 1138, 1630, 50, 72, "Input"],
Cell[CellGroupData[{
Cell[34685, 1192, 173, 4, 52, "Input"],
Cell[34861, 1198, 94, 2, 31, "Output"],
Cell[34958, 1202, 94, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[35089, 1209, 1491, 48, 74, "Input"],
Cell[36583, 1259, 96, 2, 31, "Output"],
Cell[36682, 1263, 96, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[36815, 1270, 273, 8, 54, "Input"],
Cell[37091, 1280, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[37156, 1285, 356, 9, 52, "Input"],
Cell[37515, 1296, 172, 4, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[37724, 1305, 847, 25, 72, "Input"],
Cell[38574, 1332, 30, 0, 31, "Output"],
Cell[38607, 1334, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[38674, 1339, 131, 3, 52, "Input"],
Cell[38808, 1344, 566, 14, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[39411, 1363, 1128, 35, 75, "Input"],
Cell[40542, 1400, 206, 6, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[40785, 1411, 177, 5, 31, "Input"],
Cell[40965, 1418, 95, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[41097, 1425, 177, 5, 31, "Input"],
Cell[41277, 1432, 95, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[41409, 1439, 697, 21, 52, "Input"],
Cell[42109, 1462, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[42196, 1467, 506, 16, 76, "Input"],
Cell[42705, 1485, 28, 0, 31, "Output"],
Cell[42736, 1487, 28, 0, 31, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 9uDT4XZJ5rvg2DwiU7PrVx0m *)
