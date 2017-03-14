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
NotebookDataLength[      4316,        164]
NotebookOptionsPosition[      4429,        145]
NotebookOutlinePosition[      4772,        160]
CellTagsIndexPosition[      4729,        157]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Quantum number utility functions", "Section"],

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

Cell["Intersection of quantum numbers", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "41", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  SubscriptBox["q", "0"], "=", 
  RowBox[{"RandomInteger", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"-", "9"}], ",", "9"}], "}"}], ",", "12"}], 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  SubscriptBox["q", "1"], "=", 
  RowBox[{"RandomInteger", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"-", "9"}], ",", "9"}], "}"}], ",", "10"}], "]"}]}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "6"}], ",", "5", ",", 
   RowBox[{"-", "2"}], ",", 
   RowBox[{"-", "2"}], ",", "5", ",", "8", ",", "0", ",", "7", ",", 
   RowBox[{"-", "7"}], ",", 
   RowBox[{"-", "4"}], ",", "3", ",", "3"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"8", ",", "4", ",", "8", ",", 
   RowBox[{"-", "6"}], ",", "0", ",", "1", ",", 
   RowBox[{"-", "6"}], ",", 
   RowBox[{"-", "7"}], ",", "6", ",", 
   RowBox[{"-", "9"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  SubscriptBox["q", "is"], "=", 
  RowBox[{"Intersection", "[", 
   RowBox[{
    SubscriptBox["q", "0"], ",", 
    SubscriptBox["q", "1"]}], "]"}]}], "\[IndentingNewLine]", 
 RowBox[{"Length", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "7"}], ",", 
   RowBox[{"-", "6"}], ",", "0", ",", "8"}], "}"}]], "Output"],

Cell[BoxData["4"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "quantum", " ", "numbers", " ", "to", " ", "disk"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
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
      RowBox[{"i", ",", "0", ",", "1"}], "}"}]}], "]"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "save", " ", "common", " ", "quantum", " ", "numbers", " ", "to", " ", 
    "disk"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "base"], "<>", "\"\<_qis.dat\>\""}], ",", 
     SubscriptBox["q", "is"], ",", "\"\<Integer32\>\""}], "]"}], 
   ";"}]}]], "Input"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1560, 920},
WindowMargins->{{227, Automatic}, {84, Automatic}},
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
Cell[1486, 35, 51, 0, 63, "Section"],
Cell[1540, 37, 123, 3, 31, "Input"],
Cell[1666, 42, 174, 5, 31, "Input"],
Cell[CellGroupData[{
Cell[1865, 51, 53, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[1943, 55, 508, 17, 72, "Input"],
Cell[2454, 74, 268, 7, 31, "Output"],
Cell[2725, 83, 229, 6, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[2991, 94, 245, 7, 52, "Input"],
Cell[3239, 103, 131, 4, 31, "Output"],
Cell[3373, 109, 28, 0, 31, "Output"]
}, Open  ]],
Cell[3416, 112, 578, 15, 52, "Input"],
Cell[3997, 129, 404, 12, 52, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature SvTqW2ETo#GwRB19d5cgjJaL *)
