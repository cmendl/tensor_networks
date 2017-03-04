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
NotebookDataLength[     36017,       1197]
NotebookOptionsPosition[     32490,       1055]
NotebookOutlinePosition[     32833,       1070]
CellTagsIndexPosition[     32790,       1067]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Projected Entangled Pair States (PEPS)", "Section"],

Cell[TextData[{
 "Reference:\n\tV. Murg, F. Verstraete, J. I. Cirac\n\tVariational study of \
hard-core bosons in a two-dimensional optical lattice using projected \
entangled pair states\n\tPhys. Rev. A 75, 033605 (2007) ",
 ButtonBox["DOI",
  BaseStyle->"Hyperlink",
  ButtonData->{
    URL["http://dx.doi.org/10.1103/PhysRevA.75.033605"], None},
  ButtonNote->"http://dx.doi.org/10.1103/PhysRevA.75.033605"]
}], "Text"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell["Common functions", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"reshape", " ", "array"}], ",", " ", 
    RowBox[{
    "similar", " ", "to", " ", "the", " ", "Matlab", " ", "command"}]}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Reshape", "[", 
    RowBox[{"A_", ",", "dim_"}], "]"}], ":=", 
   RowBox[{"Fold", "[", 
    RowBox[{"Partition", ",", 
     RowBox[{"Flatten", "[", "A", "]"}], ",", 
     RowBox[{"Reverse", "[", 
      RowBox[{"Rest", "[", "dim", "]"}], "]"}]}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"Reorder", "[", "A_", "]"}], ":=", 
  RowBox[{"Transpose", "[", 
   RowBox[{"A", ",", 
    RowBox[{"Reverse", "[", 
     RowBox[{"Range", "[", 
      RowBox[{"ArrayDepth", "[", "A", "]"}], "]"}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"RowMajorLayout", "[", "A_", "]"}], ":=", 
  RowBox[{"Flatten", "[", "A", "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"ColumnMajorLayout", "[", "A_", "]"}], ":=", 
  RowBox[{"RowMajorLayout", "[", 
   RowBox[{"Reorder", "[", "A", "]"}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "reshape", " ", "array", " ", "corresponding", " ", "to", " ", "column", 
    " ", "major", " ", "memory", " ", "layout"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"ReshapeColumnMajor", "[", 
    RowBox[{"A_", ",", "dim_"}], "]"}], ":=", 
   RowBox[{"Reorder", "[", 
    RowBox[{"Reshape", "[", 
     RowBox[{
      RowBox[{"Reorder", "[", "A", "]"}], ",", 
      RowBox[{"Reverse", "[", "dim", "]"}]}], "]"}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"ConstructETensor", "[", "A_", "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"n", "=", 
      RowBox[{
       RowBox[{"ArrayDepth", "[", "A", "]"}], "-", "1"}]}], "}"}], ",", 
    RowBox[{"Simplify", "[", 
     RowBox[{"ReshapeColumnMajor", "[", 
      RowBox[{
       RowBox[{"Transpose", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"ConjugateTranspose", "[", 
           RowBox[{"A", ",", 
            RowBox[{"Prepend", "[", 
             RowBox[{
              RowBox[{"Range", "[", "n", "]"}], ",", 
              RowBox[{"n", "+", "1"}]}], "]"}]}], "]"}], ".", "A"}], ",", 
         RowBox[{"Join", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"2", 
             RowBox[{"Range", "[", "n", "]"}]}], "-", "1"}], ",", 
           RowBox[{"2", 
            RowBox[{"Range", "[", "n", "]"}]}]}], "]"}]}], "]"}], ",", 
       SuperscriptBox[
        RowBox[{"Rest", "[", 
         RowBox[{"Dimensions", "[", "A", "]"}], "]"}], "2"]}], "]"}], "]"}]}],
    "]"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Consistency checks", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "check", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"SeedRandom", "[", "42", "]"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"RandomInteger", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"0", ",", "9"}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"2", ",", "15", ",", "8"}], "}"}]}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{"RowMajorLayout", "[", "%", "]"}], "-", 
     RowBox[{"RowMajorLayout", "[", 
      RowBox[{"Reshape", "[", 
       RowBox[{"%", ",", 
        RowBox[{"{", 
         RowBox[{"5", ",", "4", ",", "3", ",", "4"}], "}"}]}], "]"}], "]"}]}],
     "]"}]}]}]], "Input"],

Cell[BoxData["0"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "check", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"SeedRandom", "[", "42", "]"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"RandomInteger", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"0", ",", "9"}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"2", ",", "15", ",", "8"}], "}"}]}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{"ColumnMajorLayout", "[", "%", "]"}], "-", 
     RowBox[{"ColumnMajorLayout", "[", 
      RowBox[{"ReshapeColumnMajor", "[", 
       RowBox[{"%", ",", 
        RowBox[{"{", 
         RowBox[{"5", ",", "4", ",", "3", ",", "4"}], "}"}]}], "]"}], "]"}]}],
     "]"}]}]}]], "Input"],

Cell[BoxData["0"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"note", " ", 
     RowBox[{"that", " ", "'"}], 
     RowBox[{
      RowBox[{"Reshape", "[", "]"}], "'"}], " ", "corresponds", " ", "to", 
     " ", "row", " ", "major", " ", "layout"}], ",", " ", 
    RowBox[{"makes", " ", "a", " ", "difference"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"SeedRandom", "[", "42", "]"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"RandomInteger", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"0", ",", "9"}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"2", ",", "15", ",", "8"}], "}"}]}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Norm", "[", 
    RowBox[{
     RowBox[{"ColumnMajorLayout", "[", "%", "]"}], "-", 
     RowBox[{"ColumnMajorLayout", "[", 
      RowBox[{"Reshape", "[", 
       RowBox[{"%", ",", 
        RowBox[{"{", 
         RowBox[{"5", ",", "4", ",", "3", ",", "4"}], "}"}]}], "]"}], "]"}]}],
     "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"2", " ", 
  SqrtBox["1015"]}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["PEPS state example", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"NDimsA", "[", 
   RowBox[{"x_", ",", "y_", ",", "L_"}], "]"}], ":=", 
  RowBox[{"5", "-", 
   RowBox[{"If", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"x", ">", "1"}], "\[And]", 
      RowBox[{"x", "<", "L"}]}], ",", "0", ",", "1"}], "]"}], "-", 
   RowBox[{"If", "[", 
    RowBox[{
     RowBox[{
      RowBox[{"y", ">", "1"}], "\[And]", 
      RowBox[{"y", "<", "L"}]}], ",", "0", ",", "1"}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"CreateATensor", "[", 
   RowBox[{"x_", ",", "y_", ",", "L_", ",", "d_", ",", "D_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"dim", "=", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"d", ",", "D", ",", "D", ",", "D", ",", "D"}], "}"}], 
       "\[LeftDoubleBracket]", 
       RowBox[{"1", ";;", 
        RowBox[{"NDimsA", "[", 
         RowBox[{"x", ",", "y", ",", "L"}], "]"}]}], 
       "\[RightDoubleBracket]"}]}], "}"}], ",", 
    RowBox[{"ReshapeColumnMajor", "[", 
     RowBox[{
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{
         FractionBox["1", "16"], 
         RowBox[{"(", 
          RowBox[{
           RowBox[{"Mod", "[", 
            RowBox[{
             RowBox[{"i", "-", "1"}], ",", "2"}], "]"}], "-", 
           FractionBox["1", "2"], "+", 
           SuperscriptBox[
            RowBox[{"(", 
             RowBox[{"1", "+", 
              SuperscriptBox[
               RowBox[{"(", 
                RowBox[{"x", "-", "1"}], ")"}], "2"], "+", 
              SuperscriptBox[
               RowBox[{"(", 
                RowBox[{"y", "-", "1"}], ")"}], "2"]}], ")"}], 
            RowBox[{
             RowBox[{"-", "1"}], "/", "2"}]], "+", 
           RowBox[{"\[ImaginaryI]", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"Mod", "[", 
               RowBox[{"i", ",", "5"}], "]"}], "-", 
              FractionBox["5", "2"], "+", 
              RowBox[{"ArcTan", "[", 
               RowBox[{"x", "-", "y", "-", "1"}], "]"}]}], ")"}]}]}], ")"}]}],
         ",", 
        RowBox[{"{", 
         RowBox[{"i", ",", 
          RowBox[{"Times", "@@", "dim"}]}], "}"}]}], "]"}], ",", "dim"}], 
     "]"}]}], "]"}]}]], "Input"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["L", "val"], "=", "4"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["d", "val"], "=", "5"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["Dv", "val"], "=", "3"}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"CreateATensor", "[", 
     RowBox[{"1", ",", "2", ",", 
      SubscriptBox["L", "val"], ",", 
      SubscriptBox["d", "val"], ",", 
      SubscriptBox["Dv", "val"]}], "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"Dimensions", "[", "%", "]"}], ",", 
     RowBox[{"%", "\[LeftDoubleBracket]", 
      RowBox[{"1", ",", "2", ",", "3", ",", "3"}], 
      "\[RightDoubleBracket]"}]}], "}"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"5", ",", "3", ",", "3", ",", "3"}], "}"}], ",", 
   RowBox[{
    FractionBox["1", "16"], " ", 
    RowBox[{"(", 
     RowBox[{
      FractionBox["1", "2"], "+", 
      FractionBox["1", 
       SqrtBox["2"]], "+", 
      RowBox[{"\[ImaginaryI]", " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["3", "2"]}], "-", 
         RowBox[{"ArcTan", "[", "2", "]"}]}], ")"}]}]}], ")"}]}]}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["peps", "data"], "=", 
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"CreateATensor", "[", 
      RowBox[{"x", ",", "y", ",", 
       SubscriptBox["L", "val"], ",", 
       SubscriptBox["d", "val"], ",", 
       SubscriptBox["Dv", "val"]}], "]"}], ",", 
     RowBox[{"{", 
      RowBox[{"x", ",", 
       SubscriptBox["L", "val"]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"y", ",", 
       SubscriptBox["L", "val"]}], "}"}]}], "]"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "L", "\[Times]", "L", "\[Times]", "d", "\[Times]", "D", "\[Times]", "D", 
    RowBox[{"(", 
     RowBox[{"\[Times]", "D", "\[Times]", "D"}], ")"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Dimensions", "[", 
    SubscriptBox["peps", "data"], "]"}], "\[IndentingNewLine]", 
   RowBox[{"Times", "@@", "%"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "5", ",", "3", ",", "3"}], "}"}]], "Output"],

Cell[BoxData["720"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["peps", "data"], "\[LeftDoubleBracket]", 
   RowBox[{"2", ",", "3"}], "\[RightDoubleBracket]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "3", ",", "3", ",", "3", ",", "3"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["peps", "data"], "\[LeftDoubleBracket]", 
   RowBox[{"1", ",", "2"}], "\[RightDoubleBracket]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"5", ",", "3", ",", "3", ",", "3"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"N", "[", 
   RowBox[{
    SubscriptBox["peps", "data"], "\[LeftDoubleBracket]", 
    RowBox[{"1", ",", "2", ",", "1", ",", "1", ",", "1"}], 
    "\[RightDoubleBracket]"}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"0.012944173824159216`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.16294679486213065`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.07544417382415922`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.16294679486213065`", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.012944173824159216`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.16294679486213065`", " ", "\[ImaginaryI]"}]}]}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "to", " ", "disk", " ", "for", " ", "comparison"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{"\"\<peps_test_A01_ref.dat\>\"", ",", 
     RowBox[{"ColumnMajorLayout", "[", 
      RowBox[{"N", "[", 
       RowBox[{
        SubscriptBox["peps", "data"], "\[LeftDoubleBracket]", 
        RowBox[{"1", ",", "2"}], "\[RightDoubleBracket]"}], "]"}], "]"}], 
     ",", "\"\<Complex128\>\""}], "]"}], ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["\[OpenCurlyQuote]E\[CloseCurlyQuote] tensor example", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"ConstructETensor", "[", 
     RowBox[{"CreateATensor", "[", 
      RowBox[{"1", ",", "2", ",", 
       SubscriptBox["L", "val"], ",", 
       SubscriptBox["d", "val"], ",", 
       SubscriptBox["Dv", "val"]}], "]"}], "]"}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"Dimensions", "[", "%", "]"}], ",", 
     RowBox[{"N", "[", 
      RowBox[{"%", "\[LeftDoubleBracket]", 
       RowBox[{"2", ",", "1", ",", "1"}], "\[RightDoubleBracket]"}], "]"}]}], 
    "}"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"9", ",", "9", ",", "9"}], "}"}], ",", 
   RowBox[{"0.09439310549037477`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.021902924678883166`", " ", "\[ImaginaryI]"}]}]}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["tensorE", "data"], "=", 
   RowBox[{"Outer", "[", 
    RowBox[{"ConstructETensor", ",", 
     SubscriptBox["peps", "data"], ",", "2"}], "]"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "corner", " ", "E", " ", "states", " ", "have", " ", "dimension", " ", 
    SuperscriptBox["D", "2"], "\[Times]", 
    SuperscriptBox["D", "2"]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Dimensions", "[", 
   SubscriptBox["tensorE", "data"], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"4", ",", "4", ",", "9", ",", "9"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["tensorE", "data"], "\[LeftDoubleBracket]", 
   RowBox[{"1", ",", "1"}], "\[RightDoubleBracket]"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["tensorE", "data"], "\[LeftDoubleBracket]", 
   RowBox[{"1", ",", "3"}], "\[RightDoubleBracket]"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["tensorE", "data"], "\[LeftDoubleBracket]", 
   RowBox[{"2", ",", "3"}], "\[RightDoubleBracket]"}], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"9", ",", "9"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"9", ",", "9", ",", "9"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"9", ",", "9", ",", "9", ",", "9"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"numerical", " ", "version"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["tensorEN", "data"], "=", 
    RowBox[{"N", "[", 
     SubscriptBox["tensorE", "data"], "]"}]}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"consisteny", " ", "check"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{"Flatten", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
      RowBox[{"1", ",", "2"}], "\[RightDoubleBracket]"}], "-", 
     RowBox[{"ConstructETensor", "[", 
      RowBox[{"CreateATensor", "[", 
       RowBox[{"1", ",", "2", ",", 
        SubscriptBox["L", "val"], ",", 
        SubscriptBox["d", "val"], ",", 
        SubscriptBox["Dv", "val"]}], "]"}], "]"}]}], "]"}], "]"}]}]], "Input"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
    RowBox[{"1", ",", "2"}], "\[RightDoubleBracket]"}], 
   "\[LeftDoubleBracket]", 
   RowBox[{
    RowBox[{"1", ";;", "2"}], ",", "1", ",", "1"}], 
   "\[RightDoubleBracket]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.10139659462636483`", ",", 
   RowBox[{"0.09439310549037477`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.021902924678883166`", " ", "\[ImaginaryI]"}]}]}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "to", " ", "disk", " ", "for", " ", "comparison"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{"\"\<peps_test_E01_ref.dat\>\"", ",", 
     RowBox[{"ColumnMajorLayout", "[", 
      RowBox[{
       SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
       RowBox[{"1", ",", "2"}], "\[RightDoubleBracket]"}], "]"}], ",", 
     "\"\<Complex128\>\""}], "]"}], ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Construct matrix product state", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
   RowBox[{"2", ",", "4"}], "\[RightDoubleBracket]"}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
   RowBox[{"1", ",", "4"}], "\[RightDoubleBracket]"}], "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"9", ",", "9", ",", "9"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"9", ",", "9"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "shuffle", " ", "\"\<right\>\"", " ", "level", " ", "to", " ", "the", " ", 
    "right"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["mps", 
      RowBox[{"data", ",", "top"}]], "=", 
     RowBox[{
      RowBox[{"Transpose", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
         RowBox[{"1", ",", "1"}], "\[RightDoubleBracket]"}], ",", 
        RowBox[{"{", 
         RowBox[{"2", ",", "1"}], "}"}]}], "]"}], ".", 
      RowBox[{"Transpose", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
         RowBox[{"2", ",", "1"}], "\[RightDoubleBracket]"}], ",", 
        RowBox[{"{", 
         RowBox[{"1", ",", "3", ",", "2"}], "}"}]}], "]"}], ".", 
      RowBox[{"Transpose", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
         RowBox[{"3", ",", "1"}], "\[RightDoubleBracket]"}], ",", 
        RowBox[{"{", 
         RowBox[{"1", ",", "3", ",", "2"}], "}"}]}], "]"}], ".", 
      RowBox[{
       SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
       RowBox[{"4", ",", "1"}], "\[RightDoubleBracket]"}]}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}], "\[IndentingNewLine]", 
   RowBox[{"Times", "@@", "%"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"9", ",", "9", ",", "9", ",", "9"}], "}"}]], "Output"],

Cell[BoxData["6561"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "shuffle", " ", "\"\<right\>\"", " ", "level", " ", "to", " ", "the", " ", 
    "right"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["mps", 
      RowBox[{"data", ",", "bottom"}]], "=", 
     RowBox[{
      RowBox[{"Transpose", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
         RowBox[{"1", ",", "4"}], "\[RightDoubleBracket]"}], ",", 
        RowBox[{"{", 
         RowBox[{"2", ",", "1"}], "}"}]}], "]"}], ".", 
      RowBox[{"Transpose", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
         RowBox[{"2", ",", "4"}], "\[RightDoubleBracket]"}], ",", 
        RowBox[{"{", 
         RowBox[{"1", ",", "3", ",", "2"}], "}"}]}], "]"}], ".", 
      RowBox[{"Transpose", "[", 
       RowBox[{
        RowBox[{
         SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
         RowBox[{"3", ",", "4"}], "\[RightDoubleBracket]"}], ",", 
        RowBox[{"{", 
         RowBox[{"1", ",", "3", ",", "2"}], "}"}]}], "]"}], ".", 
      RowBox[{
       SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
       RowBox[{"4", ",", "4"}], "\[RightDoubleBracket]"}]}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}], "\[IndentingNewLine]", 
   RowBox[{"Times", "@@", "%"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"9", ",", "9", ",", "9", ",", "9"}], "}"}]], "Output"],

Cell[BoxData["6561"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["mps", 
     RowBox[{"data", ",", "top"}]], "\[LeftDoubleBracket]", 
    RowBox[{
     RowBox[{"1", ";;", "2"}], ",", "1", ",", "1", ",", "1"}], 
    "\[RightDoubleBracket]"}], "\[IndentingNewLine]", 
   RowBox[{
    SubscriptBox["mps", 
     RowBox[{"data", ",", "bottom"}]], "\[LeftDoubleBracket]", 
    RowBox[{
     RowBox[{"1", ";;", "2"}], ",", "1", ",", "1", ",", "1"}], 
    "\[RightDoubleBracket]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"0.007338885869247582`", "\[VeryThinSpace]", "+", 
    RowBox[{"4.9841876849359255`*^-22", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.00742918753901367`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.0005322287101705881`", " ", "\[ImaginaryI]"}]}]}], 
  "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"0.050376478121308695`", "\[VeryThinSpace]", "+", 
    RowBox[{"1.8856397867444028`*^-19", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.050389527972600094`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.0035609489586744397`", " ", "\[ImaginaryI]"}]}]}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "to", " ", "disk", " ", "for", " ", "comparison"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{"\"\<peps_test_mpstop_ref.dat\>\"", ",", 
      RowBox[{"ColumnMajorLayout", "[", 
       SubscriptBox["mps", 
        RowBox[{"data", ",", "top"}]], "]"}], ",", "\"\<Complex128\>\""}], 
     "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{"\"\<peps_test_mpsbottom_ref.dat\>\"", ",", 
      RowBox[{"ColumnMajorLayout", "[", 
       SubscriptBox["mps", 
        RowBox[{"data", ",", "bottom"}]], "]"}], ",", "\"\<Complex128\>\""}], 
     "]"}], ";"}]}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Construct matrix product operator", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "shuffle", " ", "\"\<right\>\"", " ", "level", " ", "to", " ", "the", " ", 
    "right"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["mpo", "2"], "=", 
     RowBox[{"Transpose", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"Transpose", "[", 
         RowBox[{
          RowBox[{
           SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
           RowBox[{"1", ",", "2"}], "\[RightDoubleBracket]"}], ",", 
          RowBox[{"{", 
           RowBox[{"3", ",", "1", ",", "2"}], "}"}]}], "]"}], ".", 
        RowBox[{"Transpose", "[", 
         RowBox[{
          RowBox[{
           SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
           RowBox[{"2", ",", "2"}], "\[RightDoubleBracket]"}], ",", 
          RowBox[{"{", 
           RowBox[{"1", ",", "4", ",", "2", ",", "3"}], "}"}]}], "]"}], ".", 
        RowBox[{"Transpose", "[", 
         RowBox[{
          RowBox[{
           SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
           RowBox[{"3", ",", "2"}], "\[RightDoubleBracket]"}], ",", 
          RowBox[{"{", 
           RowBox[{"1", ",", "4", ",", "2", ",", "3"}], "}"}]}], "]"}], ".", 
        RowBox[{
         SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
         RowBox[{"4", ",", "2"}], "\[RightDoubleBracket]"}]}], ",", 
       RowBox[{"{", 
        RowBox[{
        "1", ",", "5", ",", "2", ",", "6", ",", "3", ",", "7", ",", "4", ",", 
         "8"}], "}"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}], "\[IndentingNewLine]", 
   RowBox[{"Times", "@@", "%"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "9", ",", "9", ",", "9", ",", "9", ",", "9", ",", "9", ",", "9", ",", "9"}],
   "}"}]], "Output"],

Cell[BoxData["43046721"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["mpo", "2"], "\[LeftDoubleBracket]", 
   RowBox[{
    RowBox[{"1", ";;", "2"}], ",", "1", ",", "1", ",", "1", ",", "1", ",", 
    "1", ",", "1", ",", "1"}], "\[RightDoubleBracket]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"0.010884642589050166`", "\[VeryThinSpace]", "+", 
    RowBox[{"9.475929106848437`*^-21", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.010951279125235806`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.0007775510515817201`", " ", "\[ImaginaryI]"}]}]}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "to", " ", "disk", " ", "for", " ", "comparison"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{"\"\<peps_test_mpo_ref.dat\>\"", ",", 
     RowBox[{"ColumnMajorLayout", "[", 
      RowBox[{
       SubscriptBox["mpo", "2"], "\[LeftDoubleBracket]", 
       RowBox[{
       ";;", ",", ";;", ",", ";;", ",", "3", ",", "4", ",", "5", ",", "6", 
        ",", "7"}], "\[RightDoubleBracket]"}], "]"}], ",", 
     "\"\<Complex128\>\""}], "]"}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "shuffle", " ", "\"\<right\>\"", " ", "level", " ", "to", " ", "the", " ", 
    "right"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["mpo", "3"], "=", 
     RowBox[{"Transpose", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"Transpose", "[", 
         RowBox[{
          RowBox[{
           SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
           RowBox[{"1", ",", "3"}], "\[RightDoubleBracket]"}], ",", 
          RowBox[{"{", 
           RowBox[{"3", ",", "1", ",", "2"}], "}"}]}], "]"}], ".", 
        RowBox[{"Transpose", "[", 
         RowBox[{
          RowBox[{
           SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
           RowBox[{"2", ",", "3"}], "\[RightDoubleBracket]"}], ",", 
          RowBox[{"{", 
           RowBox[{"1", ",", "4", ",", "2", ",", "3"}], "}"}]}], "]"}], ".", 
        RowBox[{"Transpose", "[", 
         RowBox[{
          RowBox[{
           SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
           RowBox[{"3", ",", "3"}], "\[RightDoubleBracket]"}], ",", 
          RowBox[{"{", 
           RowBox[{"1", ",", "4", ",", "2", ",", "3"}], "}"}]}], "]"}], ".", 
        RowBox[{
         SubscriptBox["tensorEN", "data"], "\[LeftDoubleBracket]", 
         RowBox[{"4", ",", "3"}], "\[RightDoubleBracket]"}]}], ",", 
       RowBox[{"{", 
        RowBox[{
        "1", ",", "5", ",", "2", ",", "6", ",", "3", ",", "7", ",", "4", ",", 
         "8"}], "}"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}], "\[IndentingNewLine]", 
   RowBox[{"Times", "@@", "%"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "9", ",", "9", ",", "9", ",", "9", ",", "9", ",", "9", ",", "9", ",", "9"}],
   "}"}]], "Output"],

Cell[BoxData["43046721"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   SubscriptBox["mpo", "3"], "\[LeftDoubleBracket]", 
   RowBox[{
    RowBox[{"1", ";;", "2"}], ",", "1", ",", "1", ",", "1", ",", "1", ",", 
    "1", ",", "1", ",", "1"}], "\[RightDoubleBracket]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"0.022590032753401434`", "\[VeryThinSpace]", "-", 
    RowBox[{"1.160189729222014`*^-19", " ", "\[ImaginaryI]"}]}], ",", 
   RowBox[{"0.022636880947172453`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.0016195115722657319`", " ", "\[ImaginaryI]"}]}]}], 
  "}"}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Compute scalar product", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[
 SuperscriptBox[
  RowBox[{"(", 
   SubscriptBox["Dv", "val"], ")"}], 
  RowBox[{"2", 
   SubscriptBox["L", "val"]}]]], "Input"],

Cell[BoxData["6561"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"\[LeftAngleBracket]", 
    RowBox[{
     SubscriptBox["\[Psi]", "A"], ",", 
     SubscriptBox["\[Psi]", "A"]}], "\[RightAngleBracket]"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Flatten", "[", 
    SubscriptBox["mps", 
     RowBox[{"data", ",", "bottom"}]], "]"}], ".", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"Reshape", "[", 
      RowBox[{
       SubscriptBox["mpo", "3"], ",", 
       RowBox[{
        SuperscriptBox[
         SubscriptBox["Dv", "val"], 
         RowBox[{"2", 
          SubscriptBox["L", "val"]}]], 
        RowBox[{"{", 
         RowBox[{"1", ",", "1"}], "}"}]}]}], "]"}], ".", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"Reshape", "[", 
        RowBox[{
         SubscriptBox["mpo", "2"], ",", 
         RowBox[{
          SuperscriptBox[
           SubscriptBox["Dv", "val"], 
           RowBox[{"2", 
            SubscriptBox["L", "val"]}]], 
          RowBox[{"{", 
           RowBox[{"1", ",", "1"}], "}"}]}]}], "]"}], ".", 
       RowBox[{"Flatten", "[", 
        SubscriptBox["mps", 
         RowBox[{"data", ",", "top"}]], "]"}]}], ")"}]}], ")"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"28078.256738974185`", "\[VeryThinSpace]", "-", 
  RowBox[{"1.3289478188407048`*^-12", " ", "\[ImaginaryI]"}]}]], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1398, 827},
WindowMargins->{{Automatic, 217}, {49, Automatic}},
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
Cell[1486, 35, 57, 0, 63, "Section"],
Cell[1546, 37, 422, 9, 87, "Text"],
Cell[1971, 48, 123, 3, 31, "Input"],
Cell[CellGroupData[{
Cell[2119, 55, 38, 0, 43, "Subsection"],
Cell[2160, 57, 524, 15, 52, "Input"],
Cell[2687, 74, 257, 7, 31, "Input"],
Cell[2947, 83, 126, 3, 31, "Input"],
Cell[3076, 88, 171, 4, 31, "Input"],
Cell[3250, 94, 514, 14, 52, "Input"],
Cell[3767, 110, 1080, 31, 76, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4884, 146, 40, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[4949, 150, 721, 21, 92, "Input"],
Cell[5673, 173, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5738, 178, 738, 21, 92, "Input"],
Cell[6479, 201, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6544, 206, 997, 29, 92, "Input"],
Cell[7544, 237, 65, 2, 34, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[7658, 245, 40, 0, 43, "Subsection"],
Cell[7701, 247, 453, 14, 31, "Input"],
Cell[8157, 263, 1770, 51, 75, "Input"],
Cell[9930, 316, 281, 9, 72, "Input"],
Cell[CellGroupData[{
Cell[10236, 329, 564, 15, 72, "Input"],
Cell[10803, 346, 511, 18, 53, "Output"]
}, Open  ]],
Cell[11329, 367, 516, 16, 31, "Input"],
Cell[CellGroupData[{
Cell[11870, 387, 404, 11, 72, "Input"],
Cell[12277, 400, 103, 2, 31, "Output"],
Cell[12383, 404, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12450, 409, 183, 4, 31, "Input"],
Cell[12636, 415, 103, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12776, 422, 183, 4, 31, "Input"],
Cell[12962, 428, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13092, 435, 294, 7, 52, "Input"],
Cell[13389, 444, 445, 9, 31, "Output"]
}, Open  ]],
Cell[13849, 456, 530, 13, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14416, 474, 73, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[14514, 478, 639, 18, 72, "Input"],
Cell[15156, 498, 255, 7, 31, "Output"]
}, Open  ]],
Cell[15426, 508, 213, 6, 31, "Input"],
Cell[CellGroupData[{
Cell[15664, 518, 329, 8, 52, "Input"],
Cell[15996, 528, 93, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16126, 535, 568, 14, 72, "Input"],
Cell[16697, 551, 73, 2, 31, "Output"],
Cell[16773, 555, 83, 2, 31, "Output"],
Cell[16859, 559, 93, 2, 31, "Output"]
}, Open  ]],
Cell[16967, 564, 280, 8, 52, "Input"],
Cell[CellGroupData[{
Cell[17272, 576, 602, 15, 52, "Input"],
Cell[17877, 593, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17944, 598, 370, 10, 52, "Input"],
Cell[18317, 610, 215, 5, 31, "Output"]
}, Open  ]],
Cell[18547, 618, 499, 12, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[19083, 635, 52, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[19160, 639, 380, 9, 52, "Input"],
Cell[19543, 650, 83, 2, 31, "Output"],
Cell[19629, 654, 73, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[19739, 661, 1456, 38, 95, "Input"],
Cell[21198, 701, 93, 2, 31, "Output"],
Cell[21294, 705, 31, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[21362, 710, 1459, 38, 95, "Input"],
Cell[22824, 750, 93, 2, 31, "Output"],
Cell[22920, 754, 31, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[22988, 759, 556, 15, 76, "Input"],
Cell[23547, 776, 321, 7, 33, "Output"],
Cell[23871, 785, 322, 7, 33, "Output"]
}, Open  ]],
Cell[24208, 795, 735, 19, 76, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[24980, 819, 55, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[25060, 823, 1702, 42, 112, "Input"],
Cell[26765, 867, 139, 4, 31, "Output"],
Cell[26907, 873, 35, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[26979, 878, 315, 7, 52, "Input"],
Cell[27297, 887, 321, 7, 33, "Output"]
}, Open  ]],
Cell[27633, 897, 571, 14, 52, "Input"],
Cell[CellGroupData[{
Cell[28229, 915, 1702, 42, 112, "Input"],
Cell[29934, 959, 139, 4, 31, "Output"],
Cell[30076, 965, 35, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[30148, 970, 315, 7, 52, "Input"],
Cell[30466, 979, 321, 7, 33, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[30836, 992, 44, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[30905, 996, 142, 5, 31, "Input"],
Cell[31050, 1003, 31, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[31118, 1008, 1183, 38, 54, "Input"],
Cell[32304, 1048, 146, 2, 31, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Ww01pBaFDU#a4CKDmNVHQJNo *)
