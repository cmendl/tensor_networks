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
NotebookDataLength[     18055,        571]
NotebookOptionsPosition[     17895,        544]
NotebookOutlinePosition[     18238,        559]
CellTagsIndexPosition[     18195,        556]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Construction of local Hamiltonian operator terms", "Section"],

Cell[TextData[{
 "References:\n\tF. Verstraete, V. Murg, J. I. Cirac\n\tMatrix product \
states, projected entangled pair states, and variational renormalization \
group methods for quantum spin systems\n\tAdvances in Physics 57, 143-224 \
(2008) ",
 ButtonBox["DOI",
  BaseStyle->"Hyperlink",
  ButtonData->{
    URL["http://dx.doi.org/10.1080/14789940801912366"], None},
  ButtonNote->"http://dx.doi.org/10.1080/14789940801912366"],
 "\n\n\tThomas Barthel\n\tPrecise evaluation of thermal response functions by \
optimized density matrix renormalization group schemes\n\tNew Journal of \
Physics 15, 073010 (2013) ",
 ButtonBox["DOI",
  BaseStyle->"Hyperlink",
  ButtonData->{
    URL["http://dx.doi.org/10.1088/1367-2630/15/7/073010"], None},
  ButtonNote->"http://dx.doi.org/10.1088/1367-2630/15/7/073010"]
}], "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["fn", "base"], "=", 
   RowBox[{"FileBaseName", "[", 
    RowBox[{"NotebookFileName", "[", "]"}], "]"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell["Bose-Hubbard Hamiltonian", "Subsection"],

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
   "local", " ", "Hamiltonian", " ", "terms", " ", "acting", " ", "on", " ", 
    "neighboring", " ", "lattice", " ", "sites"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"h2", "[", 
    RowBox[{"t_", ",", "U_", ",", "\[Mu]_", ",", "M_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"bd", "=", 
        RowBox[{"SiteCreateOp", "[", "M", "]"}]}], ",", 
       RowBox[{"b", "=", 
        RowBox[{"SiteAnnihilOp", "[", "M", "]"}]}], ",", 
       RowBox[{"S", "=", 
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
          RowBox[{"NumberOp", "[", "M", "]"}]}]}]}], ",", "SI", ",", "IS"}], 
      "}"}], ",", 
     RowBox[{
      RowBox[{"SI", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{"S", ",", 
         RowBox[{"IdentityMatrix", "[", 
          RowBox[{"M", "+", "1"}], "]"}]}], "]"}]}], ";", 
      RowBox[{"IS", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         RowBox[{"IdentityMatrix", "[", 
          RowBox[{"M", "+", "1"}], "]"}], ",", "S"}], "]"}]}], ";", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{
         RowBox[{
          RowBox[{"-", "t"}], 
          RowBox[{"(", 
           RowBox[{
            RowBox[{"KroneckerProduct", "[", 
             RowBox[{"bd", ",", "b"}], "]"}], "+", 
            RowBox[{"KroneckerProduct", "[", 
             RowBox[{"b", ",", "bd"}], "]"}]}], ")"}]}], "+", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"j", "\[Equal]", "1"}], ",", 
           RowBox[{"SI", "+", 
            RowBox[{
             FractionBox["1", "2"], "IS"}]}], ",", 
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{"j", "<", 
              RowBox[{"L", "-", "1"}]}], ",", 
             RowBox[{
              FractionBox["1", "2"], 
              RowBox[{"(", 
               RowBox[{"SI", "+", "IS"}], ")"}]}], ",", 
             RowBox[{
              RowBox[{
               FractionBox["1", "2"], "SI"}], "+", "IS"}]}], "]"}]}], "]"}]}],
         ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", 
          RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}]}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"number", " ", "of", " ", "lattice", " ", "sites"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["L", "val"], "=", "7"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"maximal", " ", "occupancy", " ", "per", " ", "site"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["M", "val"], "=", "4"}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["h", "sym"], "=", 
   RowBox[{"h2", "[", 
    RowBox[{"t", ",", "U", ",", "\[Mu]", ",", 
     SubscriptBox["M", "val"], ",", 
     SubscriptBox["L", "val"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"6", ",", "25", ",", "25"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", "symmetric"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Norm", "[", 
     RowBox[{"#", "-", 
      RowBox[{"Transpose", "[", "#", "]"}]}], "]"}], "&"}], "/@", 
   SubscriptBox["h", "sym"]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"MatrixForm", "[", 
     RowBox[{"#", "\[LeftDoubleBracket]", 
      RowBox[{
       RowBox[{"1", ";;", "5"}], ",", 
       RowBox[{"1", ";;", "5"}]}], "\[RightDoubleBracket]"}], "]"}], "&"}], "/@", 
   SubscriptBox["h", "sym"]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {"0", "0", "0", "0", "0"},
       {"0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}], "0", "0", "0"},
       {"0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{"U", "-", 
           RowBox[{"2", " ", "\[Mu]"}]}], ")"}]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"3", " ", "U"}], "-", 
           RowBox[{"3", " ", "\[Mu]"}]}], ")"}]}], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"6", " ", "U"}], "-", 
           RowBox[{"4", " ", "\[Mu]"}]}], ")"}]}]}
      },
      GridBoxAlignment->{
       "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
        "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
      GridBoxSpacings->{"Columns" -> {
          Offset[0.27999999999999997`], {
           Offset[0.7]}, 
          Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
          Offset[0.2], {
           Offset[0.4]}, 
          Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
    Function[BoxForm`e$, 
     MatrixForm[BoxForm`e$]]], ",", 
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {"0", "0", "0", "0", "0"},
       {"0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}], "0", "0", "0"},
       {"0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{"U", "-", 
           RowBox[{"2", " ", "\[Mu]"}]}], ")"}]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"3", " ", "U"}], "-", 
           RowBox[{"3", " ", "\[Mu]"}]}], ")"}]}], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"6", " ", "U"}], "-", 
           RowBox[{"4", " ", "\[Mu]"}]}], ")"}]}]}
      },
      GridBoxAlignment->{
       "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
        "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
      GridBoxSpacings->{"Columns" -> {
          Offset[0.27999999999999997`], {
           Offset[0.7]}, 
          Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
          Offset[0.2], {
           Offset[0.4]}, 
          Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
    Function[BoxForm`e$, 
     MatrixForm[BoxForm`e$]]], ",", 
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {"0", "0", "0", "0", "0"},
       {"0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}], "0", "0", "0"},
       {"0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{"U", "-", 
           RowBox[{"2", " ", "\[Mu]"}]}], ")"}]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"3", " ", "U"}], "-", 
           RowBox[{"3", " ", "\[Mu]"}]}], ")"}]}], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"6", " ", "U"}], "-", 
           RowBox[{"4", " ", "\[Mu]"}]}], ")"}]}]}
      },
      GridBoxAlignment->{
       "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
        "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
      GridBoxSpacings->{"Columns" -> {
          Offset[0.27999999999999997`], {
           Offset[0.7]}, 
          Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
          Offset[0.2], {
           Offset[0.4]}, 
          Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
    Function[BoxForm`e$, 
     MatrixForm[BoxForm`e$]]], ",", 
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {"0", "0", "0", "0", "0"},
       {"0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}], "0", "0", "0"},
       {"0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{"U", "-", 
           RowBox[{"2", " ", "\[Mu]"}]}], ")"}]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"3", " ", "U"}], "-", 
           RowBox[{"3", " ", "\[Mu]"}]}], ")"}]}], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"6", " ", "U"}], "-", 
           RowBox[{"4", " ", "\[Mu]"}]}], ")"}]}]}
      },
      GridBoxAlignment->{
       "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
        "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
      GridBoxSpacings->{"Columns" -> {
          Offset[0.27999999999999997`], {
           Offset[0.7]}, 
          Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
          Offset[0.2], {
           Offset[0.4]}, 
          Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
    Function[BoxForm`e$, 
     MatrixForm[BoxForm`e$]]], ",", 
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {"0", "0", "0", "0", "0"},
       {"0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}], "0", "0", "0"},
       {"0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{"U", "-", 
           RowBox[{"2", " ", "\[Mu]"}]}], ")"}]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"3", " ", "U"}], "-", 
           RowBox[{"3", " ", "\[Mu]"}]}], ")"}]}], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"6", " ", "U"}], "-", 
           RowBox[{"4", " ", "\[Mu]"}]}], ")"}]}]}
      },
      GridBoxAlignment->{
       "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
        "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
      GridBoxSpacings->{"Columns" -> {
          Offset[0.27999999999999997`], {
           Offset[0.7]}, 
          Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
          Offset[0.2], {
           Offset[0.4]}, 
          Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
    Function[BoxForm`e$, 
     MatrixForm[BoxForm`e$]]], ",", 
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {"0", "0", "0", "0", "0"},
       {"0", 
        RowBox[{"-", "\[Mu]"}], "0", "0", "0"},
       {"0", "0", 
        RowBox[{"U", "-", 
         RowBox[{"2", " ", "\[Mu]"}]}], "0", "0"},
       {"0", "0", "0", 
        RowBox[{
         RowBox[{"3", " ", "U"}], "-", 
         RowBox[{"3", " ", "\[Mu]"}]}], "0"},
       {"0", "0", "0", "0", 
        RowBox[{
         RowBox[{"6", " ", "U"}], "-", 
         RowBox[{"4", " ", "\[Mu]"}]}]}
      },
      GridBoxAlignment->{
       "Columns" -> {{Center}}, "ColumnsIndexed" -> {}, 
        "Rows" -> {{Baseline}}, "RowsIndexed" -> {}},
      GridBoxSpacings->{"Columns" -> {
          Offset[0.27999999999999997`], {
           Offset[0.7]}, 
          Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
          Offset[0.2], {
           Offset[0.4]}, 
          Offset[0.2]}, "RowsIndexed" -> {}}], "\[NoBreak]", ")"}],
    Function[BoxForm`e$, 
     MatrixForm[BoxForm`e$]]]}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"Hamiltonian", " ", "parameters"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["t", "val"], "=", 
     RowBox[{"7", "/", "10"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["U", "val"], "=", 
     RowBox[{"16", "/", "5"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     SubscriptBox["\[Mu]", "val"], "=", 
     RowBox[{"13", "/", "10"}]}], ";"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"save", " ", "'"}], 
    RowBox[{"h", "'"}], " ", "matrices", " ", "as", " ", "reference", " ", 
    "to", " ", "disk"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"d", "=", 
        RowBox[{
         SubscriptBox["M", "val"], "+", "1"}]}]}], "}"}], ",", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"Export", "[", 
        RowBox[{
         RowBox[{
          SubscriptBox["fn", "base"], "<>", "\"\<_h\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"j", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{"Flatten", "[", 
          RowBox[{"Transpose", "[", 
           RowBox[{
            RowBox[{"ArrayReshape", "[", 
             RowBox[{
              RowBox[{
               RowBox[{
                SubscriptBox["h", "sym"], "\[LeftDoubleBracket]", "j", 
                "\[RightDoubleBracket]"}], "/.", 
               RowBox[{"{", 
                RowBox[{
                 RowBox[{"t", "\[Rule]", 
                  SubscriptBox["t", "val"]}], ",", 
                 RowBox[{"U", "\[Rule]", 
                  SubscriptBox["U", "val"]}], ",", 
                 RowBox[{"\[Mu]", "\[Rule]", 
                  SubscriptBox["\[Mu]", "val"]}]}], "}"}]}], ",", 
              RowBox[{"{", 
               RowBox[{"d", ",", "d", ",", "d", ",", "d"}], "}"}]}], "]"}], 
            ",", 
            RowBox[{"Reverse", "[", 
             RowBox[{"Range", "[", "4", "]"}], "]"}]}], "]"}], "]"}], ",", 
         "\"\<Real64\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", 
         RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1767, 920},
WindowMargins->{{Automatic, 153}, {85, Automatic}},
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
Cell[1486, 35, 67, 0, 63, "Section"],
Cell[1556, 37, 822, 18, 163, "Text"],
Cell[2381, 57, 123, 3, 31, "Input"],
Cell[2507, 62, 174, 5, 31, "Input"],
Cell[CellGroupData[{
Cell[2706, 71, 46, 0, 43, "Subsection"],
Cell[2755, 73, 524, 15, 52, "Input"],
Cell[3282, 90, 185, 5, 31, "Input"],
Cell[3470, 97, 2601, 74, 123, "Input"],
Cell[6074, 173, 233, 7, 52, "Input"],
Cell[6310, 182, 237, 7, 52, "Input"],
Cell[CellGroupData[{
Cell[6572, 193, 301, 8, 52, "Input"],
Cell[6876, 203, 85, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6998, 210, 313, 10, 52, "Input"],
Cell[7314, 222, 116, 3, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7467, 230, 370, 10, 52, "Input"],
Cell[7840, 242, 7638, 226, 260, "Output"]
}, Open  ]],
Cell[15493, 471, 516, 17, 92, "Input"],
Cell[16012, 490, 1855, 50, 52, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature XxpwA2IAYUbOqBw3uTzL0Ydj *)
