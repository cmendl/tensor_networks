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
NotebookDataLength[    251965,       5360]
NotebookOptionsPosition[    248715,       5231]
NotebookOutlinePosition[    249058,       5246]
CellTagsIndexPosition[    249015,       5243]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Bose-Hubbard model simulation", "Section"],

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

Cell[BoxData[{
 RowBox[{
  RowBox[{"SiteCreateOp", "[", "M_", "]"}], ":=", 
  RowBox[{"DiagonalMatrix", "[", 
   RowBox[{
    RowBox[{"Sqrt", "[", 
     RowBox[{"Range", "[", 
      RowBox[{"1", ",", "M"}], "]"}], "]"}], ",", 
    RowBox[{"-", "1"}]}], "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"SiteAnnihilOp", "[", "M_", "]"}], ":=", 
  RowBox[{"DiagonalMatrix", "[", 
   RowBox[{
    RowBox[{"Sqrt", "[", 
     RowBox[{"Range", "[", 
      RowBox[{"1", ",", "M"}], "]"}], "]"}], ",", "1"}], "]"}]}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"NumberOp", "[", "M_", "]"}], ":=", 
  RowBox[{"DiagonalMatrix", "[", 
   RowBox[{"Range", "[", 
    RowBox[{"0", ",", "M"}], "]"}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"construct", " ", "Bose"}], "-", 
    RowBox[{
    "Hamiltonian", " ", "with", " ", "open", " ", "boundary", " ", 
     "conditions"}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"HBoseHubbard", "[", 
     RowBox[{"t_", ",", "U_", ",", "\[Mu]_", ",", "M_", ",", "1"}], "]"}], ":=", 
    RowBox[{
     RowBox[{
      FractionBox["U", "2"], 
      RowBox[{
       RowBox[{"NumberOp", "[", "M", "]"}], ".", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"NumberOp", "[", "M", "]"}], "-", 
         RowBox[{"IdentityMatrix", "[", 
          RowBox[{"M", "+", "1"}], "]"}]}], ")"}]}]}], "-", 
     RowBox[{"\[Mu]", " ", 
      RowBox[{"NumberOp", "[", "M", "]"}]}]}]}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"HBoseHubbard", "[", 
     RowBox[{"t_", ",", "U_", ",", "\[Mu]_", ",", "M_", ",", "L_"}], "]"}], ":=", 
    RowBox[{
     RowBox[{
      RowBox[{"-", "t"}], " ", 
      RowBox[{"Sum", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"KroneckerProduct", "[", 
          RowBox[{
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"M", "+", "1"}], ")"}], 
             RowBox[{"j", "-", "1"}]], "]"}], ",", 
           RowBox[{"SiteCreateOp", "[", "M", "]"}], ",", 
           RowBox[{"SiteAnnihilOp", "[", "M", "]"}], ",", 
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"M", "+", "1"}], ")"}], 
             RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}], "+", 
         RowBox[{"KroneckerProduct", "[", 
          RowBox[{
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"M", "+", "1"}], ")"}], 
             RowBox[{"j", "-", "1"}]], "]"}], ",", 
           RowBox[{"SiteAnnihilOp", "[", "M", "]"}], ",", 
           RowBox[{"SiteCreateOp", "[", "M", "]"}], ",", 
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"M", "+", "1"}], ")"}], 
             RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}]}], ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", "1", ",", 
          RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}], "+", 
     RowBox[{"Sum", "[", 
      RowBox[{
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         RowBox[{"SparseIdentityMatrix", "[", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"M", "+", "1"}], ")"}], 
           RowBox[{"j", "-", "1"}]], "]"}], ",", 
         RowBox[{
          RowBox[{
           FractionBox["U", "2"], 
           RowBox[{
            RowBox[{"NumberOp", "[", "M", "]"}], ".", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"NumberOp", "[", "M", "]"}], "-", 
              RowBox[{"IdentityMatrix", "[", 
               RowBox[{"M", "+", "1"}], "]"}]}], ")"}]}]}], "-", 
          RowBox[{"\[Mu]", " ", 
           RowBox[{"NumberOp", "[", "M", "]"}]}]}], ",", 
         RowBox[{"SparseIdentityMatrix", "[", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"M", "+", "1"}], ")"}], 
           RowBox[{"L", "-", "j"}]], "]"}]}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "1", ",", "L"}], "}"}]}], "]"}]}]}]}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Simulation parameters", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"kinetic", " ", "hopping", " ", "parameter"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["tH", "val"], "=", "1"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"interaction", " ", "strength"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["U", "val"], "=", "5"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"chemical", " ", "potential"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["\[Mu]", "val"], "=", 
    FractionBox["1", "7"]}], ";"}]}]], "Input"],

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
   RowBox[{
    RowBox[{
    "single", " ", "site", " ", "occupation", " ", "number", " ", "cut"}], 
    "-", "off"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["M", "val"], "=", "2"}], ";"}]}]], "Input"],

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
         RowBox[{
          RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", "H"}], "]"}], ".", 
        "A", ".", 
        RowBox[{"MatrixExp", "[", 
         RowBox[{"\[ImaginaryI]", " ", "t", " ", "H"}], "]"}]}]}]}], "}"}], 
    ",", 
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
         RowBox[{
          RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", "H"}], "]"}], ".", 
        "A", ".", 
        RowBox[{"MatrixExp", "[", 
         RowBox[{"\[ImaginaryI]", " ", "t", " ", "H"}], "]"}]}]}], ",", 
      RowBox[{"Ct", "=", 
       RowBox[{
        RowBox[{"MatrixExp", "[", 
         RowBox[{
          RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", "H"}], "]"}], ".", 
        "C", ".", 
        RowBox[{"MatrixExp", "[", 
         RowBox[{"\[ImaginaryI]", " ", "t", " ", "H"}], "]"}]}]}]}], "}"}], 
    ",", 
    FractionBox[
     RowBox[{"Tr", "[", 
      RowBox[{"exp\[Beta]H", ".", "At", ".", "B", ".", "Ct", ".", "D"}], 
      "]"}], 
     RowBox[{"Tr", "[", "exp\[Beta]H", "]"}]]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SiteCreateOpFull", "[", 
   RowBox[{"j_", ",", "M_", ",", "L_"}], "]"}], ":=", 
  RowBox[{"KroneckerProduct", "[", 
   RowBox[{
    RowBox[{"SparseIdentityMatrix", "[", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"M", "+", "1"}], ")"}], "j"], "]"}], ",", 
    RowBox[{"SiteCreateOp", "[", "M", "]"}], ",", 
    RowBox[{"SparseIdentityMatrix", "[", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"M", "+", "1"}], ")"}], 
      RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SiteAnnihilOpFull", "[", 
   RowBox[{"j_", ",", "M_", ",", "L_"}], "]"}], ":=", 
  RowBox[{"KroneckerProduct", "[", 
   RowBox[{
    RowBox[{"SparseIdentityMatrix", "[", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"M", "+", "1"}], ")"}], "j"], "]"}], ",", 
    RowBox[{"SiteAnnihilOp", "[", "M", "]"}], ",", 
    RowBox[{"SparseIdentityMatrix", "[", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"M", "+", "1"}], ")"}], 
      RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SiteNumberOpFull", "[", 
   RowBox[{"j_", ",", "M_", ",", "L_"}], "]"}], ":=", 
  RowBox[{"KroneckerProduct", "[", 
   RowBox[{
    RowBox[{"SparseIdentityMatrix", "[", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"M", "+", "1"}], ")"}], "j"], "]"}], ",", 
    RowBox[{"NumberOp", "[", "M", "]"}], ",", 
    RowBox[{"SparseIdentityMatrix", "[", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"M", "+", "1"}], ")"}], 
      RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["fn", "import"], "=", 
   RowBox[{"\"\<../output/bose_hubbard/L\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["L", "val"], "]"}], "<>", "\"\<_otoc/bose_hubbard_L\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["L", "val"], "]"}], "<>", "\"\<_M\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["M", "val"], "]"}]}]}], ";"}]], "Input"],

Cell[BoxData[
 RowBox[{"(*", " ", 
  RowBox[{
  "read", " ", "simulation", " ", "results", " ", "from", " ", "disk"}], " ", 
  "*)"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  SubscriptBox["density", "list"], "=", 
  RowBox[{"Import", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["fn", "import"], "<>", "\"\<_density.dat\>\""}], ",", 
    "\"\<Real64\>\""}], "]"}]}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1.`", ",", "1.`", ",", "1.`", ",", "1.`", ",", "1.`"}], 
  "}"}]], "Output"],

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
 RowBox[{"-", "1.9068123532908339`"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["otoc1", "list"], "=", 
   RowBox[{"Import", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "import"], "<>", "\"\<_otoc1.dat\>\""}], ",", 
     "\"\<Complex128\>\""}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", "41", "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["otoc2", "list"], "=", 
   RowBox[{"Import", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "import"], "<>", "\"\<_otoc2.dat\>\""}], ",", 
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

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["i", "site"], "=", "1"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["j", "site"], "=", "3"}], ";"}]}], "Input"],

Cell[BoxData[
 RowBox[{"(*", " ", 
  RowBox[{"reference", " ", "calculation"}], " ", "*)"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"tH", "=", 
      SubscriptBox["tH", "val"]}], ",", 
     RowBox[{"U", "=", 
      SubscriptBox["U", "val"]}], ",", 
     RowBox[{"\[Mu]", "=", 
      SubscriptBox["\[Mu]", "val"]}], ",", 
     RowBox[{"M", "=", 
      SubscriptBox["M", "val"]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"\[Beta]", "=", 
      SubscriptBox["\[Beta]", "val"]}], ",", "HB"}], "}"}], ",", 
   RowBox[{
    RowBox[{"HB", "=", 
     RowBox[{"N", "[", 
      RowBox[{"HBoseHubbard", "[", 
       RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
      "]"}]}], ";", 
    RowBox[{
     SubscriptBox["density", 
      RowBox[{"list", ",", "ref"}]], "=", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"OperatorAverage", "[", 
        RowBox[{
         RowBox[{"SiteNumberOpFull", "[", 
          RowBox[{"i", ",", "M", ",", "L"}], "]"}], ",", "HB", ",", 
         "\[Beta]"}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"i", ",", "0", ",", 
         RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}]}]}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.6215533386197526`", ",", "0.6753618526848063`", ",", 
   "0.6760214033886217`", ",", "0.6753618526848069`", ",", 
   "0.6215533386197531`"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"tH", "=", 
      SubscriptBox["tH", "val"]}], ",", 
     RowBox[{"U", "=", 
      SubscriptBox["U", "val"]}], ",", 
     RowBox[{"\[Mu]", "=", 
      SubscriptBox["\[Mu]", "val"]}], ",", 
     RowBox[{"M", "=", 
      SubscriptBox["M", "val"]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"\[Beta]", "=", 
      SubscriptBox["\[Beta]", "val"]}], ",", "HB"}], "}"}], ",", 
   RowBox[{
    RowBox[{"HB", "=", 
     RowBox[{"N", "[", 
      RowBox[{"HBoseHubbard", "[", 
       RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
      "]"}]}], ";", 
    RowBox[{
     SubscriptBox["energy", 
      RowBox[{"val", ",", "ref"}]], "=", 
     RowBox[{"OperatorAverage", "[", 
      RowBox[{"HB", ",", "HB", ",", "\[Beta]"}], "]"}]}]}]}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"-", "1.9068984524733663`"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"tH", "=", 
       SubscriptBox["tH", "val"]}], ",", 
      RowBox[{"U", "=", 
       SubscriptBox["U", "val"]}], ",", 
      RowBox[{"\[Mu]", "=", 
       SubscriptBox["\[Mu]", "val"]}], ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", "HB"}], "}"}], ",", 
    RowBox[{
     RowBox[{"HB", "=", 
      RowBox[{"N", "[", 
       RowBox[{"HBoseHubbard", "[", 
        RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
       "]"}]}], ";", 
     RowBox[{
      SubscriptBox["otoc1", 
       RowBox[{"list", ",", "ref"}]], "=", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"OTOC", "[", 
         RowBox[{
          RowBox[{"SiteCreateOpFull", "[", 
           RowBox[{
            SubscriptBox["j", "site"], ",", "M", ",", "L"}], "]"}], ",", 
          RowBox[{"SiteCreateOpFull", "[", 
           RowBox[{
            SubscriptBox["i", "site"], ",", "M", ",", "L"}], "]"}], ",", 
          RowBox[{"SiteAnnihilOpFull", "[", 
           RowBox[{
            SubscriptBox["j", "site"], ",", "M", ",", "L"}], "]"}], ",", 
          RowBox[{"SiteAnnihilOpFull", "[", 
           RowBox[{
            SubscriptBox["i", "site"], ",", "M", ",", "L"}], "]"}], ",", "HB",
           ",", "\[Beta]", ",", "t"}], "]"}], ",", 
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
      RowBox[{"tH", "=", 
       SubscriptBox["tH", "val"]}], ",", 
      RowBox[{"U", "=", 
       SubscriptBox["U", "val"]}], ",", 
      RowBox[{"\[Mu]", "=", 
       SubscriptBox["\[Mu]", "val"]}], ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", "HB"}], "}"}], ",", 
    RowBox[{
     RowBox[{"HB", "=", 
      RowBox[{"N", "[", 
       RowBox[{"HBoseHubbard", "[", 
        RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
       "]"}]}], ";", 
     RowBox[{
      SubscriptBox["otoc2", 
       RowBox[{"list", ",", "ref"}]], "=", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"OTOC", "[", 
         RowBox[{
          RowBox[{"SiteCreateOpFull", "[", 
           RowBox[{
            SubscriptBox["j", "site"], ",", "M", ",", "L"}], "]"}], ",", 
          RowBox[{"SiteAnnihilOpFull", "[", 
           RowBox[{
            SubscriptBox["i", "site"], ",", "M", ",", "L"}], "]"}], ",", 
          RowBox[{"SiteAnnihilOpFull", "[", 
           RowBox[{
            SubscriptBox["j", "site"], ",", "M", ",", "L"}], "]"}], ",", 
          RowBox[{"SiteCreateOpFull", "[", 
           RowBox[{
            SubscriptBox["i", "site"], ",", "M", ",", "L"}], "]"}], ",", "HB",
           ",", "\[Beta]", ",", "t"}], "]"}], ",", 
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
      RowBox[{"tH", "=", 
       SubscriptBox["tH", "val"]}], ",", 
      RowBox[{"U", "=", 
       SubscriptBox["U", "val"]}], ",", 
      RowBox[{"\[Mu]", "=", 
       SubscriptBox["\[Mu]", "val"]}], ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", "HB"}], "}"}], ",", 
    RowBox[{
     RowBox[{"HB", "=", 
      RowBox[{"N", "[", 
       RowBox[{"HBoseHubbard", "[", 
        RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
       "]"}]}], ";", 
     RowBox[{
      SubscriptBox["gf", 
       RowBox[{"list", ",", "ref"}]], "=", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"GF", "[", 
         RowBox[{
          RowBox[{"SiteCreateOpFull", "[", 
           RowBox[{
            SubscriptBox["j", "site"], ",", "M", ",", "L"}], "]"}], ",", 
          RowBox[{"SiteAnnihilOpFull", "[", 
           RowBox[{
            SubscriptBox["i", "site"], ",", "M", ",", "L"}], "]"}], ",", "HB",
           ",", "\[Beta]", ",", "t"}], "]"}], ",", 
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
    SubscriptBox["density", "list"], "-", 
    SubscriptBox["density", 
     RowBox[{"list", ",", "ref"}]]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.3784466613802474`", ",", "0.3246381473151937`", ",", 
   "0.3239785966113783`", ",", "0.32463814731519314`", ",", 
   "0.37844666138024685`"}], "}"}]], "Output"]
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

Cell[BoxData["0.00008609918253243976`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["otoc1", "list"], "-", 
     SubscriptBox["otoc1", 
      RowBox[{"list", ",", "ref"}]]}], ",", "\[Infinity]"}], "]"}]}]], "Input"],

Cell[BoxData["0.00006185539033561887`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["otoc2", "list"], "-", 
     SubscriptBox["otoc2", 
      RowBox[{"list", ",", "ref"}]]}], ",", "\[Infinity]"}], "]"}]}]], "Input"],

Cell[BoxData["0.0000890706746816308`"], "Output"]
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

Cell[BoxData["0.000030632313059220095`"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["plot", "label"], "=", 
   RowBox[{
   "\"\<Bose-Hubbard model with\\n\!\(\*SubscriptBox[\(t\), \(H\)]\)=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["tH", "val"], "]"}], "<>", "\"\<, U=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["U", "val"], "]"}], "<>", "\"\<, \[Mu]=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     RowBox[{"InputForm", "[", 
      SubscriptBox["\[Mu]", "val"], "]"}], "]"}], "<>", "\"\<, M=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["M", "val"], "]"}], "<>", "\"\<, L=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["L", "val"], "]"}], "<>", "\"\<, \[Beta]=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     RowBox[{"N", "[", 
      SubscriptBox["\[Beta]", "val"], "]"}], "]"}], "<>", 
    "\"\<\\nsites: i=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["i", "site"], "]"}], "<>", "\"\<, j=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["j", "site"], "]"}]}]}], ";"}]], "Input"],

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
           SubscriptBox["otoc1", "list"], "]"}]}], "}"}], "]"}], ",", 
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["t", "list"], ",", 
          RowBox[{"Im", "[", 
           SubscriptBox["otoc1", "list"], "]"}]}], "}"}], "]"}]}], "}"}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<t\>\"", ",", 
        "\"\<\[LeftAngleBracket]\!\(\*SubsuperscriptBox[\(b\), \(j\), \(\
\[Dagger]\)]\)(t) \!\(\*SubsuperscriptBox[\(b\), \(i\), \(\[Dagger]\)]\)(0) \
\!\(\*SubscriptBox[\(b\), \(j\)]\)(t) \!\(\*SubscriptBox[\(b\), \(i\)]\)(0)\!\
\(\*SubscriptBox[\(\[RightAngleBracket]\), \(\[Beta]\)]\)\>\""}], "}"}]}], 
     ",", 
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
       RowBox[{"\"\<Re\>\"", ",", "\"\<Im\>\""}], "}"}]}]}], "]"}], ",", 
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
             SubscriptBox["otoc1", 
              RowBox[{"list", ",", "ref"}]], "]"}]}], "}"}], "]"}], "]"}], 
        "[", "\[Tau]", "]"}], ",", 
       RowBox[{
        RowBox[{"Interpolation", "[", 
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            SubscriptBox["t", "list"], ",", 
            RowBox[{"Im", "[", 
             SubscriptBox["otoc1", 
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
     SubscriptBox["fn", "export"], "<>", "\"\<otoc1_L\>\"", "<>", 
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
1:eJxTTMoPSmViYGDQBGIQDQNihqesvRXv2kN4B+wblW1XGovD+Bfsu+WsnnK9
vwPl37A/8vyp95tJMP4De/YZJxrnvbkN5T+x7zwnyqT45BaU/8K+gOtT26fw
m1D+G/tYnfSpL9SvQ/kf7M1Y6jf0hVyB8j/Z7xA6d2yd0EUo/4u96u2l+nFF
p6H8b/avmBNDPhkchfJ/2HsZWDc69u6H8n/Z+7RsZrH8tA3K/2Mf9vJqkbrD
Rij/n/1ZbluXhRHroHwGhz1zL4UXH9wA5TM67D3+PS3z4RYon8khIfLMWu0d
O6F8ZoemKS4Xzt3dC+WzOGhxWEz82nAAymd1MLI1tHix8SCUz+YgalL9QyD2
EJTP7vAgsCo84TVMnsPhtVTKGbkamPs5HVweVa/n6dkO5XM5dDb+1I5atwrK
53a4HL/ovpFeG5TP4/Dt+6qfv17N2g/h8zqkBc7hU4lYC+XzOczmeyQsE7kV
yud3+Lr00NnO/N1QvoCDStPRSq1zByD8BgGHyd3+dR1KR6Dygg58QVHXryw9
DpUXdPjB+nitzMdTUHkhh333u7X6Ys9C5YUclmqmfHyTdA4qL+wgsV/6SuZ3
mLywg8+9K6vXNp6Byos4/OY2Vb6ff2o/ACJ+xpA=
        "]], 
       Hue[0.9060679774997897, 0.6, 0.6], 
       Directive[
        PointSize[0.016666666666666666`], 
        AbsoluteThickness[1.6], 
        RGBColor[0.560181, 0.691569, 0.194885]], 
       PointBox[CompressedData["
1:eJxTTMoPSmViYGDQBGIQjR0csA/hqV2zKOj6Pgj/gr2cmfvFpyJ6+yH8G/Yq
9+8qsXBFQPkP7Lf/mOqpH1oE5T+xv3S51FlHqQnKf2EfvsFy8yKebij/jf1x
xUwLd/uJUP4H+2f5MxyXtk6F8j/Zhy36X2hydg6U/8XeIiv3Y37YEij/m72K
00mGZUVroPwf9uE3xea/E9kM5f+yDzLi/n5m2g4o/4/9Fa1Aq5A1+6D8f/bP
Y4NVVUoOQfkMDrFvNv6x0DgK5TM6SHYrTJd/fwzKZ3Jo2PP0gtDy41A+s8N2
ty0LGeF8FgdWjntqstEwPqvD7NXro2Zfhulnc7gzRXPd0pMw89kd7ooduuHA
fQTK53CI+WvhueXIQSif0+FYQFh282yYe7kceNmXixcX7YTyuR0ONPxbs7wU
5l8eh8jlh/5I6ayA8nkdZC1cLX7O6YHy+RymJNxsdvWZYg/h8zsUxzOJ365a
CeULOBRy7vTlmLgJwm8QcJDc87Vl162tUHlBhzvVXFPvXITyGwQdTE4z3JZ/
sBEqL+QgL9qn9fDqEqi8kMMk9cesq34XQ+WFHbgPsX7hbYbGZ4Oww6Q/9oof
5q2Euk/EwTJgQpW63Lr9AKSewVA=
        "]]}, {}}, {{{}, {}, {
        Directive[
         Opacity[1.], 
         AbsoluteThickness[1.6], 
         RGBColor[0.922526, 0.385626, 0.209179]], 
        LineBox[CompressedData["
1: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

         "]]}, {
        Directive[
         Opacity[1.], 
         AbsoluteThickness[1.6], 
         RGBColor[0.922526, 0.385626, 0.209179]], 
        LineBox[CompressedData["
1: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
uW76SZU9WwTxwMAtLyQRfXc0CX/mtQh2+whxh6cmIv5p+eWzrxfB49WLKKg8
EdX8nKUURSyCu4FU6dbxRMSKNM/lfsbt5/cJvFBOQvFeAhcSRxZB247Mr+CN
JFTJVHLjtcYSqKqvFpf1SkHMnGMP7wgvgze3km5xtqehFV89lQ/iy+DckNpV
8Zk0NLLdwj8huwy8VF1tjXalI+pUSZeH8jJYq6HQr8uno1d1b1Qy9ZbBwFTk
DWJqOmLyFBMgBi2D8uHvWwbPMxDTrFN37uIymDx7kq5dLgsxNjFe3lO+AiYI
rQOy/blo43v241C7VZC4XJA8BgrR33s5Bw4fXgdHLzc3NM8Wowuvra3qsjdA
UIVsQ2R2OYrYLmZRNtgCxKJliRqPSsR6otY64sEWeCIdcinQrxL53PzRNvpo
C0jsUcrXDKtE9gnjcW9dtgB24ph6/6dKdEPpoGRnyBZY3irdpDZVIqZXrjoP
a7ZAp5CjHwNvFXJhU8wMOrUNfH55kRryq9CsjCppWGwbPP1krSdUVoXM9O8+
kZbdBnvPxux5VluF7uRagx6lbcDk2Kuxv7sKSah/aBPU2wbGknRo/1YVmgin
2ywK3AZrfwwGBC5VI12+6mv9i9uAQDxVPt5WjSas5heK1rdBs3X6wNWf1cgF
HYkKIuyA1Mx9Uokj1eidsdtfJY4d8J+zrOD5tWrUmibzPF14BxC96bv3HK5B
qjJpuU5GO6CPFh6xz6wGnbsRwMXZvAOuCXxYgbM1qP7D1+KJjh3wcvSMh8e/
GqQ1P65f078DSt8kfirYqUFPwi9lOk/sgLabhR6bHLVIa3pHYJZIBz+ymz0Y
EKtF4VIlpZqH6WAf1ent2ce1iLVCZEpQkw7Wb2xzvO+vRcNR6nUeWnRww3P2
2OHfteiLg3Nyvy4dXF0+IR89XouMT1TrvTOmg3oKtzXtVnB7oE4Tiy0dHDta
mx3NQUXG9/1y5vzp4LphSnAHoKKz/+X6Xw+kg3a+H29mqFARG2eHWUYIHazp
sMEc1KiouIb/iGkkHWR2efD+z13cLloc1JVCB3mKRtIVrHD7+ogtVkEHdQVb
JureU1FgO+t13ho6ePSRq9pILBWZ5EiecqHRwW7yiz2rH6mI3fj5L4nvdJCL
7B+xmonb67k1UvroYG9G2kUrhMeTdP4McZAOinVYkE/X4OfdjXYbDNNBV1fV
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
         "]]}}}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {-0.23739396845514907`, 0.4551570972332838}}, 
     DisplayFunction -> Identity, AspectRatio -> 
     NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> {True, True}, 
     AxesLabel -> {
       FormBox["\"t\"", TraditionalForm], 
       FormBox[
       "\"\[LeftAngleBracket]\\!\\(\\*SubsuperscriptBox[\\(b\\), \\(j\\), \\(\
\[Dagger]\\)]\\)(t) \\!\\(\\*SubsuperscriptBox[\\(b\\), \\(i\\), \\(\[Dagger]\
\\)]\\)(0) \\!\\(\\*SubscriptBox[\\(b\\), \\(j\\)]\\)(t) \
\\!\\(\\*SubscriptBox[\\(b\\), \\(i\\)]\\)(0)\\!\\(\\*SubscriptBox[\\(\
\[RightAngleBracket]\\), \\(\[Beta]\\)]\\)\"", TraditionalForm]}, 
     AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], Method -> {}, PlotLabel -> 
     FormBox["\"Bose-Hubbard model with\\n\\!\\(\\*SubscriptBox[\\(t\\), \\(H\
\\)]\\)=1, U=5, \[Mu]=1/7, M=2, L=5, \[Beta]=0.6\\nsites: i=1, j=3\\nred: \
independent reference calculation\"", TraditionalForm], 
     PlotRange -> {{0, 5.}, {-0.23739396845514907`, 0.4551570972332838}}, 
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
           SubscriptBox["otoc2", "list"], "]"}]}], "}"}], "]"}], ",", 
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["t", "list"], ",", 
          RowBox[{"Im", "[", 
           SubscriptBox["otoc2", "list"], "]"}]}], "}"}], "]"}]}], "}"}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<t\>\"", ",", 
        "\"\<\[LeftAngleBracket]\!\(\*SubsuperscriptBox[\(b\), \(j\), \(\
\[Dagger]\)]\)(t) \!\(\*SubscriptBox[\(b\), \(i\)]\)(0) \
\!\(\*SubscriptBox[\(b\), \(j\)]\)(t) \!\(\*SubsuperscriptBox[\(b\), \(i\), \
\(\[Dagger]\)]\)(0)\!\(\*SubscriptBox[\(\[RightAngleBracket]\), \
\(\[Beta]\)]\)\>\""}], "}"}]}], ",", 
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
       RowBox[{"\"\<Re\>\"", ",", "\"\<Im\>\""}], "}"}]}]}], "]"}], ",", 
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
             SubscriptBox["otoc2", 
              RowBox[{"list", ",", "ref"}]], "]"}]}], "}"}], "]"}], "]"}], 
        "[", "\[Tau]", "]"}], ",", 
       RowBox[{
        RowBox[{"Interpolation", "[", 
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            SubscriptBox["t", "list"], ",", 
            RowBox[{"Im", "[", 
             SubscriptBox["otoc2", 
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
     SubscriptBox["fn", "export"], "<>", "\"\<otoc2_L\>\"", "<>", 
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
1:eJxTTMoPSmViYGDQBGIQDQNMF9Ye2PnpvT2Ed8B+RXykU9dPGP+CvRinunyv
0Aco/4b92m9CjWfsYPwH9tMUY07xu8D4T+yfvTr33ssUpv+FvRnveV2F/tdQ
/hv7xQmpR5x2PIXyP9jrM3ptiky9B+V/sn/y497zyxcuQ/lf7NOsT96+yX0a
yv9mfzu9ak/m1iNQ/g97nQdGT3557Ifyf9nL182albZ2E5T/x/6lUZL6X5YF
UP4/+5Cu5IiNy+ZD+QwOOw/lb7v5fwuUz+jwbFn/8n97D0P5TA5HOXguxl88
CeUzO9TXma1e3wzjszjsNa09KP8Npp7V4YXKEv52nt1QPpvDun2WOTVbtkL5
7A5WHj82/PfYBeVzOHzSXVS1fe0BKJ/Tge3u8t8bC/dB+VwO07Y8sGD8thDK
53aoYjzwfF3Rrv0QPo+Dtt2dd7frT0P5vA4f/25n1hSE8fkcGLzPt6mX74Ty
+R1Cnpe21V+ohZon4PDONGDGm9pWCL9BwKG/8ujW5j0boeoFHVxeJHB1dR+C
8BsEHQ7eV191wecYVF7IQViyYM/SnVB+g5BDQfP7NQU2x6Hywg6sRevdf3qe
gMoLO0T03e3Vng3lM4g4xJ6f6N9feHw/AJIXzh8=
        "]], 
       Hue[0.9060679774997897, 0.6, 0.6], 
       Directive[
        PointSize[0.016666666666666666`], 
        AbsoluteThickness[1.6], 
        RGBColor[0.560181, 0.691569, 0.194885]], 
       PointBox[CompressedData["
1:eJxTTMoPSmViYGDQBGIQjR0csLe8uCnzZJaIPYR/wV5ExOrjuvO5UP4Ne80Z
eq1zls6E8h/YcyvckTvcuxXKf2L/bN2PKzvXHofyX9hbVxXZMQpfhvLf2P9+
yqZx6/R1KP+D/YXKeKmoPTD+J/s1My/vC5wNU//FXjdOzXjTlzNQ/jf7NDXm
yyamx6D8H/aBZdxnTVcdhvJ/2Rs9yUoqOXoQyv9j78fbvIJbaheU/89ef9KE
JOY1K6B8BoeXbYwNtkzdUD6jQ0bUhf1LjOdA+UwOS/wY9zkGboPymR3CbYPd
HyUegfJZHKqyIg6vqDoF5bM6NJ/PlFVgOg3lszlwWt1zEG2DhQe7g+H+g/uM
98L0czg0HX4au3g/zD+cDgf+Te1p8DoL5XM5tJsXhXfEXYTyuR10pv0pebv/
HJTP4xCu4jZflWE3lM/r8FLhn/70Lxv3Q/h8Dvzmu8oXMByF8vkd2qISVefc
2QflCzgsObzX8ZhKD4TfIOAgxDWlzBkePoIOB3OkmfWMl0H4DYIOG2I/sLeG
zoDKCzks5L/+4Hz/bKi8kIN/hsIW7cnLofLCDrUsDUaaQuuh8sIOccu3m27+
D+UziDg8ODn/+SuTdfYAAEq0QA==
        "]]}, {}}, {{{}, {}, {
        Directive[
         Opacity[1.], 
         AbsoluteThickness[1.6], 
         RGBColor[0.922526, 0.385626, 0.209179]], 
        LineBox[CompressedData["
1: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
YJPAbtljTx7/D44JcZI=
         "]]}, {
        Directive[
         Opacity[1.], 
         AbsoluteThickness[1.6], 
         RGBColor[0.922526, 0.385626, 0.209179]], 
        LineBox[CompressedData["
1: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
a6kvhP8DSEi0zQ==
         "]]}}}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {-0.2148394504842924, 1.0166166214640717`}}, 
     DisplayFunction -> Identity, AspectRatio -> 
     NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> {True, True}, 
     AxesLabel -> {
       FormBox["\"t\"", TraditionalForm], 
       FormBox[
       "\"\[LeftAngleBracket]\\!\\(\\*SubsuperscriptBox[\\(b\\), \\(j\\), \\(\
\[Dagger]\\)]\\)(t) \\!\\(\\*SubscriptBox[\\(b\\), \\(i\\)]\\)(0) \
\\!\\(\\*SubscriptBox[\\(b\\), \\(j\\)]\\)(t) \\!\\(\\*SubsuperscriptBox[\\(b\
\\), \\(i\\), \\(\[Dagger]\\)]\\)(0)\\!\\(\\*SubscriptBox[\\(\
\[RightAngleBracket]\\), \\(\[Beta]\\)]\\)\"", TraditionalForm]}, 
     AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], Method -> {}, PlotLabel -> 
     FormBox["\"Bose-Hubbard model with\\n\\!\\(\\*SubscriptBox[\\(t\\), \\(H\
\\)]\\)=1, U=5, \[Mu]=1/7, M=2, L=5, \[Beta]=0.6\\nsites: i=1, j=3\\nred: \
independent reference calculation\"", TraditionalForm], 
     PlotRange -> {{0, 5.}, {-0.2148394504842924, 1.0166166214640717`}}, 
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
        "\"\<\[LeftAngleBracket]\!\(\*SubsuperscriptBox[\(b\), \(j\), \(\
\[Dagger]\)]\)(t) \!\(\*SubscriptBox[\(b\), \(i\)]\)(0)\!\(\*SubscriptBox[\(\
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
       RowBox[{"\"\<Re\>\"", ",", "\"\<Im\>\""}], "}"}]}]}], "]"}], ",", 
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
1:eJxTTMoPSmViYGDQBGIQDQPv1t/ct/XNUXsI74A9e1bgT+EnMP4F+75rexi/
HYHxb9i3PImQXtkA4z+wn/CsZdVnJhj/iX2Oxa38a9ZHoPwX9nrzbhw7qHUY
yn9jbyJupXv28UEo/4P9nCtPTvB2HoDyP9m7bX0qeqZsH5T/xb6wM3Tue+k9
UP43+/vmSbfkOHZB+T/sb3ieXjXfZAeU/8v+hvya1ZKLt0H5f+yrsw6Zh6Zs
hfL/2T94VeZs070FymdwWHJOc/NtcRif0eHDMVGnLa83Q/lMDlHR94Lun4fx
mR3U9b265dphfBYH8f1V+/bc2wTlszp8f/Gx0mPbRiifzaG1/pFqC8MGKJ/d
IejhNuU57auhfA6HWZkbVzOaLYPyOR0M1z/5OTllAZTP5bCh2nHbpG9ToHxu
B97ikx6LcpuhfB6H6Ey+TVO/mOyH8HkdtjBYy3arNkL5fA7st8+fsV3TA+Xz
OxhG+U4WuzAByhdwqNdsjKpc2wfhNwg4bDq1h/vI1maovKBD9auA/z8jQqDy
gg7+HidYRY0aofYLOfBMWhN9dNpECL9ByGHXRPHlZi+mQ+WFHcpCPlVyTJ0F
lRd2CLmpzq9YMhMqL+Kw+bNyxM+bU+wBoyDEEQ==
        "]], 
       Hue[0.9060679774997897, 0.6, 0.6], 
       Directive[
        PointSize[0.016666666666666666`], 
        AbsoluteThickness[1.6], 
        RGBColor[0.560181, 0.691569, 0.194885]], 
       PointBox[CompressedData["
1:eJxTTMoPSmViYGDQBGIQjR0csBfdp72c5aLjfgj/gr3v4jMvrcuCofwb9qe0
Qjec8IiD8h/Yqz1tyU1UTYTyn9iHlP9c/EA+CMp/YX/16E4Owb8J9hD+G/vp
r41S3eY0QPkf7OXv3lMIjpsI5X+yLxA5EKJSPgfK/2KfdcbQ+LXCEij/m72q
y4norC0rofwf9qH/12bfKF8H5f+y19RNCCvj2wjl/7FPuLDvrYnZJij/n738
1oeXnk+H8RkciiKd2e5LwfiMDtb9wgpmOzZA+UwORVK3+f6KroXymR3e9Bmf
mrlsOZTP4rD546OuovMLoXxWB4uNFxoDymdA+WwOWxxDbS9u64Xy2R3m752j
9ri8FsrncNj+NOvKEulEKJ/TIchK+1VNbAA0/LgcJl9x+v/mSzKUz+1w6EKr
+w+ZVCifx+FL15wJ839EQvm8DssS7i7kyHOBmsfncL9K7qV7UiGUz+9wMWDT
3QreZihfwKFr2fEthq39EH6DgANrmvCfCYrToPKCDkq1nF9TqmZD5QUdzr/b
8PTKuXlQeSGHhhZxi1mz5kPlhRyyHtdNdL0/Fyov7GB9sfGP77+ZUHlhhxKD
rnOr+6dA5UUcOo59u3Nzdo89ACvQviI=
        "]]}, {}}, {{{}, {}, {
        Directive[
         Opacity[1.], 
         AbsoluteThickness[1.6], 
         RGBColor[0.922526, 0.385626, 0.209179]], 
        LineBox[CompressedData["
1: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
         "]]}, {
        Directive[
         Opacity[1.], 
         AbsoluteThickness[1.6], 
         RGBColor[0.922526, 0.385626, 0.209179]], 
        LineBox[CompressedData["
1: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
ex8KlX/2/FtbE0LSuSLWkYmh8D/gNNqC
         "]]}}}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {-0.016418793430910298`, 0.17128631419052404`}}, 
     DisplayFunction -> Identity, AspectRatio -> 
     NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> {True, True}, 
     AxesLabel -> {
       FormBox["\"t\"", TraditionalForm], 
       FormBox[
       "\"\[LeftAngleBracket]\\!\\(\\*SubsuperscriptBox[\\(b\\), \\(j\\), \\(\
\[Dagger]\\)]\\)(t) \\!\\(\\*SubscriptBox[\\(b\\), \
\\(i\\)]\\)(0)\\!\\(\\*SubscriptBox[\\(\[RightAngleBracket]\\), \
\\(\[Beta]\\)]\\)\"", TraditionalForm]}, AxesOrigin -> {0, 0}, 
     DisplayFunction :> Identity, Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], Method -> {}, PlotLabel -> 
     FormBox["\"Bose-Hubbard model with\\n\\!\\(\\*SubscriptBox[\\(t\\), \\(H\
\\)]\\)=1, U=5, \[Mu]=1/7, M=2, L=5, \[Beta]=0.6\\nsites: i=1, j=3\\nred: \
independent reference calculation\"", TraditionalForm], 
     PlotRange -> {{0, 5.}, {-0.016418793430910298`, 0.17128631419052404`}}, 
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
        SubscriptBox["L", "val"], "]"}], "<>", "\"\<_M\>\"", "<>", 
       RowBox[{"ToString", "[", 
        SubscriptBox["M", "val"], "]"}], "<>", "\"\<.pdf\>\""}], ",", "%"}], 
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
        LineBox[{{0., 1.}, {1., 9.}, {2., 30.}, {3., 30.}, {4., 9.}, {5., 
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
        LineBox[{{0., 1.}, {1., 9.}, {2., 52.}, {3., 58.}, {4., 9.}, {5., 
         1.}}]}, {
        Hue[0.1421359549995791, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 1]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 78.}, {3., 75.}, {4., 9.}, {5., 
         1.}}]}, {
        Hue[0.37820393249936934`, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[2, 3], 0.6666666666666666]]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 81.}, {3., 81.}, {4., 9.}, {5., 
         1.}}]}, {
        Hue[0.6142719099991583, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[1, 3], 0.3333333333333333]]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 81.}, {3., 81.}, {4., 9.}, {5., 
         1.}}]}, {
        Hue[0.8503398874989481, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         GrayLevel[0]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 81.}, {3., 81.}, {4., 9.}, {5., 
         1.}}]}}}, {}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {0, 81.}}, DisplayFunction -> Identity, 
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
t\\)]\\)\\nBose-Hubbard model with\\n\\!\\(\\*SubscriptBox[\\(t\\), \
\\(H\\)]\\)=1, U=5, \[Mu]=1/7, M=2, L=5, \[Beta]=0.6\\nsites: i=1, j=3\"", 
       TraditionalForm], PlotRange -> {{0, 5.}, {0, 81.}}, PlotRangeClipping -> 
     True, PlotRangePadding -> {{
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
        SubscriptBox["L", "val"], "]"}], "<>", "\"\<_M\>\"", "<>", 
       RowBox[{"ToString", "[", 
        SubscriptBox["M", "val"], "]"}], "<>", "\"\<.pdf\>\""}], ",", "%"}], 
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
        LineBox[{{0., 1.}, {1., 9.}, {2., 61.}, {3., 70.}, {4., 9.}, {5., 
         1.}}]}, {
        Hue[0.1421359549995791, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 1]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 81.}, {3., 81.}, {4., 9.}, {5., 
         1.}}]}, {
        Hue[0.37820393249936934`, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[2, 3], 0.6666666666666666]]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 81.}, {3., 81.}, {4., 9.}, {5., 
         1.}}]}, {
        Hue[0.6142719099991583, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[1, 3], 0.3333333333333333]]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 81.}, {3., 81.}, {4., 9.}, {5., 
         1.}}]}, {
        Hue[0.8503398874989481, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         GrayLevel[0]], 
        LineBox[{{0., 1.}, {1., 9.}, {2., 81.}, {3., 81.}, {4., 9.}, {5., 
         1.}}]}}}, {}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {0, 81.}}, DisplayFunction -> Identity, 
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
\[ExponentialE]\\), \\(\[ImaginaryI]\\\\ H\\\\ t\\)]\\)\\nBose-Hubbard model \
with\\n\\!\\(\\*SubscriptBox[\\(t\\), \\(H\\)]\\)=1, U=5, \[Mu]=1/7, M=2, \
L=5, \[Beta]=0.6\\nsites: i=1, j=3\"", TraditionalForm], 
     PlotRange -> {{0, 5.}, {0, 81.}}, PlotRangeClipping -> True, 
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
Cell[1486, 35, 48, 0, 63, "Section"],
Cell[1537, 37, 123, 3, 31, "Input"],
Cell[CellGroupData[{
Cell[1685, 44, 41, 0, 43, "Subsection"],
Cell[1729, 46, 297, 9, 31, "Input"],
Cell[2029, 57, 524, 15, 52, "Input"],
Cell[2556, 74, 185, 5, 31, "Input"],
Cell[2744, 81, 3424, 91, 167, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6205, 177, 43, 0, 43, "Subsection"],
Cell[6251, 179, 228, 7, 52, "Input"],
Cell[6482, 188, 214, 7, 52, "Input"],
Cell[6699, 197, 236, 7, 67, "Input"],
Cell[6938, 206, 233, 7, 52, "Input"],
Cell[7174, 215, 285, 9, 52, "Input"],
Cell[7462, 226, 244, 8, 52, "Input"],
Cell[CellGroupData[{
Cell[7731, 238, 249, 7, 52, "Input"],
Cell[7983, 247, 29, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[8061, 253, 52, 0, 43, "Subsection"],
Cell[8116, 255, 485, 14, 48, "Input"],
Cell[8604, 271, 829, 24, 48, "Input"],
Cell[9436, 297, 1189, 35, 48, "Input"],
Cell[10628, 334, 547, 15, 33, "Input"],
Cell[11178, 351, 549, 15, 33, "Input"],
Cell[11730, 368, 543, 15, 33, "Input"],
Cell[12276, 385, 424, 10, 31, "Input"],
Cell[12703, 397, 144, 4, 31, "Input"],
Cell[CellGroupData[{
Cell[12872, 405, 297, 8, 52, "Input"],
Cell[13172, 415, 116, 3, 31, "Output"],
Cell[13291, 420, 50, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13378, 426, 265, 8, 31, "Input"],
Cell[13646, 436, 63, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13746, 442, 321, 9, 52, "Input"],
Cell[14070, 453, 51, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14158, 459, 321, 9, 52, "Input"],
Cell[14482, 470, 51, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14570, 476, 315, 9, 52, "Input"],
Cell[14888, 487, 51, 1, 31, "Output"]
}, Open  ]],
Cell[14954, 491, 189, 6, 52, "Input"],
Cell[15146, 499, 102, 2, 31, "Input"],
Cell[CellGroupData[{
Cell[15273, 505, 1162, 35, 55, "Input"],
Cell[16438, 542, 204, 5, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16679, 552, 897, 27, 33, "Input"],
Cell[17579, 581, 63, 1, 31, "Output"]
}, Open  ]],
Cell[17657, 585, 1657, 47, 52, "Input"],
Cell[19317, 634, 1657, 47, 52, "Input"],
Cell[20977, 683, 1375, 41, 55, "Input"],
Cell[CellGroupData[{
Cell[22377, 728, 256, 7, 54, "Input"],
Cell[22636, 737, 206, 5, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[22879, 747, 252, 7, 54, "Input"],
Cell[23134, 756, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[23221, 761, 291, 8, 52, "Input"],
Cell[23515, 771, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[23602, 776, 291, 8, 52, "Input"],
Cell[23896, 786, 49, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[23982, 791, 285, 8, 54, "Input"],
Cell[24270, 801, 51, 0, 31, "Output"]
}, Open  ]],
Cell[24336, 804, 1045, 24, 52, "Input"],
Cell[25384, 830, 329, 10, 31, "Input"],
Cell[CellGroupData[{
Cell[25738, 844, 2913, 81, 98, "Input"],
Cell[28654, 927, 40773, 733, 304, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[69464, 1665, 2909, 81, 98, "Input"],
Cell[72376, 1748, 66444, 1154, 304, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[138857, 2907, 2794, 79, 98, "Input"],
Cell[141654, 2988, 41978, 752, 320, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[183681, 3746, 45, 0, 43, "Subsection"],
Cell[183729, 3748, 213, 7, 31, "Input"],
Cell[CellGroupData[{
Cell[183967, 3759, 3210, 88, 137, "Input"],
Cell[187180, 3849, 27790, 592, 342, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[215007, 4446, 3119, 86, 137, "Input"],
Cell[218129, 4534, 27684, 591, 339, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[245862, 5131, 49, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[245936, 5135, 718, 22, 54, "Input"],
Cell[246657, 5159, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[246724, 5164, 985, 28, 55, "Input"],
Cell[247712, 5194, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[247779, 5199, 863, 25, 54, "Input"],
Cell[248645, 5226, 30, 0, 31, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature sv0pgpVvcrgx@DgcUc6MCsWx *)
