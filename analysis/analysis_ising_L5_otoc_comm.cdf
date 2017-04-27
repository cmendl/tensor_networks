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
NotebookDataLength[    146254,       3283]
NotebookOptionsPosition[    143560,       3172]
NotebookOutlinePosition[    143903,       3187]
CellTagsIndexPosition[    143860,       3184]
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
  RowBox[{"Comm", "[", 
   RowBox[{"A_", ",", "B_"}], "]"}], ":=", 
  RowBox[{
   RowBox[{"A", ".", "B"}], "-", 
   RowBox[{"B", ".", "A"}]}]}]], "Input"],

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
  RowBox[{"GFcomm", "[", 
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
      RowBox[{"exp\[Beta]H", ".", 
       RowBox[{"Comm", "[", 
        RowBox[{"At", ",", "B"}], "]"}]}], "]"}], 
     RowBox[{"Tr", "[", "exp\[Beta]H", "]"}]]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"OTOComm", "[", 
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
          RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", "H"}], "]"}]}]}], 
      ",", "AtB"}], "}"}], ",", 
    RowBox[{
     RowBox[{"AtB", "=", 
      RowBox[{"Comm", "[", 
       RowBox[{"At", ",", "B"}], "]"}]}], ";", 
     FractionBox[
      RowBox[{"Tr", "[", 
       RowBox[{"exp\[Beta]H", ".", "AtB", ".", "AtB"}], "]"}], 
      RowBox[{"Tr", "[", "exp\[Beta]H", "]"}]]}]}], "]"}]}]], "Input"],

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
     SubscriptBox["L", "val"], "]"}], "<>", "\"\<_otoc_comm/ising_L\>\"", "<>", 
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
   RowBox[{"-", "0.18465144873988093`"}], ",", 
   RowBox[{"-", "0.04283305946893597`"}], ",", 
   RowBox[{"-", "0.133392407164477`"}], ",", 
   RowBox[{"-", "0.04283720932113697`"}], ",", 
   RowBox[{"-", "0.1846514252150324`"}]}], "}"}]], "Output"],

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
        RowBox[{"OTOComm", "[", 
         RowBox[{"V", ",", "V", ",", "HI", ",", "\[Beta]", ",", "t"}], "]"}], 
        ",", 
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
        RowBox[{"GFcomm", "[", 
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

Cell[BoxData["4.157741436361384`*^-6"], "Output"]
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

Cell[BoxData["0.000015721200422377012`"], "Output"]
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

Cell[BoxData["0.00006850093838209871`"], "Output"]
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
        "\"\<\[LeftAngleBracket][W(t),V(0)\!\(\*SuperscriptBox[\(]\), \
\(2\)]\)\!\(\*SubscriptBox[\(\[RightAngleBracket]\), \(\[Beta]\)]\)\>\""}], 
       "}"}]}], ",", 
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
1:eJxTTMoPSmViYGDQBGIQjR0csJ8UaLIjdSHrAQj/gv3qgzPkrocqQvk37Jfl
VKWV7tOG8h/Ys5X8UuvRNYDyn9j7+y4Oj1mhD+W/sM9REhZm6ICpf2P/MuXU
crVVqlD+B/sMeym5+n3yUP4nez3tFEO5e+JQ/hd79iObl3k8EIXyv9lfMFF9
GVEnCeX/sFeUkvT9A9f/y/7tDeMDpvFKUP4fe91P2f9CjZSh/H/2EwNcJsVn
wOQZHO76KH/dHq8A5TM6iBUs1LgsKg3lMzmk9v+r+NsHs5/ZYeOvCYL31YWg
fBaH8F6fkIg1glA+q4Nv/cJdR/qEoXw2hzD7lMKoU2JQPrtDsVBvN4uhFJTP
4RD778Ee73QZKJ/ToVXt5/vGeTA+l4P5jrLgJ+4w93A7yO7Ydi63FOZ/HocK
zS3/GXbDwovXIfb5vQs2BjD7+BwCjO/HW6nB3M/vkChYeN9DCMYXcEiLlU35
dQ/KbxBwkBE5E1r5FKZf0OFv1ZYX9zug5jcIOogwPpur0gKzT8jhllXU2uZL
UPUNQg6azu+/7toMM1/Y4UhSu+7OQyJQeWGHIoblR5n2QfkMIg4Xbkyx/sQu
dgAAeyKzmA==
        "]], 
       Hue[0.9060679774997897, 0.6, 0.6], 
       Directive[
        PointSize[0.016666666666666666`], 
        AbsoluteThickness[1.6], 
        RGBColor[0.560181, 0.691569, 0.194885]], 
       PointBox[CompressedData["
1:eJxTTMoPSmViYGDQBGIQjR0csA/a93ltx9y1dhD+Bfu9EUdjDbquQfk37Oe+
L8gUlHsG5T+wdy4JmGPv+hDKf2J/d+q1eZ1Xr+2D8F/Yz7ZwXvFswQ8o/429
bd0PhV01jPsh/A/2TQplyt/n/YXKf7KPTojodAx4AeV/sX+0crLCHn+Y+d/s
1zBEiB1n/wnl/7C3rD3cVNvyH8r/Zf9y1/FGPudfUP4feyvldy6Kxa+g/H/2
X/jP+8f/WwDlMzhoHim0eCUKcy+jQ1zmnl1TX1yE8pkcFp0vvecXtQqqntlh
5/M5V+IkH0D5LA7LFqms2m35Fspndfh4e8V204aPUD6bw6HJZvMmO32A8tkd
9jVox0/ueAHlczi4zNZawnH1KpTP6ZDV0fTzZ+J1qP1cDn7dU6JMtGDhx+3Q
kPCBN0OPAxp+PA7/l8Te/1MgAOXzOiwrKU45+5IXyudzuCh18FmVKgOUz+9Q
LKAhz7rtEtQ8AQdJf5cXp31uQ+xvEHA4KnxeZkPmRah7BB0+LZ3P9nTaZYj6
BkGHFXH1yX49n6H6hRzYP4dtnv6BCWJ+g5DDjBULjsuocEHtE3aQWSiXvb2C
Gyov7KBTvGyd51I2qLyIQ8Hvu0dKtf7tAwASZcVk
        "]]}, {}}, {{{}, {}, {
        Directive[
         Opacity[1.], 
         AbsoluteThickness[1.6], 
         RGBColor[0.922526, 0.385626, 0.209179]], 
        LineBox[CompressedData["
1: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
ol7sBxbAkkS7lA==
         "]]}, {
        Directive[
         Opacity[1.], 
         AbsoluteThickness[1.6], 
         RGBColor[0.922526, 0.385626, 0.209179]], 
        LineBox[CompressedData["
1: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
guWSqKDm76F/W1s8CJkk6Uk8bAT/A5DlkFg=
         "]]}}}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {-16.177919803758435`, 0.000030057468550446032`}},
      DisplayFunction -> Identity, AspectRatio -> 
     NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> {True, True}, 
     AxesLabel -> {
       FormBox["\"t\"", TraditionalForm], 
       FormBox[
       "\"\[LeftAngleBracket][W(t),V(0)\\!\\(\\*SuperscriptBox[\\(]\\), \
\\(2\\)]\\)\\!\\(\\*SubscriptBox[\\(\[RightAngleBracket]\\), \
\\(\[Beta]\\)]\\)\"", TraditionalForm]}, AxesOrigin -> {0, 0}, 
     DisplayFunction :> Identity, Frame -> {{False, False}, {False, False}}, 
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
     PlotRange -> {{0, 5.}, {-16.177919803758435`, 0.000030057468550446032`}},
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
        "\"\<\[LeftAngleBracket][W(t),V(0)]\!\(\*SubscriptBox[\(\
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
1:eJxTTMoPSmViYGDQBGIQDQNlEcstFwSk74HwDthHnu1cOEd0xz4I/4L91p2N
zO+fXYDyb9grxz2JzLe8COU/sPcQCjgr5b7cDsJ/Ys+XZNd5ZfMjKP+FfRTz
7n128z9A+W/sv64+8WPRlY9Q/gf7FYfOLhad9gLK/2T/5YqjyqGF56H8L/ZZ
/3i3Zu7cA7Xvm73YvAVnjsQcgvJ/2Bvwmlp0noLZ/8veasLPH5orTkL5f+w/
Hru/Yd7zA1D+P/uKQ3Urvr04CNXP4DDPwNBhfv1tKJ/RIWCBQY+M10Mon8nB
RIF3r2P8LSif2aFIfYHr54wjUD6Lw9wtk9qDNk6Fms/qsGSdUGnfHBeoPJuD
SEpIkfrJk1A+u8OTnrKm9zZ3oHwOh8g36xfX7HwE5XM67Jtve2GB82Mon8th
hucmByM+mDy3g/HidZOqtGB8Hof44qc+JnufQPm8DkUOeYbPzV5A+XwOdiEf
FPh2vYTy+R3OVC1S31T9HMoXcHjx1L2yIAhqXoOAw/er0YsUE2D+FXR4yp/s
mrTqKlRe0IFzsemfArvrUHkhB4m8DV2rlkPVNwg5WDno8/wWhOkXdrjeqVKw
6fElqLywg3I7S6Dtzb1QeRGHql/nOzU2LrMDAELi0EY=
        "]], 
       Hue[0.9060679774997897, 0.6, 0.6], 
       Directive[
        PointSize[0.016666666666666666`], 
        AbsoluteThickness[1.6], 
        RGBColor[0.560181, 0.691569, 0.194885]], 
       PointBox[CompressedData["
1:eJxTTMoPSmViYGDQBGIQjR0csGdSrI1ceu7pfgj/gr255ZQPlzs/Qvk37Feb
zRPacQ3Gf2D/7e4C1swVL6H8J/aPKzcs6WK6DuW/sOcw+fzMprQOyn9jzzzr
/+GUKQfsIfwP9hc8d6YYHF0H5X+ytysoKz/3ew9U/Rf7tax7H7ZkXYTyv9mr
fzuU+F/4GpT/wz63o0B249YrUP4v+027xU7w3ToH5f+xfzkvN4xj3UEo/5/9
pcOM7yTclkH5DA7mpXdbOdnmQO1ndFi33PV52cQNUD6TQ/00IT3u5PVQPrND
uoJB7LqQiVA+i4PkqROXHCvXQM1jdfj3cHLgstMHoHw2h9ObLdwDHI5D+ewO
Zsr1d505TkD5HA5tzh8unrpxCMrndDiiMYl7ntBmKJ/L4Ubp+dQrMyqg9nE7
lNv43t7cuxHK53E4JXfziYjUDiif18GZU7hdtWszlM/n4L3y0ZXtEjOhfH6H
a/f/3J6ntxhqvoDDvgu3/my22QLhNwg4cAQIXftXBLNf0GFV2+WJ57unQ+UF
HT7+fLW8ygAWHkIOHbKvz0jcOwjhNwg5zO/jrf+88BhUXthhu99MDePHh6Hy
wg693FbvVAu3QeVFHNTvmdlM7223BwAv6MpG
        "]]}, {}}, {{{}, {}, {
        Directive[
         Opacity[1.], 
         AbsoluteThickness[1.6], 
         RGBColor[0.922526, 0.385626, 0.209179]], 
        LineBox[CompressedData["
1:eJwVkGk8lAkcgOdIUeN85VdyTMdaoVIh8ef9dw5R9oqUNaYS7VazDS3bzJbJ
kMGQZq2kMSOjdJBNWfKGSiVhxbZt1y/KUYMig8m57Yfn93x6vjzzd/K/CWfQ
aLTQz/xvxZGd05fvFnrTaI0XuY5hlbnbez2C2MEk+2T2k6m1XtTTzckCNnsv
WTPwftXEc38qhhNspMf+hYSqrMgU4xBqYy2GjNhKSXOp/lie8Aeq6JhLfL9t
NqndPWplFBFDtfOKLfpsL5Cl2siDsmQxJfz6x7Ae2wrSJyD44oixiDL4lPNg
39J6cq9iRYJckgkHbx9N7RW0knbSNIaX9RVYqpY/ulb8lIzvkdSuV1yHzi2R
Vq/c28itriqu+lEpZFkmWueFvSG1ckvB1LPrsFpQfoXZ0EVeupW7ydH5D7jz
JOcr/pca0oIvs0uqzYPlqZPec3z7SJFicOY1HwFwujxeOQf1k3Uc7+3ziVSq
e0nZBm3vANmyJyjc4nkEJRyXrqQOD5Lu5g2cZOscmGH6du93DkOkq2fzr169
MtBr1OPMujlMhkxs4W6THIaxpqJ9Jw/qyKFyl4iItCzoDCqea2MzSnKd/I3/
uCeHNUkH9tcVjZE72vmPpQIxZE6WG6zjTpDu3DQjv4xE2GF1x//F4CRZcSPP
+5ZaDqwax94FW2nYoe9fK08rhHDXs0PBTnQcEKrVq9eUQHLabONfl9HRk2vE
5uuXQHF3kr1qBR3Xl3TKyhRXYDibv6PLnY5KlWd419ViSJqEW4INdPxSsir+
bsNluHj/SWpKKB1FT/cfyawvhPfBhotunqBj5/06sVWACsxK47za5HRkjWue
t6cowY2lDWRm0bH2UEzzv7/kwtGqZ1JfBR2XFn4U2gadAZOFhR8eX6Djp4sD
L8wtT8GK3rWV72/Tcdp3Nr+nl6ZDzJHYb9hDdJQEMoTdc74C+14R67iOjs7p
Bf0mL63g32Dxvb4xOlqmaGve7fOh3F2TPSoZDCypjjU0IkIoXU/OgkATBjbH
NKz6UBhIHQ6u/pjiyEBaEqe9J3DK84jLdPkIj4EhgzYWNssOQYJG3trUxMBL
i6PuHSqQg7+DcSHrNBPjdLckZ8V7QVbkVuPPm4ZKs5/Pc8SJVP23+ePRq/Xw
7bI25tvzPKhp5Kc6MafjcMI7m9b1GXD1BzE2vJyOfz+ImhxlngcbP9L9wLUZ
WHp53MDdtwTWTYXEK0X6ODdE4NayJAd2/1P9sXyrAZ4amu+XufEA5S0+dp3H
nom1JnLZhCoDTvIHKlndM7FAY8/QFMTC67iCLmXVLHTucDnglKiAnvCK3beP
s/A3udO5387HQP9+sxmNPEMMdDZL7neTUsW+D8f3LDFCWhx3Z7a6ybMr0tmN
OWSEQom1/wtxJmV56Zn8eKMx6uLGvidrY6n4MMHZRj8TnBpb6KmZxaNGxufK
/CpMsCXdLWyeXELZV2Zl1y8yRVRw6jTHuOC6626AqdQU17etZBquU0HNmdlz
GoZM0dH+sqHP/CSwr5mdvGWHGV4tszfgbjsNm/V6rVuqzNBoycEvNqkyqP7n
HXceOBBYFv36btOjQop/RkZI0wl0DnmvbG2JhAb6og+bMgj8qW1rggf3J3CI
uFHPkhOYpBEWNgdEQ8fybvGJ3wmM/atCv9pWBNvuY3+WgkCPV0pB258JsPbj
YMO5SwSyixdcDrA5CRY+2xNr7xNo6+vy9tvQXIgq6uclPiAwlFdwr5KuhGaz
414+Dwlcq6vOK1cpIeVlqfZhE4Hlfqz2xEgV0KIMd7U+JrDbzmWfmygPNIoa
8vWbz30u8/U8u3zgMIPmqTsJ1IqaJWe35IM6sm84vJtAJz1Mc4rOB+5Ky+J3
GgIdZJbGc8vy4e+6KKuBAQIZjzdwRwg1LF86U3d18POP7SWNsFANaXJVa/QQ
ga5HOywWLFODb2hjsk5H4GLbm1GnQQ3n7uzac2OUwI6gH9Xm3mqYtnh0jWic
wIkLw+/GPdXASzth7T1JoKX2TctGNzVUDdp9mpoi8JV5eV+nkxr+A3koveM=

         "]]}, {
        Directive[
         Opacity[1.], 
         AbsoluteThickness[1.6], 
         RGBColor[0.922526, 0.385626, 0.209179]], 
        LineBox[CompressedData["
1:eJwUV3c41e8bdoxjHRzHSPItJMmKqDSft0RCoqKSJIQoSZKMpCTJaiplZESy
jr3ymodk751s2euQkd/5/fW57ut53+e572d9rlfC/PbZ68xMTExSrExM//+G
PTQnKlu6HWViSsXj22MLw40nDl4QvwSPZEz3zpk+wR2n/RzFxW8A+t5jcOrS
a3z/5CVeNvEH4KA/sSysF401y5DJ0rbnoFayhXh2fzpOeqz6ZGbbB0iUUhRv
Zy/Fv68lC09u+wqePK3NE5GN+E/0hsXE6Fe4qqWXvKDYhOeG9Knj1ASw33Yx
0rugCbPazuv8UU+Ehztta9Vam7G0o5rXiHUKjJ3wO9/K0ob3Hfu9ONOWBv6/
60SIJ7uwm4Gd2fi2XNBi4fESS/+N/z3Zt/mXfy68zEnzH6P/xo+yCI2Nf3Oh
5F6J1pWD/dh7y3v1vKY86AuY1thX1I8Dh8qknz8rgF2/5D0/VQzgyAdbJ6Wn
McQZfTj+rWwI87cunOVRLILeo8oj75iH8dnbxrufWRYB6eQd7m1oGLd83jHq
2lAE+kdyNZnzhnEnseCS+bdi8LUTSmf+OoIH6kcPK18thYBtljkmd8ewlK3e
5m9vS+FNft1YacIYtmLJWJSqLoXPQRK233+P4dG9nskiB8qg6vrJn5Z6f/BE
qJA4k0A5uDhpHbwrOY7plsdZ6mg0IN98Ks6UOYH3/4v7pbVOgx+HvzTC0AR2
CeEpKFGpgLdXxqPYhSbx6o92p6zICrghlMavcHcSM+2+PRzmWglCHL1nv++a
wpx/P/64qVgF2tpCuZae01jtWYer9rUqcJG09NsdO41thDbJy7ypglKxoHXf
qmlMU34VOPC3Cj6oa3TNcc5gb1vfc8blP4Ff/+TSR/0ZnLFczqq2/BMmV0Rj
M67N4AEfliwhuWq4TJsMfuU4g49HPxRpCK6GTM3Nm8Nez2CmbqeekyY1kBKt
/nWocQYr2aYF7giqgfuc1awS/TP46vI0sJTUwMUIyxfbZmdwoaBdVOHOWpAe
0CNf553FbqevWe+dr4UTXqVZXJqzOKErXERAug4ktz6XuXhuFnfe6P4xc7EO
IlZup1mZzWI1nwvyiYV1sGdlFxvtwSy2EXzb83y2DmSvHTsl7DOLdQ1uVKhQ
6mFyIyZlJZjh/9cXF36Neij6fNpPKHYWv/qiYfDItB7UVCetSpMZ8W4N7pq+
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
//8TQGZHRm/Qo4c/vkuHmw==
         "]]}}}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {-1.1149216391817542`, 0.17681735709912957`}}, 
     DisplayFunction -> Identity, AspectRatio -> 
     NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> {True, True}, 
     AxesLabel -> {
       FormBox["\"t\"", TraditionalForm], 
       FormBox[
       "\"\[LeftAngleBracket][W(t),V(0)]\\!\\(\\*SubscriptBox[\\(\
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
     PlotRange -> {{0, 5.}, {-1.1149216391817542`, 0.17681735709912957`}}, 
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
    RowBox[{"W", "'"}], " ", "operator"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Partition", "[", 
     RowBox[{
      RowBox[{"Import", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["fn", "import"], "<>", "\"\<_DXW.dat\>\""}], ",", 
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
       "\"\<j\>\"", ",", "\"\<\!\(\*SubscriptBox[\(D\), \(W, j\)]\)(t)\>\""}],
        "}"}]}], ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", 
      RowBox[{
      "\"\<virtual bond dimension of \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[ImaginaryI]\)\\\ H\\\ t\)]\) \
W(0) \!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\[ImaginaryI]\\\ H\\\ t\)]\)\
\\n\>\"", "<>", 
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
       SubscriptBox["fn", "export"], "<>", "\"\<DW_L\>\"", "<>", 
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
       "\"\\!\\(\\*SubscriptBox[\\(D\\), \\(W, j\\)]\\)(t)\"", 
        TraditionalForm]}, AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], Method -> {}, PlotLabel -> 
     FormBox["\"virtual bond dimension of \\!\\(\\*SuperscriptBox[\\(\
\[ExponentialE]\\), \\(\\(-\[ImaginaryI]\\)\\\\ H\\\\ t\\)]\\) W(0) \
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
      RowBox[{"-", "\[Beta]"}], " ", "H"}]], " ", "W", 
    RowBox[{"(", "0", ")"}], " ", 
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
         SubscriptBox["fn", "import"], "<>", "\"\<_tol_eff_W.dat\>\""}], ",", 
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
Cell[7794, 256, 178, 6, 31, "Input"],
Cell[7975, 264, 485, 14, 48, "Input"],
Cell[8463, 280, 880, 25, 48, "Input"],
Cell[9346, 307, 963, 27, 48, "Input"],
Cell[10312, 336, 392, 10, 33, "Input"],
Cell[10707, 348, 336, 9, 31, "Input"],
Cell[11046, 359, 320, 8, 31, "Input"],
Cell[11369, 369, 144, 4, 31, "Input"],
Cell[CellGroupData[{
Cell[11538, 377, 309, 8, 52, "Input"],
Cell[11850, 387, 290, 7, 31, "Output"],
Cell[12143, 396, 50, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12230, 402, 265, 8, 31, "Input"],
Cell[12498, 412, 62, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12597, 418, 319, 9, 52, "Input"],
Cell[12919, 429, 51, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13007, 435, 315, 9, 52, "Input"],
Cell[13325, 446, 51, 1, 31, "Output"]
}, Open  ]],
Cell[13391, 450, 102, 2, 31, "Input"],
Cell[CellGroupData[{
Cell[13518, 456, 1100, 33, 55, "Input"],
Cell[14621, 491, 293, 7, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14951, 503, 795, 24, 33, "Input"],
Cell[15749, 529, 62, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15848, 535, 596, 19, 87, "Input"],
Cell[16447, 556, 28, 0, 31, "Output"],
Cell[16478, 558, 28, 0, 31, "Output"]
}, Open  ]],
Cell[16521, 561, 1245, 38, 72, "Input"],
Cell[17769, 601, 1242, 38, 76, "Input"],
Cell[CellGroupData[{
Cell[19036, 643, 307, 8, 54, "Input"],
Cell[19346, 653, 49, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[19432, 658, 252, 7, 54, "Input"],
Cell[19687, 667, 49, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[19773, 672, 445, 13, 52, "Input"],
Cell[20221, 687, 51, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20309, 692, 439, 13, 54, "Input"],
Cell[20751, 707, 50, 0, 31, "Output"]
}, Open  ]],
Cell[20816, 710, 964, 21, 69, "Input"],
Cell[21783, 733, 329, 10, 31, "Input"],
Cell[CellGroupData[{
Cell[22137, 747, 2813, 80, 98, "Input"],
Cell[24953, 829, 44797, 799, 315, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[69787, 1633, 2760, 79, 97, "Input"],
Cell[72550, 1714, 37918, 687, 315, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[110517, 2407, 45, 0, 43, "Subsection"],
Cell[110565, 2409, 213, 7, 31, "Input"],
Cell[CellGroupData[{
Cell[110803, 2420, 2988, 84, 137, "Input"],
Cell[113794, 2506, 27809, 592, 336, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[141652, 3104, 49, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[141726, 3108, 718, 22, 54, "Input"],
Cell[142447, 3132, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[142514, 3137, 973, 28, 54, "Input"],
Cell[143490, 3167, 30, 0, 31, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature fvpifADhUKvg0AwfyeJsXdzX *)
