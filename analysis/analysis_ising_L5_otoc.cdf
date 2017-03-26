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
NotebookDataLength[    212867,       4570]
NotebookOptionsPosition[    209968,       4452]
NotebookOutlinePosition[    210311,       4467]
CellTagsIndexPosition[    210268,       4464]
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
  RowBox[{"SiteOperatorSum", "[", 
   RowBox[{"A_", ",", "j0_", ",", "j1_", ",", "L_"}], "]"}], ":=", 
  RowBox[{"Sum", "[", 
   RowBox[{
    RowBox[{"SiteOperator", "[", 
     RowBox[{"A", ",", "j", ",", "L"}], "]"}], ",", 
    RowBox[{"{", 
     RowBox[{"j", ",", "j0", ",", "j1"}], "}"}]}], "]"}]}]], "Input"],

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
      RowBox[{"SiteOperatorSum", "[", 
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
      RowBox[{"SiteOperatorSum", "[", 
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
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["magnetization", "list"], "-", 
     SubscriptBox["magnetization", 
      RowBox[{"list", ",", "ref"}]]}], ",", "\[Infinity]"}], "]"}]}]], "Input"],

Cell[BoxData["4.1577414407745206`*^-6"], "Output"]
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
  RowBox[{
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["otoc", "list"], "-", 
      SubscriptBox["otoc", 
       RowBox[{"list", ",", "ref"}]]}], ",", "\[Infinity]"}], "]"}], "/", 
   RowBox[{"Norm", "[", 
    RowBox[{
     SubscriptBox["otoc", 
      RowBox[{"list", ",", "ref"}]], ",", "\[Infinity]"}], "]"}]}]}]], "Input"],

Cell[BoxData["0.000024255539448476676`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["gf", "list"], "-", 
      SubscriptBox["gf", 
       RowBox[{"list", ",", "ref"}]]}], ",", "\[Infinity]"}], "]"}], "/", 
   RowBox[{"Norm", "[", 
    RowBox[{
     SubscriptBox["gf", 
      RowBox[{"list", ",", "ref"}]], ",", "\[Infinity]"}], "]"}]}]}]], "Input"],

Cell[BoxData["0.000034437439568422835`"], "Output"]
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
    "\"\<\\noperator W=\!\(\*UnderscriptBox[\(\[Sum]\), \
\(i\)]\)\!\(\*SubscriptBox[\(\[Sigma]\), \(x, i\)]\), V=\!\(\*UnderscriptBox[\
\(\[Sum]\), \(i\)]\)\!\(\*SubscriptBox[\(\[Sigma]\), \(x, i\)]\) on left half \
lattice\>\""}]}], ";"}]], "Input"],

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
1:eJxTTMoPSmViYGDQBGIQDQO2lZs4cm4qO0B4B+w9Y/rYL2xXgPIv2P8r9qub
7iIM5d+wfzDD/8Zr7h/2EP4De/uJWz8w2V3ZD+E/sf80p0DC8t8TKP+F/YIc
VinWZY1Q9W/sv0uKBhUIfobyP9gv2TnpaagkM9T8T/bKb6clO+twQvlf7LsO
SNVwXoPxv9nL94mnvZrCCuX/sM/RnfHXYPE/qHm/7L2MimNPmXyF8v/YV2yZ
ZtDm9QnK/2dvWqu4qc0eJs/g4PV0x/n/W/9A+YwO8p8Nt8kug7mHySH2XdLH
q185oHxmB7eZsdfKE3igfBaHnBlFK4xFeaF8Vge7NYF9x6ZwQ/lsDs8fxNhp
XYPpZ3fo3OK5f98nmPs5HLQ6Piy9r8IC5XM6rDq7fAWPGIzP5fD86J+46fYw
9dwO82I+b3k5gw3K53GIXOflwbSZHcrndfBTUV1itRhmH5/DnXnXOpisYOHH
77DM5Ns2KyEYX8BB5z7Hs4NuUPUNAg4vJ4ibmdTDzBN02B5z1XhRAJTfIOhQ
mCzw2Oc5TF7IYeospcBVClDzGoQcuq/ypiXN5oLKCzucCu9a+X4XNDwahB0m
Hdjw5uRLWPiIOOy953W7mJ3bAQBqfK3J
        "]], 
       Hue[0.9060679774997897, 0.6, 0.6], 
       Directive[
        PointSize[0.016666666666666666`], 
        AbsoluteThickness[1.6], 
        RGBColor[0.560181, 0.691569, 0.194885]], 
       PointBox[CompressedData["
1:eJxTTMoPSmViYGDQBGIQjR0csG9btlnKdBbDAQj/gv29/uy9/p9Zofwb9pcz
btW0m8PkH9j7uuxj7p/+Zj+E/8Tesfzqa5O9HfYQ/gt71f7vvtv2PIby39h7
HFFIOSb8Dsr/YN+dLu/1tPEtlP/JnqfVWdVf4xGU/8V+WY/zlEd/50L53+yP
ZO07XL72FtS+H/a7bOwn7w95COX/sncrmHflSeh1KP+PvZ5dzodrW7dD+f/s
38+P2/A15yDUPAaHx0v/Pa1suAzlMzqEPmC8fpzvBpTP5KA4407nsVmXoHxm
h3tTe4Tkdm6D8lkcvjEqMG/z3Qs1n9XB7qjK/Y1WF6B8NgdhbYX9lnuvQPns
Dif+3zZi8YPxORy+XbO7ceztOSif0+GA7GYh2+6jUD6XA8v6DSqPjx2B8rkd
9q1aNU274QSUz+NQ1eWwlPXtMSif18FRq0vBae8+KJ/P4V544w+j6xuhfH6H
aA/dsMIZK6B8AYeue0nh+f9mQ/gNAg4ft5lKrjpWBvWfoMObrDlvF61fBOE3
CDoUW3tZbbFfD5UXcshMfMi0rg4aHg1CDu+NlXyObtoDlRd2UEx4XJ66Yi9U
XthhS+QK/SWLd0DlRRw475ysE9y/2R4Aj6nIrg==
        "]]}, {}}, {{{}, {}, {
        Directive[
         Opacity[1.], 
         AbsoluteThickness[1.6], 
         RGBColor[0.922526, 0.385626, 0.209179]], 
        LineBox[CompressedData["
1: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
F1qKoPSZxbYz8ucir6z9rwsZ3bu6Xk2tgyHSH+djVNOF/OTJoQFmnYy675mx
1Vzd6FPuPPvGty4G555Pyc4C3UgC6Ry1Xe5iKGflvuPf2I0GnTJMXu/tZoTF
f/96Qr0bF9eQ1qaP3Yyva0tLRg50o5ylnmqz0W7GyIOKyhC9bnS4WfnluFQP
45h3fVuZXTfSu0a9LBvew7jBbOyzde9G+3/lidcW9jDeXG4b5b7djdz3rQY3
T/UwCGf62Yeiu1FcakQ/Xb+XUaA2v7Gwsht9VMpepzfXyxhLZ0lfaO5Gt4Ym
YmU39jE2SnHsWOnvRtd3nChygz6GlyBln9ZqNxqIjLt4OqiPkXKP/0grtQe1
GeVEzif1MRpWBXVvivag6UalDv6iPobauNj5XJUeFGp/TyZ5sY9hbbPZ5vT+
HnRbMKRHRrifEdEm5TSn04Me5+7Yvl2+n1FoJHv96ekeNC9Pak490M+YqFC4
pXYJ77fnTXW6aT9D/KDKnXrXHlSYFTOi7NDPOJmnHnb1Vg+KsfAk7fXpZ3gr
az4VDO1BJYJVhMoH/Yy0t/vjsp71II/nct/6Y/oZzeKHXusn9aCJwi2Coan9
DPIz7YzxzB50xexQe/7nfoYG/8nPYV97kLyyxKpXYT/DJsjgm8LPHmQvfNz4
589+RiTL+Mevvz3IqlYvP622n1F01azKoacHme4uokk09TOmhs//pUz0IP91
akry7f0MCUur9hRWD9qsqb5Y1dXP0G+y7dcm9yJnN1Md3t5+hq++49jAml6U
ESrL0YM5o9Rl9s6WXiRqrLVgirltn/uytGIvGouRpDt29zOonz25SzR7kb3y
la0SHf0MTYVb/NbavaisM3WtZ3M/wz7p9lou4150zPNKgXt9PyNKLHjTq4u9
SKb88LJIZT9jrvf3Wz3nXiT/gS/6RVE/wzhDRJXt3YsSE+w2hP7Xz/jocfFr
akgv0i2X7/6X1s8QgtSjp6N6EdNM6cT32H6GK4VZQ3zdi4zuHsvjC+tnVNdp
nsvO7kUqAbr3a7z7GQ9sKl34f/cij7fXWiqM+xkjimuX8lt7kZX6AREe1M84
vnA+yH64FzWdNtpVLNPP4Lk/8byY2IeWBzJY+TN9jEvGu6XchPpQ7CN3y+am
PkbxptsZ4hJ9iH3/kVbglz6Gf5ZQkdfePiRzJ5US6NPH6PA6d1LmeB8Koog0
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
JmD4H2uziog=
         "]]}, {
        Directive[
         Opacity[1.], 
         AbsoluteThickness[1.6], 
         RGBColor[0.922526, 0.385626, 0.209179]], 
        LineBox[CompressedData["
1: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
dg==
         "]]}}}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {-2.7438044355821907`, 9.924652358805014}}, 
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
\[Beta]=0.6\\noperator W=\\!\\(\\*UnderscriptBox[\\(\[Sum]\\), \\(i\\)]\\)\\!\
\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(x, i\\)]\\), V=\\!\\(\\*UnderscriptBox[\
\\(\[Sum]\\), \\(i\\)]\\)\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(x, i\\)]\\) \
on left half lattice\\nred: independent reference calculation\"", 
       TraditionalForm], 
     PlotRange -> {{0, 5.}, {-2.7438044355821907`, 9.924652358805014}}, 
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
                    Scaled[{0.5, 0.5}]}]]}}}, AspectRatio -> Full, ImageSize -> {\
10, 10}, PlotRangePadding -> None, ImagePadding -> Automatic, 
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
1:eJxTTMoPSmViYGDQBGIQDQOWlZs4cm4yO0B4B+x3+P+tvn2XCcq/YB8abra5
IooByr9hv5Ln8tQv+37ZQ/gP7Gcvm1y1R/wblP/E/q/ICz9Zxi9Q/gt7kf1C
eXcCYPw39sb7bq7+cvErlP/BvtB6lq+czHco/5N91M6lfScCYfwv9hVrDRdZ
JMHM/2ZfcebnyYazMPN+2Cd9VN1ZY/wZyv9lL7FmWvK7fx+h/D/2W6Mb5ukF
wvj/7LVfyV/skoHxGRwy16q/jHeB8RkdpHZIxp1fAeMzOfSLZf6oUvwE5TM7
FJ29oPKpCsZncXgiUljR0gzjszp89lhteAauns3hkcc0Ge0UmHnsDjyR2RNU
az9A+RwObUplDX9j3kP5nA7WV5Y8vR/3Dsrncjhba3i42wTG53ZYG8v+Z/4Z
GJ/HYcMxtrlPb8D08zrUx+qeDiuGmc/nsH4px5xFB2F8fofMB3msezbD+AIO
ewP9j37whfIbBBz65WLZ7zXAzBN0kLKLEFRZA7WvQdDh9RTjld5LYPYLOTSx
vFynMwuqvkHIwbZH59rmxTDzhR1Ew3cLT2+B+r9B2EHSPa8pQxwWPiIOTrOM
zttrf7IHAPdiw1c=
        "]], 
       Hue[0.9060679774997897, 0.6, 0.6], 
       Directive[
        PointSize[0.016666666666666666`], 
        AbsoluteThickness[1.6], 
        RGBColor[0.560181, 0.691569, 0.194885]], 
       PointBox[CompressedData["
1:eJxTTMoPSmViYGDQBGIQjR0csP8Y1rhp3rmr+yH8C/Y/Pomevt35EMq/YV8Y
7/f8yDUY/4E91zd7te4VN6H8J/ahx1TsPzEdh/Jf2Ae/VNk0d0oelP/G3kLs
xGnRyRvsIfwP9kEiIrHzd8+D8j/Zr1yoyxTBvBaq/ov9VompMWE5B6H8b/ZH
bSrfZIkeg/J/2H+6oHpi8rYjUP4v+9W9Ufqit/dB+X/sN25In/dt3UYo/5/9
fde5K1h9pkH5DA4tv9KYr3zqhtrP6LBVw+Lcxa4FUD6TQ0U+Q6dN8Hwon9nh
iq7I6XzjRiifxeFjuKEwV+ccqHmsDjWN2kZ85zdA+WwORqct9n902g7lszs0
9djt+8O5A8rncNikc+X2nJuboHxOh4v5JksvCS2G8rkcEi/fOPZuYQbUPm6H
NUHMjwP7FkL5PA5RXmwrLKVWQPm8Ds7cr6Yv7VwM5fM5vLG6/uacSCeUz+8g
rnwg7pDBZKj5Ag4/e7buz7RdAuE3CDhcD5GIZCmG2S/oIDf/7mT2znaovKDD
fM6uM8uNYOEh5HBtq0L85HsbIfwGIYe2sLhXyou2QeWFHSQvh6axPt4MlRd2
uLE1aap9wTKovIjDgcIy+X2t5fYA21LC9g==
        "]]}, {}}, {{{}, {}, {
        Directive[
         Opacity[1.], 
         AbsoluteThickness[1.6], 
         RGBColor[0.922526, 0.385626, 0.209179]], 
        LineBox[CompressedData["
1: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
bFpmfnWVjLIz3+UFKDDgf6JUIKQ=
         "]]}, {
        Directive[
         Opacity[1.], 
         AbsoluteThickness[1.6], 
         RGBColor[0.922526, 0.385626, 0.209179]], 
        LineBox[CompressedData["
1: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
Tr315YW/sZjuL3pxRI+MtogkSyp1xeL26kendO6Q0Y6h/z7uLY7FkedE/9tv
SkZ/8eYpMa9YTBkqE/hjRkaVPnY8jxwY+dwekT6ak5G6QPhTGfNYbFpYtsJq
yZjXrud60+dicdvtR3NfH5LRt79tZvOHGPu6vnXM6hGj/omjo8Y7Y7HM8Ucd
XbZk9OmqxmOv1Rgc2b61IeAJGZGHwvlhOAZT7Mt+qtqTkZ3WEa3bjTGYnr01
L9uRjErVnlb3JcTgHzJlQd4vyCgzghIed5bx3lRb+Z1xY+DMjWQpSUY+i62v
l16RUcnNYiFRrhjslmj1xNiTjIRSR1nP1UZjjR1bdU74kxEbq3NAg1Y07hC0
ooyHkdH8v7FE86NRWCNbhDM6gsE3+e17skAUzr9USrgWRUYCE89ZDkxG4ig/
kZniWMb8XNZ43BYZic04Sms/fWH0p2a6Z3AjAi+ubvFRzyMjV2P34V71MDw9
p+757yvDL2e0FjYbiodHn71K+M6o13BF/UFwKO5o63vGUkBGE7sUr6j2fcL5
2Z8tv5WR0WOfsFvCZiHY7f5RrX1NZCS9083WUD0Ik7uu8XNNkRHrZOnvNGt/
zNHoxZs3TUbPZeSGllf9MHPldy7TWTJi36XuJcTvh+dyxViLF8hIaUOhquOY
D255NzzvsMrQH6la8NfeE4eq27eMcvAhd7n8L1/tXLHkt6CPlbv4kMuOjDMC
zZK44pFV9k0JPlTQZWKmbq8AZpLna8f38CGmbxLisl/V4HPgMivvPkaccOv1
y4lbIGV1y+qyHB8SFpTOX/38EPbt3nmu6yQfOnbLm8xm5AIyfqnzE7p86Bk/
W4Z6mz8cMiq9yOfJhxSV1/bskosC0dihYyVefCjvJ69knFMUMA+ySdh586H4
mx5J3BVRUGOittrlx4cMXG57+OlHg4l5bWLiBz5Epvr/kfGKgeBH7QQUy4cu
COsuhnXEwbLzRJYl5kNOfyT8NHSToLeAJ0K8kA+h8s0P1z4lQRlB1qupiA+Z
P+W+bdaXBO9eWt85VsaHZMW/FZhYfAHp14skYjUfemjCWd7tmAy3fAkmYR18
qIG7Lv+JTyoUhAoKVy3woan1tqQMhQzQDOsWN1zkQ4ctZFh7LmZAZ1jcvqUl
PoSN5ba3mWcAPfwQ7FrlQ62HfNTkIzNgf5SOiRMzBZFt5YSsiZkQEheYLc1L
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
0zONeT++8yb5//8TQJZHRm/Qo3c/7g9K1w==
         "]]}}}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {-0.5574669377992746, 2.4811630897012518`}}, 
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
\[Beta]=0.6\\noperator W=\\!\\(\\*UnderscriptBox[\\(\[Sum]\\), \\(i\\)]\\)\\!\
\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(x, i\\)]\\), V=\\!\\(\\*UnderscriptBox[\
\\(\[Sum]\\), \\(i\\)]\\)\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(x, i\\)]\\) \
on left half lattice\\nred: independent reference calculation\"", 
       TraditionalForm], 
     PlotRange -> {{0, 5.}, {-0.5574669377992746, 2.4811630897012518`}}, 
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
        LineBox[{{0., 1.}, {1., 8.}, {2., 6.}, {3., 6.}, {4., 4.}, {5., 
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
        LineBox[{{0., 1.}, {1., 4.}, {2., 12.}, {3., 10.}, {4., 4.}, {5., 
         1.}}]}, {
        Hue[0.1421359549995791, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 1]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 12.}, {4., 4.}, {5., 
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
W=\\!\\(\\*UnderscriptBox[\\(\[Sum]\\), \\(i\\)]\\)\\!\\(\\*SubscriptBox[\\(\
\[Sigma]\\), \\(x, i\\)]\\), V=\\!\\(\\*UnderscriptBox[\\(\[Sum]\\), \\(i\\)]\
\\)\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(x, i\\)]\\) on left half \
lattice\"", TraditionalForm], PlotRange -> {{0, 5.}, {0, 16.}}, 
     PlotRangeClipping -> True, PlotRangePadding -> {{
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
        LineBox[{{0., 1.}, {1., 2.}, {2., 1.}, {3., 1.}, {4., 1.}, {5., 
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
        LineBox[{{0., 1.}, {1., 4.}, {2., 8.}, {3., 4.}, {4., 3.}, {5., 
         1.}}]}, {
        Hue[0.1421359549995791, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 1]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 14.}, {3., 10.}, {4., 4.}, {5., 
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
with\\nJ=1, h=1/2, g=-1, L=5, \[Beta]=0.6\\noperator \
W=\\!\\(\\*UnderscriptBox[\\(\[Sum]\\), \\(i\\)]\\)\\!\\(\\*SubscriptBox[\\(\
\[Sigma]\\), \\(x, i\\)]\\), V=\\!\\(\\*UnderscriptBox[\\(\[Sum]\\), \\(i\\)]\
\\)\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(x, i\\)]\\) on left half \
lattice\"", TraditionalForm], PlotRange -> {{0, 5.}, {0, 16.}}, 
     PlotRangeClipping -> True, PlotRangePadding -> {{
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
Cell[10683, 345, 336, 9, 31, "Input"],
Cell[11022, 356, 315, 8, 31, "Input"],
Cell[11340, 366, 144, 4, 31, "Input"],
Cell[CellGroupData[{
Cell[11509, 374, 309, 8, 52, "Input"],
Cell[11821, 384, 291, 7, 31, "Output"],
Cell[12115, 393, 50, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12202, 399, 265, 8, 31, "Input"],
Cell[12470, 409, 62, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12569, 415, 319, 9, 52, "Input"],
Cell[12891, 426, 51, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12979, 432, 315, 9, 52, "Input"],
Cell[13297, 443, 51, 1, 31, "Output"]
}, Open  ]],
Cell[13363, 447, 102, 2, 31, "Input"],
Cell[CellGroupData[{
Cell[13490, 453, 1100, 33, 55, "Input"],
Cell[14593, 488, 293, 7, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14923, 500, 795, 24, 33, "Input"],
Cell[15721, 526, 62, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15820, 532, 596, 19, 87, "Input"],
Cell[16419, 553, 28, 0, 31, "Output"],
Cell[16450, 555, 28, 0, 31, "Output"]
}, Open  ]],
Cell[16493, 558, 1274, 39, 72, "Input"],
Cell[17770, 599, 1238, 38, 33, "Input"],
Cell[CellGroupData[{
Cell[19033, 641, 307, 8, 54, "Input"],
Cell[19343, 651, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[19430, 656, 252, 7, 54, "Input"],
Cell[19685, 665, 49, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[19771, 670, 445, 13, 52, "Input"],
Cell[20219, 685, 51, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20307, 690, 439, 13, 54, "Input"],
Cell[20749, 705, 51, 0, 31, "Output"]
}, Open  ]],
Cell[20815, 708, 964, 21, 69, "Input"],
Cell[21782, 731, 329, 10, 31, "Input"],
Cell[CellGroupData[{
Cell[22136, 745, 2778, 79, 92, "Input"],
Cell[24917, 826, 59214, 1036, 303, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[84168, 1867, 2768, 79, 97, "Input"],
Cell[86939, 1948, 57820, 1013, 303, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[144808, 2967, 45, 0, 43, "Subsection"],
Cell[144856, 2969, 213, 7, 31, "Input"],
Cell[CellGroupData[{
Cell[145094, 2980, 3109, 86, 137, "Input"],
Cell[148206, 3068, 27953, 594, 343, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[176196, 3667, 3018, 84, 137, "Input"],
Cell[179217, 3753, 27849, 593, 340, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[207115, 4352, 49, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[207189, 4356, 718, 22, 54, "Input"],
Cell[207910, 4380, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[207977, 4385, 985, 28, 55, "Input"],
Cell[208965, 4415, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[209032, 4420, 863, 25, 54, "Input"],
Cell[209898, 4447, 30, 0, 31, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature AxpTbJfZON63SCguCgPsueCF *)
