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
NotebookDataLength[     25022,        882]
NotebookOptionsPosition[     22845,        784]
NotebookOutlinePosition[     23188,        799]
CellTagsIndexPosition[     23145,        796]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Matrix Product States (MPS)", "Section"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";"}]], "Input"],

Cell[BoxData[
 RowBox[{"<<", "tn_base.m"}]], "Input"],

Cell[CellGroupData[{

Cell["Merge two MPS tensors", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"fictitious", " ", "physical", " ", "dimensions"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["d", "0"], "=", "3"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["d", "1"], "=", "4"}], ";"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"bond", " ", "dimensions"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["D", "0"], "=", "6"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["D", "1"], "=", "7"}], ";"}], 
   RowBox[{"(*", " ", 
    RowBox[{"shared", " ", "bond"}], " ", "*)"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["D", "2"], "=", "8"}], ";"}]}]}]], "Input"],

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
        SubscriptBox["D", "1"]}], ",", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", 
        SubscriptBox["D", "1"]}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["d", "0"], ",", 
       SubscriptBox["D", "0"], ",", 
       SubscriptBox["D", "1"]}], "}"}]}], "]"}]}], 
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
        SubscriptBox["D", "1"]}], ",", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", 
        SubscriptBox["D", "1"]}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["d", "1"], ",", 
       SubscriptBox["D", "1"], ",", 
       SubscriptBox["D", "2"]}], "}"}]}], "]"}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["A", "0"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"3", ",", "6", ",", "7"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  SubscriptBox["A", "1"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "7", ",", "8"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Dimensions", "[", 
   RowBox[{"MPSMergeTensors", "[", 
    RowBox[{
     SubscriptBox["A", "0"], ",", 
     SubscriptBox["A", "1"]}], "]"}], "]"}], "-", 
  RowBox[{"{", 
   RowBox[{
    RowBox[{
     SubscriptBox["d", "0"], 
     SubscriptBox["d", "1"]}], ",", 
    SubscriptBox["D", "0"], ",", 
    SubscriptBox["D", "2"]}], "}"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "0", ",", "0"}], "}"}]], "Output"]
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
               RowBox[{"i", "-", "1"}], ")"}], "/", 
              SubscriptBox["d", "1"]}], "]"}], "+", "1"}], ",", 
           SubscriptBox["j", "0"], ",", 
           SubscriptBox["j", "1"]}], "\[RightDoubleBracket]"}], 
         RowBox[{
          SubscriptBox["A", "1"], "\[LeftDoubleBracket]", 
          RowBox[{
           RowBox[{
            RowBox[{"Mod", "[", 
             RowBox[{
              RowBox[{"i", "-", "1"}], ",", 
              SubscriptBox["d", "1"]}], "]"}], "+", "1"}], ",", 
           SubscriptBox["j", "1"], ",", 
           SubscriptBox["j", "2"]}], "\[RightDoubleBracket]"}]}], ",", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["j", "1"], ",", 
          SubscriptBox["D", "1"]}], "}"}]}], "]"}], ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", 
        RowBox[{
         SubscriptBox["d", "0"], 
         SubscriptBox["d", "1"]}]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        SubscriptBox["j", "0"], ",", 
        SubscriptBox["D", "0"]}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{
        SubscriptBox["j", "2"], ",", 
        SubscriptBox["D", "2"]}], "}"}]}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{"Flatten", "[", 
     RowBox[{"%", "-", 
      RowBox[{"MPSMergeTensors", "[", 
       RowBox[{
        SubscriptBox["A", "0"], ",", 
        SubscriptBox["A", "1"]}], "]"}]}], "]"}], "]"}]}]}]], "Input"],

Cell[BoxData["0.`"], "Output"]
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
         RowBox[{"#1", "+", "#2", "-", "#3"}], "\[Equal]", "0"}], ",", 
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
     SubscriptBox["qB", "0"], ",", 
     SubscriptBox["qB", "2"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"20", ",", "13", ",", "11"}], "}"}]], "Output"]
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
  RowBox[{"MPSBlockStructureError", "[", 
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
   RowBox[{"MPSSplitTensor", "[", 
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
  RowBox[{"4", ",", "13", ",", "37"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "37", ",", "11"}], "}"}]], "Output"]
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
  SubscriptBox["\[Sigma]", 
   RowBox[{"B", ",", "val"}]]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.5878642453586812`", ",", "1.9021010655752453`", ",", 
   "1.4373038044655113`", ",", "1.2078681076135003`", ",", 
   "2.741958939821841`", ",", "2.1564163041241478`", ",", 
   "1.5567952103624374`", ",", "3.1198389460188425`", ",", 
   "2.592384701749311`", ",", "1.7596167925197976`", ",", 
   "1.1423825032847221`", ",", "3.296995290026966`", ",", 
   "1.7303914882347762`", ",", "1.0031137240292436`", ",", 
   "0.6890183514519643`", ",", "0.31048976717373766`", ",", 
   "2.1985898580896137`", ",", "0.8786222539261143`", ",", 
   "3.350799337421941`", ",", "2.520877232308065`", ",", "2.026521882218307`",
    ",", "1.4861143654783415`", ",", "1.0751439961970284`", ",", 
   "0.4642283010679714`", ",", "2.6898930564336645`", ",", 
   "2.1098913136571134`", ",", "1.2962001007936732`", ",", 
   "1.5590700888188265`", ",", "2.8245244967087397`", ",", 
   "2.0676915194696184`", ",", "1.7052068183362337`", ",", 
   "0.9151690909153529`", ",", "1.4742903498993045`", ",", 
   "1.0162295141753512`", ",", "1.4114003703001672`", ",", 
   "0.5783212974481948`", ",", "1.822102392427058`"}], "}"}]], "Output"]
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
   RowBox[{"MPSBlockStructureError", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["B", "0"], ",", 
       SubscriptBox["qB", "0"], ",", 
       SubscriptBox["qB", "1"]}], "}"}], ",", 
     SubscriptBox["qd", "0"]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"MPSBlockStructureError", "[", 
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
      RowBox[{"MPSMergeTensors", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["B", "0"], ".", 
         RowBox[{"DiagonalMatrix", "[", 
          SubscriptBox["\[Sigma]", 
           RowBox[{"B", ",", "val"}]], "]"}]}], ",", 
        SubscriptBox["B", "1"]}], "]"}]}], "]"}], ",", "\[Infinity]"}], 
   "]"}]}]], "Input"],

Cell[BoxData["2.3525204118543076`*^-15"], "Output"]
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
         RowBox[{"#1", "+", "#2", "-", "#3"}], "\[Equal]", "0"}], ",", 
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
         RowBox[{"#1", "+", "#2", "-", "#3"}], "\[Equal]", "0"}], ",", 
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
  RowBox[{"4", ",", "5", ",", "14"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "14", ",", "7"}], "}"}]], "Output"]
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
   RowBox[{"MPSCompressTensors", "[", 
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
  RowBox[{"4", ",", "5", ",", "8"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "8", ",", "7"}], "}"}]], "Output"]
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
  "1.0709553035489585`", ",", "5.1940210384894`", ",", "2.180727966622371`", 
   ",", "0.3557917808794906`", ",", "1.540221397864557`", ",", 
   "1.6460256935307855`", ",", "0.49320961341200287`", ",", 
   "1.6548445096603575`"}], "}"}]], "Output"]
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
   RowBox[{"MPSBlockStructureError", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["cC", "0"], ",", 
       SubscriptBox["qcC", "0"], ",", 
       SubscriptBox["qcC", "1"]}], "}"}], ",", 
     SubscriptBox["qd", "0"]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"MPSBlockStructureError", "[", 
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
      RowBox[{"MPSMergeTensors", "[", 
       RowBox[{
        SubscriptBox["C", "0"], ",", 
        SubscriptBox["C", "1"]}], "]"}], "-", 
      RowBox[{"MPSMergeTensors", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["cC", "0"], ".", 
         RowBox[{"DiagonalMatrix", "[", 
          SubscriptBox["\[Sigma]", 
           RowBox[{"C", ",", "val"}]], "]"}]}], ",", 
        SubscriptBox["cC", "1"]}], "]"}]}], "]"}], ",", "\[Infinity]"}], 
   "]"}]}]], "Input"],

Cell[BoxData["1.432843787967409`*^-15"], "Output"]
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
Cell[1486, 35, 46, 0, 63, "Section"],
Cell[1535, 37, 123, 3, 31, "Input"],
Cell[1661, 42, 53, 1, 31, "Input"],
Cell[CellGroupData[{
Cell[1739, 47, 43, 0, 43, "Subsection"],
Cell[1785, 49, 343, 11, 72, "Input"],
Cell[2131, 62, 488, 15, 92, "Input"],
Cell[2622, 79, 1337, 44, 72, "Input"],
Cell[CellGroupData[{
Cell[3984, 127, 85, 2, 31, "Input"],
Cell[4072, 131, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4192, 138, 85, 2, 31, "Input"],
Cell[4280, 142, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4400, 149, 379, 13, 31, "Input"],
Cell[4782, 164, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4902, 171, 1840, 55, 72, "Input"],
Cell[6745, 228, 30, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[6824, 234, 36, 0, 43, "Subsection"],
Cell[6863, 236, 566, 18, 72, "Input"],
Cell[CellGroupData[{
Cell[7454, 258, 543, 16, 75, "Input"],
Cell[8000, 276, 351, 8, 31, "Output"],
Cell[8354, 286, 29, 0, 31, "Output"]
}, Open  ]],
Cell[8398, 289, 912, 26, 72, "Input"],
Cell[CellGroupData[{
Cell[9335, 319, 895, 26, 75, "Input"],
Cell[10233, 347, 86, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[10356, 354, 580, 17, 54, "Input"],
Cell[10939, 373, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[11006, 378, 1022, 33, 74, "Input"],
Cell[12031, 413, 85, 2, 31, "Output"],
Cell[12119, 417, 85, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12241, 424, 273, 8, 54, "Input"],
Cell[12517, 434, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12582, 439, 163, 4, 52, "Input"],
Cell[12748, 445, 1154, 20, 52, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13939, 470, 847, 25, 72, "Input"],
Cell[14789, 497, 30, 0, 31, "Output"],
Cell[14822, 499, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14889, 504, 681, 20, 52, "Input"],
Cell[15573, 526, 51, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[15673, 532, 44, 0, 43, "Subsection"],
Cell[15720, 534, 1132, 34, 92, "Input"],
Cell[16855, 570, 1518, 46, 72, "Input"],
Cell[CellGroupData[{
Cell[18398, 620, 173, 4, 52, "Input"],
Cell[18574, 626, 84, 2, 31, "Output"],
Cell[18661, 630, 84, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[18782, 637, 1187, 38, 74, "Input"],
Cell[19972, 677, 83, 2, 31, "Output"],
Cell[20058, 681, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20178, 688, 275, 8, 54, "Input"],
Cell[20456, 698, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20521, 703, 163, 4, 52, "Input"],
Cell[20687, 709, 288, 6, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[21012, 720, 853, 25, 72, "Input"],
Cell[21868, 747, 30, 0, 31, "Output"],
Cell[21901, 749, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[21968, 754, 784, 23, 52, "Input"],
Cell[22755, 779, 50, 0, 31, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature hxDbFEhQ25dbYAKPV#U8fZ7j *)
