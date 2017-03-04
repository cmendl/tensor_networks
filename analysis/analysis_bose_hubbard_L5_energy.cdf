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
NotebookDataLength[    127319,       2922]
NotebookOptionsPosition[    125518,       2841]
NotebookOutlinePosition[    125861,       2856]
CellTagsIndexPosition[    125818,       2853]
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
  RowBox[{"Z", "[", 
   RowBox[{"H_", ",", "\[Beta]_"}], "]"}], ":=", 
  SuperscriptBox[
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{"MatrixExp", "[", 
      RowBox[{
       RowBox[{"-", 
        FractionBox["\[Beta]", "2"]}], "H"}], "]"}], ",", 
     "\"\<Frobenius\>\""}], "]"}], "2"]}]], "Input"],

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
             RowBox[{"l", "-", "1"}]], "]"}], ",", 
           RowBox[{"SiteCreateOp", "[", "M", "]"}], ",", 
           RowBox[{"SiteAnnihilOp", "[", "M", "]"}], ",", 
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"M", "+", "1"}], ")"}], 
             RowBox[{"L", "-", "l", "-", "1"}]], "]"}]}], "]"}], "+", 
         RowBox[{"KroneckerProduct", "[", 
          RowBox[{
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"M", "+", "1"}], ")"}], 
             RowBox[{"l", "-", "1"}]], "]"}], ",", 
           RowBox[{"SiteAnnihilOp", "[", "M", "]"}], ",", 
           RowBox[{"SiteCreateOp", "[", "M", "]"}], ",", 
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"M", "+", "1"}], ")"}], 
             RowBox[{"L", "-", "l", "-", "1"}]], "]"}]}], "]"}]}], ",", 
        RowBox[{"{", 
         RowBox[{"l", ",", "1", ",", 
          RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}], "+", 
     RowBox[{"Sum", "[", 
      RowBox[{
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         RowBox[{"SparseIdentityMatrix", "[", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"M", "+", "1"}], ")"}], 
           RowBox[{"l", "-", "1"}]], "]"}], ",", 
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
           RowBox[{"L", "-", "l"}]], "]"}]}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"l", ",", "1", ",", "L"}], "}"}]}], "]"}]}]}]}]}]], "Input"]
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
     RowBox[{"1", "/", "4"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Length", "[", "%", "]"}]}], "Input"],

Cell[BoxData["21"], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Energy correlations", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"\[Chi]C", "[", 
   RowBox[{"A_", ",", "B_", ",", "H_", ",", "\[Beta]_", ",", "t_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"tA", "=", 
       FractionBox["t", "2"]}], ",", 
      RowBox[{"tB", "=", 
       FractionBox["t", "2"]}], ",", 
      RowBox[{"\[Rho]\[Beta]", "=", 
       RowBox[{"MatrixExp", "[", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["\[Beta]", "2"]}], "H"}], "]"}]}]}], "}"}], ",", 
    RowBox[{
     FractionBox["1", 
      RowBox[{"Z", "[", 
       RowBox[{"H", ",", "\[Beta]"}], "]"}]], 
     RowBox[{"Tr", "[", 
      RowBox[{
       RowBox[{"(", 
        RowBox[{
         RowBox[{"MatrixExp", "[", 
          RowBox[{"\[ImaginaryI]", " ", "tB", " ", "H"}], "]"}], ".", 
         "\[Rho]\[Beta]", ".", "B", ".", 
         RowBox[{"MatrixExp", "[", 
          RowBox[{
           RowBox[{"-", "\[ImaginaryI]"}], " ", "tB", " ", "H"}], "]"}]}], 
        ")"}], ".", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"MatrixExp", "[", 
          RowBox[{
           RowBox[{"-", "\[ImaginaryI]"}], " ", "tA", " ", "H"}], "]"}], ".", 
         "A", ".", "\[Rho]\[Beta]", ".", 
         RowBox[{"MatrixExp", "[", 
          RowBox[{"\[ImaginaryI]", " ", "tA", " ", "H"}], "]"}]}], ")"}]}], 
      "]"}]}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"BondEnergyOp", "[", 
   RowBox[{"j_", ",", "t_", ",", "U_", ",", "M_", ",", "L_"}], "]"}], ":=", 
  RowBox[{
   RowBox[{
    RowBox[{"-", "t"}], 
    RowBox[{"(", 
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
          RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}]}], ")"}]}], "+", 
   RowBox[{
    FractionBox["U", "4"], 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"KroneckerProduct", "[", 
       RowBox[{
        RowBox[{"SparseIdentityMatrix", "[", 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"M", "+", "1"}], ")"}], 
          RowBox[{"j", "-", "1"}]], "]"}], ",", 
        RowBox[{
         RowBox[{"NumberOp", "[", "M", "]"}], ".", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"NumberOp", "[", "M", "]"}], "-", 
           RowBox[{"IdentityMatrix", "[", 
            RowBox[{"M", "+", "1"}], "]"}]}], ")"}]}], ",", 
        RowBox[{"SparseIdentityMatrix", "[", 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"M", "+", "1"}], ")"}], 
          RowBox[{"L", "-", "j"}]], "]"}]}], "]"}], "+", 
      RowBox[{"KroneckerProduct", "[", 
       RowBox[{
        RowBox[{"SparseIdentityMatrix", "[", 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"M", "+", "1"}], ")"}], "j"], "]"}], ",", 
        RowBox[{
         RowBox[{"NumberOp", "[", "M", "]"}], ".", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"NumberOp", "[", "M", "]"}], "-", 
           RowBox[{"IdentityMatrix", "[", 
            RowBox[{"M", "+", "1"}], "]"}]}], ")"}]}], ",", 
        RowBox[{"SparseIdentityMatrix", "[", 
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"M", "+", "1"}], ")"}], 
          RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}]}], 
     ")"}]}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["fn", "import"], "=", 
   RowBox[{"\"\<../output/bose_hubbard/L\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["L", "val"], "]"}], "<>", "\"\<_energy/bose_hubbard_L\>\"", 
    "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["L", "val"], "]"}], "<>", "\"\<_M\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["M", "val"], "]"}]}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "read", " ", "simulation", " ", "results", " ", "from", " ", "disk"}], " ",
    "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["ee", "corr"], "=", 
    RowBox[{"Import", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "import"], "<>", "\"\<_ee_corr.dat\>\""}], ",", 
      "\"\<Complex128\>\""}], "]"}]}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"0.17589690434204924`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.16575733116718916`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.025500693687700367`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.22636919798489946`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.09048311570224649`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.33879004807403884`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.056705756723573475`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.3273932074138906`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.027651557279453284`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.27094319344308887`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.009430574614944625`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.33065480883349085`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.07836234201989921`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.4227238494497018`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.05530740675630241`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.43942692765309477`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.009470633140163708`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.3932378374962161`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.025387069661331627`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.38798739688100353`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.012373062466744654`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.4210579175432396`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.006008038631545547`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.38138376566880205`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.05188691529002674`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.3231789451283224`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.025533297920281525`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.33550164142094757`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.0041432876915889275`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.33327847761420476`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.01922278068219603`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.30205818490052144`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.0021758539801046157`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.32327234016351003`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.03132059772230647`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.3568517210243062`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.039606946514545265`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.4034287885898992`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.0421045654260446`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.4302857843643734`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.0005738856513356339`", " ", "\[ImaginaryI]"}]}]}], 
  "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", "21", "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["i", "site"], "=", "2"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["j", "site"], "=", "4"}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"reference", " ", "calculation"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
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
      SubscriptBox["ee", 
       RowBox[{"corr", ",", "ref"}]], "=", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"\[Chi]C", "[", 
         RowBox[{
          RowBox[{"BondEnergyOp", "[", 
           RowBox[{
            SubscriptBox["i", "site"], ",", "tH", ",", "U", ",", "M", ",", 
            "L"}], "]"}], ",", 
          RowBox[{"BondEnergyOp", "[", 
           RowBox[{
            SubscriptBox["j", "site"], ",", "tH", ",", "U", ",", "M", ",", 
            "L"}], "]"}], ",", "HB", ",", "\[Beta]", ",", "t"}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"t", ",", 
          SubscriptBox["t", "list"]}], "}"}]}], "]"}]}]}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.17593919380762388`", ",", 
   RowBox[{"0.16575043390940322`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.025439759502980403`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.22631745047033958`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.09045313238986057`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.3387664879856831`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.05671922210545683`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.3274198182361906`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.027644750998400695`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.2709735094242094`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.009394816260423815`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.3306542475361862`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.0783270995901049`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.4227307963493683`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.05529816470143722`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.43943247352862297`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.00948452163228178`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.39323304294923445`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.02537721446033068`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.3880211016613277`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.012373302476291387`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.42105893508110054`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.006039046475649155`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.3813742038899482`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.0518603224516`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.3232250460430734`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.02552690546798597`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.3355113789852367`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.0041118749400559824`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.33327266119321014`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.019208345886929577`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.30208534498093786`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.00215338367928235`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.32330953953126707`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.031328608560266036`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.3568885965868874`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.03960060137530332`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.403437620730379`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.0420974608574793`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.430301281942347`", "\[VeryThinSpace]", "+", 
    RowBox[{"0.0006035401431073973`", " ", "\[ImaginaryI]"}]}]}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Abs", "[", 
   RowBox[{
    SubscriptBox["ee", "corr"], "-", 
    SubscriptBox["ee", 
     RowBox[{"corr", ",", "ref"}]]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.00004228946557463531`", ",", "0.00006132329926261566`", ",", 
   "0.0000598063899993741`", ",", "0.00002713658549993198`", ",", 
   "0.000027467459388308725`", ",", "0.00004687983179722139`", ",", 
   "0.000035246899331295884`", ",", "0.000011561790220685714`", ",", 
   "0.000014954830279479973`", ",", "0.00001095959248915776`", ",", 
   "0.000033705634859508805`", ",", "0.000031024535117420156`", ",", 
   "0.000028259629693976454`", ",", "0.000046542000249549414`", ",", 
   "0.00003288740058374002`", ",", "0.000015562585504057453`", ",", 
   "0.00003525031045635787`", ",", "0.000038052154818584684`", ",", 
   "0.000037417481311270934`", ",", "0.000011334972428424351`", ",", 
   "0.00003345988352174963`"}], "}"}]], "Output"]
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
           SubscriptBox["ee", "corr"], "]"}]}], "}"}], "]"}], ",", 
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["t", "list"], ",", 
          RowBox[{"Im", "[", 
           SubscriptBox["ee", "corr"], "]"}]}], "}"}], "]"}]}], "}"}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<t\>\"", ",", 
        "\"\<\[LeftAngleBracket]\!\(\*SubscriptBox[\(e\), \(j\)]\)(t) \
\!\(\*SubscriptBox[\(e\), \
\(i\)]\)(0)\!\(\*SubscriptBox[\(\[RightAngleBracket]\), \(\[Beta]\)]\)\>\""}],
        "}"}]}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<Re\>\"", ",", "\"\<Im\>\""}], "}"}]}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", 
      RowBox[{
       SubscriptBox["plot", "label"], "<>", 
       "\"\<\\nred: independent reference calculation\>\""}]}]}], "]"}], ",", 
   RowBox[{"ListLinePlot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["t", "list"], ",", 
          RowBox[{"Re", "[", 
           SubscriptBox["ee", 
            RowBox[{"corr", ",", "ref"}]], "]"}]}], "}"}], "]"}], ",", 
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["t", "list"], ",", 
          RowBox[{"Im", "[", 
           SubscriptBox["ee", 
            RowBox[{"corr", ",", "ref"}]], "]"}]}], "}"}], "]"}]}], "}"}], 
     ",", 
     RowBox[{"PlotRange", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"All", ",", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"-", "1"}], ",", "1"}], "}"}]}], "}"}]}], ",", 
     RowBox[{"InterpolationOrder", "\[Rule]", "4"}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{
       RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}]}]}], "]"}]}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Export", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["fn", "export"], "<>", "\"\<ee_corr_L\>\"", "<>", 
     RowBox[{"ToString", "[", 
      SubscriptBox["L", "val"], "]"}], "<>", "\"\<.pdf\>\""}], ",", "%"}], 
   "]"}], ";"}]}], "Input"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{{}, {
       Hue[0.67, 0.6, 0.6], 
       Directive[
        PointSize[0.019444444444444445`], 
        RGBColor[0.368417, 0.506779, 0.709798], 
        AbsoluteThickness[1.6]], 
       PointBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQNpH8/pnmo+Zg/hXbDv2GHu1ml+FMp/YL8rRrR8
1c8zUP4L+3YenZI9665C+R/sv87ZuJjpyxUo/4s9b8wuOaXwi1D+D/sAud6T
RZow9X/ss7k1Ql/w3obyGRzqZC/ITZK/A+UzOXCpPuM4r3UTymdxUPQ1Fz95
5QaUz+agU5PyYs6nW1A+h4NYmWHJ9AyYPJeDtR3rvm/rYO7hcWAVzHpwuwJm
P5+Dt3CJQ34IjC/gEHwo49brkMtQvqDDBQ7diroNMP1CDm1tV2auuHYNyhd2
aO4O+H3sIsx9Ig7i1z4mne28bQ8AYGhfsw==
        "]], 
       Hue[0.9060679774997897, 0.6, 0.6], 
       Directive[
        PointSize[0.019444444444444445`], 
        RGBColor[0.880722, 0.611041, 0.142051], 
        AbsoluteThickness[1.6]], 
       PointBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQjR1csFd6s3zqLZlZ9hD+A/sc1hPHnmluh/Jf2H84
b1faybEWyv9g/7729IwNAXP2Q/hf7JXf5vqEBTRD5X/YT19s9qGXfwuU/8ee
Ial2nkPgGiifweGn6IM7YanNUP1MDjU6+9MF/8+E8lkceoS1Q3nCO6Hq2RyE
DH5MezS7AirP4SC7oPXH6wmroHwuh/eu0vPSVGdB+TwOK34oBvX+KIDq53PY
wlP5U2n9ZKi8gEPL93dbJS4nQvmCDiIqF+86cC6AqhdyWP740/QY9yVQvrBD
ygmO47v6lkL5Ig7VyiG8Uuec7AGrQ13C
        "]]}, {}}, {{}, {{{}, {}, {
         Hue[0.67, 0.6, 0.6], 
         Directive[
          PointSize[0.019444444444444445`], 
          AbsoluteThickness[1.6], 
          RGBColor[0.922526, 0.385626, 0.209179]], 
         LineBox[CompressedData["
1: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
DA7p6CTE14Zx4b//ICijnhdHPRTuceH/APZKnaE=
          "]]}, {
         Hue[0.9060679774997897, 0.6, 0.6], 
         Directive[
          PointSize[0.019444444444444445`], 
          AbsoluteThickness[1.6], 
          RGBColor[0.922526, 0.385626, 0.209179]], 
         LineBox[CompressedData["
1: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
          "]]}}}, {}}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 5.}, {-0.05188691529002674, 0.43942692765309477`}}, 
     DisplayFunction -> Identity, AspectRatio -> 
     NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> {True, True}, 
     AxesLabel -> {
       FormBox["\"t\"", TraditionalForm], 
       FormBox[
       "\"\[LeftAngleBracket]\\!\\(\\*SubscriptBox[\\(e\\), \\(j\\)]\\)(t) \
\\!\\(\\*SubscriptBox[\\(e\\), \\(i\\)]\\)(0)\\!\\(\\*SubscriptBox[\\(\
\[RightAngleBracket]\\), \\(\[Beta]\\)]\\)\"", TraditionalForm]}, 
     AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], Method -> {}, PlotLabel -> 
     FormBox["\"Bose-Hubbard model with\\n\\!\\(\\*SubscriptBox[\\(t\\), \\(H\
\\)]\\)=1, U=5, \[Mu]=1/7, M=2, L=5, \[Beta]=0.6\\nsites: i=2, j=4\\nred: \
independent reference calculation\"", TraditionalForm], 
     PlotRange -> {{0, 5.}, {-0.05188691529002674, 0.43942692765309477`}}, 
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
                    PointSize[0.7], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.7], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], 
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
                    PointSize[0.7], 
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    AbsoluteThickness[1.6]], {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.7], 
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    AbsoluteThickness[1.6]], 
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
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
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
                     Selectable -> False], ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}]}], "]"}], 
               ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.019444444444444445`", "]"}], 
                   ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    RowBox[{
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> 
                    RGBColor[
                    0.587148, 0.40736066666666665`, 0.09470066666666668], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 1.35 CurrentValue["FontCapHeight"]/
                    AbsoluteCurrentValue[Magnification]}]], 
                    "\[InvisibleSpace]"}], 
                    "RGBColor[0.880722, 0.611041, 0.142051]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.880722, 0.611041, 0.142051]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.880722, 0.611041, 0.142051], Editable -> False,
                     Selectable -> False], ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}]}], "]"}]}],
              "}"}], ",", 
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
   RowBox[{"Range", "[", 
    RowBox[{"0", ",", "5"}], "]"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  SubscriptBox["t", "idx"], "=", 
  RowBox[{"Flatten", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"Position", "[", 
      RowBox[{
       SubscriptBox["t", "list"], ",", "#"}], "]"}], "&"}], "/@", 
    SubscriptBox["t", "plot"]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "5", ",", "9", ",", "13", ",", "17", ",", "21"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"virtual", " ", "bond", " ", "dimension", " ", 
    RowBox[{"for", " ", "'"}], 
    RowBox[{"A", "'"}], " ", "operator"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
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
       "&"}], "/@", 
      RowBox[{
       RowBox[{"Partition", "[", 
        RowBox[{
         RowBox[{"Import", "[", 
          RowBox[{
           RowBox[{
            SubscriptBox["fn", "import"], "<>", "\"\<_DXA.dat\>\""}], ",", 
           "\"\<Integer64\>\""}], "]"}], ",", 
         RowBox[{
          SubscriptBox["L", "val"], "+", "1"}]}], "]"}], 
       "\[LeftDoubleBracket]", 
       SubscriptBox["t", "idx"], "\[RightDoubleBracket]"}]}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<j\>\"", ",", "\"\<\!\(\*SubscriptBox[\(D\), \(A, j\)]\)(t)\>\""}],
        "}"}]}], ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", 
      RowBox[{
      "\"\<virtual bond dimension of \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[ImaginaryI]\)\\\ H\\\ t/2\)]\
\) A \!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[Beta]\)\\\ H/2\)]\) \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\[ImaginaryI]\\\ H\\\ t/2\)]\)\\n\
\>\"", "<>", 
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
        LineBox[{{0., 1.}, {1., 9.}, {2., 57.}, {3., 22.}, {4., 9.}, {5., 
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
        LineBox[{{0., 1.}, {1., 9.}, {2., 81.}, {3., 81.}, {4., 9.}, {5., 
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
       "\"\\!\\(\\*SubscriptBox[\\(D\\), \\(A, j\\)]\\)(t)\"", 
        TraditionalForm]}, AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], Method -> {}, PlotLabel -> 
     FormBox["\"virtual bond dimension of \\!\\(\\*SuperscriptBox[\\(\
\[ExponentialE]\\), \\(\\(-\[ImaginaryI]\\)\\\\ H\\\\ t/2\\)]\\) A \
\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \\(\\(-\[Beta]\\)\\\\ \
H/2\\)]\\) \\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \
\\(\[ImaginaryI]\\\\ H\\\\ t/2\\)]\\)\\nBose-Hubbard model \
with\\n\\!\\(\\*SubscriptBox[\\(t\\), \\(H\\)]\\)=1, U=5, \[Mu]=1/7, M=2, \
L=5, \[Beta]=0.6\\nsites: i=2, j=4\"", TraditionalForm], 
     PlotRange -> {{0, 5.}, {0, 81.}}, PlotRangeClipping -> True, 
     PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{
      "\"t=0\"", "\"t=1\"", "\"t=2\"", "\"t=3\"", "\"t=4\"", "\"t=5\""}, 
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
       "&"}], "/@", 
      RowBox[{
       RowBox[{"Partition", "[", 
        RowBox[{
         RowBox[{"Import", "[", 
          RowBox[{
           RowBox[{
            SubscriptBox["fn", "import"], "<>", "\"\<_DXB.dat\>\""}], ",", 
           "\"\<Integer64\>\""}], "]"}], ",", 
         RowBox[{
          SubscriptBox["L", "val"], "+", "1"}]}], "]"}], 
       "\[LeftDoubleBracket]", 
       SubscriptBox["t", "idx"], "\[RightDoubleBracket]"}]}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<j\>\"", ",", "\"\<\!\(\*SubscriptBox[\(D\), \(B, j\)]\)(t)\>\""}],
        "}"}]}], ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", 
      RowBox[{
      "\"\<virtual bond dimension of \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\[ImaginaryI]\\\ H\\\ t/2\)]\) \!\
\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[Beta]\)\\\ H/2\)]\) B \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[ImaginaryI]\)\\\ H\\\ t/2\)]\
\)\\n\>\"", "<>", 
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
        LineBox[{{0., 1.}, {1., 9.}, {2., 22.}, {3., 22.}, {4., 9.}, {5., 
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
        LineBox[{{0., 1.}, {1., 9.}, {2., 71.}, {3., 80.}, {4., 9.}, {5., 
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
\[ExponentialE]\\), \\(\[ImaginaryI]\\\\ H\\\\ t/2\\)]\\) \
\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \\(\\(-\[Beta]\\)\\\\ \
H/2\\)]\\) B \\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \\(\\(-\
\[ImaginaryI]\\)\\\\ H\\\\ t/2\\)]\\)\\nBose-Hubbard model \
with\\n\\!\\(\\*SubscriptBox[\\(t\\), \\(H\\)]\\)=1, U=5, \[Mu]=1/7, M=2, \
L=5, \[Beta]=0.6\\nsites: i=2, j=4\"", TraditionalForm], 
     PlotRange -> {{0, 5.}, {0, 81.}}, PlotRangeClipping -> True, 
     PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{
      "\"t=0\"", "\"t=1\"", "\"t=2\"", "\"t=3\"", "\"t=4\"", "\"t=5\""}, 
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
      RowBox[{"-", "\[Beta]"}], " ", 
      RowBox[{"H", "/", "2"}]}]]}], " ", "*)"}], "\[IndentingNewLine]", 
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
      RowBox[{"-", "\[ImaginaryI]"}], " ", "H", " ", 
      RowBox[{"t", "/", "2"}]}]], " ", "A", " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Beta]"}], " ", 
      RowBox[{"H", "/", "2"}]}]], " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{"\[ImaginaryI]", " ", "H", " ", 
      RowBox[{"t", "/", "2"}]}]]}], " ", "*)"}], "\[IndentingNewLine]", 
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
     RowBox[{"\[ImaginaryI]", " ", "H", " ", 
      RowBox[{"t", "/", "2"}]}]], " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[Beta]"}], " ", 
      RowBox[{"H", "/", "2"}]}]], " ", "B", " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[ImaginaryI]"}], " ", "H", " ", 
      RowBox[{"t", "/", "2"}]}]]}], " ", "*)"}], "\[IndentingNewLine]", 
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
WindowSize->{1626, 920},
WindowMargins->{{223, Automatic}, {29, Automatic}},
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
Cell[2744, 81, 330, 11, 46, "Input"],
Cell[3077, 94, 3424, 91, 167, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6538, 190, 43, 0, 43, "Subsection"],
Cell[6584, 192, 228, 7, 52, "Input"],
Cell[6815, 201, 214, 7, 52, "Input"],
Cell[7032, 210, 236, 7, 67, "Input"],
Cell[7271, 219, 233, 7, 52, "Input"],
Cell[7507, 228, 285, 9, 52, "Input"],
Cell[7795, 239, 244, 8, 52, "Input"],
Cell[CellGroupData[{
Cell[8064, 251, 249, 7, 52, "Input"],
Cell[8316, 260, 29, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[8394, 266, 41, 0, 43, "Subsection"],
Cell[8438, 268, 1364, 40, 48, "Input"],
Cell[9805, 310, 2843, 78, 133, "Input"],
Cell[12651, 390, 431, 11, 31, "Input"],
Cell[CellGroupData[{
Cell[13107, 405, 484, 14, 72, "Input"],
Cell[13594, 421, 2755, 45, 72, "Output"],
Cell[16352, 468, 51, 1, 31, "Output"]
}, Open  ]],
Cell[16418, 472, 189, 6, 52, "Input"],
Cell[CellGroupData[{
Cell[16632, 482, 1528, 44, 72, "Input"],
Cell[18163, 528, 2656, 43, 72, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20856, 576, 246, 7, 52, "Input"],
Cell[21105, 585, 779, 13, 52, "Output"]
}, Open  ]],
Cell[21899, 601, 1045, 24, 52, "Input"],
Cell[22947, 627, 329, 10, 31, "Input"],
Cell[CellGroupData[{
Cell[23301, 641, 2441, 71, 92, "Input"],
Cell[25745, 714, 34744, 635, 314, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[60538, 1355, 45, 0, 43, "Subsection"],
Cell[60586, 1357, 151, 5, 31, "Input"],
Cell[CellGroupData[{
Cell[60762, 1366, 274, 9, 31, "Input"],
Cell[61039, 1377, 119, 3, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[61195, 1385, 2851, 76, 118, "Input"],
Cell[64049, 1463, 27729, 592, 336, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[91815, 2060, 2851, 76, 118, "Input"],
Cell[94669, 2138, 27729, 592, 336, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[122447, 2736, 49, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[122521, 2740, 742, 22, 54, "Input"],
Cell[123266, 2764, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[123333, 2769, 1021, 29, 54, "Input"],
Cell[124357, 2800, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[124424, 2805, 1021, 29, 54, "Input"],
Cell[125448, 2836, 30, 0, 31, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature BvDyDeoT1iwtNAwGgUfGlRE0 *)
