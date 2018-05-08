(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 11.1' *)

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
NotebookDataLength[    137637,       3053]
NotebookOptionsPosition[    133295,       2934]
NotebookOutlinePosition[    133640,       2949]
CellTagsIndexPosition[    133597,       2946]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Heisenberg XXZ model simulation", "Section",ExpressionUUID->"15b55aae-663e-4a10-9187-0d24bad3f3ba"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";"}]], "Input",ExpressionU\
UID->"cb999c94-3c8c-486c-88a3-a3ab5c978574"],

Cell[CellGroupData[{

Cell["General definitions", "Subsection",ExpressionUUID->"df4012a7-eb65-431a-83d4-7d66b3e07ff6"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SparseIdentityMatrix", "[", "d_", "]"}], ":=", 
  RowBox[{"SparseArray", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"{", 
      RowBox[{"i_", ",", "i_"}], "}"}], "\[Rule]", "1"}], ",", 
    RowBox[{"{", 
     RowBox[{"d", ",", "d"}], "}"}]}], "]"}]}]], "Input",ExpressionUUID->\
"519d853e-1f85-4bb8-9607-e518ff30dc20"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "construct", " ", "Heisenberg", " ", "Hamiltonian", " ", "with", " ", 
    "open", " ", "boundary", " ", "conditions"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"HHeisenberg", "[", 
    RowBox[{"J_List", ",", "h_", ",", "L_"}], "]"}], ":=", 
   RowBox[{
    RowBox[{"Sum", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"J", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         RowBox[{"SparseIdentityMatrix", "[", 
          SuperscriptBox["2", 
           RowBox[{"j", "-", "1"}]], "]"}], ",", 
         RowBox[{
          FractionBox["1", "2"], 
          RowBox[{"PauliMatrix", "[", "i", "]"}]}], ",", 
         RowBox[{
          FractionBox["1", "2"], 
          RowBox[{"PauliMatrix", "[", "i", "]"}]}], ",", 
         RowBox[{"SparseIdentityMatrix", "[", 
          SuperscriptBox["2", 
           RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}]}], ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", "3"}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"j", ",", "1", ",", 
        RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], "-", 
    RowBox[{"h", " ", 
     RowBox[{"Sum", "[", 
      RowBox[{
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         RowBox[{"SparseIdentityMatrix", "[", 
          SuperscriptBox["2", 
           RowBox[{"j", "-", "1"}]], "]"}], ",", 
         RowBox[{
          FractionBox["1", "2"], 
          RowBox[{"PauliMatrix", "[", "3", "]"}]}], ",", 
         RowBox[{"SparseIdentityMatrix", "[", 
          SuperscriptBox["2", 
           RowBox[{"L", "-", "j"}]], "]"}]}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"j", ",", "1", ",", "L"}], "}"}]}], "]"}]}]}]}]}]], "Input",Ex\
pressionUUID->"d854b616-a424-404b-a598-45cdb6b0b91d"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Simulation parameters", "Subsection",ExpressionUUID->"146584b8-fef4-4cb6-93ab-b96c725e6027"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"coupling", " ", "constant"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["J", "val"], "=", 
    RowBox[{"{", 
     RowBox[{"1", ",", "1", ",", 
      RowBox[{"7", "/", "6"}]}], "}"}]}], ";"}]}]], "Input",ExpressionUUID->\
"688a7e53-8c61-4c30-bad6-cf2448e2f69d"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"magnetic", " ", "field", " ", "strength"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["h", "val"], "=", 
    FractionBox["1", "2"]}], ";"}]}]], "Input",ExpressionUUID->"f19fabe0-cab7-\
4bcd-913d-8c8982ceab18"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"number", " ", "of", " ", "lattice", " ", "sites"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["L", "val"], "=", "7"}], ";"}]}]], "Input",ExpressionUUID->\
"46a5000a-2c50-4818-b77c-5bdd0fcd7ff0"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"inverse", " ", "temperature"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["\[Beta]", "val"], "=", 
    RowBox[{"3", "/", "5"}]}], ";"}]}]], "Input",ExpressionUUID->"33592b91-\
314e-434f-a3bd-8944f2e250df"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["t", "list"], "=", 
   RowBox[{"Range", "[", 
    RowBox[{"0", ",", "8", ",", 
     RowBox[{"1", "/", "4"}]}], "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Length", "[", "%", "]"}]}], "Input",ExpressionUUID->"b5245949-29bb-\
4df5-8e1b-590f22baaf54"],

Cell[BoxData["33"], "Output",ExpressionUUID->"5385b0fc-a99b-4433-88d5-091392e767b9"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Response function", "Subsection",ExpressionUUID->"114dd179-6fb4-4d9b-96db-7dc6cfd5fc73"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"local", " ", 
    SubscriptBox["S", "z"], " ", "spin", " ", "operator"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Szloc", "[", 
    RowBox[{"j_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"KroneckerProduct", "[", 
    RowBox[{
     RowBox[{"SparseIdentityMatrix", "[", 
      SuperscriptBox["2", "j"], "]"}], ",", 
     RowBox[{
      FractionBox["1", "2"], 
      RowBox[{"PauliMatrix", "[", "3", "]"}]}], ",", 
     RowBox[{"SparseIdentityMatrix", "[", 
      SuperscriptBox["2", 
       RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}]}]}]], "Input",Expres\
sionUUID->"2d6cd612-4d6c-48d1-93f6-787ea1fa8674"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
    "local", " ", "spin", " ", "current", " ", "operator", " ", "between", 
     " ", "site", " ", "j", " ", "and", " ", "j"}], "+", "1"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"jloc", "[", 
    RowBox[{"j_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"KroneckerProduct", "[", 
    RowBox[{
     RowBox[{"SparseIdentityMatrix", "[", 
      SuperscriptBox["2", "j"], "]"}], ",", 
     RowBox[{
      RowBox[{"KroneckerProduct", "[", 
       RowBox[{
        RowBox[{
         FractionBox["1", "2"], 
         RowBox[{"PauliMatrix", "[", "1", "]"}]}], ",", 
        RowBox[{
         FractionBox["1", "2"], 
         RowBox[{"PauliMatrix", "[", "2", "]"}]}]}], "]"}], "-", 
      RowBox[{"KroneckerProduct", "[", 
       RowBox[{
        RowBox[{
         FractionBox["1", "2"], 
         RowBox[{"PauliMatrix", "[", "2", "]"}]}], ",", 
        RowBox[{
         FractionBox["1", "2"], 
         RowBox[{"PauliMatrix", "[", "1", "]"}]}]}], "]"}]}], ",", 
     RowBox[{"SparseIdentityMatrix", "[", 
      SuperscriptBox["2", 
       RowBox[{"L", "-", "j", "-", "2"}]], "]"}]}], "]"}]}]}]], "Input",Expres\
sionUUID->"9db6dd3c-5dcb-4bd7-a948-a5a7370e42dc"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", "Hermitian"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"With", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"j", "=", "3"}]}], "}"}], ",", 
    RowBox[{"Norm", "[", 
     RowBox[{"Flatten", "[", 
      RowBox[{
       RowBox[{"jloc", "[", 
        RowBox[{"j", ",", "L"}], "]"}], "-", 
       RowBox[{"ConjugateTranspose", "[", 
        RowBox[{"jloc", "[", 
         RowBox[{"j", ",", "L"}], "]"}], "]"}]}], "]"}], "]"}]}], 
   "]"}]}]], "Input",ExpressionUUID->"291ac800-6710-4064-ab02-6c419aae72b5"],

Cell[BoxData["0"], "Output",ExpressionUUID->"c8814571-eec2-4c33-898e-aa40c768e1da"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "commutator", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Comm", "[", 
    RowBox[{"A_", ",", "B_"}], "]"}], ":=", 
   RowBox[{
    RowBox[{"A", ".", "B"}], "-", 
    RowBox[{"B", ".", "A"}]}]}]}]], "Input",ExpressionUUID->"c04f5bc6-1ab3-\
4686-881f-d438872b9ce4"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", " ", "continuity", " ", "equation"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"J", "=", 
       SubscriptBox["J", "val"]}], ",", "h", ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"j", "=", "3"}]}], "}"}], ",", 
    RowBox[{"Norm", "[", 
     RowBox[{"Flatten", "[", 
      RowBox[{"FullSimplify", "[", 
       RowBox[{
        RowBox[{"\[ImaginaryI]", " ", 
         RowBox[{"Comm", "[", 
          RowBox[{
           RowBox[{"HHeisenberg", "[", 
            RowBox[{"J", ",", "h", ",", "L"}], "]"}], ",", 
           RowBox[{"Szloc", "[", 
            RowBox[{"j", ",", "L"}], "]"}]}], "]"}]}], "+", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"jloc", "[", 
           RowBox[{"j", ",", "L"}], "]"}], "-", 
          RowBox[{"jloc", "[", 
           RowBox[{
            RowBox[{"j", "-", "1"}], ",", "L"}], "]"}]}], ")"}]}], "]"}], 
      "]"}], "]"}]}], "]"}]}]], "Input",ExpressionUUID->"b5245d3c-aab4-4a2e-\
b880-6efeb17137c3"],

Cell[BoxData["0"], "Output",ExpressionUUID->"26a14dad-48ab-40ec-be88-b8778f9300dc"]
}, Open  ]],

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
          FractionBox["\[Beta]", "2"]}], "H"}], "]"}]}], ",", "Z"}], "}"}], 
    ",", 
    RowBox[{
     RowBox[{"Z", "=", 
      SuperscriptBox[
       RowBox[{"Norm", "[", 
        RowBox[{"\[Rho]\[Beta]", ",", "\"\<Frobenius\>\""}], "]"}], "2"]}], 
     ";", 
     RowBox[{
      FractionBox["1", "Z"], 
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
       "]"}]}]}]}], "]"}]}]], "Input",ExpressionUUID->"f261a7c1-24d4-4388-\
a434-221cf8db6059"],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["j", "A"], "=", "2"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["j", "B"], "=", "4"}], ";"}]}], "Input",ExpressionUUID->\
"c3d6f3d3-8463-4ca6-b3f6-06f0987cd2f2"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "current", " ", "correlation", " ", "reference", " ", "calculation"}], " ",
    "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["\[Chi]", 
     RowBox[{"current", ",", "ref"}]], "=", 
    RowBox[{"With", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"J", "=", 
         SubscriptBox["J", "val"]}], ",", 
        RowBox[{"h", "=", 
         SubscriptBox["h", "val"]}], ",", 
        RowBox[{"L", "=", 
         SubscriptBox["L", "val"]}], ",", 
        RowBox[{"\[Beta]", "=", 
         SubscriptBox["\[Beta]", "val"]}]}], "}"}], ",", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"\[Chi]C", "[", 
         RowBox[{
          RowBox[{"N", "[", 
           RowBox[{"jloc", "[", 
            RowBox[{
             StyleBox[
              SubscriptBox["j", "A"],
              FontWeight->"Plain"], ",", "L"}], "]"}], "]"}], ",", 
          RowBox[{"N", "[", 
           RowBox[{"jloc", "[", 
            RowBox[{
             SubscriptBox["j", "B"], ",", "L"}], "]"}], "]"}], ",", 
          RowBox[{"N", "[", 
           RowBox[{"HHeisenberg", "[", 
            RowBox[{"J", ",", "h", ",", "L"}], "]"}], "]"}], ",", "\[Beta]", 
          ",", "t"}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"t", ",", 
          SubscriptBox["t", "list"]}], "}"}]}], "]"}]}], "]"}]}], 
   ";"}]}]], "Input",ExpressionUUID->"28a57357-e2a7-4827-afda-96f1d1b05597"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["fn", "import"], "=", 
   RowBox[{"\"\<../output/heisenberg/L\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["L", "val"], "]"}], "<>", 
    "\"\<_current/heisenberg_XXZ_L\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["L", "val"], "]"}]}]}], ";"}]], "Input",ExpressionUUID->\
"bf141d14-1642-438f-857c-b5d62845b104"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "read", " ", "simulation", " ", "results", " ", "from", " ", "disk"}], " ",
    "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["\[Chi]", "current"], "=", 
    RowBox[{"Import", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "import"], "<>", "\"\<_chi.dat\>\""}], ",", 
      "\"\<Complex128\>\""}], "]"}]}], ";"}]}]], "Input",ExpressionUUID->\
"cdccbd54-61c5-41be-bb55-9b6638c18b8d"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["\[Chi]", "current"], "-", 
     SubscriptBox["\[Chi]", 
      RowBox[{"current", ",", "ref"}]]}], ",", "\[Infinity]"}], 
   "]"}]}]], "Input",ExpressionUUID->"7b615e2f-8f0e-4686-8ff5-0d926e108431"],

Cell[BoxData["2.8465557253363333`*^-6"], "Output",ExpressionUUID->"7f091838-aee0-4612-b334-d4bc5f81fa82"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["plot", "label"], "=", 
   RowBox[{"\"\<Heisenberg XXZ model with J=(\>\"", "<>", 
    RowBox[{"ToString", "[", 
     RowBox[{
      SubscriptBox["J", "val"], "\[LeftDoubleBracket]", "1", 
      "\[RightDoubleBracket]"}], "]"}], "<>", "\"\<,\>\"", "<>", 
    RowBox[{"ToString", "[", 
     RowBox[{"InputForm", "[", 
      RowBox[{
       SubscriptBox["J", "val"], "\[LeftDoubleBracket]", "2", 
       "\[RightDoubleBracket]"}], "]"}], "]"}], "<>", "\"\<,\>\"", "<>", 
    RowBox[{"ToString", "[", 
     RowBox[{"InputForm", "[", 
      RowBox[{
       SubscriptBox["J", "val"], "\[LeftDoubleBracket]", "3", 
       "\[RightDoubleBracket]"}], "]"}], "]"}], "<>", "\"\<), h=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     RowBox[{"InputForm", "[", 
      SubscriptBox["h", "val"], "]"}], "]"}], "<>", "\"\<, L=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     SubscriptBox["L", "val"], "]"}], "<>", "\"\<, \[Beta]=\>\"", "<>", 
    RowBox[{"ToString", "[", 
     RowBox[{"InputForm", "[", 
      SubscriptBox["\[Beta]", "val"], "]"}], "]"}], "<>", 
    "\"\<\\ncurrent operator \!\(\*SubscriptBox[\(\[Sigma]\), \(x\)]\)\
\[TensorProduct]\!\(\*SubscriptBox[\(\[Sigma]\), \(y\)]\)-\!\(\*SubscriptBox[\
\(\[Sigma]\), \(y\)]\)\[TensorProduct]\!\(\*SubscriptBox[\(\[Sigma]\), \(x\)]\
\)\>\""}]}], ";"}]], "Input",ExpressionUUID->"8cfb0879-3355-4fe4-ae03-\
6297f2d646aa"],

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
     RowBox[{"NotebookFileName", "[", "]"}], "]"}], "]"}]}], ";"}]], "Input",E\
xpressionUUID->"0059c950-40b6-4438-9ddf-23d0bf695239"],

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
           SubscriptBox["\[Chi]", "current"], "]"}]}], "}"}], "]"}], ",", 
       RowBox[{"Transpose", "[", 
        RowBox[{"{", 
         RowBox[{
          SubscriptBox["t", "list"], ",", 
          RowBox[{"Im", "[", 
           SubscriptBox["\[Chi]", "current"], "]"}]}], "}"}], "]"}]}], "}"}], 
     ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<t\>\"", ",", 
        "\"\<\[LeftAngleBracket]\!\(\*SubscriptBox[\(J\), \
\(A\)]\)[t]\!\(\*SubscriptBox[\(J\), \(B\)]\)[0]\!\(\*SubscriptBox[\(\
\[RightAngleBracket]\), \(\[Beta]\)]\)\>\""}], "}"}]}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{"\"\<Re\>\"", ",", "\"\<Im\>\""}], "}"}]}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", 
      RowBox[{
       SubscriptBox["plot", "label"], "<>", 
       "\"\<\\nred: independent reference calculation\>\""}]}]}], "]"}], ",", 
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
             SubscriptBox["\[Chi]", 
              RowBox[{"current", ",", "ref"}]], "]"}]}], "}"}], "]"}], "]"}], 
        "[", "\[Tau]", "]"}], ",", 
       RowBox[{
        RowBox[{"Interpolation", "[", 
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            SubscriptBox["t", "list"], ",", 
            RowBox[{"Im", "[", 
             SubscriptBox["\[Chi]", 
              RowBox[{"current", ",", "ref"}]], "]"}]}], "}"}], "]"}], "]"}], 
        "[", "\[Tau]", "]"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"\[Tau]", ",", "0", ",", "8"}], "}"}], ",", 
     RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
     RowBox[{"PlotStyle", "\[Rule]", 
      RowBox[{
       RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}]}]}], "]"}]}], 
  "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Export", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["fn", "export"], "<>", "\"\<J_corr_L\>\"", "<>", 
     RowBox[{"ToString", "[", 
      SubscriptBox["L", "val"], "]"}], "<>", "\"\<.pdf\>\""}], ",", "%"}], 
   "]"}], ";"}]}], "Input",ExpressionUUID->"1df23911-3df7-49f7-97da-\
f2405473fa28"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{{}, {{{}, {
         Hue[0.67, 0.6, 0.6], 
         Directive[
          PointSize[0.011000000000000001`], 
          RGBColor[0.368417, 0.506779, 0.709798], 
          AbsoluteThickness[1.6]], 
         PointBox[CompressedData["
1:eJxTTMoPSmViYGBQBGIQDQNGNxe7xIhY74fwLtizuu3rW8+6yA7Cf2D/957G
l/zcUHsI/4X9ru3s0oaXc6H8D/Y2x7cVTT1XA+V/sQ+6sn2GHHs7lP/D/tTX
Z90FPBOg/D/2nx7UZm95PBnKZ3BIOM9cYcszDcpncmDdOfdd47GpUD6LwySt
GV94b0yC8tkcNjham76M7IbyORwmbblTeo2nFsrncljNfDWwbKYPlM/jIKIq
cfbpvQKo//gcem4/+CsiVQvlCzgcrmxKuaffAOULOmSdWTqDN6wGyhdy8DaJ
dZV3KIHyhR0EZwRbsi5Mh/JFHL7u+/yDWTICyhd1WL7fiv/twUAoX8xB+n7K
9GiOGChf3KGX86nAmTMZUL6EgwjPzNevFhRB+ZIObeHXOPt3lEP5Ug5NV91a
eO2qoHxph8PXXpXfnl4J5cs4BBm7qOaIlEH5sg4rihcpSpyD+VfOocBozmPT
62lQvrzDVNZmszTheChfwSGBe9rdRVdi9wMAD1eTyQ==
          "]]}, {
         Hue[0.9060679774997897, 0.6, 0.6], 
         Directive[
          PointSize[0.011000000000000001`], 
          RGBColor[0.880722, 0.611041, 0.142051], 
          AbsoluteThickness[1.6]], 
         PointBox[CompressedData["
1:eJxTTMoPSmViYGBQBGIQDQMWrusvF5/j2QPhXbBf/Tjqa6BBoD2E/8B+IlfL
gr5niVD+C/t7kzeHCS3JhvI/2DdnT3gkxl0E5X+xv8PWeG23SQmU/8PeXkDx
UssjmPwf+2rWC4YnlmZB+QwOfYnLivVm+kP5TA78oa6ut6Tj9kP4LA5rpOf9
q2kpgvLZHHZ4LtD+E1oF5XM4rAut2cEqUgvlczm03hV71O0Ik+dxeDL995WX
H2H6+RxWi2fmOp5OgvIFHP4e0/pYOUsQyhd0kPp3eu+vYxFQ9wg5CNqkfV2/
AeZ/YQfnlSxPLWXjoXwRh/yf146GdAdA+aIOyeVK93/tl4KaJ+bQLsBXLCAX
COWLO+xpFRTekhYJ5Us4zNvTmpD/LQLKl3RoavpadfxVAJQv5fC46OCUy2KG
UL60Q+qyt7OOqjlB7ZNxCL7gE8HtHgzlyzr0Lbtzd5FnOJQv57BWizHwfRFM
Xt5h1+2pugaz7aF8BYesLl7PR51O+wEtk5Ph
          "]]}, {}}}, {}, {}, {{}, {}}, {{}, {}}}, {{{{}, {}, 
        TagBox[{
          Directive[
           Opacity[1.], 
           AbsoluteThickness[1.6], 
           RGBColor[0.922526, 0.385626, 0.209179]], 
          LineBox[CompressedData["
1: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
zFt3/D8ywHb8
           "]]}, Annotation[#, "Charting`Private`Tag$3471#1"]& ], 
        TagBox[{
          Directive[
           Opacity[1.], 
           AbsoluteThickness[1.6], 
           RGBColor[0.922526, 0.385626, 0.209179]], 
          LineBox[CompressedData["
1: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
/cONb2OCthD7Gy/v8SJwlXGEmPo2Ktxf2bDymOBPfSn3eFiLCk7vbEoaifgO
GTQZ39Olwhb5q3ceE/Hr48A+z51UkO/8b8qTyE9sp1SEDFCB3Pq9s4/I/2dZ
jXC3IRXezNEiVWtYqFr78IMUYyq4aLzi34VZKK2EarDHjArJXknl6ytZyE+z
/AOfBRXcjvwr/VRGrG97n1dqRYWtwQp2B0tZSPzoRNwBGyqc94zfX/eMhfB9
JeV6Ryq0SEPRrwKC3xD+hDhTofZvC3qeR8Tb59qi4EYFi6mRP3aEP0RpycHx
XlTYpKuatZRF6PX0ofEmHyr8dydykHyT0Ne6XrJvH6GvyWPS0DWiXmcXq/T8
qNDuJ5ckcZmFyv/4CsyHUYHT9kSsaSzhh7S4vvuRVDCq3BvaT/h535aMIocY
Kji/aM6xCGYhYb9W5pN4KggnPgu9tp/wb6/OvaOJVDApl4miWRF+j3SIoCdR
oahlUNnUhIVWiwfsbk6mglTtRNBuxELPre5NrE+jwswJWnKLBtFfWGjnwG0q
HDopgF9SiP5zUxG5cpcKVp/Wq/zHx0LP5nd9N8imAtNv82W9VSzkqRF17tYj
KkzvdRUgT3ihp1nf37uWUOHL0/3R95q9kNupUv93zVSgMQ27KDFeqHBNh0H8
Wyp0yqm9Mg30QjyVY2Kb3lFB8JVLjOM+Yj7NKpRf6KLCymDXm4U9XojrwEWS
2VcqnIh4+tdnjRd6ZO59u2qOCmvRTa3BCE+kqSavj/5Q4dXejzt3enqiKqH+
T3iJ6J8PKRz2Jp6orWMvrYZDFCSTzl+MFPVEM3tdkl7yi4Jxp8Zyc44H0g+2
YTfJisLbbNFrTXV7UVuGvnO7iSicsGjhmG53Qy6xf2ftzEXhTlIdL+cTN/TN
s+JKh4UoPDF6Fd2b7IZmFHVbO21EYXer1p5ZKzckVbDNpNtVFL7XHxCorXdF
3i/VNHv9ReF1GK/S2jwXNPtLWmQwTRSyGnq4+5yYKPXGUGPmNVEA7m8/Pqsx
0Vbr4jj7TIL/Xod9AScTBT2xGq/OEoVO29SfTY+d0Fhk/NvreaLQYHAu+ccq
J/SDZ/CCba0otJzRUNa544DeyxXxVY6JQurWseejDbbomb0pV6qRGPH/G/rX
Ld4UxZmdvlU8KAa3D+oUlXJ80m/3OOiuMSIGIlt+fZnjbq9SDLOQyvslBpE/
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
           "]]}, 
         Annotation[#, "Charting`Private`Tag$3471#2"]& ]}}, {}, {}}}, {
    DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 8.}, {-0.007903802339851112, 0.02153106732380594}}, 
     PlotRangeClipping -> True, ImagePadding -> All, DisplayFunction -> 
     Identity, AspectRatio -> NCache[GoldenRatio^(-1), 0.6180339887498948], 
     Axes -> {True, True}, AxesLabel -> {
       FormBox["\"t\"", TraditionalForm], 
       FormBox[
       "\"\[LeftAngleBracket]\\!\\(\\*SubscriptBox[\\(J\\), \\(A\\)]\\)[t]\\!\
\\(\\*SubscriptBox[\\(J\\), \\(B\\)]\\)[0]\\!\\(\\*SubscriptBox[\\(\
\[RightAngleBracket]\\), \\(\[Beta]\\)]\\)\"", TraditionalForm]}, 
     AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], 
     Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
           (Identity[#]& )[
            Part[#, 1]], 
           (Identity[#]& )[
            Part[#, 2]]}& ), "CopiedValueFunction" -> ({
           (Identity[#]& )[
            Part[#, 1]], 
           (Identity[#]& )[
            Part[#, 2]]}& )}}, PlotLabel -> 
     FormBox[
      "\"Heisenberg XXZ model with J=(1,1,7/6), h=1/2, L=7, \
\[Beta]=3/5\\ncurrent operator \\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(x\\)]\
\\)\[TensorProduct]\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \
\\(y\\)]\\)-\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(y\\)]\\)\[TensorProduct]\
\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(x\\)]\\)\\nred: independent \
reference calculation\"", TraditionalForm], 
     PlotRange -> {{0, 8.}, {-0.007903802339851112, 0.02153106732380594}}, 
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
                    PointSize[0.396], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.396], 
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
                    PointSize[0.396], 
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    AbsoluteThickness[1.6]], {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.396], 
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
                   RowBox[{"PointSize", "[", "0.011000000000000001`", "]"}], 
                   ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
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
                   RowBox[{"PointSize", "[", "0.011000000000000001`", "]"}], 
                   ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
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
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}], ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{"False", ",", "False"}], "}"}]}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& ), 
      Editable -> True], TraditionalForm], TraditionalForm]},
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
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output",ExpressionU\
UID->"033d578d-e384-4e61-97bf-e300bae1b50d"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Virtual bond dimensions", "Subsection",ExpressionUUID->"3edbeadf-8209-4b57-b40e-97f2092b9b69"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["t", "plot"], "=", 
   RowBox[{"{", 
    RowBox[{"0", ",", 
     RowBox[{"1", "/", "2"}], ",", "1", ",", "2", ",", "4", ",", "5"}], 
    "}"}]}], ";"}]], "Input",ExpressionUUID->"d40fa03a-ab73-4f14-82a1-\
e7ac66dbcc09"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"virtual", " ", "bond", " ", "dimension", " ", 
    RowBox[{"for", " ", "'"}], 
    RowBox[{
     SubscriptBox["J", "A"], "'"}], " ", "current", " ", "operator"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"Lv", "=", 
       SubscriptBox["L", "val"]}], ",", "data"}], "}"}], ",", 
    RowBox[{
     RowBox[{"data", "=", 
      RowBox[{"Partition", "[", 
       RowBox[{
        RowBox[{"Import", "[", 
         RowBox[{
          RowBox[{
           SubscriptBox["fn", "import"], "<>", "\"\<_DXA.dat\>\""}], ",", 
          "\"\<Integer64\>\""}], "]"}], ",", 
        RowBox[{"Lv", "+", "1"}]}], "]"}]}], ";", 
     RowBox[{"data", "=", 
      RowBox[{
       RowBox[{
        RowBox[{
        "data", "\[LeftDoubleBracket]", "#", "\[RightDoubleBracket]"}], "&"}],
        "/@", 
       RowBox[{"Flatten", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"Position", "[", 
           RowBox[{
            SubscriptBox["t", "list"], ",", "#"}], "]"}], "&"}], "/@", 
         SubscriptBox["t", "plot"]}], "]"}]}]}], ";", 
     RowBox[{"ListLinePlot", "[", 
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"Range", "[", 
             RowBox[{"0", ",", "Lv"}], "]"}], ",", "#"}], "}"}], "]"}], "&"}],
         "/@", "data"}], ",", 
       RowBox[{"AxesLabel", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{
         "\"\<j\>\"", ",", 
          "\"\<\!\(\*SubscriptBox[\(D\), \(A, j\)]\)(t)\>\""}], "}"}]}], ",", 
       RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
       RowBox[{"PlotLabel", "\[Rule]", 
        RowBox[{
        "\"\<virtual bond dimension of \!\(\*SuperscriptBox[\(\[ExponentialE]\
\), \(\(-\[ImaginaryI]\)\\\ H\\\ t/2\)]\) \!\(\*SubscriptBox[\(J\), \(A\)]\) \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[Beta]\)\\\ H/2\)]\) \
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
          SubscriptBox["t", "plot"]}], ")"}]}]}], "]"}]}]}], "]"}]}]], "Input",\
ExpressionUUID->"26f548bd-4f1e-491d-88f0-81725e900e3f"],

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
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 28.}, {4., 16.}, {5., 
         16.}, {6., 4.}, {7., 1.}}]}, {
        Hue[0.9060679774997897, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[
          NCache[
           Rational[1, 3], 0.3333333333333333], 
          NCache[
           Rational[1, 3], 0.3333333333333333], 1]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 20.}, {4., 19.}, {5., 
         16.}, {6., 4.}, {7., 1.}}]}, {
        Hue[0.1421359549995791, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 1]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 28.}, {4., 26.}, {5., 
         16.}, {6., 4.}, {7., 1.}}]}, {
        Hue[0.37820393249936934`, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[2, 3], 0.6666666666666666]]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 55.}, {4., 50.}, {5., 
         16.}, {6., 4.}, {7., 1.}}]}, {
        Hue[0.6142719099991583, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[1, 3], 0.3333333333333333]]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 64.}, {4., 64.}, {5., 
         16.}, {6., 4.}, {7., 1.}}]}, {
        Hue[0.8503398874989481, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         GrayLevel[0]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 64.}, {4., 64.}, {5., 
         16.}, {6., 4.}, {7., 1.}}]}}}, {}, {}, {{}, {}}, {{}, {}}}, {
    DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 7.}, {0, 64.}}, PlotRangeClipping -> True, 
     ImagePadding -> All, DisplayFunction -> Identity, AspectRatio -> 
     NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> {True, True}, 
     AxesLabel -> {
       FormBox["\"j\"", TraditionalForm], 
       FormBox[
       "\"\\!\\(\\*SubscriptBox[\\(D\\), \\(A, j\\)]\\)(t)\"", 
        TraditionalForm]}, AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], 
     Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
           (Identity[#]& )[
            Part[#, 1]], 
           (Identity[#]& )[
            Part[#, 2]]}& ), "CopiedValueFunction" -> ({
           (Identity[#]& )[
            Part[#, 1]], 
           (Identity[#]& )[
            Part[#, 2]]}& )}}, PlotLabel -> 
     FormBox["\"virtual bond dimension of \\!\\(\\*SuperscriptBox[\\(\
\[ExponentialE]\\), \\(\\(-\[ImaginaryI]\\)\\\\ H\\\\ t/2\\)]\\) \
\\!\\(\\*SubscriptBox[\\(J\\), \\(A\\)]\\) \\!\\(\\*SuperscriptBox[\\(\
\[ExponentialE]\\), \\(\\(-\[Beta]\\)\\\\ H/2\\)]\\) \\!\\(\\*SuperscriptBox[\
\\(\[ExponentialE]\\), \\(\[ImaginaryI]\\\\ H\\\\ t/2\\)]\\)\\nHeisenberg XXZ \
model with J=(1,1,7/6), h=1/2, L=7, \[Beta]=3/5\\ncurrent operator \
\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \
\\(x\\)]\\)\[TensorProduct]\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(y\\)]\\)-\
\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \
\\(y\\)]\\)\[TensorProduct]\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \
\\(x\\)]\\)\"", TraditionalForm], PlotRange -> {{0, 7.}, {0, 64.}}, 
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
                    "RGBColor[2/3, 2/3, 1]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
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
                    "RGBColor[1/3, 1/3, 1]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
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
                    "RGBColor[0, 0, 1]"], Appearance -> None, BaseStyle -> {},
                     BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
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
                    "RGBColor[0, 0, 2/3]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
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
                    "RGBColor[0, 0, 1/3]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
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
                    AbsoluteCurrentValue[Magnification]}]], "GrayLevel[0]"], 
                    Appearance -> None, BaseStyle -> {}, BaselinePosition -> 
                    Baseline, DefaultBaseStyle -> {}, ButtonFunction :> 
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
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}], ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               
               RowBox[{
                "True", ",", "True", ",", "True", ",", "True", ",", "True", 
                 ",", "True"}], "}"}]}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& ), 
      Editable -> True], TraditionalForm], TraditionalForm]},
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
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output",ExpressionU\
UID->"470e752a-6d62-4937-9538-9da83c5ad074"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"virtual", " ", "bond", " ", "dimension", " ", 
    RowBox[{"for", " ", "'"}], 
    RowBox[{
     SubscriptBox["J", "B"], "'"}], " ", "current", " ", "operator"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"Lv", "=", 
       SubscriptBox["L", "val"]}], ",", "data"}], "}"}], ",", 
    RowBox[{
     RowBox[{"data", "=", 
      RowBox[{"Partition", "[", 
       RowBox[{
        RowBox[{"Import", "[", 
         RowBox[{
          RowBox[{
           SubscriptBox["fn", "import"], "<>", "\"\<_DXB.dat\>\""}], ",", 
          "\"\<Integer64\>\""}], "]"}], ",", 
        RowBox[{"Lv", "+", "1"}]}], "]"}]}], ";", 
     RowBox[{"data", "=", 
      RowBox[{
       RowBox[{
        RowBox[{
        "data", "\[LeftDoubleBracket]", "#", "\[RightDoubleBracket]"}], "&"}],
        "/@", 
       RowBox[{"Flatten", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"Position", "[", 
           RowBox[{
            SubscriptBox["t", "list"], ",", "#"}], "]"}], "&"}], "/@", 
         SubscriptBox["t", "plot"]}], "]"}]}]}], ";", 
     RowBox[{"ListLinePlot", "[", 
      RowBox[{
       RowBox[{
        RowBox[{
         RowBox[{"Transpose", "[", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"Range", "[", 
             RowBox[{"0", ",", "Lv"}], "]"}], ",", "#"}], "}"}], "]"}], "&"}],
         "/@", "data"}], ",", 
       RowBox[{"AxesLabel", "\[Rule]", 
        RowBox[{"{", 
         RowBox[{
         "\"\<j\>\"", ",", 
          "\"\<\!\(\*SubscriptBox[\(D\), \(B, j\)]\)(t)\>\""}], "}"}]}], ",", 
       RowBox[{"PlotRange", "\[Rule]", "All"}], ",", 
       RowBox[{"PlotLabel", "\[Rule]", 
        RowBox[{
        "\"\<virtual bond dimension of \!\(\*SuperscriptBox[\(\[ExponentialE]\
\), \(\[ImaginaryI]\\\ H\\\ t/2\)]\) \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[Beta]\)\\\ H/2\)]\) \
\!\(\*SubscriptBox[\(J\), \(B\)]\) \!\(\*SuperscriptBox[\(\[ExponentialE]\), \
\(\(-\[ImaginaryI]\)\\\ H\\\ t/2\)]\)\\n\>\"", "<>", 
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
          SubscriptBox["t", "plot"]}], ")"}]}]}], "]"}]}]}], "]"}]}]], "Input",\
ExpressionUUID->"9e00d0cb-34e0-4c61-8372-2e97506b46e1"],

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
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 16.}, {4., 16.}, {5., 
         16.}, {6., 4.}, {7., 1.}}]}, {
        Hue[0.9060679774997897, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[
          NCache[
           Rational[1, 3], 0.3333333333333333], 
          NCache[
           Rational[1, 3], 0.3333333333333333], 1]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 19.}, {4., 19.}, {5., 
         16.}, {6., 4.}, {7., 1.}}]}, {
        Hue[0.1421359549995791, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 1]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 19.}, {4., 26.}, {5., 
         16.}, {6., 4.}, {7., 1.}}]}, {
        Hue[0.37820393249936934`, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[2, 3], 0.6666666666666666]]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 32.}, {4., 51.}, {5., 
         16.}, {6., 4.}, {7., 1.}}]}, {
        Hue[0.6142719099991583, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         RGBColor[0, 0, 
          NCache[
           Rational[1, 3], 0.3333333333333333]]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 62.}, {4., 64.}, {5., 
         16.}, {6., 4.}, {7., 1.}}]}, {
        Hue[0.8503398874989481, 0.6, 0.6], 
        Directive[
         PointSize[0.019444444444444445`], 
         AbsoluteThickness[1.6], 
         GrayLevel[0]], 
        LineBox[{{0., 1.}, {1., 4.}, {2., 16.}, {3., 64.}, {4., 64.}, {5., 
         16.}, {6., 4.}, {7., 1.}}]}}}, {}, {}, {{}, {}}, {{}, {}}}, {
    DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 7.}, {0, 64.}}, PlotRangeClipping -> True, 
     ImagePadding -> All, DisplayFunction -> Identity, AspectRatio -> 
     NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> {True, True}, 
     AxesLabel -> {
       FormBox["\"j\"", TraditionalForm], 
       FormBox[
       "\"\\!\\(\\*SubscriptBox[\\(D\\), \\(B, j\\)]\\)(t)\"", 
        TraditionalForm]}, AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], 
     Method -> {"CoordinatesToolOptions" -> {"DisplayFunction" -> ({
           (Identity[#]& )[
            Part[#, 1]], 
           (Identity[#]& )[
            Part[#, 2]]}& ), "CopiedValueFunction" -> ({
           (Identity[#]& )[
            Part[#, 1]], 
           (Identity[#]& )[
            Part[#, 2]]}& )}}, PlotLabel -> 
     FormBox["\"virtual bond dimension of \\!\\(\\*SuperscriptBox[\\(\
\[ExponentialE]\\), \\(\[ImaginaryI]\\\\ H\\\\ t/2\\)]\\) \
\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \\(\\(-\[Beta]\\)\\\\ \
H/2\\)]\\) \\!\\(\\*SubscriptBox[\\(J\\), \\(B\\)]\\) \
\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \\(\\(-\[ImaginaryI]\\)\\\\ \
H\\\\ t/2\\)]\\)\\nHeisenberg XXZ model with J=(1,1,7/6), h=1/2, L=7, \
\[Beta]=3/5\\ncurrent operator \\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(x\\)]\
\\)\[TensorProduct]\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \
\\(y\\)]\\)-\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(y\\)]\\)\[TensorProduct]\
\\!\\(\\*SubscriptBox[\\(\[Sigma]\\), \\(x\\)]\\)\"", TraditionalForm], 
     PlotRange -> {{0, 7.}, {0, 64.}}, PlotRangeClipping -> True, 
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
                    "RGBColor[2/3, 2/3, 1]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
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
                    "RGBColor[1/3, 1/3, 1]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
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
                    "RGBColor[0, 0, 1]"], Appearance -> None, BaseStyle -> {},
                     BaselinePosition -> Baseline, DefaultBaseStyle -> {}, 
                    ButtonFunction :> With[{Typeset`box$ = EvaluationBox[]}, 
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
                    "RGBColor[0, 0, 2/3]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
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
                    "RGBColor[0, 0, 1/3]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
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
                    AbsoluteCurrentValue[Magnification]}]], "GrayLevel[0]"], 
                    Appearance -> None, BaseStyle -> {}, BaselinePosition -> 
                    Baseline, DefaultBaseStyle -> {}, ButtonFunction :> 
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
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}], ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               
               RowBox[{
                "True", ",", "True", ",", "True", ",", "True", ",", "True", 
                 ",", "True"}], "}"}]}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& ), 
      Editable -> True], TraditionalForm], TraditionalForm]},
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
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output",ExpressionU\
UID->"6121c607-8253-49c7-a4a3-b8c781434aeb"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Effective truncation weight", "Subsection",ExpressionUUID->"ce82f970-25b0-4d80-9e27-00a31afe3dff"],

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
     RowBox[{"-", "12"}]]}], "]"}]}]], "Input",ExpressionUUID->"ade962fc-3f54-\
4cbd-aeff-44c74543ac30"],

Cell[BoxData["0.`"], "Output",ExpressionUUID->"b30c8127-c068-4f4a-bb8f-93457c98bb36"]
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
     RowBox[{"-", "12"}]]}], "]"}]}]], "Input",ExpressionUUID->"b4f0a9e8-a8f3-\
45e7-b335-674510b1bbd6"],

Cell[BoxData["0.`"], "Output",ExpressionUUID->"3beef029-c964-4ecd-924e-3751f6bd4ad4"]
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
     RowBox[{"-", "12"}]]}], "]"}]}]], "Input",ExpressionUUID->"d29b5432-dcb9-\
41dd-9c0c-a62825cd6f0b"],

Cell[BoxData["0.`"], "Output",ExpressionUUID->"07d7a90a-e420-4cf7-9f68-b9704f8f2036"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1626, 919},
WindowMargins->{{Automatic, 233}, {74, Automatic}},
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
Cell[1486, 35, 105, 0, 63, "Section", "ExpressionUUID" -> \
"15b55aae-663e-4a10-9187-0d24bad3f3ba"],
Cell[1594, 37, 180, 4, 30, "Input", "ExpressionUUID" -> \
"cb999c94-3c8c-486c-88a3-a3ab5c978574"],
Cell[CellGroupData[{
Cell[1799, 45, 96, 0, 43, "Subsection", "ExpressionUUID" -> \
"df4012a7-eb65-431a-83d4-7d66b3e07ff6"],
Cell[1898, 47, 354, 10, 30, "Input", "ExpressionUUID" -> \
"519d853e-1f85-4bb8-9607-e518ff30dc20"],
Cell[2255, 59, 1852, 50, 119, "Input", "ExpressionUUID" -> \
"d854b616-a424-404b-a598-45cdb6b0b91d"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4144, 114, 98, 0, 43, "Subsection", "ExpressionUUID" -> \
"146584b8-fef4-4cb6-93ab-b96c725e6027"],
Cell[4245, 116, 353, 10, 50, "Input", "ExpressionUUID" -> \
"688a7e53-8c61-4c30-bad6-cf2448e2f69d"],
Cell[4601, 128, 305, 9, 74, "Input", "ExpressionUUID" -> \
"f19fabe0-cab7-4bcd-913d-8c8982ceab18"],
Cell[4909, 139, 290, 8, 50, "Input", "ExpressionUUID" -> \
"46a5000a-2c50-4818-b77c-5bdd0fcd7ff0"],
Cell[5202, 149, 301, 9, 50, "Input", "ExpressionUUID" -> \
"33592b91-314e-434f-a3bd-8944f2e250df"],
Cell[CellGroupData[{
Cell[5528, 162, 306, 8, 50, "Input", "ExpressionUUID" -> \
"b5245949-29bb-4df5-8e1b-590f22baaf54"],
Cell[5837, 172, 84, 0, 30, "Output", "ExpressionUUID" -> \
"5385b0fc-a99b-4433-88d5-091392e767b9"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[5970, 178, 94, 0, 43, "Subsection", "ExpressionUUID" -> \
"114dd179-6fb4-4d9b-96db-7dc6cfd5fc73"],
Cell[6067, 180, 689, 19, 74, "Input", "ExpressionUUID" -> \
"2d6cd612-4d6c-48d1-93f6-787ea1fa8674"],
Cell[6759, 201, 1243, 35, 74, "Input", "ExpressionUUID" -> \
"9db6dd3c-5dcb-4bd7-a948-a5a7370e42dc"],
Cell[CellGroupData[{
Cell[8027, 240, 673, 20, 50, "Input", "ExpressionUUID" -> \
"291ac800-6710-4064-ab02-6c419aae72b5"],
Cell[8703, 262, 83, 0, 30, "Output", "ExpressionUUID" -> \
"c8814571-eec2-4c33-898e-aa40c768e1da"]
}, Open  ]],
Cell[8801, 265, 325, 9, 50, "Input", "ExpressionUUID" -> \
"c04f5bc6-1ab3-4686-881f-d438872b9ce4"],
Cell[CellGroupData[{
Cell[9151, 278, 1139, 33, 50, "Input", "ExpressionUUID" -> \
"b5245d3c-aab4-4a2e-b880-6efeb17137c3"],
Cell[10293, 313, 83, 0, 30, "Output", "ExpressionUUID" -> \
"26a14dad-48ab-40ec-be88-b8778f9300dc"]
}, Open  ]],
Cell[10391, 316, 1570, 46, 98, "Input", "ExpressionUUID" -> \
"f261a7c1-24d4-4388-a434-221cf8db6059"],
Cell[11964, 364, 240, 7, 50, "Input", "ExpressionUUID" -> \
"c3d6f3d3-8463-4ca6-b3f6-06f0987cd2f2"],
Cell[12207, 373, 1481, 43, 52, "Input", "ExpressionUUID" -> \
"28a57357-e2a7-4827-afda-96f1d1b05597"],
Cell[13691, 418, 394, 10, 33, "Input", "ExpressionUUID" -> \
"bf141d14-1642-438f-857c-b5d62845b104"],
Cell[14088, 430, 483, 14, 52, "Input", "ExpressionUUID" -> \
"cdccbd54-61c5-41be-bb55-9b6638c18b8d"],
Cell[CellGroupData[{
Cell[14596, 448, 358, 9, 52, "Input", "ExpressionUUID" -> \
"7b615e2f-8f0e-4686-8ff5-0d926e108431"],
Cell[14957, 459, 105, 0, 30, "Output", "ExpressionUUID" -> \
"7f091838-aee0-4612-b334-d4bc5f81fa82"]
}, Open  ]],
Cell[15077, 462, 1415, 31, 54, "Input", "ExpressionUUID" -> \
"8cfb0879-3355-4fe4-ae03-6297f2d646aa"],
Cell[16495, 495, 386, 11, 33, "Input", "ExpressionUUID" -> \
"0059c950-40b6-4438-9ddf-23d0bf695239"],
Cell[CellGroupData[{
Cell[16906, 510, 2653, 74, 96, "Input", "ExpressionUUID" -> \
"1df23911-3df7-49f7-97da-f2405473fa28"],
Cell[19562, 586, 47318, 844, 293, "Output", "ExpressionUUID" -> \
"033d578d-e384-4e61-97bf-e300bae1b50d"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[66929, 1436, 100, 0, 43, "Subsection", "ExpressionUUID" -> \
"3edbeadf-8209-4b57-b40e-97f2092b9b69"],
Cell[67032, 1438, 270, 8, 33, "Input", "ExpressionUUID" -> \
"d40fa03a-ab73-4f14-82a1-e7ac66dbcc09"],
Cell[CellGroupData[{
Cell[67327, 1450, 3133, 84, 122, "Input", "ExpressionUUID" -> \
"26f548bd-4f1e-491d-88f0-81725e900e3f"],
Cell[70463, 1536, 28181, 599, 319, "Output", "ExpressionUUID" -> \
"470e752a-6d62-4937-9538-9da83c5ad074"]
}, Open  ]],
Cell[CellGroupData[{
Cell[98681, 2140, 3133, 84, 122, "Input", "ExpressionUUID" -> \
"9e00d0cb-34e0-4c61-8372-2e97506b46e1"],
Cell[101817, 2226, 28185, 599, 319, "Output", "ExpressionUUID" -> \
"6121c607-8253-49c7-a4a3-b8c781434aeb"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[130051, 2831, 104, 0, 43, "Subsection", "ExpressionUUID" -> \
"ce82f970-25b0-4d80-9e27-00a31afe3dff"],
Cell[CellGroupData[{
Cell[130180, 2835, 775, 23, 54, "Input", "ExpressionUUID" -> \
"ade962fc-3f54-4cbd-aeff-44c74543ac30"],
Cell[130958, 2860, 85, 0, 30, "Output", "ExpressionUUID" -> \
"b30c8127-c068-4f4a-bb8f-93457c98bb36"]
}, Open  ]],
Cell[CellGroupData[{
Cell[131080, 2865, 1042, 29, 57, "Input", "ExpressionUUID" -> \
"b4f0a9e8-a8f3-45e7-b335-674510b1bbd6"],
Cell[132125, 2896, 85, 0, 30, "Output", "ExpressionUUID" -> \
"3beef029-c964-4ecd-924e-3751f6bd4ad4"]
}, Open  ]],
Cell[CellGroupData[{
Cell[132247, 2901, 920, 26, 56, "Input", "ExpressionUUID" -> \
"d29b5432-dcb9-41dd-9c0c-a62825cd6f0b"],
Cell[133170, 2929, 85, 0, 30, "Output", "ExpressionUUID" -> \
"07d7a90a-e420-4cf7-9f68-b9704f8f2036"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* NotebookSignature FxpNcNRy#D5t@CKLDcvwJuQn *)
