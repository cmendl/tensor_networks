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
NotebookDataLength[     25476,        825]
NotebookOptionsPosition[     23599,        738]
NotebookOutlinePosition[     23942,        753]
CellTagsIndexPosition[     23899,        750]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Virtual bond operations", "Section"],

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

Cell[CellGroupData[{

Cell["Truncated bond indices", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"NeumannEntropy", "[", "\[Sigma]_", "]"}], ":=", 
  RowBox[{"If", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"Norm", "[", "\[Sigma]", "]"}], "\[Equal]", "0"}], ",", "0", ",", 
    RowBox[{"Module", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"\[Sigma]sq", "=", 
        RowBox[{"Select", "[", 
         RowBox[{
          SuperscriptBox[
           RowBox[{"(", 
            FractionBox["\[Sigma]", 
             RowBox[{"Norm", "[", "\[Sigma]", "]"}]], ")"}], "2"], ",", 
          RowBox[{
           RowBox[{"#", ">", "0"}], "&"}]}], "]"}]}], "}"}], ",", 
      RowBox[{"-", 
       RowBox[{"\[Sigma]sq", ".", 
        RowBox[{"Log", "[", "\[Sigma]sq", "]"}]}]}]}], "]"}]}], 
   "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"fictitious", " ", "singular", " ", "values"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"SeedRandom", "[", "42", "]"}], "\[IndentingNewLine]", 
   RowBox[{
    SubscriptBox["\[Sigma]", "val"], "=", 
    RowBox[{"RandomReal", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"0", ",", "1"}], "}"}], ",", "27"}], "]"}]}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.4259052837159625`", ",", "0.39102315987416847`", ",", 
   "0.3470693535096594`", ",", "0.4537406306856451`", ",", 
   "0.55596334203812`", ",", "0.2891692533673895`", ",", 
   "0.2968480626450438`", ",", "0.2064076444638916`", ",", 
   "0.32516970578303916`", ",", "0.9733246886114033`", ",", 
   "0.2587960215042713`", ",", "0.5505816044038576`", ",", 
   "0.717286648744436`", ",", "0.7543526005471366`", ",", 
   "0.8603487993734615`", ",", "0.9969658446871783`", ",", 
   "0.7392260961589487`", ",", "0.03836455577694142`", ",", 
   "0.376127158995208`", ",", "0.2961986475539444`", ",", 
   "0.5281419089419908`", ",", "0.6073518077632123`", ",", 
   "0.902794607273971`", ",", "0.8406826077380374`", ",", 
   "0.8857522009322867`", ",", "0.5270830513051634`", ",", 
   "0.5606045878150887`"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  SubscriptBox["ind", "tr"], "=", 
  RowBox[{"TruncatedBondIndices", "[", 
   RowBox[{
    SubscriptBox["\[Sigma]", "val"], ",", "0.1"}], 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{"Length", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "1", ",", "4", ",", "5", ",", "10", ",", "12", ",", "13", ",", "14", ",", 
   "15", ",", "16", ",", "17", ",", "21", ",", "22", ",", "23", ",", "24", 
   ",", "25", ",", "26", ",", "27"}], "}"}]], "Output"],

Cell[BoxData["17"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "norm", " ", "of", " ", "retained", " ", "singular", " ", "values"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["\[Sigma]", "norm"], "=", 
   RowBox[{"Norm", "[", 
    RowBox[{
     SubscriptBox["\[Sigma]", "val"], "\[LeftDoubleBracket]", 
     SubscriptBox["ind", "tr"], "\[RightDoubleBracket]"}], "]"}]}]}]], "Input"],

Cell[BoxData["2.9761153823680653`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "entropy", " ", "of", " ", "retained", " ", "singular", " ", "values"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["\[Sigma]", "entropy"], "=", 
   RowBox[{"NeumannEntropy", "[", 
    RowBox[{
     SubscriptBox["\[Sigma]", "val"], "\[LeftDoubleBracket]", 
     SubscriptBox["ind", "tr"], "\[RightDoubleBracket]"}], "]"}]}]}]], "Input"],

Cell[BoxData["2.7094645770104036`"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "singular", " ", "values", " ", "to", " ", "disk"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "base"], "<>", "\"\<_sigma.dat\>\""}], ",", 
     SubscriptBox["\[Sigma]", "val"], ",", "\"\<Real64\>\""}], "]"}], 
   ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "truncated", " ", 
    RowBox[{"(", 
     RowBox[{"zero", "-", "based"}], ")"}], " ", "bond", " ", "indices", " ", 
    "to", " ", "disk"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "base"], "<>", "\"\<_indtr.dat\>\""}], ",", 
     RowBox[{
      SubscriptBox["ind", "tr"], "-", "1"}], ",", "\"\<Integer64\>\""}], 
    "]"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "save", " ", "norm", " ", "and", " ", "entropy", " ", "to", " ", "disk"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_sigma_norm.dat\>\""}], ",", 
      SubscriptBox["\[Sigma]", "norm"], ",", "\"\<Real64\>\""}], "]"}], ";"}],
    "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_sigma_entropy.dat\>\""}], ",", 
      SubscriptBox["\[Sigma]", "entropy"], ",", "\"\<Real64\>\""}], "]"}], 
    ";"}]}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Split a matrix", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"fictitious", " ", "quantum", " ", "numbers"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["q", "0"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "5"}], ",", "3", ",", 
       RowBox[{"-", "5"}], ",", 
       RowBox[{"-", "7"}], ",", "4", ",", "3", ",", "3", ",", "3", ",", 
       RowBox[{"-", "5"}], ",", 
       RowBox[{"-", "2"}], ",", "6", ",", "0", ",", 
       RowBox[{"-", "2"}], ",", "3", ",", "6"}], "}"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["q", "1"], "=", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "7"}], ",", "4", ",", 
       RowBox[{"-", "2"}], ",", "3", ",", 
       RowBox[{"-", "2"}], ",", "0", ",", "3", ",", "3", ",", "2", ",", 
       RowBox[{"-", "2"}], ",", "6", ",", "2", ",", "3"}], "}"}]}], 
    ";"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"common", " ", "quantum", " ", "numbers"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Intersection", "[", 
   RowBox[{
    SubscriptBox["q", "0"], ",", 
    SubscriptBox["q", "1"]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "7"}], ",", 
   RowBox[{"-", "2"}], ",", "0", ",", "3", ",", "4", ",", "6"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "42", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["A", "mat"], "=", 
   RowBox[{"Outer", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"If", "[", 
       RowBox[{
        RowBox[{"#1", "\[Equal]", "#2"}], ",", 
        RowBox[{"RandomComplex", "[", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"-", 
            RowBox[{"(", 
             RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], ",", 
           RowBox[{"1", "+", "\[ImaginaryI]"}]}], "}"}], "]"}], ",", "0"}], 
       "]"}], "&"}], ",", 
     SubscriptBox["q", "0"], ",", 
     SubscriptBox["q", "1"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"15", ",", "13"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  SubscriptBox["A", "mat"], "//", "MatrixForm"}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"},
     {"0", "0", "0", 
      RowBox[{
       RowBox[{"-", "0.14818943256807504`"}], "-", 
       RowBox[{"0.21795368025166306`", " ", "\[ImaginaryI]"}]}], "0", "0", 
      RowBox[{
       RowBox[{"-", "0.3058612929806812`"}], "-", 
       RowBox[{"0.09251873862870985`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.11192668407624007`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.42166149326522095`", " ", "\[ImaginaryI]"}]}], "0", "0", 
      "0", "0", 
      RowBox[{
       RowBox[{"-", "0.40630387470991236`"}], "-", 
       RowBox[{"0.5871847110722168`", " ", "\[ImaginaryI]"}]}]},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"},
     {
      RowBox[{
       RowBox[{"-", "0.34966058843392167`"}], "+", 
       RowBox[{"0.9466493772228066`", " ", "\[ImaginaryI]"}]}], "0", "0", "0",
       "0", "0", "0", "0", "0", "0", "0", "0", "0"},
     {"0", 
      RowBox[{
       RowBox[{"-", "0.48240795699145744`"}], "+", 
       RowBox[{"0.10116320880771523`", " ", "\[ImaginaryI]"}]}], "0", "0", 
      "0", "0", "0", "0", "0", "0", "0", "0", "0"},
     {"0", "0", "0", 
      RowBox[{"0.4345732974888721`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.5087052010942732`", " ", "\[ImaginaryI]"}]}], "0", "0", 
      RowBox[{"0.7206975987469231`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.9939316893743566`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.4784521923178975`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.9232708884461172`", " ", "\[ImaginaryI]"}]}], "0", "0", "0",
       "0", 
      RowBox[{
       RowBox[{"-", "0.24774568200958402`"}], "-", 
       RowBox[{"0.40760270489211115`", " ", "\[ImaginaryI]"}]}]},
     {"0", "0", "0", 
      RowBox[{"0.05628381788398151`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.21470361552642458`", " ", "\[ImaginaryI]"}]}], "0", "0", 
      RowBox[{"0.805589214547942`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.6813652154760748`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.7715044018645734`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.05416610261032684`", " ", "\[ImaginaryI]"}]}], "0", "0", 
      "0", "0", 
      RowBox[{"0.12120917563017741`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.8488420393389275`", " ", "\[ImaginaryI]"}]}]},
     {"0", "0", "0", 
      RowBox[{
       RowBox[{"-", "0.996845911847545`"}], "+", 
       RowBox[{"0.8012405031687013`", " ", "\[ImaginaryI]"}]}], "0", "0", 
      RowBox[{
       RowBox[{"-", "0.26502141490695497`"}], "-", 
       RowBox[{"0.4517705552075224`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.954240877484517`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.9214604974832064`", " ", "\[ImaginaryI]"}]}], "0", "0", "0",
       "0", 
      RowBox[{
       RowBox[{"-", "0.042476709497767384`"}], "+", 
       RowBox[{"0.697701006151882`", " ", "\[ImaginaryI]"}]}]},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"},
     {"0", "0", 
      RowBox[{
       RowBox[{"-", "0.2941360630773855`"}], "+", 
       RowBox[{"0.5990295152245264`", " ", "\[ImaginaryI]"}]}], "0", 
      RowBox[{
       RowBox[{"-", "0.2683475956722292`"}], "+", 
       RowBox[{"0.4797918840847606`", " ", "\[ImaginaryI]"}]}], "0", "0", "0",
       "0", 
      RowBox[{"0.579072654042172`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.6140431504923685`", " ", "\[ImaginaryI]"}]}], "0", "0", "0"},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", 
      RowBox[{"0.06934803946666701`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.6714448676391673`", " ", "\[ImaginaryI]"}]}], "0", "0"},
     {"0", "0", "0", "0", "0", 
      RowBox[{
       RowBox[{"-", "0.27405336540046354`"}], "-", 
       RowBox[{"0.11136574350494266`", " ", "\[ImaginaryI]"}]}], "0", "0", 
      "0", "0", "0", "0", "0"},
     {"0", "0", 
      RowBox[{
       RowBox[{"-", "0.31742239082740964`"}], "+", 
       RowBox[{"0.6531453706263979`", " ", "\[ImaginaryI]"}]}], "0", 
      RowBox[{"0.03829917188266707`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.7591384307933908`", " ", "\[ImaginaryI]"}]}], "0", "0", "0",
       "0", 
      RowBox[{"0.3528033233061274`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.8806101876558512`", " ", "\[ImaginaryI]"}]}], "0", "0", "0"},
     {"0", "0", "0", 
      RowBox[{
       RowBox[{"-", "0.5845941418263498`"}], "+", 
       RowBox[{"0.24002771010077062`", " ", "\[ImaginaryI]"}]}], "0", "0", 
      RowBox[{"0.5386849567461933`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.4945112706221422`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.0013815508891399375`"}], "+", 
       RowBox[{"0.8184684788489616`", " ", "\[ImaginaryI]"}]}], "0", "0", "0",
       "0", 
      RowBox[{"0.6974114267415361`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.8672358302015843`", " ", "\[ImaginaryI]"}]}]},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", 
      RowBox[{
       RowBox[{"-", "0.3295212966366554`"}], "+", 
       RowBox[{"0.997302324324445`", " ", "\[ImaginaryI]"}]}], "0", "0"}
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

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     SubscriptBox["A", "0"], ",", 
     SubscriptBox["A", "1"], ",", 
     SubscriptBox["S", "val"], ",", 
     SubscriptBox["q", "bond"]}], "}"}], "=", 
   RowBox[{"SplitMatrix", "[", 
    RowBox[{
     SubscriptBox["A", "mat"], ",", 
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["q", "0"], ",", 
       SubscriptBox["q", "1"]}], "}"}], ",", "0.025"}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", "%"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"15", ",", "7"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"7", ",", "13"}], "}"}], ",", 
   RowBox[{"{", "7", "}"}], ",", 
   RowBox[{"{", "7", "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"singular", " ", "values"}], " ", "*)"}], "\[IndentingNewLine]", 
  SubscriptBox["S", "val"]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "1.0091618158156224`", ",", "1.8278059853447992`", ",", 
   "2.6449578316177926`", ",", "1.7968500504392122`", ",", 
   "1.7232498248702182`", ",", "0.6619090629147539`", ",", 
   "1.2485365721102817`"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"corresponding", " ", "quantum", " ", "numbers"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  SubscriptBox["q", "bond"]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "7"}], ",", 
   RowBox[{"-", "2"}], ",", "3", ",", "3", ",", "3", ",", "3", ",", "6"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "norm", " ", "of", " ", "retained", " ", "singular", " ", "values"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["S", "norm"], "=", 
   RowBox[{"Norm", "[", 
    SubscriptBox["S", "val"], "]"}]}]}]], "Input"],

Cell[BoxData["4.421573414944398`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "entropy", " ", "of", " ", "retained", " ", "singular", " ", "values"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["S", "entropy"], "=", 
   RowBox[{"NeumannEntropy", "[", 
    SubscriptBox["S", "val"], "]"}]}]}]], "Input"],

Cell[BoxData["1.694017698155948`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"approximation", " ", "error"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  FractionBox[
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["A", "0"], ".", 
      RowBox[{"DiagonalMatrix", "[", 
       SubscriptBox["S", "val"], "]"}], ".", 
      SubscriptBox["A", "1"]}], "-", 
     SubscriptBox["A", "mat"]}], "]"}], 
   RowBox[{"Norm", "[", 
    SubscriptBox["A", "mat"], "]"}]]}]], "Input"],

Cell[BoxData["0.18635496967477871`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "check", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"Sort", "[", 
     RowBox[{
      SubscriptBox["S", "val"], ",", "Greater"}], "]"}], "-", 
    RowBox[{
     RowBox[{"SingularValueList", "[", 
      SubscriptBox["A", "mat"], "]"}], "\[LeftDoubleBracket]", 
     RowBox[{"1", ";;", 
      RowBox[{"Length", "[", 
       SubscriptBox["S", "val"], "]"}]}], "\[RightDoubleBracket]"}]}], 
   "]"}]}]], "Input"],

Cell[BoxData["6.280369834735101`*^-16"], "Output"]
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
    RowBox[{
     SubscriptBox["A", "0"], 
     RowBox[{"Outer", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"#1", "\[NotEqual]", "#2"}], ",", "1", ",", "0"}], "]"}], 
        "&"}], ",", 
       SubscriptBox["q", "0"], ",", 
       SubscriptBox["q", "bond"]}], "]"}]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     SubscriptBox["A", "1"], 
     RowBox[{"Outer", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"#1", "\[NotEqual]", "#2"}], ",", "1", ",", "0"}], "]"}], 
        "&"}], ",", 
       SubscriptBox["q", "bond"], ",", 
       SubscriptBox["q", "1"]}], "]"}]}], "]"}]}]}]], "Input"],

Cell[BoxData["0.`"], "Output"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", " ", "normalization"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"ConjugateTranspose", "[", 
       SubscriptBox["A", "0"], "]"}], ".", 
      SubscriptBox["A", "0"]}], "-", 
     RowBox[{"IdentityMatrix", "[", 
      RowBox[{"Length", "[", 
       SubscriptBox["q", "bond"], "]"}], "]"}]}], "]"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["A", "1"], ".", 
      RowBox[{"ConjugateTranspose", "[", 
       SubscriptBox["A", "1"], "]"}]}], "-", 
     RowBox[{"IdentityMatrix", "[", 
      RowBox[{"Length", "[", 
       SubscriptBox["q", "bond"], "]"}], "]"}]}], "]"}]}]}]], "Input"],

Cell[BoxData["8.63169118748947`*^-16"], "Output"],

Cell[BoxData["6.774280163087778`*^-16"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"save", " ", "'"}], 
    RowBox[{"A", "'"}], " ", "matrix", " ", "to", " ", "disk"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "base"], "<>", "\"\<_A.dat\>\""}], ",", 
     RowBox[{"Transpose", "[", 
      SubscriptBox["A", "mat"], "]"}], ",", "\"\<Complex128\>\""}], "]"}], 
   ";"}]}]], "Input"],

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
         SubscriptBox["fn", "base"], "<>", "\"\<_q\>\"", "<>", 
         RowBox[{"ToString", "[", "i", "]"}], "<>", "\"\<.dat\>\""}], ",", 
        SubscriptBox["q", "i"], ",", "\"\<Integer32\>\""}], "]"}], ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", "0", ",", "1"}], "}"}]}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_qbond.dat\>\""}], ",", 
      SubscriptBox["q", "bond"], ",", "\"\<Integer32\>\""}], "]"}], 
    ";"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "SVD", " ", "approximation", " ", 
    RowBox[{"of", " ", "'"}], 
    RowBox[{"A", "'"}], " ", "to", " ", "disk"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "base"], "<>", "\"\<_A01.dat\>\""}], ",", 
     RowBox[{"Transpose", "[", 
      RowBox[{
       SubscriptBox["A", "0"], ".", 
       RowBox[{"DiagonalMatrix", "[", 
        SubscriptBox["S", "val"], "]"}], ".", 
       SubscriptBox["A", "1"]}], "]"}], ",", "\"\<Complex128\>\""}], "]"}], 
   ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "save", " ", "norm", " ", "and", " ", "entropy", " ", "of", " ", 
    "retained", " ", "singular", " ", "values", " ", "to", " ", "disk"}], " ",
    "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_S_norm.dat\>\""}], ",", 
      SubscriptBox["S", "norm"], ",", "\"\<Real64\>\""}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_S_entropy.dat\>\""}], ",", 
      SubscriptBox["S", "entropy"], ",", "\"\<Real64\>\""}], "]"}], 
    ";"}]}]}]], "Input"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1560, 920},
WindowMargins->{{212, Automatic}, {32, Automatic}},
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
Cell[1486, 35, 42, 0, 63, "Section"],
Cell[1531, 37, 123, 3, 31, "Input"],
Cell[1657, 42, 68, 1, 31, "Input"],
Cell[1728, 45, 174, 5, 31, "Input"],
Cell[CellGroupData[{
Cell[1927, 54, 44, 0, 43, "Subsection"],
Cell[1974, 56, 746, 22, 49, "Input"],
Cell[CellGroupData[{
Cell[2745, 82, 418, 12, 72, "Input"],
Cell[3166, 96, 862, 16, 52, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4065, 117, 246, 7, 52, "Input"],
Cell[4314, 126, 248, 5, 31, "Output"],
Cell[4565, 133, 29, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4631, 138, 406, 11, 52, "Input"],
Cell[5040, 151, 46, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5123, 156, 422, 11, 52, "Input"],
Cell[5548, 169, 46, 0, 31, "Output"]
}, Open  ]],
Cell[5609, 172, 391, 11, 52, "Input"],
Cell[6003, 185, 500, 14, 52, "Input"],
Cell[6506, 201, 688, 20, 72, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7231, 226, 36, 0, 43, "Subsection"],
Cell[7270, 228, 924, 27, 72, "Input"],
Cell[CellGroupData[{
Cell[8219, 259, 267, 8, 52, "Input"],
Cell[8489, 269, 154, 5, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[8680, 279, 754, 22, 72, "Input"],
Cell[9437, 303, 75, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[9549, 310, 83, 2, 31, "Input"],
Cell[9635, 314, 5583, 118, 263, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15255, 437, 518, 17, 52, "Input"],
Cell[15776, 456, 241, 8, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16054, 469, 162, 4, 52, "Input"],
Cell[16219, 475, 264, 6, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16520, 486, 188, 5, 52, "Input"],
Cell[16711, 493, 164, 5, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16912, 503, 294, 9, 52, "Input"],
Cell[17209, 514, 45, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17291, 519, 310, 9, 52, "Input"],
Cell[17604, 530, 45, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17686, 535, 470, 15, 69, "Input"],
Cell[18159, 552, 47, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[18243, 557, 495, 14, 52, "Input"],
Cell[18741, 573, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[18828, 578, 1065, 33, 72, "Input"],
Cell[19896, 613, 30, 0, 31, "Output"],
Cell[19929, 615, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[19996, 620, 782, 24, 72, "Input"],
Cell[20781, 646, 49, 0, 31, "Output"],
Cell[20833, 648, 50, 0, 31, "Output"]
}, Open  ]],
Cell[20898, 651, 456, 14, 52, "Input"],
Cell[21357, 667, 850, 24, 72, "Input"],
Cell[22210, 693, 627, 18, 52, "Input"],
Cell[22840, 713, 731, 21, 72, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 1vDI#wgyX9Nt#Bw1ieJyVtml *)
