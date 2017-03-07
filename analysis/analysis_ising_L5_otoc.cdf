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
NotebookDataLength[    198578,       4337]
NotebookOptionsPosition[    195680,       4219]
NotebookOutlinePosition[    196023,       4234]
CellTagsIndexPosition[    195980,       4231]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Ising model simulation", "Section"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell["General definitions", "Subsection"],

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
   "construct", " ", "Ising", " ", "Hamiltonian", " ", "with", " ", 
    "longitudinal", " ", "field", " ", 
    RowBox[{"(", 
     RowBox[{"open", " ", "boundary", " ", "conditions"}], ")"}]}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"HIsing", "[", 
    RowBox[{"J_", ",", "h_", ",", "g_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"\[Sigma]", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"0", ",", "1"}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"1", ",", "0"}], "}"}]}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"0", ",", 
             RowBox[{"-", "\[ImaginaryI]"}]}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"\[ImaginaryI]", ",", "0"}], "}"}]}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"1", ",", "0"}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"0", ",", 
             RowBox[{"-", "1"}]}], "}"}]}], "}"}]}], "}"}]}], "}"}], ",", 
     RowBox[{
      RowBox[{"Sum", "[", 
       RowBox[{
        RowBox[{"J", " ", 
         RowBox[{"KroneckerProduct", "[", 
          RowBox[{
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox["2", 
             RowBox[{"l", "-", "1"}]], "]"}], ",", 
           RowBox[{
           "\[Sigma]", "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}],
            ",", 
           RowBox[{
           "\[Sigma]", "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}],
            ",", 
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox["2", 
             RowBox[{"L", "-", "l", "-", "1"}]], "]"}]}], "]"}]}], ",", 
        RowBox[{"{", 
         RowBox[{"l", ",", "1", ",", 
          RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], "+", 
      RowBox[{"Sum", "[", 
       RowBox[{
        RowBox[{"KroneckerProduct", "[", 
         RowBox[{
          RowBox[{"SparseIdentityMatrix", "[", 
           SuperscriptBox["2", 
            RowBox[{"l", "-", "1"}]], "]"}], ",", 
          RowBox[{
           RowBox[{"g", " ", 
            RowBox[{
            "\[Sigma]", "\[LeftDoubleBracket]", "1", 
             "\[RightDoubleBracket]"}]}], "+", 
           RowBox[{"h", " ", 
            RowBox[{
            "\[Sigma]", "\[LeftDoubleBracket]", "3", 
             "\[RightDoubleBracket]"}]}]}], ",", 
          RowBox[{"SparseIdentityMatrix", "[", 
           SuperscriptBox["2", 
            RowBox[{"L", "-", "l"}]], "]"}]}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"l", ",", "1", ",", "L"}], "}"}]}], "]"}]}]}], 
    "]"}]}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Simulation parameters", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"interaction", " ", "strength"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["J", "val"], "=", "1"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"magnetic", " ", "field", " ", "strength"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["h", "val"], "=", 
    FractionBox["1", "2"]}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"transverse", " ", "magnetic", " ", "field", " ", "strength"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["g", "val"], "=", 
    RowBox[{"-", "1"}]}], ";"}]}]], "Input"],

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
   RowBox[{"inverse", " ", "temperature"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["\[Beta]", "val"], "=", 
    RowBox[{"3", "/", "5"}]}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["t", "list"], "=", 
   RowBox[{"Range", "[", 
    RowBox[{"0", ",", "5", ",", 
     RowBox[{"1", "/", "8"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Length", "[", "%", "]"}]}], "Input"],

Cell[BoxData["41"], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Out-of-time-order correlations", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"Pauli", " ", "matrices"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["\[Sigma]", "1"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"0", ",", "1"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"1", ",", "0"}], "}"}]}], "}"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["\[Sigma]", "2"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"0", ",", 
         RowBox[{"-", "\[ImaginaryI]"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"\[ImaginaryI]", ",", "0"}], "}"}]}], "}"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["\[Sigma]", "3"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"1", ",", "0"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"0", ",", 
         RowBox[{"-", "1"}]}], "}"}]}], "}"}]}], ";"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "operator", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["op", "val"], "=", 
    SubscriptBox["\[Sigma]", "1"]}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"OperatorAverage", "[", 
   RowBox[{"A_", ",", "H_", ",", "\[Beta]_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"exp\[Beta]H", "=", 
      RowBox[{"MatrixExp", "[", 
       RowBox[{
        RowBox[{"-", "\[Beta]"}], " ", "H"}], "]"}]}], "}"}], ",", 
    FractionBox[
     RowBox[{"Tr", "[", 
      RowBox[{"exp\[Beta]H", ".", "A"}], "]"}], 
     RowBox[{"Tr", "[", "exp\[Beta]H", "]"}]]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"GF", "[", 
   RowBox[{"A_", ",", "B_", ",", "H_", ",", "\[Beta]_", ",", "t_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"exp\[Beta]H", "=", 
       RowBox[{"MatrixExp", "[", 
        RowBox[{
         RowBox[{"-", "\[Beta]"}], " ", "H"}], "]"}]}], ",", 
      RowBox[{"At", "=", 
       RowBox[{
        RowBox[{"MatrixExp", "[", 
         RowBox[{"\[ImaginaryI]", " ", "t", " ", "H"}], "]"}], ".", "A", ".", 
        RowBox[{"MatrixExp", "[", 
         RowBox[{
          RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", "H"}], "]"}]}]}]}], 
     "}"}], ",", 
    FractionBox[
     RowBox[{"Tr", "[", 
      RowBox[{"exp\[Beta]H", ".", "At", ".", "B"}], "]"}], 
     RowBox[{"Tr", "[", "exp\[Beta]H", "]"}]]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"OTOC", "[", 
   RowBox[{
   "A_", ",", "B_", ",", "C_", ",", "D_", ",", "H_", ",", "\[Beta]_", ",", 
    "t_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"exp\[Beta]H", "=", 
       RowBox[{"MatrixExp", "[", 
        RowBox[{
         RowBox[{"-", "\[Beta]"}], " ", "H"}], "]"}]}], ",", 
      RowBox[{"At", "=", 
       RowBox[{
        RowBox[{"MatrixExp", "[", 
         RowBox[{"\[ImaginaryI]", " ", "t", " ", "H"}], "]"}], ".", "A", ".", 
        RowBox[{"MatrixExp", "[", 
         RowBox[{
          RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", "H"}], "]"}]}]}], 
      ",", 
      RowBox[{"Ct", "=", 
       RowBox[{
        RowBox[{"MatrixExp", "[", 
         RowBox[{"\[ImaginaryI]", " ", "t", " ", "H"}], "]"}], ".", "C", ".", 
        RowBox[{"MatrixExp", "[", 
         RowBox[{
          RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", "H"}], "]"}]}]}]}], 
     "}"}], ",", 
    FractionBox[
     RowBox[{"Tr", "[", 
      RowBox[{"exp\[Beta]H", ".", "At", ".", "B", ".", "Ct", ".", "D"}], 
      "]"}], 
     RowBox[{"Tr", "[", "exp\[Beta]H", "]"}]]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SiteOperator", "[", 
   RowBox[{"A_", ",", "j_", ",", "L_"}], "]"}], ":=", 
  RowBox[{"KroneckerProduct", "[", 
   RowBox[{
    RowBox[{"SparseIdentityMatrix", "[", 
     SuperscriptBox["2", "j"], "]"}], ",", "A", ",", 
    RowBox[{"SparseIdentityMatrix", "[", 
     SuperscriptBox["2", 
      RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SiteOperatorChain", "[", 
   RowBox[{"A_", ",", "j0_", ",", "j1_", ",", "L_"}], "]"}], ":=", 
  RowBox[{"KroneckerProduct", "@@", 
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"If", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"j0", "\[LessEqual]", "j"}], "\[And]", 
        RowBox[{"j", "\[LessEqual]", "j1"}]}], ",", "A", ",", 
       RowBox[{"SparseIdentityMatrix", "[", "2", "]"}]}], "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"j", ",", "0", ",", 
       RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["fn", "import"], "=", 
   RowBox[{"\"\<../output/ising/L\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["L", "val"], "]"}], "<>", "\"\<_otoc/ising_L\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["L", "val"], "]"}]}]}], ";"}]], "Input"],

Cell[BoxData[
 RowBox[{"(*", " ", 
  RowBox[{
  "read", " ", "simulation", " ", "results", " ", "from", " ", "disk"}], " ", 
  "*)"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  SubscriptBox["magnetization", "list"], "=", 
  RowBox[{"Import", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["fn", "import"], "<>", "\"\<_magnetization.dat\>\""}], ",", 
    "\"\<Real64\>\""}], "]"}]}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "0.18465144873988082`"}], ",", 
   RowBox[{"-", "0.04283305946893713`"}], ",", 
   RowBox[{"-", "0.1333924071644726`"}], ",", 
   RowBox[{"-", "0.04283720932114231`"}], ",", 
   RowBox[{"-", "0.1846514252150299`"}]}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", "5", "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  SubscriptBox["energy", "val"], "=", 
  RowBox[{"First", "[", 
   RowBox[{"Import", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "import"], "<>", "\"\<_energy.dat\>\""}], ",", 
     "\"\<Real64\>\""}], "]"}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"-", "4.328373184016925`"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["otoc", "list"], "=", 
   RowBox[{"Import", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "import"], "<>", "\"\<_otoc.dat\>\""}], ",", 
     "\"\<Complex128\>\""}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", "41", "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["gf", "list"], "=", 
   RowBox[{"Import", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "import"], "<>", "\"\<_gf.dat\>\""}], ",", 
     "\"\<Complex128\>\""}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", "41", "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"(*", " ", 
  RowBox[{"reference", " ", "calculation"}], " ", "*)"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"J", "=", 
      SubscriptBox["J", "val"]}], ",", 
     RowBox[{"h", "=", 
      SubscriptBox["h", "val"]}], ",", 
     RowBox[{"g", "=", 
      SubscriptBox["g", "val"]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"\[Beta]", "=", 
      SubscriptBox["\[Beta]", "val"]}], ",", "HI"}], "}"}], ",", 
   RowBox[{
    RowBox[{"HI", "=", 
     RowBox[{"N", "[", 
      RowBox[{"HIsing", "[", 
       RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}]}], ";", 
    RowBox[{
     SubscriptBox["magnetization", 
      RowBox[{"list", ",", "ref"}]], "=", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"OperatorAverage", "[", 
        RowBox[{
         RowBox[{"SiteOperator", "[", 
          RowBox[{
           SubscriptBox["\[Sigma]", "3"], ",", "i", ",", "L"}], "]"}], ",", 
         "HI", ",", "\[Beta]"}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"i", ",", "0", ",", 
         RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}]}]}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "0.18465305882341285`"}], ",", 
   RowBox[{"-", "0.04283378686425651`"}], ",", 
   RowBox[{"-", "0.13339656490591337`"}], ",", 
   RowBox[{"-", "0.04283378686425662`"}], ",", 
   RowBox[{"-", "0.18465305882341276`"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"J", "=", 
      SubscriptBox["J", "val"]}], ",", 
     RowBox[{"h", "=", 
      SubscriptBox["h", "val"]}], ",", 
     RowBox[{"g", "=", 
      SubscriptBox["g", "val"]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"\[Beta]", "=", 
      SubscriptBox["\[Beta]", "val"]}], ",", "HI"}], "}"}], ",", 
   RowBox[{
    RowBox[{"HI", "=", 
     RowBox[{"N", "[", 
      RowBox[{"HIsing", "[", 
       RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}]}], ";", 
    RowBox[{
     SubscriptBox["energy", 
      RowBox[{"val", ",", "ref"}]], "=", 
     RowBox[{"OperatorAverage", "[", 
      RowBox[{"HI", ",", "HI", ",", "\[Beta]"}], "]"}]}]}]}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"-", "4.328363930467837`"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"operator", " ", "chain", " ", "ranges", " ", 
    RowBox[{"(", 
     RowBox[{"zero", "-", 
      RowBox[{"based", " ", "indices"}]}], ")"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["j", "0"], "=", "0"}], "\[IndentingNewLine]", 
   RowBox[{
    SubscriptBox["j", "1"], "=", 
    RowBox[{
     RowBox[{"Floor", "[", 
      FractionBox[
       SubscriptBox["L", "val"], "2"], "]"}], "-", "1", 
     RowBox[{"(*", 
      RowBox[{
       SubscriptBox["L", "val"], "-", "1"}], "*)"}]}]}]}]}]], "Input"],

Cell[BoxData["0"], "Output"],

Cell[BoxData["1"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"J", "=", 
       SubscriptBox["J", "val"]}], ",", 
      RowBox[{"h", "=", 
       SubscriptBox["h", "val"]}], ",", 
      RowBox[{"g", "=", 
       SubscriptBox["g", "val"]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", "HI", ",", "V"}], "}"}], ",", 
    RowBox[{
     RowBox[{"HI", "=", 
      RowBox[{"N", "[", 
       RowBox[{"HIsing", "[", 
        RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}]}], ";", 
     RowBox[{"V", "=", 
      RowBox[{"SiteOperatorChain", "[", 
       RowBox[{
        SubscriptBox["op", "val"], ",", 
        SubscriptBox["j", "0"], ",", 
        SubscriptBox["j", "1"], ",", "L"}], "]"}]}], ";", 
     RowBox[{
      SubscriptBox["otoc", 
       RowBox[{"list", ",", "ref"}]], "=", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"OTOC", "[", 
         RowBox[{
         "V", ",", "V", ",", "V", ",", "V", ",", "HI", ",", "\[Beta]", ",", 
          "t"}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"t", ",", 
          SubscriptBox["t", "list"]}], "}"}]}], "]"}]}]}]}], "]"}], 
  ";"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"J", "=", 
       SubscriptBox["J", "val"]}], ",", 
      RowBox[{"h", "=", 
       SubscriptBox["h", "val"]}], ",", 
      RowBox[{"g", "=", 
       SubscriptBox["g", "val"]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", "HI", ",", "V"}], "}"}], ",", 
    RowBox[{
     RowBox[{"HI", "=", 
      RowBox[{"N", "[", 
       RowBox[{"HIsing", "[", 
        RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}]}], ";", 
     RowBox[{"V", "=", 
      RowBox[{"SiteOperatorChain", "[", 
       RowBox[{
        SubscriptBox["op", "val"], ",", 
        SubscriptBox["j", "0"], ",", 
        SubscriptBox["j", "1"], ",", "L"}], "]"}]}], ";", 
     RowBox[{
      SubscriptBox["gf", 
       RowBox[{"list", ",", "ref"}]], "=", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"GF", "[", 
         RowBox[{"V", ",", "V", ",", "HI", ",", "\[Beta]", ",", "t"}], "]"}], 
        ",", 
        RowBox[{"{", 
         RowBox[{"t", ",", 
          SubscriptBox["t", "list"]}], "}"}]}], "]"}]}]}]}], "]"}], 
  ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Abs", "[", 
   RowBox[{
    SubscriptBox["magnetization", "list"], "-", 
    SubscriptBox["magnetization", 
     RowBox[{"list", ",", "ref"}]]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "1.6100835320276286`*^-6", ",", "7.27395319380375`*^-7", ",", 
   "4.1577414407745206`*^-6", ",", "3.422456885684988`*^-6", ",", 
   "1.6336083828727421`*^-6"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Abs", "[", 
   RowBox[{
    SubscriptBox["energy", "val"], "-", 
    SubscriptBox["energy", 
     RowBox[{"val", ",", "ref"}]]}], "]"}]}]], "Input"],

Cell[BoxData["9.253549087873125`*^-6"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["otoc", "list"], "-", 
     SubscriptBox["otoc", 
      RowBox[{"list", ",", "ref"}]]}], ",", "\[Infinity]"}], "]"}]}]], "Input"],

Cell[BoxData["0.00003117967606215172`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["gf", "list"], "-", 
     SubscriptBox["gf", 
      RowBox[{"list", ",", "ref"}]]}], ",", "\[Infinity]"}], "]"}]}]], "Input"],

Cell[BoxData["0.000018011461025804966`"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["plot", "label"], "=", 
   RowBox[{"\"\<Ising model with\\nJ=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["J", "val"], "]"}], "<>", "\"\<, h=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     RowBox[{"InputForm", "[", 
      SubscriptBox["h", "val"], "]"}], "]"}], "<>", "\"\<, g=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     RowBox[{"InputForm", "[", 
      SubscriptBox["g", "val"], "]"}], "]"}], "<>", "\"\<, L=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["L", "val"], "]"}], "<>", "\"\<, \[Beta]=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     RowBox[{"N", "[", 
      SubscriptBox["\[Beta]", "val"], "]"}], "]"}], "<>", 
    "\"\<\\noperator W=\!\(\*SubscriptBox[\(\[Sigma]\), \(x\)]\), \
V=\!\(\*SubscriptBox[\(\[Sigma]\), \(x\)]\) on left half lattice\>\""}]}], 
  ";"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["fn", "export"], "=", 
   RowBox[{
    RowBox[{
     RowBox[{
     "\"\<plots/\>\"", "<>", "#", "<>", "\"\</\>\"", "<>", "#", "<>", 
      "\"\<_\>\""}], "&"}], "[", 
    RowBox[{"FileBaseName", "[", 
     RowBox[{"NotebookFileName", "[", "]"}], "]"}], "]"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Show", "[", 
  RowBox[{
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["t", "list"], ",", 
          RowBox[{"Re", "[", 
           SubscriptBox["otoc", "list"], "]"}]}], "}"}], "]"}], ",", 
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["t", "list"], ",", 
          RowBox[{"Im", "[", 
           SubscriptBox["otoc", "list"], "]"}]}], "}"}], "]"}]}], "}"}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<t\>\"", ",", 
        "\"\<\[LeftAngleBracket]W(t) V(0) W(t) V(0)\!\(\*SubscriptBox[\(\
\[RightAngleBracket]\), \(\[Beta]\)]\)\>\""}], "}"}]}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", 
      RowBox[{
       SubscriptBox["plot", "label"], "<>", 
       "\"\<\\nred: independent reference calculation\>\""}]}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{
         RowBox[{"ColorData", "[", "97", "]"}], "[", "1", "]"}], ",", 
        RowBox[{
         RowBox[{"ColorData", "[", "97", "]"}], "[", "3", "]"}]}], "}"}]}], 
     ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<Re\>\"", ",", "\"\<Im\>\""}], "}"}]}], ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{
        RowBox[{"Interpolation", "[", 
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            SubscriptBox["t", "list"], ",", 
            RowBox[{"Re", "[", 
             SubscriptBox["otoc", 
              RowBox[{"list", ",", "ref"}]], "]"}]}], "}"}], "]"}], "]"}], 
        "[", "\[Tau]", "]"}], ",", 
       RowBox[{
        RowBox[{"Interpolation", "[", 
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            SubscriptBox["t", "list"], ",", 
            RowBox[{"Im", "[", 
             SubscriptBox["otoc", 
              RowBox[{"list", ",", "ref"}]], "]"}]}], "}"}], "]"}], "]"}], 
        "[", "\[Tau]", "]"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"\[Tau]", ",", "0", ",", "5"}], "}"}], ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{
       RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}]}]}], "]"}]}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Export", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["fn", "export"], "<>", "\"\<otoc_L\>\"", "<>", 
     RowBox[{"ToString", "[", 
      SubscriptBox["L", "val"], "]"}], "<>", "\"\<.pdf\>\""}], ",", "%"}], 
   "]"}], ";"}]}], "Input"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{{}, {
       Hue[0.67, 0.6, 0.6], 
       Directive[
        PointSize[0.016666666666666666`], 
        AbsoluteThickness[1.6], 
        RGBColor[0.368417, 0.506779, 0.709798]], 
       PointBox[CompressedData["
1:eJxTTMoPSmViYGDQBGIQDQOMYPKDPYR3wN5n6YNp/2VeQ/kX7KevvS3a5Hsf
yr9hP+OCzvs6vf1Q/gN7i/svjsz+c2A/hP/EvtZ0Crec2UUo/4X94vYOneV/
r0D5b+zduQr5DV5fhfI/2PPN2PRt2i+Y/Cf7pxy3jzEIXYLyv9hLxs9Prj12
Asr/Zt+pFsLO47MByv9hP31jXfLBvo1Q9/yyZ3l7aL7zl0NQ/h97pn2WvEz9
h6H8f/aVkZ9FFsfuhfIZHCL+fYieVbgNymd0EN19LqIsdReUz+Tw7Oy359dl
j0D5zA4qIuxcLf/PQPksDsIpjuJmZZegfFaH1wmrygV1r0L5bA4NkroFyf3X
oHx2h7fZ/Cu6nsL4HA5mOkVCbe0wPqdDhGYZj+oqmH4uhx9mIXdSAq9A+dwO
DEsSc+dVw+zjcfg+26bpecwFKJ/XQY3jgv3FszD38Tnsu373z3mlU1A+v4OT
PKdPt8BJKF/AweKCcdNkRii/QcDhVlT5MaNXJ6Dygg75T6sT5V2h/AZBhwcH
jj+51HQcKi/kwD3j4+QrMVB+g5CD5qbIvpQfMHlhhxPaLNNnC8LMB/I7jvt7
HoS5R8Rh3zL2uDC/s/YABMW+Og==
        "]], 
       Hue[0.9060679774997897, 0.6, 0.6], 
       Directive[
        PointSize[0.016666666666666666`], 
        AbsoluteThickness[1.6], 
        RGBColor[0.560181, 0.691569, 0.194885]], 
       PointBox[CompressedData["
1:eJxTTMoPSmViYGDQBGIQjR0csN9Sem7jZevz+yH8C/ZbVWIVbzVeg/Jv2L86
+HjeDp4rUP4De/+v93KcF56G8p/Y/7u2a9+klweg/Bf2x3fN7P/3cTOU/8be
n/dB38ugpVD+B/vO2W/uHJJohvI/2cuEh15cMWWePYT/xV7T0iChY9kmKP+b
/abQCvnORTug/B/2ouY+fpOWbYbyf9lf7Xdti/87Dcr/Yz/fd2JK/9I5UPP/
2YuGLJI3d4PZz+AQ6bdccFrBZCif0WG5u+3R8H19UP1MDszryl60OC2G8pkd
0rLS7387swTKZ3F4EpFootw5B8pndXixTV6wpqIBymdz2D//9KPlkm1Q89kd
ai6+ll8cPgPK53DQkN287NKNeVA+pwPPwc0y/w8sgPK5HFZmTZul83whlM/t
cPe0zu9nvxdB+TwOf6SKN06ohPF5HVJ8vl29IQUzj8/B8WHlDtdTk6B8foe6
h5Kb5sg2QvkCDgHXeZcnXi+C8BsEHN4u1T9UIFYNlRd0cHhhGn3MF6q+QdDB
yWmJelNXGVReyMGUM9HMfLYyxL8NQg6eV7/sfNCXDfW/sMPiz6xNB95C+Q3C
DtsflBgYv8qDyos4xMss2r5lcqE9AKLbyhk=
        "]]}, {}}, {{{}, {}, {
        Directive[
         Opacity[1.], 
         AbsoluteThickness[1.6], 
         RGBColor[0.922526, 0.385626, 0.209179]], 
        LineBox[CompressedData["
1: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
HwqkdyU=
         "]]}, {
        Directive[
         Opacity[1.], 
         AbsoluteThickness[1.6], 
         RGBColor[0.922526, 0.385626, 0.209179]], 
        LineBox[CompressedData["
1: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

         "]]}}}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {-0.35167554147899277`, 1.0000000000000002`}}, 
     DisplayFunction -> Identity, AspectRatio -> 
     NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> {True, True}, 
     AxesLabel -> {
       FormBox["\"t\"", TraditionalForm], 
       FormBox[
       "\"\[LeftAngleBracket]W(t) V(0) W(t) V(0)\\!\\(\\*SubscriptBox[\\(\
\[RightAngleBracket]\\), \\(\[Beta]\\)]\\)\"", TraditionalForm]}, 
     AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], Method -> {}, PlotLabel -> 
     FormBox["\"Ising model with\\nJ=1, h=1/2, g=-1, L=5, \
\[Beta]=0.6\\noperator W=\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(x\\)]\\), \
V=\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(x\\)]\\) on left half \
lattice\\nred: independent reference calculation\"", TraditionalForm], 
     PlotRange -> {{0, 5.}, {-0.35167554147899277`, 1.0000000000000002`}}, 
     PlotRangeClipping -> True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{"\"Re\"", "\"Im\""}, "PointLegend", 
      DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{{}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.6], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0.368417, 0.506779, 0.709798]], {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.6], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0.368417, 0.506779, 0.709798]], 
                    PointBox[
                    NCache[{
                    Scaled[{
                    Rational[1, 2], 
                    Rational[1, 2]}]}, {
                    Scaled[{0.5, 0.5}]}]]}}}, AspectRatio -> Full, 
                    ImageSize -> {10, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{{}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.6], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0.560181, 0.691569, 0.194885]], {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.6], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0.560181, 0.691569, 0.194885]], 
                    PointBox[
                    NCache[{
                    Scaled[{
                    Rational[1, 2], 
                    Rational[1, 2]}]}, {
                    Scaled[{0.5, 0.5}]}]]}}}, AspectRatio -> Full, 
                    ImageSize -> {10, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
         FontFamily -> "Arial"}, Background -> Automatic, StripOnInput -> 
         False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"PointLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.016666666666666666`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.24561133333333335`, 0.3378526666666667, 
                    0.4731986666666667], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], 
                    "RGBColor[0.368417, 0.506779, 0.709798]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.368417, 0.506779, 0.709798]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.368417, 0.506779, 0.709798], Editable -> False,
                     Selectable -> False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.016666666666666666`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.560181, 0.691569, 0.194885], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.37345400000000006`, 0.461046, 0.12992333333333334`], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], 
                    "RGBColor[0.560181, 0.691569, 0.194885]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.560181, 0.691569, 0.194885]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.560181, 0.691569, 0.194885], Editable -> False,
                     Selectable -> False]}], "]"}]}], "}"}], ",", 
           RowBox[{"{", 
             RowBox[{#, ",", #2}], "}"}], ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{"False", ",", "False"}], "}"}]}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}], ",", 
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}]}], 
         "]"}]& ), Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Show", "[", 
  RowBox[{
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["t", "list"], ",", 
          RowBox[{"Re", "[", 
           SubscriptBox["gf", "list"], "]"}]}], "}"}], "]"}], ",", 
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["t", "list"], ",", 
          RowBox[{"Im", "[", 
           SubscriptBox["gf", "list"], "]"}]}], "}"}], "]"}]}], "}"}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<t\>\"", ",", 
        "\"\<\[LeftAngleBracket]W(t) V(0) W(t) V(0)\!\(\*SubscriptBox[\(\
\[RightAngleBracket]\), \(\[Beta]\)]\)\>\""}], "}"}]}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", 
      RowBox[{
       SubscriptBox["plot", "label"], "<>", 
       "\"\<\\nred: independent reference calculation\>\""}]}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{
         RowBox[{"ColorData", "[", "97", "]"}], "[", "1", "]"}], ",", 
        RowBox[{
         RowBox[{"ColorData", "[", "97", "]"}], "[", "3", "]"}]}], "}"}]}], 
     ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<Re\>\"", ",", "\"\<Im\>\""}], "}"}]}], ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
   RowBox[{"Plot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{
        RowBox[{"Interpolation", "[", 
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            SubscriptBox["t", "list"], ",", 
            RowBox[{"Re", "[", 
             SubscriptBox["gf", 
              RowBox[{"list", ",", "ref"}]], "]"}]}], "}"}], "]"}], "]"}], 
        "[", "\[Tau]", "]"}], ",", 
       RowBox[{
        RowBox[{"Interpolation", "[", 
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            SubscriptBox["t", "list"], ",", 
            RowBox[{"Im", "[", 
             SubscriptBox["gf", 
              RowBox[{"list", ",", "ref"}]], "]"}]}], "}"}], "]"}], "]"}], 
        "[", "\[Tau]", "]"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"\[Tau]", ",", "0", ",", "5"}], "}"}], ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{
       RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}]}]}], "]"}]}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Export", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["fn", "export"], "<>", "\"\<gf_L\>\"", "<>", 
     RowBox[{"ToString", "[", 
      SubscriptBox["L", "val"], "]"}], "<>", "\"\<.pdf\>\""}], ",", "%"}], 
   "]"}], ";"}]}], "Input"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{{}, {
       Hue[0.67, 0.6, 0.6], 
       Directive[
        PointSize[0.016666666666666666`], 
        AbsoluteThickness[1.6], 
        RGBColor[0.368417, 0.506779, 0.709798]], 
       PointBox[CompressedData["
1:eJxTTMoPSmViYGDQBGIQjQo+2EPoA/ZzpmwJXLr7HZR/wV70wD8xeb/XUP4N
+/tdS/qeL3sG5T+w7y9q1bh4/SGU/8R+//3l3N+jb0P5L+wFp933P8d9Fcp/
Y79kts7ExXsu2MPsfS7JyvZE6gyU/8k+t7G2953gSSj/i/3UqnWaDs3Hofxv
9lXZ2yasXHQMyv9h/1Lut1PRjqNQ/i97JrnWug1uR6D8P/bRk3ewOZgdgvL/
2UtNv9PyZs9+KJ/BgUf24ZTVi3dD+YwORhsaH4cL74TymRzOFj25sD1gB5TP
7PDNyW9X+icYn8Vh5jRz3xjXXVA+q0PIXeb+ZVth5rE5aOtOZ+V7swfKZ3ew
aywx5126F8rncLjz+ucNjXYYn9NhY6xNmIkxTD2Xw+YJRly2rTD3cDvI28So
3z62FcrncdD5kB3IOW8jlM/rMFct4xl382oon8/BftO8krbEpVA+v0PoFImH
i30XQvkCDolPzS1ChOdD+A0CDkIxkbVbKxdA5QUddhjv7eSYvQQqL+gQGfe+
OlhvDVReyOGt1NWGY7WbofJCDp5vJpsWWcHCQ9jB99iC9xosB6Hywg6fpj7n
aI6BxZeIQ5xt1fGJXKfsAZmwuKA=
        "]], 
       Hue[0.9060679774997897, 0.6, 0.6], 
       Directive[
        PointSize[0.016666666666666666`], 
        AbsoluteThickness[1.6], 
        RGBColor[0.560181, 0.691569, 0.194885]], 
       PointBox[CompressedData["
1:eJxTTMoPSmViYGDQBGIQjR0csJ9n4sI0Y/uB/RD+Bfs17q2r9machfJv2N/s
4fpTfe8ilP/Avn3mTbFOOP+JveLl6bbF9ueh/Bf2z0//CkpeewLKf2OvFM3C
avjrIJT/wd7pqsbnkPYdUP4n+4yPbL/1v66H8r/Yd1+QfHaHcSmU/82+ZOWe
rC2L5kP5P+wvnJl7S9J7HpT/y979iabvsgsLoPw/9jx3XMLnGi2C8v/ZOyqK
+x13XAjlMziUOc3Yc/L1LCif0WHljydZN5r6oXwmhx/rTQP6TxRB+cwOM19s
ZdyRkGUP4bM4BB27sCF2Xw2Uz+qQLLgh03VlLZTP5rDUtnN/794iKJ/dgfOh
YexWbXeoeRwOc5M+X9wh3AjlczpMzn50et2yiVA+l8PWu0tY/r6aCeVzO9R/
m+tR9gvmXx4HsVduZz8Ww8KD12FxRUQ8V81sKJ/PYb/FtIObjKZA+fwOnu/q
Nkzya4XyBRx8tfXm8H10g7ivQcBBoWRV6arubqh7BR2mtR3adf3bbKi8oIPu
/5zn9vxLofJCDhNZ6u3Sq1ZD5YUcKo7yWcvmbYDKCzs0Jl/6+7RnE1Re2GFv
/1WFxaxboPIiDlec7pQtnL7FHgDKLMuG
        "]]}, {}}, {{{}, {}, {
        Directive[
         Opacity[1.], 
         AbsoluteThickness[1.6], 
         RGBColor[0.922526, 0.385626, 0.209179]], 
        LineBox[CompressedData["
1:eJwVl3c81d8fx92Le+17jSKJiigkSoXK+yCSshtIEjJSZkPZUTIiK2VdK6Os
b0bXuPYuoyhERSL72nv8Pr9/7n08H+fzec/X+3zO2WfhaHALz8DA0I79/P8/
wcuCIGflrmwf3IfRDCSaTCpd3WsMDuc/UCUx7tUOctm71w6i4yYUNTA+erI9
la3HBYLrmSINMH54zpiLee8jWGNz/6qLcfnVIbdtG28Iy/tEUMYYV1g8u9H9
BOaXXJX3YCxWvi6+tv4UUs//IfVt00GjDpkuiwTC+1WfoesY235+Gr6gFgKX
nlbw1W7RIbirpWHWJgwWXaOr2DC+Ok30WlYPh8GLDEzHN7HnXd4JLHVHgFPM
6rrKBh0eLV0sWLCLgpUf7vVy63QIekzXnl+PhrZEX0+mNTrEb4WPzr6IAc3b
zCqlK3TIeSLvNyPyBsrrcIcNl+lQQejeQ/8vFnyOO5u1L9KhI+gRdUotHsbV
dOZkFugwF1ExNW5DAearp4pez9DhSbBs3YJHEljeRsKp05i/Vl/uBfVkqFRI
uB4+ifnTF8ue606BOlHNzl2jdEiLvL86m5QKgrrBaoXDmP9vDRqzdmlQb0De
OjqE+Te2G6SvvwVHhpb6nz/pMHgzd+eUSBZ411h8mvhCh/HUbcvJ0Sz45bm7
5H0bFs+w3n8T/70D1YvjPXqf6MB0e/7CuFo23IbC/Rfq6CDuouD7zyYPsi6a
szEW0UHgx1kbV4F8CLwrW0jPp4OQ+xTnvEc+CPWPP6zJpoMYTfnanPp/8KGS
pVowjQ4nVAYXZ7o/wOZd3advwumg9Ccw3ul0AXxv7jlUGkIHZb+jajNJBcCd
u7ejOoAO5+r9XtLtCgF/+Hv0M086GJ0Xl5peLwKFr8pyYzZ0cNe3N58QKYGd
B84wSivQYcvvxK7fISXg+2nwN8jRwacY9/XragmoGDr4KEjSwX/3a7XSzlK4
Uj6T1LObDqHDdeKBAeXwb+KBXc/mNCQ9Ep4Sp1eCwyNbm6XyaeD+vmDAKVMF
HzzMvtgUToOBo8mRAKsqSDnJqFP1fhq+JR8YffylCgSD2HglYqfhB6Hc2OJ9
NTx9Pfmt/f40DHWMnpa7UQtEvl8vcg9Og9htnV3vo2shojfCOUV4GqwZCxfF
PteC8GFasTffNIwe984VUKyDb8fEVpe2p2AydsdeBt566Cjmt+3/NgVLVqqM
7Q0NUHrh3plUzylgXY1rviPTAjce4s6IVkyCQkDvY62bLdAQqbTj5odJsN3B
L30wqgUOGswrhKVPQoNcROjQagu4NYr0lYdOgv/t54Ym9Z/AeCdrl7nZJDD0
3/t5zrQVpi+rDA+vTYD773Q3bvUO+PJr9dXTQxPgXOMdMunSCW+7OFuYLcdA
Ji3yS2FuL7z8dyvhXtIwDOvYCv1WGIBJ9BPnFjMIfA13xLzUB2CVHV1HgYOg
esZZeo/BAHB7ylqR3AchSerx6Wv2A6DrfSCl2mwQTFlCTLsTBuCtuo6Qm/gg
fK3Oi2/HDwJ1hGP1xMcBqJBfFqr6PAgGdQmUmPLfECP4bE+y+RBwrnxJiAvq
h6WhtgwdhyG4ebD/i6RTP1zK4T+64T4EMoLL1zsu9wMPytK4GjME6asbs2b7
+iHk1mdHzrYh8Mh+ffRFSR/45PPUPDr1FywKmPN3zvwAWw2KtcHOYWAo8fPu
c+6FBtLozLboMLxX86qoNOmFA72y7jlyw5D6bsOnTK0X/tjXhLFoD4NG10zo
6o5eMA0fplb4DcN/zFm1YWU9oNcvxS41OwySppMnxdh7QNGFmsf4eQQY8k2e
j5d9h47tU2bOvSOg1LNiL5T5HaxfVHL8HhmBUtmbU1ZR3yEis8GuFPcPtGa4
mxTvfofxX12izif/wXFBr69zIt8h/sJszK+Uf8Cb0PUvOfAbbIlJ+pQ8GgXb
nnTmFscuiPqQIyMRMAqaN2q1cDe6QBLJ/YyKGgVfh33ROjpdcOWagpJT3igI
lZxlkDrcBXnhGgviw6NQzhSbODbRCeZbFrZRemMwmUpydL7bCbXdcXqOEuMg
cS9zXcPnK0RZXF5YPDYOeoX3G3a4fgXrKa7XHmgcztTXSS3d+gpsjE9+BxqP
g5aRcczEha+gJ2PrkBY8DldPuWZnCHyFX/7yIb30cXAu3kcxKfoCa3KtjWrU
CcgLkpA2We+Az+XP7FvqJiDWaLxEfaYDEs8hkv6XCbg0XXxXZbgDVK4XXDEb
n4CdTr8E7No74PnzN8NuQpOw9/Zf2ZdpHbDz9y3GXJ9JEFzIElnS7wC5kC1l
gfNTkDj01NvYqR2O2m1Y5VzBuJ8zN8K0HeQ11oJUraYgvlLy85RmO5xgWPp+
x3sKPtx+d451fzucvjflUF00BdXWrrpfvrWBpml/4u390zDxpByeqbWBuXTp
Vvn6NOzLywt7fqIVLFipYgasdOD6fuFoqXgrWI4Uaf3bSYckkWJNVv5WsE76
7xX3UTrUqHiobC9/hjt8WTLWtnQI6/R5oFH2GR5uxJiRvtHhc8l68P5zn+Hc
iNJv2aszEDAepPzO5RNYd3ZNBlyfgQeCanEkm0/gX+Ww9styBhrF1nuCrn2C
6tiUHS+cZkAzXDeo5uwnOKXLdnEscAaYzn1qOibwCY5Qe6nJ5TMgThLsZq5t
AZ23rg0rNTPgaU95XE5tgTsRnF26zTMgV/9RKyC3BbLuqNA3v83AXcVnjMax
LSC6L+uACX0G7qT09Y25tAB/kFsEz/5ZMDS/dz5LogVOPORJsjs4Cx0Cq5PR
wi1wySo7p0pmFjJmU1mid7RAuPJAk8OpWdjdqneqhbEF2OfPbbdcmgWTTM0I
zsFm2L7Gf8cvYBY2e8sPDiQ2w7/DxeoLk7PA7baTZUm8GfZ73r0lNT8LkaMm
HSJ7m8H0s9hTi9VZwCNlHqNdzdBxO7Kug3kOLqdK6E6yN0NphpNajvAcLFZu
xOTMNkHIPikVa705mEx/O1RV2QQNTn/ME67MwSPjX+yVJU3AUPXGp8t0DqRA
QqqloAnum7FUqdrNAYvhETohswnM4oaVRZ7MAZ81A50/vAnkdiSd7imYg2D/
v/1PbjXBHaurpqTSOSBOaSmrmzdBegGXh0bVHPw528PPe60JBA08ywo/zwHN
OaezQ68JmMJMlMKH58Ah8FDHl9NN8J1lh4IW/zz8Wk+f6NrZBO4bgcfKH8/D
V/UscYWvjdB2zzLqse88mOpfb/7b2gh7p04vKjyfB0Wbd1ZxzY1Q95NeXBQ9
D1fDmtnEqxuBo/KyUl7+PBB/y9Jy8hsh0XefSsrIPDhMXFi3D2+EakKJznOD
BXj3+uSDs0aNwOcdkadhvACszGA1fqkRrJftyczmC3BO2Dj5lX4jsI0Kf/W9
uwAGLU2xuAuNYNDsf9n9+QKcPJz7XFi5Ef4G65k6VCxAraqBiumBRiByj9pd
klwE1S8s2eLLDbAUYKpOkcUYBF6/XGiAka2OveMnFsGIqZt5c7YBGiZLur3V
FmE0mIXz52QDPGsKVn9vuggWxvVGH/80AMHnyD582CJoyy8YV7dhTH/Qkze/
CGLCb96GZmD2b00UrK0uwr2EZe89bzH7/TfC1BmWwCQ/ueZdCma/RVOjj2MJ
OlxVjwYlYPbTBQsJ4kugYuP4n2okZs+sIuy60RLgQxKaQrwagLmV+Rw7bQms
pLxFBS81AMfdeMuftUuwab8r7aB+A/BxHvPJa1kCJn/Pp/I6DSCmbV5i2LME
hflxQmc1G+Bsa6lU/Dz2vML6I3S6AZ60OpIPSy7D2dGk3/GiDcDQ1turE7MM
zD8uN1+j1wOLg9PS3sRleGXiHzMzUQ9kLiLvfNoy6N5CV3xG62GvjvzFmA/L
EBxmfPXlYD1AW2jF79ZliHbtU3fqrAevNrVUJ6YVkOSRrVkpqof1tpw7Ec4r
8DvVzorbtR6Ev9yMO+u2AmhBs7faoR5UO3e0LHmtwDX7rv13btdDULenxLWQ
FUgfvSKee7MeBAa0/4hmrEBPX1/YP916ODE7dbWofwVynrnOS0vVgxOvjFrP
uVUo2NKUG++vg6gdf5yDdFZB53Di27buOvjI/yrp9OVV+GTc45v9tQ62dm9t
Jlmsgl6jhdWlpjp4IdZGtfNchfr8ZJdLBXXw7riDzPqHVXCjXC7leV4Hw1dz
dwkLr0E+79vha1J1kG60WWMqtgal+3YzRB+oA1vji3fiJNdg0MfqYpNIHYyb
jFcInFyDv5nzqXv46mDmurgVr94aLPRFOftv1MKGZWIuy5M1SMm/E3cBO5fx
OoWqzQ+vwah4dSuLbS2oPHe425SzDqH999v9ImogeovKqnZjE3Jc8J9wsVXA
IVHvEH1rE05Jnct/GVEF/rpfOv/ZbwK7e1rL3uAqcEkaSwhx24Ss0NmRsx5V
oKMqePR7+CYon//6MdGsCgjP3E3s6jYxO1FBmaJV4Map/D7s0Ba2n1L4u25U
Av24FvnPkS14fH2In6JfCdZmV+7Ln9gC/Ghvt5NaJVzKc4Be1S2o+PCG65BE
JcjpUzr3m25BFbdHAn26AsajGDaKQrfgv5BgZ7p3BVwTqr3YP78FM1Jf3YIz
aTB+d3auaG0LzNRsu3VjaeBWKfImDLcNX7l2BO0NocErC49hVdI2dDcy+/9z
pMHXzONeWZLbIDL1fIGkQAOt45l5D25ug6YJCE62lIOSzgse7vZt4LjzkbV/
vQyaKWXU8W/boLtiUnCPXgZGs2Nmdf3bYGmX4yo8VAb3ozTePxzfBkGGDx1v
W7D1qe19dDwDyrygL/oztgyijpWUXhZmQGGNuxhFVMqAo0pqcv9lBtQxEBHu
E1cKf97oN3kbMaDeb5PL8+Gl8NH1YVr/NQb05E5M/aPnpWAhUWv6yoIBFRhU
VZbfx9ZDTVpZnRgQa/sL7X362Pr1wNyZIAaUPe5ZdZe9FBRO5gVphzKgw51G
1hyMpcDJ/c36XTgDCshh569YKwFq3V4Rq9cMqIW9r9pkvAQ4palh3W8ZEMMp
7WuPW7D1tRGniioGpN04HHottARCuzi0d9cxoPH04uwjASVgmXv0kFsjA4pt
GnHj9ykBLguvQbk2BnQyXUN9vwu23rzD4G0fA+p/Jff5wNUSUEg9JYP/zYBs
DA+5v9bDnve8yXbjDwPas6YmKaKF+ZPNqREYY0BiP2r/sz2Drb8+eyxkiQEt
5Qv6T4mVwF/n26SxVQZkEHzFAIfdm0ouvJxQ32RAG8tuLod2lYDVdl/qNiMO
Ze7+b1CSqwRKrV35XLlxaHZ15HblKhVuHU9ZNJbGIWe271KZXVQICt1B8jyC
Qz7a8UIZHVTI/ff8YNJRHJr/Yczx8TMVlt44XhtRwCGbx0NFrPVUeL51utpF
HYec9LVb3YqpkH01/0e0Jg49uDuuv/WBCh35ogvUCzj0QbjDMSqPCrss2SS2
9XHo5EjC2blMKrxr7A4JNsOhG2E3pl3iqdC290J67k0cwvVd73V/Q4W5RxWV
X6xwKIewtBz1igqnpN/O8dvjUESqUMLySyp8fulilPYQh+49uiHq+YwKM2PD
zo2Pccj4wvlzBH8q8KkZB4974tAeTWFFii8Vri9Chaw/DuXZfDBk8KTCtDGn
GO0lDo3WURi87lGBp8DnzEAkDhW7bh/xd6HCCY6FK4wxOKTwOq7xjRMVvCt+
BJ5PwKHGf/9tzN2hQhq/TuqdJBwKuFXlc8KeCk1O1eVhqThku3VMKdCOCmTR
TPq3LByaE3cVNLWmgrzHbtbVbBzSZ+2U6LeigtG30P1C+TikmF110t6SCskB
9y9bFOMQd+9d6WJzKjQMjDo8LcGhj0XVy843qDCuaPo8sxx7f+VTxGkzKhyd
VC2brsGhz5ekmbeuUeGKenEXdwMOWVTvrF0wocLjxEPT8s04dFVxYM+aMRUS
l+OJRp9xiHnkKwsXxrV65H3u7TjUNKPwUNaICqNZfkqJX3Fo5Ymp6c2rVOBg
XDas/obFXx/wPukKFWRNb9/924ND5CEmo+nLVLhU9PMZsR+HshmFL2th7Mal
nyT5G4f26+95VXiJCgk2dSXaf3CoZeEi12GMa6pOdjoNY/0VWM4vMKTCyK73
k5GjOLTv7y1nTYzZXIUJHydwyP/JkOqEARVkPoeL/JjGoWdCpQLxGBscYFbc
nMX02XdsxATjh15uBnsXcah1NDZRAuODkx4cASuYHj1v5W/rU6HH2Ldhah2H
eqK0tv9h/Lzxqc+lbRw6I8vvPoCxwvEgpTI8Hmku1sWzYe+PpoQu7CPg0Zuo
yvWLGL8mR+Y+Z8UjO0qCKgVjTa8YWzoHHhmx9l7GYfGuTMTtv0LGI8aGiV2u
GGcaJ/WX8+IRR7Ou6wLGRo1pr0T58YhM8NZ4iuXPcjxLL0gQj/Kc5h8ewOpV
kpLDNrsHj55viE92YXyb/KHu6j48UkqIDIjE6i3oVexVIYZHtzQKZP7fj8fG
lXPBUnhE8ZmXO4T1T7KxNntOBo+mVohXRbF+/5BvsjY+ikeymh93SWN6OEX+
8kNcEY+4ldpY7a5TYdLzW9SL09jztYcYEjD9xE/06ixgp2mleaL4b0xfGw1/
aqo18CidLB/xwgKbZ/l/Hge18Ag/cj95FdOnacrEiTBtPNI+st/F9RYVaJ4L
70wv4dHByeSxMFsqeMkTIpdv4tGNwigZO0esfyls2ma38CiyzUcDOVPhF4lE
rLfFo5zVdDUxVyrABL97hCMe8ekHevM8pAJDyiHLw55YvO821vy9qZBPktkT
5YNHf2dISlXY/Jp7Hu1e88Oj18PST4jYfFcbnbrQFIRHQhn2lSXPqfCEpH3M
8jUe4WQNJ7IisPnw1J9qjsOjM8FsTqrRVPgzfjlDloJHBnJx+0ZiqKDWYLZ7
6y0ePZOWTdBJoAKTpxPjmwI8euDvPZ+E7U9PxyM729rwqGjYlnismgr+3cMt
61/wSHiXLbdSHcZ1J2sOfsMjN/ymyflGzH9iX/6TPjza237R0KcVq4eBaOiJ
UUwvihq3tH9Q4UHpB81EHCPq/vKCpLlIBdugL7S78oxI8YTIT6MjJWDzULQo
9iQjyhbNlJY5VgLWVvezG5UYUS2T0DHWk9h+rrwrbp8KI+IbKhfsUC6Bm3Pm
bt+0GdFkT7YORacETExmjp6xYURe05H8xxxL4KIkKZMjlhG1j81QcgtKwLjJ
MfNQAuYvwryKgYrZt+7I1EhiRI2P1g5cKS8Bn5TwLJ90RsS8NfGYrb4ECgX5
3i98YERKyV6WMd9LQIh9V27/J0ZU7Xdw6ij2vZyc2F+YvcmI+NWqOpZUS+FF
zomqizeZ0DfW7yGvOktB3PzgzRwrJpSRdbzAt6cUKngE8Vy2TOg+h2DSnZ+l
MPNwU63dgQmZds69VvlXCpdU6xr1PZjQEyenmJG1UhDq1m+/EsOEthQ3LnDv
L4Nshru/zFuZ0MHXRsUvHMugxTB1454iM2rwMtd9yVgOH57++RF3mhn52Cb+
zSeWQ+zHfSU1wIyK45/FtbGXw+3dSffJGszo/rCBNo6vHFiH4qffGzAjua36
XlWxctB0eTXwx54ZxXg4XD9ythzqXwbW6SUyIzPpIK17vuWQXdOU8jCZGVW3
J/AfeloOUQtE38Q0ZuRep7bV+7wcrIyenZl8x4yaUtSWj7wsB6a9fsUBH5lR
ncJW/vvEclDN88is6GBGMmvFbH2l5VDV6hgizUhAVY5Whyfo5SDPh9hjCARk
d270kOV8OWSakINwbASU37Vp+G2pHML+5Qd8JxOQBFF6NWOzHMxwc098hAlI
+UUxjpmdBhvy9x51KRLQz0MR/eFiNHByP7uifIaAnHUvSaVL0OBvNd/DLERA
44SBpgJJGnzSKbrndY6A3uxPoZbK0iDWdsnx4GUCutM29/f+aRooxrtZezgR
UCljl0q0AQ2y/2gOj7gSUPIpg6WTl2mw99AuK/2HBFQw+EWw8yoNWIpLbop7
YfE7inrMmdKgp33NtCOYgF4ZyAl2WdPg4s5PfUphBKRN629SsKNBlWmcydsI
AjL0P+AWbU+DjLFTRo/fEJCR8M+kE040eMDoaSiWQUCf1QjROx9h59nz2l9D
3xGQg0FFjaI7Dcxe7tFfzSEg3/d5vpc8aaC+p0KnrZCA2OVD3J18acB3cvu8
Ww0ByZjr9KJAGjz3bG/6U09AXX5zbCLBWL1qKee0mwmIa8DebAE7Dw/pIfX9
HQSkqyh9zP8lDT7c9kWffxJQoCwz18kYGshbmDeJDxLQLb6Y+/WvaVBsDHq+
f7F88fgRLex8XaK5eePEBAHhsvKylRKw/MQfeSetENBW1xPz7BQaqAobEdfX
Cei/isWE2VQa1O44GXZ5m4CK2PoeH35LgwamxUQ2AhGpE5jfhGbQoPWPU8U9
XiK6+yz++O/3NND5oavRvpOItM/k7u7LpkHHF5m2Q4JEFCTOf7Q1hwZdVZM/
f+0lYte9gY+ReTS4Qv10S1GMiMLMFNlt82nQnfduKlKCiCxu9F05+h8NfiTa
bmrKEFFw30Ri5gcamL469zRVjoh0jhl6Xyqgwa8X4pxb8kQkemRRZAlj86fM
0UYKRKR2ps3lRSENBj3+ChWcIqI/n37YCRbRwOJebRonEJHief7leIz/2qdI
26oSkZeoD8eOYhpYW/oW1qgT0WgTd/wTjEdNzE/vOU9EORlNMcMY3zaAuocX
iYhJJnn2zEcaTJ4XvvhVl4jEWmLigjF2UNnslDYkorPjmQFtGNMV+q8FXCGi
2I2ODAIV07ts2dCgMRGZOXJMH8N4TiLW/vR1ImrIv3rxCsb3RB7NvzInItYj
eYV3MV7aaeQ+a0lE141Iux5j7MZ1kvGiDRGtxd6zd8d4lXlncPptItpxqy/B
GePHmws8OAci+ieGUkwx3ljojL3mTETpmpTbpzH2mvywv/geET1XXhwlY8zw
N/wd2Y2I6u4pk35g8T7pczpq705E4cYP22MwZuzULa33IiLxa/G7tTD2b5FR
3fuEiEr/ZQ3PYPUg1HC2PH5KRH5340VCMH5eMqn/7TkRfTRxKtuNMdt/n3qP
hGD93bP/PQWrd0jmu5tBYUSkIpY7wI8xZ1Lg2N8IImL8Sdbxx/pFDju3+uYN
EUXuufhaEetnxDNx34V4Imrz3WP8BOs/nxczq24SES3qfdxViemD/26tAFMG
EQ2OHrfgw/Tz2iolyewdEfGG8rZJY/oSNPU9WJJDRBxX3+MUc2kgfAEUHAqJ
SJpzPUAa0+d0tf1m6Eci+v7MnSCB6bdS4XVNXinmnxhYsPMdpifx2YuzVUSk
Wt5m/w3Tu2zCHh6eOiI6WqlpnpZOAxyfVvfRRiI6YtN52RabjxRc6s17rUSk
dzZxZzs2Ty5u7eLRHUTkrLn3k3MyDdTo6xNFnZgewk4YsiZh+uu/9GC5l4jw
T1Pzd2LzKEElBD8eISJmMwGLrFc0WJE5phc3RkTnP3+7NxtFg6a3N3aUT2Lz
UCLDIBOJ6TGSStmcIyJC3glD/zAaKLENWwkvEdGZZxJMiS9owO7LLQmrRHTn
8UmGbGw/yXa4XeizTUQFVxWy0wJo4DH86lEyngXx3N5jcP8pDbRNa5VrmFnQ
ws7WY8f9sPqcF2pm5GBB5c+r9cK9sPwPtP18JsCCSsk0t9J7mH7i11IydrOg
MLdzfeIuNPjCI2HbJMyC8DocEIDd110YfOZYD7CgoAv8q6K3aVDUJ0d8IceC
3L7NVHw2w+KNiJaN1GJBE+fS2rvVMb2w1iwWaLMgaq6L6hNVGvR5T5d26bGg
4+9qnfcCFu/dc+o7r7IgNrvKhZPY/b9Cc9X4jSUL8tbq5+08hNV329SP4sGC
4isTForYaJAUJDjG6MOCTtiN1SMCNg87enRs/VjQydS23nIctj9KGwrKBbEg
53aPgucr5XDQ5Px/NTEsSEiJNdphuBw4io7/Hv7Agmz+TKg7lJeDLZo/q1XM
gp7f8stj+4h9fz/lv8stwexHk5le/1cOXn+kHjysYkFncaJGT9PLYYa0n5O1
DbN/ppnnXVg5dN3mOiU9xoKOdogR+W+Ug+zSp6SXkyzoMr05tNKoHF74BhIW
6SxIqrsqy8igHDReM32lLbEgRpYyP1P1cqDWr9nqMrEi5aKfL65JlkP83n+v
XERY0ZeRJWvRmTKw+l45R73MikKupz10cCoD8mBL9JARK8q/5HwswLYMyia+
KXCZsqLYVFHLSPMy4MFNellasKLlimLVZ3plUCklwM7lyIqiJDjw3UfKQNDX
SdTyOSvaTtjjKT1ZCl+k9l3iLGNF7JySqv+ulYKy75Oim3vZUNePHv98/hJY
Ph1/00OUDVmsnD20zFEC+StFnDHibOiIu5S9PL4ERJ3Gbn2WZkM39Of4Iiex
+8YNvZ0nFdmQTLqcyFAVFTpPCz/kMGBDgftamH7bYOfPlRKFj35sCDew3tCa
9xEiHGfLOP6xoWJfmfI6qWL44/N2hFLBjiYJwg/P5H6AiVslVjUBHOhGLP3b
PlwecLSohkkGc6DbX34nfh3JBWmZzyURoRyo80Ns7MvPuXBn6ReXZTQH6sNP
NMq/zoXJZ0wljKkciK9MV3O/LMYZupzqFRxoIH3FoNAiB6bHhosaFziQroqK
eFPne+DScRw4ssKB/qYMhdmXvQeZDytsr9c50NW9BwT2pb4Hh8fs5rZ4TpSs
lrax6vIeptnk2FjJnMjf4eIVQ773QJfyMNOS4kR1j9huhpu8g5m7PMTWm5zo
tbfom9LFTLihP+awbsWJ3B8F5T0bzIQ2+arvh2w5kcCVZapVayZkr99Nf+bA
iTICLw1ceZsJtoHN6sidE2m9Udy340omDKT5+BdEcaJZw6g7hLIMaO+bxsU2
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
/AAV9LO1wP8AoGP98A==
         "]]}, {
        Directive[
         Opacity[1.], 
         AbsoluteThickness[1.6], 
         RGBColor[0.922526, 0.385626, 0.209179]], 
        LineBox[CompressedData["
1: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
vGh47lho69Y7cKbSZzTVlxfdXDhGG/x7B04prMwQjuNFa9+eoxVddYcLtY4Z
OxJ50X75vHwc5g5WVi0Z2km86KyLko5yoTv4Jj954ZvGi8S+W+YbC98F5jqJ
V1O5vChX7viTnFd3oaLA9dWqt7yo3HzOYk3rXWg6+/nVrkJeNLWCdukP+y4M
Rzx9bYN5kU1nRlLPYQ/YQF6b1VvPixIclYwGmzxgx4u7WXNNvGh5qEu3cMwD
1I93Z61u5UVvDfTXLa3yBIOA+GyDTl5UYHhH4rORJ9xb2PimaogXyQ8rnC1r
9IQnz6hvvv3kRSeW3L6L/fEEmkb/m6XfvGg0xnyubYUXFNxKytUc50UGCX/v
vwYvGPkjx3y9yIsYHdfFMzO8YC44gPmRi4SY1b1e1hVewL99iPmDl4T+dfTp
7+7yAplrz/NlhEhoLZfo5OoV3mDcu+1d1GoSKprY73ba1BssPILevVlLQjHr
8tcjJ29wkPr1rmkDCVWmhCQ+D/CGIOOXBQKbSSid8uthS4Y3lDQoFXntJqFt
i3bHs0e84aNtaNEzVRKaqPy+yoDjDe0Cf4ve7iUh48s/TW3IVBg7ml08doCE
fE6sqeHaToXFgZUlIkBC6zXFQv32UkHIz6lEQYt4X01e3lOLCltKVUqv6ZDQ
dMQhme6LVFC5FFHqd5KEph6TFZAVFQ7NTZTS9EmI1f7wnIwzFc7vZZZ1GpNQ
8629jgb3qXC9TQJPnyOhCmtFHkYYFVycb2PxSySk0WcjZB9DhdBM9fJTFiRk
Eni6wT2dCvLm2y0yr5GQbalQhkE2FcrE1/GI2pCQfIHehrC3VDhXTU5xsCOh
DVZdUSqlRD1ui0eaHUio/a2D94H3VAhW+De024WEBp41HX5dSwW5vq/3H98m
ocalQr17jVQoDm+VH3cnoS2fx4WrWFQw1qr6YOhFQq7CGn/sPlNhdCrfJteH
hE5F6Rp7dVIhMD1dkBJA6DUdzZvupsKmi89e3gokoaozX2939lKhQPjRyU/B
JORrO8S39QsVDLHXiFooCc2GFzX3EPzb2SE0+jEJFeZthkWCA7aY75qJJCHD
6q84mOANHYbNZ2NISI+ZW+rXR4X84CNO7+JIaL/TxdTvPVTQP7h3lRSN6Pdw
bH9+FxV+/pXPdWeQkLTI7p6Jdir4MqTOdKWSkHJjH09iGxXWGgtN7csgIRsp
q0pmMxVy+TlRca9I6MyXoPv766lwsnB070IWoVd0RcGuGioM2fW3X8olIa9Y
RvWTcip4S7PcSvJJqM1u7bprRVRYzaqU2lhIQhLuu2XT8qiQHcAs9C4hzrTX
qdrnX1NBRz3t4hdMQvfn9s14pFLh23DMwqH3xDzo5cSLJlDBIz44gV5DQgee
1SZTIqnwmsv+i3kjCSW1Ddy75UOFY3lmPhUtJJTPsNJodqXCl+sGMnKfiPq2
Pp5PvEEFsfo9loPdJCQj1Gnx1JAKL7y38h79QujTde8rP0oFLeU1qanfSEhs
uULKXIMKrtHz368Pk9AFXxPvpXVUENEZCaz5Q9SrJEtdIuY/bb5v27Z/JHRd
KG7UldiPzisVN4anSYi+NuZDTY83HFAIGrXl5UPKeneCl6K84VPv3bB6fj40
sTZ6OcvfG26G2+1WEuJDrp98yjsdvYE2pe88KsaH0IbbzbE63sCDJacdpfnQ
0/28Pc2TXhDvvOJpiywfSi54bn66zwvUtsypq2zlQ280Qh6eqPECq+Be9wlF
PnRH65tb1lMvqDuTwnHdx4fWNTU7g4oX5N4f6I4/yIditya8uyblBXHvZAsr
gQ9durlIWrPsCbbrk26LafOhD679WpvrPUFwMOHvKyM+1KpUI/vlsifouDz9
OmDHhw6sPirLsfcA5dTPZYKOfCjsZd4ZHn0PkGqXSFR24UPeA/txzE4P+Lkv
8gLVnQ/p/h5rdPpzFwK5H7euvc+H+CSTkvot7kL14+AqAxofep+n3NK0zx1e
V9YmuzH4kH6dw4oucXeImlrhR0vlQ8Wax1+4/nGDa+cD/xt5yYe86rYVmse7
AUkm4O2Dd3xI3vvU15Uzd0Ar2yujrIUPfV84wf3r6W0ob3QMUeLlR+8Okug+
D1xATQKRY/j50Zc4tC1S3wUyLoo95BbiR1cUHCZ2SLpA+M+cB+1i/Mg4zJBr
IMkZzLgn/H2l+dFNUKjwzXUCjprr3U/7+NHeX2c2HvK2h30J7lZeTvxoSU1Z
QZZ9DV4P6Hz/cYsfhURyqVdaXQOZHWuvGbrxo2qLpVzXz1dB4G2hhTyVH5ll
/7m8MscSOpvnTVse8aO0Ige+rRfN4Q6v95kt6fyooOe4xEHSOci19UMNffzo
tf5FxbT9cqBmaV4r/40ftfheejlzRhTeXgADvyF+JPNoYhV5crasUGfxivof
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
/wMiD/4z
         "]]}}}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {-0.2792074893135567, 1.}}, DisplayFunction -> 
     Identity, AspectRatio -> NCache[GoldenRatio^(-1), 0.6180339887498948], 
     Axes -> {True, True}, AxesLabel -> {
       FormBox["\"t\"", TraditionalForm], 
       FormBox[
       "\"\[LeftAngleBracket]W(t) V(0) W(t) V(0)\\!\\(\\*SubscriptBox[\\(\
\[RightAngleBracket]\\), \\(\[Beta]\\)]\\)\"", TraditionalForm]}, 
     AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], Method -> {}, PlotLabel -> 
     FormBox["\"Ising model with\\nJ=1, h=1/2, g=-1, L=5, \
\[Beta]=0.6\\noperator W=\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(x\\)]\\), \
V=\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(x\\)]\\) on left half \
lattice\\nred: independent reference calculation\"", TraditionalForm], 
     PlotRange -> {{0, 5.}, {-0.2792074893135567, 1.}}, PlotRangeClipping -> 
     True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{"\"Re\"", "\"Im\""}, "PointLegend", 
      DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{{}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.6], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0.368417, 0.506779, 0.709798]], {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.6], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0.368417, 0.506779, 0.709798]], 
                    PointBox[
                    NCache[{
                    Scaled[{
                    Rational[1, 2], 
                    Rational[1, 2]}]}, {
                    Scaled[{0.5, 0.5}]}]]}}}, AspectRatio -> Full, 
                    ImageSize -> {10, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{{}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.6], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0.560181, 0.691569, 0.194885]], {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.6], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0.560181, 0.691569, 0.194885]], 
                    PointBox[
                    NCache[{
                    Scaled[{
                    Rational[1, 2], 
                    Rational[1, 2]}]}, {
                    Scaled[{0.5, 0.5}]}]]}}}, AspectRatio -> Full, 
                    ImageSize -> {10, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
         FontFamily -> "Arial"}, Background -> Automatic, StripOnInput -> 
         False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"PointLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.016666666666666666`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.24561133333333335`, 0.3378526666666667, 
                    0.4731986666666667], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], 
                    "RGBColor[0.368417, 0.506779, 0.709798]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.368417, 0.506779, 0.709798]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.368417, 0.506779, 0.709798], Editable -> False,
                     Selectable -> False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.016666666666666666`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.560181, 0.691569, 0.194885], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.37345400000000006`, 0.461046, 0.12992333333333334`], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], 
                    "RGBColor[0.560181, 0.691569, 0.194885]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.560181, 0.691569, 0.194885]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.560181, 0.691569, 0.194885], Editable -> False,
                     Selectable -> False]}], "]"}]}], "}"}], ",", 
           RowBox[{"{", 
             RowBox[{#, ",", #2}], "}"}], ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{"False", ",", "False"}], "}"}]}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}], ",", 
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}]}], 
         "]"}]& ), Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Virtual bond dimensions", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["t", "plot"], "=", 
   RowBox[{"{", 
    RowBox[{"0", ",", 
     RowBox[{"1", "/", "2"}], ",", "1", ",", "2", ",", "4", ",", "5"}], 
    "}"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"virtual", " ", "bond", " ", "dimension", " ", 
    RowBox[{"for", " ", "'"}], 
    RowBox[{"A", "'"}], " ", "operator"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Partition", "[", 
     RowBox[{
      RowBox[{"Import", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "import"], "<>", "\"\<_DXA.dat\>\""}], ",", 
        "\"\<Integer64\>\""}], "]"}], ",", 
      RowBox[{
       SubscriptBox["L", "val"], "+", "1"}]}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"%", "\[LeftDoubleBracket]", "#", "\[RightDoubleBracket]"}], 
      "&"}], "/@", 
     RowBox[{"Flatten", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"Position", "[", 
         RowBox[{
          SubscriptBox["t", "list"], ",", "#"}], "]"}], "&"}], "/@", 
       SubscriptBox["t", "plot"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"ListLinePlot", "[", 
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Range", "[", 
           RowBox[{"0", ",", 
            SubscriptBox["L", "val"]}], "]"}], ",", "#"}], "}"}], "]"}], 
       "&"}], "/@", "%"}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<j\>\"", ",", "\"\<\!\(\*SubscriptBox[\(D\), \(A, j\)]\)(t)\>\""}],
        "}"}]}], ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", 
      RowBox[{
      "\"\<virtual bond dimension of \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[ImaginaryI]\)\\\ H\\\ t\)]\) \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[Beta]\)\\\ H\)]\) \
\!\(\*SubsuperscriptBox[\(b\), \(j\), \(\[Dagger]\)]\) \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\[ImaginaryI]\\\ H\\\ t\)]\)\\n\>\
\"", "<>", 
       SubscriptBox["plot", "label"]}]}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"Lighter", "[", 
         RowBox[{"Blue", ",", 
          RowBox[{"2", "/", "3"}]}], "]"}], ",", 
        RowBox[{"Lighter", "[", 
         RowBox[{"Blue", ",", 
          RowBox[{"1", "/", "3"}]}], "]"}], ",", "Blue", ",", 
        RowBox[{"Darker", "[", 
         RowBox[{"Blue", ",", 
          RowBox[{"1", "/", "3"}]}], "]"}], ",", 
        RowBox[{"Darker", "[", 
         RowBox[{"Blue", ",", 
          RowBox[{"2", "/", "3"}]}], "]"}], ",", "Black"}], "}"}]}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         RowBox[{"\"\<t=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "#", "]"}], "]"}]}], "&"}], "/@", 
        SubscriptBox["t", "plot"]}], ")"}]}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "export"], "<>", "\"\<DA_L\>\"", "<>", 
       RowBox[{"ToString", "[", 
        SubscriptBox["L", "val"], "]"}], "<>", "\"\<.pdf\>\""}], ",", "%"}], 
     "]"}], ";"}]}]}]], "Input"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{}, {{{}, {}, {
        Hue[0.67, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[
          NCache[
           Rational[2, 3], 0.6666666666666666], 
          NCache[
           Rational[2, 3], 0.6666666666666666], 1]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 6.}, {3., 6.}, {4., 4.}, {5., 
         1.}}]}, {
        Hue[0.9060679774997897, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[
          NCache[
           Rational[1, 3], 0.3333333333333333], 
          NCache[
           Rational[1, 3], 0.3333333333333333], 1]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 10.}, {3., 10.}, {4., 4.}, {5., 
         1.}}]}, {
        Hue[0.1421359549995791, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 1]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 14.}, {3., 12.}, {4., 4.}, {5., 
         1.}}]}, {
        Hue[0.37820393249936934`, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[2, 3], 0.6666666666666666]]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 16.}, {4., 4.}, {5., 
         1.}}]}, {
        Hue[0.6142719099991583, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[1, 3], 0.3333333333333333]]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 16.}, {4., 4.}, {5., 
         1.}}]}, {
        Hue[0.8503398874989481, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         GrayLevel[0]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 16.}, {4., 4.}, {5., 
         1.}}]}}}, {}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {0, 16.}}, DisplayFunction -> Identity, 
     AspectRatio -> NCache[GoldenRatio^(-1), 0.6180339887498948], 
     Axes -> {True, True}, AxesLabel -> {
       FormBox["\"j\"", TraditionalForm], 
       FormBox[
       "\"\\!\\(\\*SubscriptBox[\\(D\\), \\(A, j\\)]\\)(t)\"", 
        TraditionalForm]}, AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], Method -> {}, PlotLabel -> 
     FormBox["\"virtual bond dimension of \\!\\(\\*SuperscriptBox[\\(\
\[ExponentialE]\\), \\(\\(-\[ImaginaryI]\\)\\\\ H\\\\ t\\)]\\) \
\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \\(\\(-\[Beta]\\)\\\\ H\\)]\\) \
\\!\\(\\*SubsuperscriptBox[\\(b\\), \\(j\\), \\(\[Dagger]\\)]\\) \
\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \\(\[ImaginaryI]\\\\ H\\\\ \
t\\)]\\)\\nIsing model with\\nJ=1, h=1/2, g=-1, L=5, \[Beta]=0.6\\noperator \
W=\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(x\\)]\\), V=\\!\\(\\*SubscriptBox[\
\\(\[Sigma]\\), \\(x\\)]\\) on left half lattice\"", TraditionalForm], 
     PlotRange -> {{0, 5.}, {0, 16.}}, PlotRangeClipping -> True, 
     PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{
      "\"t=0\"", "\"t=1/2\"", "\"t=1\"", "\"t=2\"", "\"t=4\"", "\"t=5\""}, 
      "LineLegend", DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 1]], {}}}, 
                    AspectRatio -> Full, ImageSize -> {20, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 1]], {}}}, 
                    AspectRatio -> Full, ImageSize -> {20, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 1]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #3}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[2, 3], 0.6666666666666666]]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[2, 3], 0.6666666666666666]]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #4}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[1, 3], 0.3333333333333333]]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[1, 3], 0.3333333333333333]]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #5}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    GrayLevel[0]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    GrayLevel[0]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #6}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
         FontFamily -> "Arial"}, Background -> Automatic, StripOnInput -> 
         False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"LineLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.4444444444444444, 0.4444444444444444, 
                    0.6666666666666666], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[2/3, 2/3, 1]"], 
                    Appearance -> None, BaseStyle -> {}, BaselinePosition -> 
                    Baseline, DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.2222222222222222, 0.2222222222222222, 
                    0.6666666666666666], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[1/3, 1/3, 1]"], 
                    Appearance -> None, BaseStyle -> {}, BaselinePosition -> 
                    Baseline, DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.6666666666666666], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[0, 0, 1]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 
                    Rational[2, 3]], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.4444444444444444], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[0, 0, 2/3]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 
                    Rational[2, 3]]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 
                    Rational[2, 3]], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 
                    Rational[1, 3]], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.2222222222222222], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[0, 0, 1/3]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 
                    Rational[1, 3]]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 
                    Rational[1, 3]], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> GrayLevel[0.], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "GrayLevel[0]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[0], Editable -> False, Selectable -> False]}], 
                 "]"}]}], "}"}], ",", 
           RowBox[{"{", 
             RowBox[{#, ",", #2, ",", #3, ",", #4, ",", #5, ",", #6}], "}"}], 
           ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               
               RowBox[{
                "True", ",", "True", ",", "True", ",", "True", ",", "True", 
                 ",", "True"}], "}"}]}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}], ",", 
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}]}], 
         "]"}]& ), Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"virtual", " ", "bond", " ", "dimension", " ", 
    RowBox[{"for", " ", "'"}], 
    RowBox[{"B", "'"}], " ", "operator"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Partition", "[", 
     RowBox[{
      RowBox[{"Import", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "import"], "<>", "\"\<_DXB.dat\>\""}], ",", 
        "\"\<Integer64\>\""}], "]"}], ",", 
      RowBox[{
       SubscriptBox["L", "val"], "+", "1"}]}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{
      RowBox[{"%", "\[LeftDoubleBracket]", "#", "\[RightDoubleBracket]"}], 
      "&"}], "/@", 
     RowBox[{"Flatten", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"Position", "[", 
         RowBox[{
          SubscriptBox["t", "list"], ",", "#"}], "]"}], "&"}], "/@", 
       SubscriptBox["t", "plot"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"ListLinePlot", "[", 
    RowBox[{
     RowBox[{
      RowBox[{
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Range", "[", 
           RowBox[{"0", ",", 
            SubscriptBox["L", "val"]}], "]"}], ",", "#"}], "}"}], "]"}], 
       "&"}], "/@", "%"}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<j\>\"", ",", "\"\<\!\(\*SubscriptBox[\(D\), \(B, j\)]\)(t)\>\""}],
        "}"}]}], ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", 
      RowBox[{
      "\"\<virtual bond dimension of \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[ImaginaryI]\)\\\ H\\\ t\)]\) \
\!\(\*SubscriptBox[\(b\), \(j\)]\) \!\(\*SuperscriptBox[\(\[ExponentialE]\), \
\(\[ImaginaryI]\\\ H\\\ t\)]\)\\n\>\"", "<>", 
       SubscriptBox["plot", "label"]}]}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"Lighter", "[", 
         RowBox[{"Blue", ",", 
          RowBox[{"2", "/", "3"}]}], "]"}], ",", 
        RowBox[{"Lighter", "[", 
         RowBox[{"Blue", ",", 
          RowBox[{"1", "/", "3"}]}], "]"}], ",", "Blue", ",", 
        RowBox[{"Darker", "[", 
         RowBox[{"Blue", ",", 
          RowBox[{"1", "/", "3"}]}], "]"}], ",", 
        RowBox[{"Darker", "[", 
         RowBox[{"Blue", ",", 
          RowBox[{"2", "/", "3"}]}], "]"}], ",", "Black"}], "}"}]}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{
         RowBox[{"\"\<t=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "#", "]"}], "]"}]}], "&"}], "/@", 
        SubscriptBox["t", "plot"]}], ")"}]}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "export"], "<>", "\"\<DB_L\>\"", "<>", 
       RowBox[{"ToString", "[", 
        SubscriptBox["L", "val"], "]"}], "<>", "\"\<.pdf\>\""}], ",", "%"}], 
     "]"}], ";"}]}]}]], "Input"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{}, {{{}, {}, {
        Hue[0.67, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[
          NCache[
           Rational[2, 3], 0.6666666666666666], 
          NCache[
           Rational[2, 3], 0.6666666666666666], 1]], 
        LineBox[{{0., 1.}, {1., 1.}, {2., 1.}, {3., 1.}, {4., 1.}, {5., 
         1.}}]}, {
        Hue[0.9060679774997897, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[
          NCache[
           Rational[1, 3], 0.3333333333333333], 
          NCache[
           Rational[1, 3], 0.3333333333333333], 1]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 8.}, {3., 5.}, {4., 3.}, {5., 
         1.}}]}, {
        Hue[0.1421359549995791, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 1]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 14.}, {3., 11.}, {4., 4.}, {5., 
         1.}}]}, {
        Hue[0.37820393249936934`, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[2, 3], 0.6666666666666666]]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 16.}, {4., 4.}, {5., 
         1.}}]}, {
        Hue[0.6142719099991583, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[1, 3], 0.3333333333333333]]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 16.}, {4., 4.}, {5., 
         1.}}]}, {
        Hue[0.8503398874989481, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         GrayLevel[0]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 16.}, {4., 4.}, {5., 
         1.}}]}}}, {}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {0, 16.}}, DisplayFunction -> Identity, 
     AspectRatio -> NCache[GoldenRatio^(-1), 0.6180339887498948], 
     Axes -> {True, True}, AxesLabel -> {
       FormBox["\"j\"", TraditionalForm], 
       FormBox[
       "\"\\!\\(\\*SubscriptBox[\\(D\\), \\(B, j\\)]\\)(t)\"", 
        TraditionalForm]}, AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], Method -> {}, PlotLabel -> 
     FormBox["\"virtual bond dimension of \\!\\(\\*SuperscriptBox[\\(\
\[ExponentialE]\\), \\(\\(-\[ImaginaryI]\\)\\\\ H\\\\ t\\)]\\) \
\\!\\(\\*SubscriptBox[\\(b\\), \\(j\\)]\\) \\!\\(\\*SuperscriptBox[\\(\
\[ExponentialE]\\), \\(\[ImaginaryI]\\\\ H\\\\ t\\)]\\)\\nIsing model \
with\\nJ=1, h=1/2, g=-1, L=5, \[Beta]=0.6\\noperator W=\\!\\(\\*SubscriptBox[\
\\(\[Sigma]\\), \\(x\\)]\\), V=\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(x\\)]\
\\) on left half lattice\"", TraditionalForm], 
     PlotRange -> {{0, 5.}, {0, 16.}}, PlotRangeClipping -> True, 
     PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{
      "\"t=0\"", "\"t=1/2\"", "\"t=1\"", "\"t=2\"", "\"t=4\"", "\"t=5\""}, 
      "LineLegend", DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 
                    NCache[
                    Rational[2, 3], 0.6666666666666666], 1]], {}}}, 
                    AspectRatio -> Full, ImageSize -> {20, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 
                    NCache[
                    Rational[1, 3], 0.3333333333333333], 1]], {}}}, 
                    AspectRatio -> Full, ImageSize -> {20, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 1]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 1]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #3}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[2, 3], 0.6666666666666666]]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[2, 3], 0.6666666666666666]]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #4}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[1, 3], 0.3333333333333333]]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    RGBColor[0, 0, 
                    NCache[
                    Rational[1, 3], 0.3333333333333333]]], {}}}, AspectRatio -> 
                    Full, ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #5}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    GrayLevel[0]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.35], 
                    AbsoluteThickness[1.6], 
                    GrayLevel[0]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #6}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
         FontFamily -> "Arial"}, Background -> Automatic, StripOnInput -> 
         False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"LineLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.4444444444444444, 0.4444444444444444, 
                    0.6666666666666666], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[2/3, 2/3, 1]"], 
                    Appearance -> None, BaseStyle -> {}, BaselinePosition -> 
                    Baseline, DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[
                    Rational[2, 3], 
                    Rational[2, 3], 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.2222222222222222, 0.2222222222222222, 
                    0.6666666666666666], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[1/3, 1/3, 1]"], 
                    Appearance -> None, BaseStyle -> {}, BaselinePosition -> 
                    Baseline, DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[
                    Rational[1, 3], 
                    Rational[1, 3], 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 1], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.6666666666666666], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[0, 0, 1]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 1]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 1], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 
                    Rational[2, 3]], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.4444444444444444], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[0, 0, 2/3]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 
                    Rational[2, 3]]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 
                    Rational[2, 3]], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0, 0, 
                    Rational[1, 3]], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0., 0., 0.2222222222222222], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "RGBColor[0, 0, 1/3]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0, 0, 
                    Rational[1, 3]]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0, 0, 
                    Rational[1, 3]], Editable -> False, Selectable -> 
                    False]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> GrayLevel[0.], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], "GrayLevel[0]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[0], Editable -> False, Selectable -> False]}], 
                 "]"}]}], "}"}], ",", 
           RowBox[{"{", 
             RowBox[{#, ",", #2, ",", #3, ",", #4, ",", #5, ",", #6}], "}"}], 
           ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               
               RowBox[{
                "True", ",", "True", ",", "True", ",", "True", ",", "True", 
                 ",", "True"}], "}"}]}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}], ",", 
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}]}], 
         "]"}]& ), Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Effective truncation weight", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"tolerance", " ", 
    RowBox[{"(", 
     RowBox[{"truncation", " ", "weight"}], ")"}], " ", "for", " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Beta]"}], " ", "H"}]]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"Partition", "[", 
     RowBox[{
      RowBox[{"Import", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "import"], "<>", "\"\<_tol_eff_beta.dat\>\""}], 
        ",", "\"\<Real64\>\""}], "]"}], ",", 
      RowBox[{
       SubscriptBox["L", "val"], "-", "1"}]}], "]"}], "-", 
    SuperscriptBox["10", 
     RowBox[{"-", "10"}]]}], "]"}]}]], "Input"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"tolerance", " ", 
    RowBox[{"(", 
     RowBox[{"truncation", " ", "weight"}], ")"}], " ", "for", " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[ImaginaryI]"}], " ", "H", " ", "t"}]], " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Beta]"}], " ", "H"}]], " ", 
    SubsuperscriptBox["b", "j", "\[Dagger]"], " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{"\[ImaginaryI]", " ", "H", " ", "t"}]]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"Partition", "[", 
     RowBox[{
      RowBox[{"Import", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "import"], "<>", "\"\<_tol_eff_A.dat\>\""}], ",", 
        "\"\<Real64\>\""}], "]"}], ",", 
      RowBox[{
       SubscriptBox["L", "val"], "-", "1"}]}], "]"}], "-", 
    SuperscriptBox["10", 
     RowBox[{"-", "10"}]]}], "]"}]}]], "Input"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"tolerance", " ", 
    RowBox[{"(", 
     RowBox[{"truncation", " ", "weight"}], ")"}], " ", "for", " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[ImaginaryI]"}], " ", "H", " ", "t"}]], " ", 
    SubscriptBox["b", "j"], " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{"\[ImaginaryI]", " ", "H", " ", "t"}]]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"Partition", "[", 
     RowBox[{
      RowBox[{"Import", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "import"], "<>", "\"\<_tol_eff_B.dat\>\""}], ",", 
        "\"\<Real64\>\""}], "]"}], ",", 
      RowBox[{
       SubscriptBox["L", "val"], "-", "1"}]}], "]"}], "-", 
    SuperscriptBox["10", 
     RowBox[{"-", "10"}]]}], "]"}]}]], "Input"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1626, 919},
WindowMargins->{{Automatic, 233}, {74, Automatic}},
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
Cell[CellGroupData[{
Cell[1678, 44, 41, 0, 43, "Subsection"],
Cell[1722, 46, 297, 9, 31, "Input"],
Cell[2022, 57, 2831, 80, 98, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4890, 142, 43, 0, 43, "Subsection"],
Cell[4936, 144, 214, 7, 52, "Input"],
Cell[5153, 153, 248, 8, 67, "Input"],
Cell[5404, 163, 265, 8, 52, "Input"],
Cell[5672, 173, 233, 7, 52, "Input"],
Cell[5908, 182, 244, 8, 52, "Input"],
Cell[CellGroupData[{
Cell[6177, 194, 249, 7, 52, "Input"],
Cell[6429, 203, 29, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[6507, 209, 52, 0, 43, "Subsection"],
Cell[6562, 211, 1017, 35, 92, "Input"],
Cell[7582, 248, 209, 6, 52, "Input"],
Cell[7794, 256, 485, 14, 48, "Input"],
Cell[8282, 272, 821, 23, 48, "Input"],
Cell[9106, 297, 1179, 34, 48, "Input"],
Cell[10288, 333, 392, 10, 33, "Input"],
Cell[10683, 345, 568, 15, 31, "Input"],
Cell[11254, 362, 315, 8, 31, "Input"],
Cell[11572, 372, 144, 4, 31, "Input"],
Cell[CellGroupData[{
Cell[11741, 380, 309, 8, 52, "Input"],
Cell[12053, 390, 291, 7, 31, "Output"],
Cell[12347, 399, 50, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12434, 405, 265, 8, 31, "Input"],
Cell[12702, 415, 62, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12801, 421, 319, 9, 52, "Input"],
Cell[13123, 432, 51, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13211, 438, 315, 9, 52, "Input"],
Cell[13529, 449, 51, 1, 31, "Output"]
}, Open  ]],
Cell[13595, 453, 102, 2, 31, "Input"],
Cell[CellGroupData[{
Cell[13722, 459, 1100, 33, 55, "Input"],
Cell[14825, 494, 293, 7, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15155, 506, 795, 24, 33, "Input"],
Cell[15953, 532, 62, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16052, 538, 596, 19, 87, "Input"],
Cell[16651, 559, 28, 0, 31, "Output"],
Cell[16682, 561, 28, 0, 31, "Output"]
}, Open  ]],
Cell[16725, 564, 1276, 39, 72, "Input"],
Cell[18004, 605, 1240, 38, 76, "Input"],
Cell[CellGroupData[{
Cell[19269, 647, 268, 7, 54, "Input"],
Cell[19540, 656, 221, 5, 33, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[19798, 666, 252, 7, 54, "Input"],
Cell[20053, 675, 49, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20139, 680, 289, 8, 52, "Input"],
Cell[20431, 690, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20518, 695, 285, 8, 54, "Input"],
Cell[20806, 705, 51, 0, 31, "Output"]
}, Open  ]],
Cell[20872, 708, 875, 20, 52, "Input"],
Cell[21750, 730, 329, 10, 31, "Input"],
Cell[CellGroupData[{
Cell[22104, 744, 2778, 79, 92, "Input"],
Cell[24885, 825, 57117, 1002, 305, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[82039, 1832, 2768, 79, 97, "Input"],
Cell[84810, 1913, 45865, 817, 302, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[130724, 2736, 45, 0, 43, "Subsection"],
Cell[130772, 2738, 213, 7, 31, "Input"],
Cell[CellGroupData[{
Cell[131010, 2749, 3109, 86, 137, "Input"],
Cell[134122, 2837, 27851, 593, 342, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[162010, 3435, 3018, 84, 137, "Input"],
Cell[165031, 3521, 27747, 592, 339, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[192827, 4119, 49, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[192901, 4123, 718, 22, 54, "Input"],
Cell[193622, 4147, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[193689, 4152, 985, 28, 55, "Input"],
Cell[194677, 4182, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[194744, 4187, 863, 25, 54, "Input"],
Cell[195610, 4214, 30, 0, 31, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature luTf1vk#OQafdCKGWRnYvV6i *)
