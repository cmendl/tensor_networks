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
NotebookDataLength[     63190,       2149]
NotebookOptionsPosition[     57504,       1934]
NotebookOutlinePosition[     57853,       1949]
CellTagsIndexPosition[     57810,       1946]
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

Cell[BoxData["4.3155705288404647`*^-16"], "Output"]
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
    RowBox[{"{", 
     RowBox[{
      SubscriptBox["qd", 
       RowBox[{"0", ",", "1"}]], ",", 
      SubscriptBox["qd", 
       RowBox[{"0", ",", "1"}]]}], "}"}]}], "]"}]}]], "Input"],

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
  "1.0161942167676605`", ",", "1.1210294261494167`", ",", 
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
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["qd", "0"], ",", 
       SubscriptBox["qd", "0"]}], "}"}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"MPOBlockStructureError", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["B", "1"], ",", 
       SubscriptBox["qB", "1"], ",", 
       SubscriptBox["qB", "2"]}], "}"}], ",", 
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

Cell[BoxData["6.797396568525725`*^-15"], "Output"]
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
    ",", "8.333541121970534`", ",", "4.69808501071879`", ",", 
   "7.882556927835049`", ",", "10.805500112558821`", ",", 
   "8.177908455108156`", ",", "4.870331027612784`", ",", 
   "5.0716797127521716`", ",", "4.024141348772295`", ",", 
   "2.1823438195788496`"}], "}"}]], "Output"]
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
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["qd", "0"], ",", 
       SubscriptBox["qd", "0"]}], "}"}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"MPOBlockStructureError", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["cC", "1"], ",", 
       SubscriptBox["qcC", "1"], ",", 
       SubscriptBox["qcC", "2"]}], "}"}], ",", 
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

Cell[BoxData["2.5176617391872307`*^-15"], "Output"]
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
  "0.23451696014869727`", ",", "0.6491749263403481`", ",", 
   "0.8094400094789078`", ",", "32.203087639338115`"}], "}"}]], "Output"]
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
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["qd", "0"], ",", 
       SubscriptBox["qd", "0"]}], "}"}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"MPOBlockStructureError", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["P", "1"], ",", 
       SubscriptBox["qP", "1"], ",", 
       SubscriptBox["qP", "2"]}], "}"}], ",", 
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
        RowBox[{"0", ",", "ref"}]], ",", 
       SubscriptBox["qP", 
        RowBox[{"0", ",", "ref"}]], ",", 
       SubscriptBox["qP", 
        RowBox[{"1", ",", "ref"}]]}], "}"}], "=", 
     RowBox[{"MPOComposition", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         SubscriptBox["C", "0"], ",", 
         SubscriptBox["qC", "0"], ",", 
         SubscriptBox["qC", "1"]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         SubscriptBox["D", "0"], ",", 
         SubscriptBox["qD", "0"], ",", 
         SubscriptBox["qD", "1"]}], "}"}]}], "]"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["P", 
        RowBox[{"1", ",", "ref"}]], ",", 
       SubscriptBox["qP", 
        RowBox[{"1", ",", "ref", ",", "alt"}]], ",", 
       SubscriptBox["qP", 
        RowBox[{"2", ",", "ref"}]]}], "}"}], "=", 
     RowBox[{"MPOComposition", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         SubscriptBox["C", "1"], ",", 
         SubscriptBox["qC", "1"], ",", 
         SubscriptBox["qC", "2"]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         SubscriptBox["D", "1"], ",", 
         SubscriptBox["qD", "1"], ",", 
         SubscriptBox["qD", "2"]}], "}"}]}], "]"}]}], ";"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"consistency", " ", "check"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    SubscriptBox["qP", 
     RowBox[{"1", ",", "ref"}]], "-", 
    SubscriptBox["qP", 
     RowBox[{"1", ",", "ref", ",", "alt"}]]}], "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
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
      RowBox[{"MPOMergeTensors", "[", 
       RowBox[{
        SubscriptBox["P", 
         RowBox[{"0", ",", "ref"}]], ",", 
        SubscriptBox["P", 
         RowBox[{"1", ",", "ref"}]]}], "]"}]}], "]"}], ",", "\[Infinity]"}], 
   "]"}]}]], "Input"],

Cell[BoxData["3.0391987757305496`*^-14"], "Output"]
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

Cell["Construct MPO representations of sums of operator chains", "Subsection"],

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
   RowBox[{"fictitious", " ", "operator", " ", "chains"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"SeedRandom", "[", "46", "]"}], ";"}], "\[IndentingNewLine]", 
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
      RowBox[{"1", ",", "4", ",", "4"}], "}"}], ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", 
     RowBox[{"{", 
      RowBox[{"6", ",", "4", ",", "4"}], "}"}], ",", "5"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "4", ",", "4"}], "}"}], ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "4", ",", "4"}], "}"}], ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", 
     RowBox[{"{", 
      RowBox[{"3", ",", "4", ",", "4"}], "}"}], ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", 
     RowBox[{"{", 
      RowBox[{"5", ",", "4", ",", "4"}], "}"}], ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", 
     RowBox[{"{", 
      RowBox[{"5", ",", "4", ",", "4"}], "}"}], ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"6", ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "4", ",", "4"}], "}"}], ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"6", ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "4", ",", "4"}], "}"}], ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"6", ",", 
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
    RowBox[{"4", ",", "4", ",", "1", ",", "3"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "3", ",", "5"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "5", ",", "5"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "5", ",", "6"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "6", ",", "6"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "4", ",", "6", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

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

Cell[BoxData["0.`"], "Output"]
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
  RowBox[{"0.`", ",", "0.`", ",", "0.`", ",", "0.`", ",", "0.`", ",", "0.`"}],
   "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "consistency", " ", "checks", " ", "for", " ", "several", " ", "random", 
    " ", "operator", " ", "chains"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"SeedRandom", "[", "47", "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Max", "[", 
    RowBox[{"Table", "[", 
     RowBox[{
      RowBox[{"Block", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"d", "=", 
           RowBox[{"RandomInteger", "[", 
            RowBox[{"{", 
             RowBox[{"1", ",", "4"}], "}"}], "]"}]}], ",", "qd", ",", 
          RowBox[{"L", "=", 
           RowBox[{"RandomInteger", "[", 
            RowBox[{"{", 
             RowBox[{"1", ",", "6"}], "}"}], "]"}]}], ",", 
          RowBox[{"nops", "=", 
           RowBox[{"RandomInteger", "[", 
            RowBox[{"{", 
             RowBox[{"1", ",", "11"}], "}"}], "]"}]}], ",", "i", ",", "len", 
          ",", "qD", ",", "opchains", ",", "W"}], "}"}], ",", 
        RowBox[{
         RowBox[{"qd", "=", 
          RowBox[{"RandomInteger", "[", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{
              RowBox[{"-", "2"}], ",", "2"}], "}"}], ",", "d"}], "]"}]}], ";", 
         RowBox[{"opchains", "=", 
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
              "}"}]}], ",", "nops"}], "]"}]}], ";", 
         RowBox[{"W", "=", 
          RowBox[{"MPOFromOpChains", "[", 
           RowBox[{"d", ",", "L", ",", "opchains"}], "]"}]}], ";", 
         RowBox[{
          RowBox[{"Norm", "[", 
           RowBox[{
            RowBox[{"MPOMergeFull", "[", 
             RowBox[{"First", "/@", "W"}], "]"}], "-", 
            RowBox[{"HamiltonianFromOpchains", "[", 
             RowBox[{"d", ",", "L", ",", "opchains"}], "]"}]}], "]"}], "+", 
          RowBox[{"Total", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"MPOBlockStructureError", "[", 
              RowBox[{"#", ",", 
               RowBox[{"{", 
                RowBox[{"qd", ",", "qd"}], "}"}]}], "]"}], "&"}], "/@", "W"}],
            "]"}]}]}]}], "]"}], ",", "100"}], "]"}], "]"}]}]}]], "Input"],

Cell[BoxData["9.930136612989092`*^-16"], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1654, 920},
WindowMargins->{{Automatic, 135}, {65, Automatic}},
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
Cell[1664, 42, 53, 1, 30, "Input"],
Cell[CellGroupData[{
Cell[1742, 47, 43, 0, 43, "Subsection"],
Cell[1788, 49, 645, 21, 118, "Input"],
Cell[2436, 72, 488, 15, 88, "Input"],
Cell[2927, 89, 1527, 50, 74, "Input"],
Cell[CellGroupData[{
Cell[4479, 143, 85, 2, 30, "Input"],
Cell[4567, 147, 93, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4697, 154, 85, 2, 30, "Input"],
Cell[4785, 158, 93, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4915, 165, 1229, 34, 69, "Input"],
Cell[6147, 201, 30, 0, 30, "Output"],
Cell[6180, 203, 30, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6247, 208, 567, 20, 33, "Input"],
Cell[6817, 230, 93, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6947, 237, 2861, 85, 74, "Input"],
Cell[9811, 324, 51, 0, 30, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[9911, 330, 39, 0, 43, "Subsection"],
Cell[9953, 332, 233, 7, 50, "Input"],
Cell[10189, 341, 363, 12, 69, "Input"],
Cell[10555, 355, 2607, 73, 90, "Input"],
Cell[CellGroupData[{
Cell[13187, 432, 112, 3, 33, "Input"],
Cell[13302, 437, 83, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13422, 444, 112, 3, 33, "Input"],
Cell[13537, 449, 83, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13657, 456, 373, 10, 55, "Input"],
Cell[14033, 468, 93, 2, 30, "Output"],
Cell[14129, 472, 93, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14259, 479, 153, 4, 33, "Input"],
Cell[14415, 485, 78, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14530, 492, 907, 27, 92, "Input"],
Cell[15440, 521, 144, 3, 30, "Output"],
Cell[15587, 526, 50, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15674, 531, 588, 16, 92, "Input"],
Cell[16265, 549, 45, 0, 30, "Output"],
Cell[16313, 551, 50, 0, 30, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[16412, 557, 36, 0, 43, "Subsection"],
Cell[16451, 559, 566, 18, 71, "Input"],
Cell[CellGroupData[{
Cell[17042, 581, 543, 16, 74, "Input"],
Cell[17588, 599, 351, 8, 30, "Output"],
Cell[17942, 609, 29, 0, 30, "Output"]
}, Open  ]],
Cell[17986, 612, 912, 26, 71, "Input"],
Cell[CellGroupData[{
Cell[18923, 642, 978, 29, 74, "Input"],
Cell[19904, 673, 97, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20038, 680, 690, 21, 54, "Input"],
Cell[20731, 703, 30, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20798, 708, 1022, 33, 73, "Input"],
Cell[21823, 743, 96, 2, 30, "Output"],
Cell[21922, 747, 96, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[22055, 754, 273, 8, 54, "Input"],
Cell[22331, 764, 28, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[22396, 769, 322, 8, 52, "Input"],
Cell[22721, 779, 171, 4, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[22929, 788, 1013, 31, 71, "Input"],
Cell[23945, 821, 30, 0, 30, "Output"],
Cell[23978, 823, 30, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[24045, 828, 681, 20, 52, "Input"],
Cell[24729, 850, 50, 0, 30, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[24828, 856, 44, 0, 43, "Subsection"],
Cell[24875, 858, 1132, 34, 91, "Input"],
Cell[26010, 894, 1630, 50, 71, "Input"],
Cell[CellGroupData[{
Cell[27665, 948, 173, 4, 50, "Input"],
Cell[27841, 954, 94, 2, 30, "Output"],
Cell[27938, 958, 94, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[28069, 965, 1187, 38, 73, "Input"],
Cell[29259, 1005, 94, 2, 30, "Output"],
Cell[29356, 1009, 94, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[29487, 1016, 275, 8, 54, "Input"],
Cell[29765, 1026, 28, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[29830, 1031, 163, 4, 52, "Input"],
Cell[29996, 1037, 403, 8, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[30436, 1050, 1019, 31, 71, "Input"],
Cell[31458, 1083, 30, 0, 30, "Output"],
Cell[31491, 1085, 30, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[31558, 1090, 784, 23, 52, "Input"],
Cell[32345, 1115, 51, 0, 30, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[32445, 1121, 46, 0, 43, "Subsection"],
Cell[32494, 1123, 981, 30, 91, "Input"],
Cell[33478, 1155, 1630, 50, 71, "Input"],
Cell[CellGroupData[{
Cell[35133, 1209, 173, 4, 50, "Input"],
Cell[35309, 1215, 94, 2, 30, "Output"],
Cell[35406, 1219, 94, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[35537, 1226, 1491, 48, 73, "Input"],
Cell[37031, 1276, 96, 2, 30, "Output"],
Cell[37130, 1280, 96, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[37263, 1287, 273, 8, 54, "Input"],
Cell[37539, 1297, 28, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[37604, 1302, 356, 9, 52, "Input"],
Cell[37963, 1313, 173, 4, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[38173, 1322, 1013, 31, 71, "Input"],
Cell[39189, 1355, 30, 0, 30, "Output"],
Cell[39222, 1357, 30, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[39289, 1362, 131, 3, 51, "Input"],
Cell[39423, 1367, 566, 14, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[40026, 1386, 177, 5, 30, "Input"],
Cell[40206, 1393, 95, 2, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[40338, 1400, 177, 5, 30, "Input"],
Cell[40518, 1407, 95, 2, 30, "Output"]
}, Open  ]],
Cell[40628, 1412, 1536, 50, 77, "Input"],
Cell[CellGroupData[{
Cell[42189, 1466, 313, 9, 54, "Input"],
Cell[42505, 1477, 28, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[42570, 1482, 825, 25, 52, "Input"],
Cell[43398, 1509, 51, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[43486, 1514, 506, 16, 77, "Input"],
Cell[43995, 1532, 28, 0, 30, "Output"],
Cell[44026, 1534, 28, 0, 30, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[44103, 1540, 78, 0, 43, "Subsection"],
Cell[44184, 1542, 297, 9, 30, "Input"],
Cell[44484, 1553, 1029, 27, 55, "Input"],
Cell[CellGroupData[{
Cell[45538, 1584, 3344, 89, 146, "Input"],
Cell[48885, 1675, 1376, 43, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[50298, 1723, 626, 20, 70, "Input"],
Cell[50927, 1745, 527, 14, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[51491, 1764, 502, 14, 51, "Input"],
Cell[51996, 1780, 30, 0, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[52063, 1785, 736, 22, 50, "Input"],
Cell[52802, 1809, 128, 3, 30, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[52967, 1817, 4444, 110, 183, "Input"],
Cell[57414, 1929, 50, 0, 30, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* NotebookSignature nvDvEuWyGJL7tA1LEjd2w57w *)
