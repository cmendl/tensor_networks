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
NotebookDataLength[      8351,        286]
NotebookOptionsPosition[      7708,        255]
NotebookOutlinePosition[      8053,        270]
CellTagsIndexPosition[      8010,        267]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Quantum number utility functions", "Section",ExpressionUUID->"aa2328d5-7ca8-48dc-8b70-1097ddc8349d"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";"}]], "Input",ExpressionU\
UID->"9478e3db-41bd-46d1-9c4c-378020830218"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["fn", "base"], "=", 
   RowBox[{"FileBaseName", "[", 
    RowBox[{"NotebookFileName", "[", "]"}], "]"}]}], ";"}]], "Input",Expressio\
nUUID->"b0dd3b12-42b3-41a1-b828-4cb6d3e9a3b8"],

Cell[CellGroupData[{

Cell["Intersection of quantum numbers", "Subsection",ExpressionUUID->"0b06af0d-376a-4b75-9358-5d7b87d9fffc"],

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
      RowBox[{"-", "3"}], ",", "3"}], "}"}], ",", 
    RowBox[{"{", 
     RowBox[{"16", ",", "2"}], "}"}]}], "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  SubscriptBox["q", "1"], "=", 
  RowBox[{
   RowBox[{
    RowBox[{
     RowBox[{"{", 
      RowBox[{"1", ",", "0"}], "}"}], "+", "#"}], "&"}], "/@", 
   RowBox[{"RandomInteger", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "4"}], ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"17", ",", "2"}], "}"}]}], "]"}]}]}]}], "Input",ExpressionUUID->\
"4f22f5fd-c1dd-4c9d-9911-f7a7be8ac022"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "3"}], ",", "3"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "3"}], ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", 
     RowBox[{"-", "3"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "2"}], ",", 
     RowBox[{"-", "2"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", 
     RowBox[{"-", "3"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "2"}], ",", 
     RowBox[{"-", "3"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "2"}], ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "1"}], ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "0"}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"2fba9f32-3280-4a80-a21b-6abb5a3cf5aa"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "2"}], ",", 
     RowBox[{"-", "4"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", 
     RowBox[{"-", "3"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "3"}], ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "1"}], ",", 
     RowBox[{"-", "4"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", 
     RowBox[{"-", "3"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "2"}], ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "2"}], ",", 
     RowBox[{"-", "4"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "3"}], ",", 
     RowBox[{"-", "4"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", 
     RowBox[{"-", "1"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"1", ",", 
     RowBox[{"-", "4"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"0", ",", "0"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "3"}], ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", 
     RowBox[{"-", "3"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "1"}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"52d7cd80-b8a2-4b7d-aebc-9f6ec34b38fe"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  SubscriptBox["q", "is"], "=", 
  RowBox[{"SortBy", "[", 
   RowBox[{
    RowBox[{"Intersection", "[", 
     RowBox[{
      SubscriptBox["q", "0"], ",", 
      SubscriptBox["q", "1"]}], "]"}], ",", "Reverse"}], 
   "]"}]}], "\[IndentingNewLine]", 
 RowBox[{"Length", "[", "%", "]"}]}], "Input",ExpressionUUID->"29f8af23-6abe-\
4a6c-b561-8416184808ec"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"3", ",", 
     RowBox[{"-", "3"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"-", "3"}], ",", "2"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "2"}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"023666b5-523b-4361-9ea5-11e7748e5794"],

Cell[BoxData["4"], "Output",ExpressionUUID->"1dfa785d-919d-47e7-8843-f8890cf051a7"]
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
      RowBox[{"i", ",", "0", ",", "1"}], "}"}]}], "]"}], ";"}]}]], "Input",Exp\
ressionUUID->"81bbfff3-4fd2-4b92-8bb4-131713d1fc4e"],

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
   ";"}]}]], "Input",ExpressionUUID->"efa9a857-fff3-4110-827b-171a98d10f28"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1560, 920},
WindowMargins->{{227, Automatic}, {84, Automatic}},
FrontEndVersion->"11.1 for Microsoft Windows (64-bit) (April 18, 2017)",
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
Cell[1486, 35, 106, 0, 63, "Section", "ExpressionUUID" -> \
"aa2328d5-7ca8-48dc-8b70-1097ddc8349d"],
Cell[1595, 37, 180, 4, 30, "Input", "ExpressionUUID" -> \
"9478e3db-41bd-46d1-9c4c-378020830218"],
Cell[1778, 43, 231, 6, 30, "Input", "ExpressionUUID" -> \
"b0dd3b12-42b3-41a1-b828-4cb6d3e9a3b8"],
Cell[CellGroupData[{
Cell[2034, 53, 108, 0, 43, "Subsection", "ExpressionUUID" -> \
"0b06af0d-376a-4b75-9358-5d7b87d9fffc"],
Cell[CellGroupData[{
Cell[2167, 57, 791, 26, 69, "Input", "ExpressionUUID" -> \
"4f22f5fd-c1dd-4c9d-9911-f7a7be8ac022"],
Cell[2961, 85, 1264, 45, 30, "Output", "ExpressionUUID" -> \
"2fba9f32-3280-4a80-a21b-6abb5a3cf5aa"],
Cell[4228, 132, 1449, 53, 30, "Output", "ExpressionUUID" -> \
"52d7cd80-b8a2-4b7d-aebc-9f6ec34b38fe"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5714, 190, 377, 11, 50, "Input", "ExpressionUUID" -> \
"29f8af23-6abe-4a6c-b561-8416184808ec"],
Cell[6094, 203, 388, 13, 30, "Output", "ExpressionUUID" -> \
"023666b5-523b-4361-9ea5-11e7748e5794"],
Cell[6485, 218, 83, 0, 30, "Output", "ExpressionUUID" -> \
"1dfa785d-919d-47e7-8843-f8890cf051a7"]
}, Open  ]],
Cell[6583, 221, 635, 16, 50, "Input", "ExpressionUUID" -> \
"81bbfff3-4fd2-4b92-8bb4-131713d1fc4e"],
Cell[7221, 239, 459, 12, 50, "Input", "ExpressionUUID" -> \
"efa9a857-fff3-4110-827b-171a98d10f28"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* NotebookSignature ouDMBDFAKCAJSB1pu8b@5@07 *)
