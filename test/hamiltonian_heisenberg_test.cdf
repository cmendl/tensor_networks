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
NotebookDataLength[     20272,        654]
NotebookOptionsPosition[     20263,        631]
NotebookOutlinePosition[     20606,        646]
CellTagsIndexPosition[     20563,        643]
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

Cell["Heisenberg Hamiltonian", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "local", " ", "Hamiltonian", " ", "terms", " ", "acting", " ", "on", " ", 
    "neighboring", " ", "lattice", " ", "sites"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"h2", "[", 
    RowBox[{"J_List", ",", "h_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"S", "=", 
        RowBox[{
         FractionBox["1", "2"], 
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
               RowBox[{"-", "1"}]}], "}"}]}], "}"}]}], "}"}]}]}], ",", 
       RowBox[{"id", "=", 
        RowBox[{"IdentityMatrix", "[", "2", "]"}]}], ",", "SzI", ",", "ISz"}],
       "}"}], ",", 
     RowBox[{
      RowBox[{"SzI", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         RowBox[{"S", "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}], 
         ",", "id"}], "]"}]}], ";", 
      RowBox[{"ISz", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{"id", ",", 
         RowBox[{
         "S", "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}]}], 
        "]"}]}], ";", 
      RowBox[{
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"Sum", "[", 
          RowBox[{
           RowBox[{
            RowBox[{
            "J", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], 
            RowBox[{"KroneckerProduct", "[", 
             RowBox[{
              RowBox[{
              "S", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], 
              ",", 
              RowBox[{
              "S", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}]}], 
             "]"}]}], ",", 
           RowBox[{"{", 
            RowBox[{"i", ",", "3"}], "}"}]}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"j", ",", 
           RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], "-", 
       RowBox[{"h", " ", 
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"L", "\[Equal]", "2"}], ",", 
          RowBox[{"{", 
           RowBox[{"SzI", "+", "ISz"}], "}"}], ",", 
          RowBox[{"Table", "[", 
           RowBox[{
            RowBox[{"If", "[", 
             RowBox[{
              RowBox[{"j", "\[Equal]", "1"}], ",", 
              RowBox[{"SzI", "+", 
               RowBox[{
                FractionBox["1", "2"], "ISz"}]}], ",", 
              RowBox[{"If", "[", 
               RowBox[{
                RowBox[{"j", "<", 
                 RowBox[{"L", "-", "1"}]}], ",", 
                RowBox[{
                 FractionBox["1", "2"], 
                 RowBox[{"(", 
                  RowBox[{"SzI", "+", "ISz"}], ")"}]}], ",", 
                RowBox[{
                 RowBox[{
                  FractionBox["1", "2"], "SzI"}], "+", "ISz"}]}], "]"}]}], 
             "]"}], ",", 
            RowBox[{"{", 
             RowBox[{"j", ",", 
              RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}], "]"}]}]}]}]}], 
    "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"number", " ", "of", " ", "lattice", " ", "sites"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["L", "val"], "=", "7"}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["h", "sym"], "=", 
   RowBox[{"h2", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       SubscriptBox["J", "x"], ",", 
       SubscriptBox["J", "y"], ",", 
       SubscriptBox["J", "z"]}], "}"}], ",", "hext", ",", 
     SubscriptBox["L", "val"]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"6", ",", "4", ",", "4"}], "}"}]], "Output"]
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
  RowBox[{"MatrixForm", "/@", 
   SubscriptBox["h", "sym"]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {
        RowBox[{
         RowBox[{"-", 
          FractionBox[
           RowBox[{"3", " ", "hext"}], "4"]}], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}]},
       {"0", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["hext", "4"]}], "-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0"},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], 
        RowBox[{
         FractionBox["hext", "4"], "-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0"},
       {
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox[
          RowBox[{"3", " ", "hext"}], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}]}
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
       {
        RowBox[{
         RowBox[{"-", 
          FractionBox["hext", "2"]}], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}]},
       {"0", 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0"},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0"},
       {
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox["hext", "2"], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}]}
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
       {
        RowBox[{
         RowBox[{"-", 
          FractionBox["hext", "2"]}], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}]},
       {"0", 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0"},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0"},
       {
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox["hext", "2"], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}]}
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
       {
        RowBox[{
         RowBox[{"-", 
          FractionBox["hext", "2"]}], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}]},
       {"0", 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0"},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0"},
       {
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox["hext", "2"], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}]}
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
       {
        RowBox[{
         RowBox[{"-", 
          FractionBox["hext", "2"]}], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}]},
       {"0", 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0"},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0"},
       {
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox["hext", "2"], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}]}
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
       {
        RowBox[{
         RowBox[{"-", 
          FractionBox[
           RowBox[{"3", " ", "hext"}], "4"]}], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}]},
       {"0", 
        RowBox[{
         FractionBox["hext", "4"], "-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0"},
       {"0", 
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], 
        RowBox[{
         RowBox[{"-", 
          FractionBox["hext", "4"]}], "-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0"},
       {
        RowBox[{
         FractionBox[
          SubscriptBox["J", "x"], "4"], "-", 
         FractionBox[
          SubscriptBox["J", "y"], "4"]}], "0", "0", 
        RowBox[{
         FractionBox[
          RowBox[{"3", " ", "hext"}], "4"], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}]}
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
   RowBox[{
    RowBox[{"save", " ", "'"}], 
    RowBox[{"h", "'"}], " ", "matrices", " ", "as", " ", "reference", " ", 
    "to", " ", "disk"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], "}"}], ",", 
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
                 RowBox[{
                  SubscriptBox["J", "x"], "\[Rule]", 
                  RowBox[{"5", "/", "11"}]}], ",", 
                 RowBox[{
                  SubscriptBox["J", "y"], "\[Rule]", 
                  RowBox[{"7", "/", "10"}]}], ",", 
                 RowBox[{
                  SubscriptBox["J", "z"], "\[Rule]", 
                  RowBox[{"13", "/", "8"}]}], ",", 
                 RowBox[{"hext", "\[Rule]", 
                  RowBox[{"2", "/", "7"}]}]}], "}"}]}], ",", 
              RowBox[{"{", 
               RowBox[{"2", ",", "2", ",", "2", ",", "2"}], "}"}]}], "]"}], 
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
WindowSize->{1803, 920},
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
Cell[2706, 71, 44, 0, 43, "Subsection"],
Cell[2753, 73, 3623, 104, 123, "Input"],
Cell[6379, 179, 233, 7, 52, "Input"],
Cell[CellGroupData[{
Cell[6637, 190, 397, 12, 52, "Input"],
Cell[7037, 204, 83, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7157, 211, 313, 10, 52, "Input"],
Cell[7473, 223, 116, 3, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7626, 231, 166, 4, 52, "Input"],
Cell[7795, 237, 10485, 336, 249, "Output"]
}, Open  ]],
Cell[18295, 576, 1940, 51, 52, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature yxTg1Hk6NaZVNBwPJi63iHi9 *)
