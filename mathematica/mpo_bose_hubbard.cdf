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
NotebookDataLength[    331643,       8560]
NotebookOptionsPosition[    326139,       8355]
NotebookOutlinePosition[    326482,       8370]
CellTagsIndexPosition[    326439,       8367]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Matrix product operators for the Bose-Hubbard model", "Section"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";"}]], "Input"],

Cell[BoxData[
 RowBox[{"<<", "tn_base.m"}]], "Input"],

Cell[CellGroupData[{

Cell["Construct full Hamiltonian as reference", "Subsection"],

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
  RowBox[{"Comm", "[", 
   RowBox[{"A_", ",", "B_"}], "]"}], ":=", 
  RowBox[{
   RowBox[{"A", ".", "B"}], "-", 
   RowBox[{"B", ".", "A"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"SiteCreateOp", "[", "5", "]"}], "//", "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0", "0", "0", "0", "0", "0"},
     {"1", "0", "0", "0", "0", "0"},
     {"0", 
      SqrtBox["2"], "0", "0", "0", "0"},
     {"0", "0", 
      SqrtBox["3"], "0", "0", "0"},
     {"0", "0", "0", "2", "0", "0"},
     {"0", "0", "0", "0", 
      SqrtBox["5"], "0"}
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

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"SiteAnnihilOp", "[", "5", "]"}], "//", "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0", "1", "0", "0", "0", "0"},
     {"0", "0", 
      SqrtBox["2"], "0", "0", "0"},
     {"0", "0", "0", 
      SqrtBox["3"], "0", "0"},
     {"0", "0", "0", "0", "2", "0"},
     {"0", "0", "0", "0", "0", 
      SqrtBox["5"]},
     {"0", "0", "0", "0", "0", "0"}
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

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"example", ":", " ", 
    RowBox[{"number", " ", "operator"}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"NumberOp", "[", "5", "]"}], "//", "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0", "0", "0", "0", "0", "0"},
     {"0", "1", "0", "0", "0", "0"},
     {"0", "0", "2", "0", "0", "0"},
     {"0", "0", "0", "3", "0", "0"},
     {"0", "0", "0", "0", "4", "0"},
     {"0", "0", "0", "0", "0", "5"}
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

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"NumberOp", "[", "5", "]"}], ".", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"NumberOp", "[", "5", "]"}], "-", 
     RowBox[{"IdentityMatrix", "[", "6", "]"}]}], ")"}]}], "//", 
  "MatrixForm"}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0", "0", "0", "0", "0", "0"},
     {"0", "0", "0", "0", "0", "0"},
     {"0", "0", "2", "0", "0", "0"},
     {"0", "0", "0", "6", "0", "0"},
     {"0", "0", "0", "0", "12", "0"},
     {"0", "0", "0", "0", "0", "20"}
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

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
    "last", " ", "entry", " ", "not", " ", "1", " ", "due", " ", "to", " ", 
     "cut"}], "-", "off"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Comm", "[", 
    RowBox[{
     RowBox[{"SiteAnnihilOp", "[", "4", "]"}], ",", 
     RowBox[{"SiteCreateOp", "[", "4", "]"}]}], "]"}], "//", 
   "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"1", "0", "0", "0", "0"},
     {"0", "1", "0", "0", "0"},
     {"0", "0", "1", "0", "0"},
     {"0", "0", "0", "1", "0"},
     {"0", "0", "0", "0", 
      RowBox[{"-", "4"}]}
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

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "check", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Table", "[", 
   RowBox[{
    RowBox[{"Norm", "[", 
     RowBox[{
      RowBox[{"NumberOp", "[", "M", "]"}], "-", 
      RowBox[{
       RowBox[{"SiteCreateOp", "[", "M", "]"}], ".", 
       RowBox[{"SiteAnnihilOp", "[", "M", "]"}]}]}], "]"}], ",", 
    RowBox[{"{", 
     RowBox[{"M", ",", "1", ",", "6"}], "}"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0"}], 
  "}"}]], "Output"]
}, Open  ]],

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
        RowBox[{"j", ",", "1", ",", "L"}], "}"}]}], "]"}]}]}]}]}]], "Input"],

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

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"Dimensions", "[", 
   RowBox[{"HBoseHubbard", "[", 
    RowBox[{"t", ",", "U", ",", "\[Mu]", ",", 
     SubscriptBox["M", "val"], ",", 
     SubscriptBox["L", "val"]}], "]"}], "]"}], "\[IndentingNewLine]", 
  RowBox[{"(*", " ", "compare", " ", "*)"}]}], "\[IndentingNewLine]", 
 RowBox[{"%", "-", 
  SuperscriptBox[
   RowBox[{"(", 
    RowBox[{
     SubscriptBox["M", "val"], "+", "1"}], ")"}], 
   SubscriptBox["L", "val"]]}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"243", ",", "243"}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0", ",", "0"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"t", "=", "1"}], ",", 
     RowBox[{"U", "=", "5"}], ",", 
     RowBox[{"\[Mu]", "=", "0"}], ",", 
     RowBox[{"M", "=", 
      SubscriptBox["M", "val"]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}]}], "}"}], ",", 
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"Sort", "[", 
        RowBox[{"Eigenvalues", "[", 
         RowBox[{"Normal", "[", 
          RowBox[{"N", "[", 
           RowBox[{"HBoseHubbard", "[", 
            RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
           "]"}], "]"}], "]"}], "]"}], ",", 
       RowBox[{"Sort", "[", 
        RowBox[{"Eigenvalues", "[", 
         RowBox[{"Normal", "[", 
          RowBox[{"N", "[", 
           RowBox[{"HBoseHubbard", "[", 
            RowBox[{"t", ",", "U", ",", "\[Mu]", ",", 
             RowBox[{"M", "+", "1"}], ",", "L"}], "]"}], "]"}], "]"}], "]"}], 
        "]"}]}], "}"}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<i\>\"", ",", 
        "\"\<\!\(\*SubscriptBox[\(\[Epsilon]\), \(i\)]\)\>\""}], "}"}]}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", 
      RowBox[{"\"\<Bose-Hubbard model\\nt=\>\"", "<>", 
       RowBox[{"ToString", "[", "t", "]"}], "<>", "\"\<, U=\>\"", "<>", 
       RowBox[{"ToString", "[", "U", "]"}], "<>", "\"\<, \[Mu]=\>\"", "<>", 
       RowBox[{"ToString", "[", "\[Mu]", "]"}], "<>", "\"\<, L=\>\"", "<>", 
       RowBox[{"ToString", "[", "L", "]"}]}]}], ",", 
     RowBox[{"PlotLegends", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"\"\<M=\>\"", "<>", 
         RowBox[{"ToString", "[", "M", "]"}]}], ",", 
        RowBox[{"\"\<M=\>\"", "<>", 
         RowBox[{"ToString", "[", 
          RowBox[{"M", "+", "1"}], "]"}]}]}], "}"}]}]}], "]"}]}], 
  "]"}]], "Input"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{}, {
      Hue[0.67, 0.6, 0.6], 
      Directive[
       PointSize[0.006944444444444445], 
       RGBColor[0.368417, 0.506779, 0.709798], 
       AbsoluteThickness[1.6]], 
      PointBox[CompressedData["
1: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
       "]], 
      Hue[0.9060679774997897, 0.6, 0.6], 
      Directive[
       PointSize[0.006944444444444445], 
       RGBColor[0.880722, 0.611041, 0.142051], 
       AbsoluteThickness[1.6]], 
      PointBox[CompressedData["
1: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
VtiQnRPw69OcoBk8Mr/r/C7P6uV25MAE1MfPtrb3IwsS0Ju7r0zLnyxKgMrW
XrKtQeSUBOSM/nS7mTkjAVNU0pqCI8jSBEy8+KTPUQE5NwHzc2PsFkaR8xLg
btOv//xUckECnE71M3ycRZYloP9VeU7RYXJJAvY+dNMJPkKuTEBl+dOfp3PI
NQk4ojb/tkcuWZ6AbOuP63edJTck4FDqzG0dN8kdXf39vTSmlpE7ExD8ecEg
fWaOGB82Lf3i/4CsIMY9z9UOMmZFMdIsxE13HrP9i6F7yyui9SXbvxhVUlWx
mpztX4yj1m+n3alj+xfD2K5ol30b278YNX5D47d8ZvsXQ/NE5+ekr2z/Yihc
fdju/4PtX4zSfuKZksF63bYU49kUi5UDp5B5XefptzxcvJzsLIbnuvs1l1aS
+WKE118ZIF5NDhTjYOK1lDNGZIEYliZTh9lYkkViPI+c8rrQipwiRtaSSzfv
WpMzxNj4flfOQhuyVIx0w7NpOrbkXDEejXqSsI45Twyxz6dF97zJBWLEv5n7
5K8PWSZGYLLOCrsocokY5vY95wfGkSvFUBFpXr51k1zTNW9h7Mghz8hyMVKU
9WM2N5EbxPhR19yx9yu5Q4wT+X0n32HuFMPHrr3ldu/V3eYkIjauc/2pPmSF
RBRe7x8i7ktWTMTc2XpmvUaRlRIxYl2dR+gmMjcRWspuTcNcyWqJSDFt3V3u
TdZMhMHrWZtb/cjaiSgXdJTMTyEjEcPG5FeOzCAbJGL6o1dc11ayaSL8D/i8
GjZDv9uWiRg74rSh2iIyLxH3D716Y8rsnIiX6vWN7fpkfiJ6aBUGbDIjByZi
58ArutabyIJEXPvz+mSMBVmUiCpPyZiFO8gpiRjOm6Ci5UXOSMTZ3fv31YWQ
pYkYp/J12LMkcm4iKhY8v9m0m5yXiNnbHPtG7SMXJOLk4KS6qyfIsq77fTPA
7hpzSSJq+tRHLzxLrkzECs+Hoj0F5JquX6yHnZ+heZ0sT8SpJVwdy0JyQyKu
TDmj03KX3JEIvUFDv/YqIXcmQvagR2b2PTJHAlluhdWTCrKCBAcK9V65PiQr
SqCanTZ36SOykgTG45YIt9eTuRLY/ftsqpxZTQKNU1+LStvImhJY5Q8dLO4g
a0tQvjlnmstXMiSY889ms5xvZIOufrvkcad6r+m2qQTtSi9jVw8iW0pgfq1i
tuEQMk8CifLz2FIlsrMET48s67N2Mpnfdb6Qr/57VMiBEox0SHgdP5MskKDK
IO2+ZCFZJMEYUdspuyXkFAkWq608d0yHnCGBXlnMp0g9slSC622BL6XryLld
7z/t4+43JuQ8CZoXYKLaBnKBBNXqoxcGuZBlEvj7KvxQiyeXSDCEp7CwKZ1c
KcGwT+7br58n10jAybjheuYiWS6BMLOzaUE+uUGCoGx+fv9ScocEm3eekYRX
kDu79vnbOVzxLZmThOsS3deL6sgKSXiirTfA9Q9ZMQm2yy1R3tOg20pJOBHS
/PbScjI3CY5yrza7lWS1JHzQfTk22oismYSpqoGZhpvI2knYIEvw7W1LRhLS
5mSK3oaTDZKgPHFG3c4IsmkS/Ew1VQceIVsmYWLQ2o0fcsi8JOR75XxLPUl2
TsKVeSGKdwrJ/CTcUY/S+PaAHJiE9dc399pVSRYkwfPeWvOLEw27LUrCl7rw
6eYa5JQkbLNdO8lyLjkjCaZBJoGTQZYmwW2cW/lYM3JuErQq1y0V+ZDzktB+
7fHjtgByQRLGu8QN8Igky7qef22QlZdGLknCGNV0h6ODjbpdmQT1mSUuA5XJ
NUmYseWOfzqzPAlWr77xsieQG7rOf93VXbaV3JEES84M6z8u5M6ufbsmv/h4
hcxJRl9REM+ylayQjEzHPSPLP5EVk/G0aV3ntT5ru62UjNhpehr5U8ncZOzL
1y3wNyWrJePAqBP6J3hkzWQsyt46oJRP1k7G1dPaC80EZCRDaKGZfGsf2SAZ
SgNfDazbTzZNxrBhznMK88iWyXDq0ds1drZxt3nJuDe+4x/9ZWTnZLiL7Q62
rybzk/FVJ1UY3U4OTEZ7+rvD9Zbrui1IRlXBouC692RRMl797+/FySnJOHJ7
9cdOtfXdzui6Lw27WK46WZqM33Nuuc/VJucmA1eXPHM2Iucl46f28zIdK3JB
MiYG/N6S7kWWJcPy3WfHJ7HkkmSoPL50dVcpuTKZ9mTS/bMmGTr6UqUT/mR5
Mr5c4e3VUjXtdgM9D3IH69/Q/bMzGelT6woliWROCp3DDP8HWlaxcQ==
       "]]}, {}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0., 1024.}, {-3.5983888847506256`, 75.}}, DisplayFunction -> 
     Identity, AspectRatio -> NCache[GoldenRatio^(-1), 0.6180339887498948], 
     Axes -> {True, True}, AxesLabel -> {
       FormBox["\"i\"", TraditionalForm], 
       FormBox[
       "\"\\!\\(\\*SubscriptBox[\\(\[Epsilon]\\), \\(i\\)]\\)\"", 
        TraditionalForm]}, AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], Method -> {}, PlotLabel -> 
     FormBox["\"Bose-Hubbard model\\nt=1, U=5, \[Mu]=0, L=5\"", 
       TraditionalForm], 
     PlotRange -> {{0., 1024.}, {-3.5983888847506256`, 75.}}, 
     PlotRangeClipping -> True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{"\"M=2\"", "\"M=3\""}, "PointLegend", 
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
                    PointSize[0.25], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.25], 
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
                    PointSize[0.25], 
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    AbsoluteThickness[1.6]], {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.25], 
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
                   RowBox[{"PointSize", "[", "0.006944444444444445`", "]"}], 
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
                   RowBox[{"PointSize", "[", "0.006944444444444445`", "]"}], 
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
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["\[Beta]", "val"], "=", 
   RowBox[{"3", "/", "5"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"t", "=", "1"}], ",", 
       RowBox[{"U", "=", "5"}], ",", 
       RowBox[{"\[Mu]", "=", 
        FractionBox["1", "7"]}], ",", 
       RowBox[{"M", "=", 
        SubscriptBox["M", "val"]}], ",", 
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"\[Beta]", "=", 
        SubscriptBox["\[Beta]", "val"]}]}], "}"}], ",", 
     RowBox[{
      RowBox[{"MatrixExp", "[", 
       RowBox[{
        RowBox[{"-", 
         FractionBox["\[Beta]", "2"]}], 
        RowBox[{"N", "[", 
         RowBox[{"HBoseHubbard", "[", 
          RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
         "]"}]}], "]"}], "\[LeftDoubleBracket]", 
      RowBox[{
       RowBox[{"1", ";;", "10"}], ",", 
       RowBox[{"1", ";;", "10"}]}], "\[RightDoubleBracket]"}]}], "]"}], "//", 
   "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"1.0000000000000002`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", 
      "0.`", "0.`"},
     {"0.`", "1.0914691316858656`", "0.`", "0.32263705044064495`", "0.`", 
      "0.`", "0.`", "0.`", "0.`", "0.0480368883716304`"},
     {"0.`", "0.`", "0.2833516224395195`", "0.`", "0.2588306997938186`", 
      "0.`", "0.04134058438801475`", "0.`", "0.`", "0.`"},
     {"0.`", "0.3226370504406451`", "0.`", "1.1395060200574973`", "0.`", 
      "0.`", "0.`", "0.`", "0.`", "0.32741923788193245`"},
     {"0.`", "0.`", "0.2588306997938186`", "0.`", "1.273475824507957`", "0.`",
       "0.2713696027757563`", "0.`", "0.`", "0.`"},
     {"0.`", "0.`", "0.`", "0.`", "0.`", "0.3153880187354888`", "0.`", 
      "0.17537380913255007`", "0.`", "0.`"},
     {"0.`", "0.`", "0.04134058438801475`", "0.`", "0.2713696027757563`", 
      "0.`", "0.3262327553779667`", "0.`", "0.`", "0.`"},
     {"0.`", "0.`", "0.`", "0.`", "0.`", "0.1753738091325501`", "0.`", 
      "0.34761719887247644`", "0.`", "0.`"},
     {"0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", 
      "0.069329018217411`", "0.`"},
     {"0.`", "0.04803688837163043`", "0.`", "0.32741923788193256`", "0.`", 
      "0.`", "0.`", "0.`", "0.`", "1.1398625482608153`"}
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
   MatrixForm[
   SparseArray[
    Automatic, {10, 10}, 0., {
     1, {{0, 1, 4, 7, 10, 13, 15, 18, 20, 21, 24}, {{1}, {2}, {4}, {10}, {
       3}, {5}, {7}, {2}, {4}, {10}, {3}, {5}, {7}, {6}, {8}, {3}, {5}, {7}, {
       6}, {8}, {9}, {2}, {4}, {10}}}, {1.0000000000000002`, 
      1.0914691316858656`, 0.32263705044064495`, 0.0480368883716304, 
      0.2833516224395195, 0.2588306997938186, 0.04134058438801475, 
      0.3226370504406451, 1.1395060200574973`, 0.32741923788193245`, 
      0.2588306997938186, 1.273475824507957, 0.2713696027757563, 
      0.3153880187354888, 0.17537380913255007`, 0.04134058438801475, 
      0.2713696027757563, 0.3262327553779667, 0.1753738091325501, 
      0.34761719887247644`, 0.069329018217411, 0.04803688837163043, 
      0.32741923788193256`, 1.1398625482608153`}}]]]]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["A", "op"], "[", 
   RowBox[{"n_", ",", "M_", ",", "L_"}], "]"}], ":=", 
  RowBox[{"KroneckerProduct", "[", 
   RowBox[{
    RowBox[{"SparseIdentityMatrix", "[", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"M", "+", "1"}], ")"}], 
      RowBox[{
       RowBox[{"Floor", "[", 
        RowBox[{"L", "/", "2"}], "]"}], "+", "n"}]], "]"}], ",", 
    RowBox[{"NumberOp", "[", "M", "]"}], ",", 
    RowBox[{"SparseIdentityMatrix", "[", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{"M", "+", "1"}], ")"}], 
      RowBox[{"L", "-", 
       RowBox[{"Floor", "[", 
        RowBox[{"L", "/", "2"}], "]"}], "-", "1", "-", "n"}]], "]"}]}], 
   "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["A", "op"], "[", 
   RowBox[{"0", ",", 
    SubscriptBox["M", "val"], ",", 
    SubscriptBox["L", "val"]}], "]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"243", ",", "243"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["A", "op"], "[", 
    RowBox[{"0", ",", "2", ",", "2"}], "]"}], "//", "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0", "0", "0", "0", "0", "0", "0", "0", "0"},
     {"0", "1", "0", "0", "0", "0", "0", "0", "0"},
     {"0", "0", "2", "0", "0", "0", "0", "0", "0"},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0"},
     {"0", "0", "0", "0", "1", "0", "0", "0", "0"},
     {"0", "0", "0", "0", "0", "2", "0", "0", "0"},
     {"0", "0", "0", "0", "0", "0", "0", "0", "0"},
     {"0", "0", "0", "0", "0", "0", "0", "1", "0"},
     {"0", "0", "0", "0", "0", "0", "0", "0", "2"}
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
   MatrixForm[
   SparseArray[
    Automatic, {9, 9}, 0, {
     1, {{0, 0, 1, 2, 2, 3, 4, 4, 5, 6}, {{2}, {3}, {5}, {6}, {8}, {9}}}, {1, 
      2, 1, 2, 1, 2}}]]]]], "Output"]
}, Open  ]],

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

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"t", "=", "1"}], ",", 
      RowBox[{"U", "=", "5"}], ",", 
      RowBox[{"\[Mu]", "=", "0"}], ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}]}], "}"}], ",", 
    RowBox[{"Z", "[", 
     RowBox[{
      RowBox[{"N", "[", 
       RowBox[{"HBoseHubbard", "[", 
        RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
       "]"}], ",", "\[Beta]"}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["83.97120668980492`"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"Zref", "[", 
   RowBox[{"H_", ",", "\[Beta]_"}], "]"}], ":=", 
  RowBox[{"Tr", "[", 
   RowBox[{"MatrixExp", "[", 
    RowBox[{
     RowBox[{"-", "\[Beta]"}], " ", "H"}], "]"}], "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "check", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"t", "=", "1"}], ",", 
      RowBox[{"U", "=", "5"}], ",", 
      RowBox[{"\[Mu]", "=", 
       FractionBox["1", "7"]}], ",", 
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
        RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
       "]"}]}], ";", 
     RowBox[{"Abs", "[", 
      RowBox[{
       RowBox[{"Z", "[", 
        RowBox[{"HB", ",", "\[Beta]"}], "]"}], "-", 
       RowBox[{"Zref", "[", 
        RowBox[{"HB", ",", "\[Beta]"}], "]"}]}], "]"}]}]}], "]"}]}]], "Input"],

Cell[BoxData["2.842170943040401`*^-14"], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"Eq", " ", 
     RowBox[{"(", "9", ")"}], " ", "in", " ", "paper", " ", "by", " ", 
     "Barthel"}], ",", " ", 
    RowBox[{"scheme", " ", "A"}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"\[Chi]A", "[", 
    RowBox[{"A_", ",", "B_", ",", "H_", ",", "\[Beta]_", ",", "t_"}], "]"}], ":=", 
   RowBox[{
    FractionBox["1", 
     RowBox[{"Z", "[", 
      RowBox[{"H", ",", "\[Beta]"}], "]"}]], 
    RowBox[{"Tr", "[", 
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"MatrixExp", "[", 
         RowBox[{
          RowBox[{"-", 
           FractionBox["\[Beta]", "2"]}], "H"}], "]"}], ".", 
        RowBox[{"MatrixExp", "[", 
         RowBox[{"\[ImaginaryI]", " ", "t", " ", "H"}], "]"}]}], ")"}], ".", 
      "B", ".", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"MatrixExp", "[", 
         RowBox[{
          RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", "H"}], "]"}], ".", 
        "A", ".", 
        RowBox[{"MatrixExp", "[", 
         RowBox[{
          RowBox[{"-", 
           FractionBox["\[Beta]", "2"]}], "H"}], "]"}]}], ")"}]}], 
     "]"}]}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"tH", "=", "1"}], ",", 
      RowBox[{"U", "=", "5"}], ",", 
      RowBox[{"\[Mu]", "=", 
       FractionBox["1", "7"]}], ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", 
      RowBox[{"t", "=", "4"}]}], "}"}], ",", 
    RowBox[{"\[Chi]A", "[", 
     RowBox[{
      RowBox[{"N", "[", 
       RowBox[{
        SubscriptBox["A", "op"], "[", 
        RowBox[{"0", ",", "M", ",", "L"}], "]"}], "]"}], ",", 
      RowBox[{"N", "[", 
       RowBox[{
        SubscriptBox["A", "op"], "[", 
        RowBox[{"2", ",", "M", ",", "L"}], "]"}], "]"}], ",", 
      RowBox[{"N", "[", 
       RowBox[{"HBoseHubbard", "[", 
        RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
       "]"}], ",", "\[Beta]", ",", "t"}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"0.4651634836229739`", "\[VeryThinSpace]", "+", 
  RowBox[{"0.005860786728824328`", " ", "\[ImaginaryI]"}]}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
    "alternative", " ", "formulation", " ", "corresponding", " ", "to", " ", 
     "scheme", " ", "C"}], ",", " ", 
    RowBox[{"see", " ", "Eq", " ", 
     RowBox[{"(", "20", ")"}]}]}], " ", "*)"}], "\[IndentingNewLine]", 
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
        FractionBox["t", "2"]}]}], "}"}], ",", 
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
          RowBox[{"MatrixExp", "[", 
           RowBox[{
            RowBox[{"-", 
             FractionBox["\[Beta]", "2"]}], "H"}], "]"}], ".", "B", ".", 
          RowBox[{"MatrixExp", "[", 
           RowBox[{
            RowBox[{"-", "\[ImaginaryI]"}], " ", "tB", " ", "H"}], "]"}]}], 
         ")"}], ".", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"MatrixExp", "[", 
           RowBox[{
            RowBox[{"-", "\[ImaginaryI]"}], " ", "tA", " ", "H"}], "]"}], ".",
           "A", ".", 
          RowBox[{"MatrixExp", "[", 
           RowBox[{
            RowBox[{"-", 
             FractionBox["\[Beta]", "2"]}], "H"}], "]"}], ".", 
          RowBox[{"MatrixExp", "[", 
           RowBox[{"\[ImaginaryI]", " ", "tA", " ", "H"}], "]"}]}], ")"}]}], 
       "]"}]}]}], "]"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"tH", "=", "1"}], ",", 
      RowBox[{"U", "=", "5"}], ",", 
      RowBox[{"\[Mu]", "=", 
       FractionBox["1", "7"]}], ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", 
      RowBox[{"t", "=", "4"}], ",", "HB"}], "}"}], ",", 
    RowBox[{
     RowBox[{"HB", "=", 
      RowBox[{"N", "[", 
       RowBox[{"HBoseHubbard", "[", 
        RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
       "]"}]}], ";", 
     RowBox[{"Abs", "[", 
      RowBox[{
       RowBox[{"\[Chi]C", "[", 
        RowBox[{
         RowBox[{"N", "[", 
          RowBox[{
           SubscriptBox["A", "op"], "[", 
           RowBox[{"0", ",", "M", ",", "L"}], "]"}], "]"}], ",", 
         RowBox[{"N", "[", 
          RowBox[{
           SubscriptBox["A", "op"], "[", 
           RowBox[{"2", ",", "M", ",", "L"}], "]"}], "]"}], ",", "HB", ",", 
         "\[Beta]", ",", "t"}], "]"}], "-", 
       RowBox[{"\[Chi]A", "[", 
        RowBox[{
         RowBox[{"N", "[", 
          RowBox[{
           SubscriptBox["A", "op"], "[", 
           RowBox[{"0", ",", "M", ",", "L"}], "]"}], "]"}], ",", 
         RowBox[{"N", "[", 
          RowBox[{
           SubscriptBox["A", "op"], "[", 
           RowBox[{"2", ",", "M", ",", "L"}], "]"}], "]"}], ",", "HB", ",", 
         "\[Beta]", ",", "t"}], "]"}]}], "]"}]}]}], "]"}]}]], "Input"],

Cell[BoxData["4.455808707827989`*^-16"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"tH", "=", "1"}], ",", 
     RowBox[{"U", "=", "5"}], ",", 
     RowBox[{"\[Mu]", "=", 
      FractionBox["1", "7"]}], ",", 
     RowBox[{"M", "=", 
      SubscriptBox["M", "val"]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"\[Beta]", "=", 
      SubscriptBox["\[Beta]", "val"]}]}], "}"}], ",", 
   RowBox[{"ListPlot", "[", 
    RowBox[{
     RowBox[{"Re", "[", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{"t", ",", 
          RowBox[{"\[Chi]A", "[", 
           RowBox[{
            RowBox[{"N", "[", 
             RowBox[{
              SubscriptBox["A", "op"], "[", 
              RowBox[{"0", ",", "M", ",", "L"}], "]"}], "]"}], ",", 
            RowBox[{"N", "[", 
             RowBox[{
              SubscriptBox["A", "op"], "[", 
              RowBox[{"2", ",", "M", ",", "L"}], "]"}], "]"}], ",", 
            RowBox[{"N", "[", 
             RowBox[{"HBoseHubbard", "[", 
              RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], 
              "]"}], "]"}], ",", "\[Beta]", ",", "t"}], "]"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"t", ",", "0", ",", "5", ",", "0.1"}], "}"}]}], "]"}], "]"}],
      ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<t\>\"", ",", 
        "\"\<Re[\!\(\*SubscriptBox[\(\[Chi]\), \(A, B\)]\)[\[Beta],t]]\>\""}],
        "}"}]}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", 
      RowBox[{"\"\<t=\>\"", "<>", 
       RowBox[{"ToString", "[", "tH", "]"}], "<>", "\"\<, U=\>\"", "<>", 
       RowBox[{"ToString", "[", "U", "]"}], "<>", "\"\<, \[Mu]=\>\"", "<>", 
       RowBox[{"ToString", "[", 
        RowBox[{"InputForm", "[", "\[Mu]", "]"}], "]"}], "<>", "\"\<, M=\>\"",
        "<>", 
       RowBox[{"ToString", "[", "M", "]"}], "<>", "\"\<, L=\>\"", "<>", 
       RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, \[Beta]=\>\"", "<>", 
       RowBox[{"ToString", "[", 
        RowBox[{"N", "[", "\[Beta]", "]"}], "]"}]}]}]}], "]"}]}], 
  "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, 
   {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.016666666666666666`], 
    AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJw10m1IU2EUAOClm5pON7dS7IMaZcUSsU0jpDgHxPwTCdkvM2Gj/ChW+AFR
Cbr6U0oGRVtJFqRJKwXTBKfmFjmGy7KmFXq3u81S2rCYNEapaC7Pe+Byudxz
nvfcc49Ce/HE2SiBQKBeuyJ3FtaMpqtdE9PQ8iASZti3XWL9OMKeR6HFpFrW
PJuGbHUkJuDgnaRefMreT8G5kVZ/0DcN65oXAjO2gQYdR/nfwL6nQ1eW44Ly
skjMwZJWs/tWopvq/dCnu3bIbHPD+7FIzINT8amzC3nygtAcUC+q9DzlL8DQ
eWNwoYMn/zeIkmOePHTzVB+CjFJJ55UCD50Xhl4wmz789JD3B5p+OFzWUi95
f+GyJW1u3u4lbwlufjGk2rf5yFuGNK74Xc0xH3krsDdQcnj2uI88AU5YdsxC
OssXYPNM+uKjr8zfgI7GWrmtykv1URjtSfUGVz10XjTq+zPj69NYf0JMqRzN
ugvse4SoMnG/hHVsXiLUtw0roz+zecagcXP+rvpCF3mx2FcZO+AIcuTFobgi
RacZ5siLw5O5s7fbBznyNuKBpre51+c48uKxYGt4Z2oO8xKw4tWbtiKDizwx
9mRo66rCLvLEOFnYXnsmn/WXiIGjcmXMWr/rXhJq9NUlilY3eRI0WqxDCT1u
8qQolp6WHLGxfCmOi069QJ7tgxS/j485nQIe/perkzFvsuZCUSbbh2Rs7hm6
kVnO9kWG2Zd8/fee8+TJcKoxwbQaYvOUYVVL4etiYPOXo+Fx3v3qBg95ctxi
eenP6mb/YxOuKPeHBh0e+AeFN26O
     "]]}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"t\"", TraditionalForm], 
    FormBox[
    "\"Re[\\!\\(\\*SubscriptBox[\\(\[Chi]\\), \\(A, B\\)]\\)[\[Beta],t]]\"", 
     TraditionalForm]},
  AxesOrigin->{0, 0.41010899802061695`},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotLabel->FormBox[
   "\"t=1, U=5, \[Mu]=1/7, M=2, L=5, \[Beta]=0.6\"", TraditionalForm],
  PlotRange->{{0, 5.}, {0.41633622633006284`, 0.5408807925189806}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["MPO operations", "Subsection"],

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

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "check", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"t", ",", "U", ",", "\[Mu]", ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}]}], "}"}], ",", 
    RowBox[{"Norm", "[", 
     RowBox[{"Flatten", "[", 
      RowBox[{"FullSimplify", "[", 
       RowBox[{
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
             RowBox[{"h2", "[", 
              RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], 
              "]"}], "\[LeftDoubleBracket]", "l", "\[RightDoubleBracket]"}], 
            ",", 
            RowBox[{"SparseIdentityMatrix", "[", 
             SuperscriptBox[
              RowBox[{"(", 
               RowBox[{"M", "+", "1"}], ")"}], 
              RowBox[{"L", "-", "l", "-", "1"}]], "]"}]}], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{"l", ",", "1", ",", 
            RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], "-", 
        RowBox[{"HBoseHubbard", "[", 
         RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}]}], 
       "]"}], "]"}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
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
   RowBox[{"h2", "[", 
    RowBox[{"t", ",", "U", ",", "\[Mu]", ",", 
     SubscriptBox["M", "val"], ",", 
     SubscriptBox["L", "val"]}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {"0", "0", "0", "0", "0"},
       {"0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}], "0", 
        RowBox[{"-", "t"}], "0"},
       {"0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{"U", "-", 
           RowBox[{"2", " ", "\[Mu]"}]}], ")"}]}], "0", 
        RowBox[{
         RowBox[{"-", 
          SqrtBox["2"]}], " ", "t"}]},
       {"0", 
        RowBox[{"-", "t"}], "0", 
        RowBox[{"-", "\[Mu]"}], "0"},
       {"0", "0", 
        RowBox[{
         RowBox[{"-", 
          SqrtBox["2"]}], " ", "t"}], "0", 
        RowBox[{"-", 
         FractionBox[
          RowBox[{"3", " ", "\[Mu]"}], "2"]}]}
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
         FractionBox["\[Mu]", "2"]}], "0", 
        RowBox[{"-", "t"}], "0"},
       {"0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{"U", "-", 
           RowBox[{"2", " ", "\[Mu]"}]}], ")"}]}], "0", 
        RowBox[{
         RowBox[{"-", 
          SqrtBox["2"]}], " ", "t"}]},
       {"0", 
        RowBox[{"-", "t"}], "0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}], "0"},
       {"0", "0", 
        RowBox[{
         RowBox[{"-", 
          SqrtBox["2"]}], " ", "t"}], "0", 
        RowBox[{"-", "\[Mu]"}]}
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
         FractionBox["\[Mu]", "2"]}], "0", 
        RowBox[{"-", "t"}], "0"},
       {"0", "0", 
        RowBox[{
         FractionBox["1", "2"], " ", 
         RowBox[{"(", 
          RowBox[{"U", "-", 
           RowBox[{"2", " ", "\[Mu]"}]}], ")"}]}], "0", 
        RowBox[{
         RowBox[{"-", 
          SqrtBox["2"]}], " ", "t"}]},
       {"0", 
        RowBox[{"-", "t"}], "0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}], "0"},
       {"0", "0", 
        RowBox[{
         RowBox[{"-", 
          SqrtBox["2"]}], " ", "t"}], "0", 
        RowBox[{"-", "\[Mu]"}]}
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
        RowBox[{"-", "\[Mu]"}], "0", 
        RowBox[{"-", "t"}], "0"},
       {"0", "0", 
        RowBox[{"U", "-", 
         RowBox[{"2", " ", "\[Mu]"}]}], "0", 
        RowBox[{
         RowBox[{"-", 
          SqrtBox["2"]}], " ", "t"}]},
       {"0", 
        RowBox[{"-", "t"}], "0", 
        RowBox[{"-", 
         FractionBox["\[Mu]", "2"]}], "0"},
       {"0", "0", 
        RowBox[{
         RowBox[{"-", 
          SqrtBox["2"]}], " ", "t"}], "0", 
        RowBox[{"-", 
         FractionBox[
          RowBox[{"3", " ", "\[Mu]"}], "2"]}]}
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
   RowBox[{"MPO", " ", "representing", " ", "identity", " ", "operation"}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"IdMPO", "[", 
    RowBox[{"M_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"ArrayReshape", "[", 
        RowBox[{
         RowBox[{"IdentityMatrix", "[", 
          RowBox[{"M", "+", "1"}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"M", "+", "1"}], ",", 
           RowBox[{"M", "+", "1"}], ",", "1", ",", "1"}], "}"}]}], "]"}], ",", 
       RowBox[{"{", "0", "}"}], ",", 
       RowBox[{"{", "0", "}"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"i", ",", "L"}], "}"}]}], "]"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"IdMPO", "[", 
    RowBox[{
     SubscriptBox["M", "val"], ",", 
     SubscriptBox["L", "val"]}], "]"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "/@", 
    RowBox[{"(", 
     RowBox[{"First", "/@", "%"}], ")"}]}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"{", "1", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "1", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "1", "}"}], "}"}]}], "}"}]}], "}"}], ",", 
     RowBox[{"{", "0", "}"}], ",", 
     RowBox[{"{", "0", "}"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"{", "1", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "1", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "1", "}"}], "}"}]}], "}"}]}], "}"}], ",", 
     RowBox[{"{", "0", "}"}], ",", 
     RowBox[{"{", "0", "}"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"{", "1", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "1", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "1", "}"}], "}"}]}], "}"}]}], "}"}], ",", 
     RowBox[{"{", "0", "}"}], ",", 
     RowBox[{"{", "0", "}"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"{", "1", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "1", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "1", "}"}], "}"}]}], "}"}]}], "}"}], ",", 
     RowBox[{"{", "0", "}"}], ",", 
     RowBox[{"{", "0", "}"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"{", "1", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "1", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "0", "}"}], "}"}], ",", 
         RowBox[{"{", 
          RowBox[{"{", "1", "}"}], "}"}]}], "}"}]}], "}"}], ",", 
     RowBox[{"{", "0", "}"}], ",", 
     RowBox[{"{", "0", "}"}]}], "}"}]}], "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "1", ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "1", ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "1", ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "1", ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "1", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "check", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{"MPOMergeFull", "[", 
     RowBox[{"First", "/@", 
      RowBox[{"IdMPO", "[", 
       RowBox[{
        SubscriptBox["M", "val"], ",", 
        SubscriptBox["L", "val"]}], "]"}]}], "]"}], "-", 
    RowBox[{"IdentityMatrix", "[", 
     SuperscriptBox[
      RowBox[{"(", 
       RowBox[{
        SubscriptBox["M", "val"], "+", "1"}], ")"}], 
      SubscriptBox["L", "val"]], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[{
 Cell[BoxData[
  FormBox[
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "\[Beta]"}], " ", 
     RowBox[{"H", "/", "2"}]}]], TraditionalForm]]],
 " MPO approximation"
}], "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["expH", "strang"], "=", 
     RowBox[{"Block", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"qd", "=", 
          RowBox[{"Range", "[", 
           RowBox[{"0", ",", 
            SubscriptBox["M", "val"]}], "]"}]}], ",", 
         RowBox[{"t", "=", "1"}], ",", 
         RowBox[{"U", "=", "5"}], ",", 
         RowBox[{"\[Mu]", "=", 
          FractionBox["1", "7"]}], ",", 
         RowBox[{"M", "=", 
          SubscriptBox["M", "val"]}], ",", 
         RowBox[{"L", "=", 
          SubscriptBox["L", "val"]}], ",", 
         RowBox[{"\[Beta]", "=", 
          SubscriptBox["\[Beta]", "val"]}], ",", 
         RowBox[{"nsteps", "=", "40"}], ",", 
         RowBox[{"tol", "=", 
          SuperscriptBox["10", 
           RowBox[{"-", "12"}]]}]}], "}"}], ",", 
       RowBox[{"MPOStrangEvolution", "[", 
        RowBox[{
         RowBox[{"IdMPO", "[", 
          RowBox[{"M", ",", "L"}], "]"}], ",", 
         RowBox[{"N", "[", 
          RowBox[{"h2", "[", 
           RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
          "]"}], ",", "qd", ",", 
         FractionBox["\[Beta]", "2"], ",", "nsteps", ",", "tol"}], "]"}]}], 
      "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "/@", 
    RowBox[{"(", 
     RowBox[{"First", "/@", "%"}], ")"}]}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "1", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "9", ",", "23"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "23", ",", "23"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "23", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "9", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"virtual", " ", "bond", " ", "quantum", " ", "numbers"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Rest", "/@", 
   SubscriptBox["expH", "strang"]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", "0", "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "0", ",", "1", ",", "1", 
       ",", "2"}], "}"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "0", ",", "1", ",", "1", 
       ",", "2"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "3"}], ",", 
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
       ",", "0", ",", "0", ",", "1", ",", "1", ",", "1", ",", "1", ",", "1", 
       ",", "2", ",", "2", ",", "3"}], "}"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "3"}], ",", 
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
       ",", "0", ",", "0", ",", "1", ",", "1", ",", "1", ",", "1", ",", "1", 
       ",", "2", ",", "2", ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "3"}], ",", 
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
       ",", "0", ",", "0", ",", "1", ",", "1", ",", "1", ",", "1", ",", "1", 
       ",", "2", ",", "2", ",", "3"}], "}"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "3"}], ",", 
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", 
       ",", "0", ",", "0", ",", "1", ",", "1", ",", "1", ",", "1", ",", "1", 
       ",", "2", ",", "2", ",", "3"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "0", ",", "1", ",", "1", 
       ",", "2"}], "}"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "2"}], ",", 
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "0", ",", "1", ",", "1", 
       ",", "2"}], "}"}], ",", 
     RowBox[{"{", "0", "}"}]}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{
     RowBox[{"entries", " ", "are", " ", "non"}], "-", 
     RowBox[{
     "zero", " ", "for", " ", "matching", " ", "quantum", " ", "numbers", " ",
       "only"}]}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"qd", "=", 
      RowBox[{"Range", "[", 
       RowBox[{"0", ",", 
        SubscriptBox["M", "val"]}], "]"}]}], "}"}], ",", 
    RowBox[{"Total", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"MPOBlockStructureError", "[", 
        RowBox[{"#", ",", 
         RowBox[{"{", 
          RowBox[{"qd", ",", "qd"}], "}"}]}], "]"}], "&"}], "/@", 
      SubscriptBox["expH", "strang"]}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["expH", "SRKNb"], "=", 
     RowBox[{"Block", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"qd", "=", 
          RowBox[{"Range", "[", 
           RowBox[{"0", ",", 
            SubscriptBox["M", "val"]}], "]"}]}], ",", 
         RowBox[{"t", "=", "1"}], ",", 
         RowBox[{"U", "=", "5"}], ",", 
         RowBox[{"\[Mu]", "=", 
          FractionBox["1", "7"]}], ",", 
         RowBox[{"M", "=", 
          SubscriptBox["M", "val"]}], ",", 
         RowBox[{"L", "=", 
          SubscriptBox["L", "val"]}], ",", 
         RowBox[{"\[Beta]", "=", 
          SubscriptBox["\[Beta]", "val"]}], ",", 
         RowBox[{"nsteps", "=", "40"}], ",", 
         RowBox[{"tol", "=", 
          SuperscriptBox["10", 
           RowBox[{"-", "12"}]]}]}], "}"}], ",", 
       RowBox[{"MPOSRKNb6Evolution", "[", 
        RowBox[{
         RowBox[{"IdMPO", "[", 
          RowBox[{"M", ",", "L"}], "]"}], ",", 
         RowBox[{"N", "[", 
          RowBox[{"h2", "[", 
           RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
          "]"}], ",", "qd", ",", 
         FractionBox["\[Beta]", "2"], ",", "nsteps", ",", "tol"}], "]"}]}], 
      "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "/@", 
    RowBox[{"(", 
     RowBox[{"First", "/@", "%"}], ")"}]}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "1", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "9", ",", "57"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "57", ",", "51"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "51", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "9", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{
     RowBox[{"entries", " ", "are", " ", "non"}], "-", 
     RowBox[{
     "zero", " ", "for", " ", "matching", " ", "quantum", " ", "numbers", " ",
       "only"}]}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"qd", "=", 
      RowBox[{"Range", "[", 
       RowBox[{"0", ",", 
        SubscriptBox["M", "val"]}], "]"}]}], "}"}], ",", 
    RowBox[{"Total", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"MPOBlockStructureError", "[", 
        RowBox[{"#", ",", 
         RowBox[{"{", 
          RowBox[{"qd", ",", "qd"}], "}"}]}], "]"}], "&"}], "/@", 
      SubscriptBox["expH", "SRKNb"]}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"qd", "=", 
       RowBox[{"Range", "[", 
        RowBox[{"0", ",", 
         SubscriptBox["M", "val"]}], "]"}]}], ",", 
      RowBox[{"t", "=", "1"}], ",", 
      RowBox[{"U", "=", "5"}], ",", 
      RowBox[{"\[Mu]", "=", 
       FractionBox["1", "7"]}], ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}]}], "}"}], ",", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"Norm", "[", 
       RowBox[{
        RowBox[{"MPOMergeFull", "[", 
         RowBox[{"First", "/@", 
          SubscriptBox["expH", "strang"]}], "]"}], "-", 
        RowBox[{"MatrixExp", "[", 
         RowBox[{
          RowBox[{"-", 
           FractionBox["\[Beta]", "2"]}], 
          RowBox[{"N", "[", 
           RowBox[{"HBoseHubbard", "[", 
            RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
           "]"}]}], "]"}]}], "]"}], ",", 
      RowBox[{"Norm", "[", 
       RowBox[{
        RowBox[{"MPOMergeFull", "[", 
         RowBox[{"First", "/@", 
          SubscriptBox["expH", "SRKNb"]}], "]"}], "-", 
        RowBox[{"MatrixExp", "[", 
         RowBox[{
          RowBox[{"-", 
           FractionBox["\[Beta]", "2"]}], 
          RowBox[{"N", "[", 
           RowBox[{"HBoseHubbard", "[", 
            RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
           "]"}]}], "]"}]}], "]"}]}], "}"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"0.00012391124524747366`", ",", "0.00003026332515229956`"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"Range", "[", 
       RowBox[{"0", ",", 
        SubscriptBox["M", "val"]}], "]"}]}], ",", 
     RowBox[{"t", "=", "1"}], ",", 
     RowBox[{"U", "=", "5"}], ",", 
     RowBox[{"\[Mu]", "=", 
      FractionBox["1", "7"]}], ",", 
     RowBox[{"M", "=", 
      SubscriptBox["M", "val"]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"\[Beta]", "=", 
      SubscriptBox["\[Beta]", "val"]}], ",", 
     RowBox[{"tol", "=", 
      SuperscriptBox["10", 
       RowBox[{"-", "12"}]]}], ",", "HB"}], "}"}], ",", 
   RowBox[{
    RowBox[{"HB", "=", 
     RowBox[{"N", "[", 
      RowBox[{"HBoseHubbard", "[", 
       RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
      "]"}]}], ";", 
    RowBox[{"Show", "[", 
     RowBox[{
      RowBox[{"ListLogLogPlot", "[", 
       RowBox[{
        RowBox[{"Table", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            FractionBox["nsteps", 
             RowBox[{"\[Beta]", "/", "2"}]], ",", 
            RowBox[{
             FractionBox["1", 
              RowBox[{"Z", "[", 
               RowBox[{"HB", ",", "\[Beta]"}], "]"}]], 
             RowBox[{"Norm", "[", 
              RowBox[{
               RowBox[{"MPOMergeFull", "[", 
                RowBox[{"First", "/@", 
                 RowBox[{"MPOStrangEvolution", "[", 
                  RowBox[{
                   RowBox[{"IdMPO", "[", 
                    RowBox[{"M", ",", "L"}], "]"}], ",", 
                   RowBox[{"N", "[", 
                    RowBox[{"h2", "[", 
                    RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}],
                     "]"}], "]"}], ",", "qd", ",", 
                   FractionBox["\[Beta]", "2"], ",", "nsteps", ",", "tol"}], 
                  "]"}]}], "]"}], "-", 
               RowBox[{"MatrixExp", "[", 
                RowBox[{
                 RowBox[{"-", 
                  FractionBox["\[Beta]", "2"]}], "HB"}], "]"}]}], "]"}]}]}], 
           "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"nsteps", ",", "1", ",", "30"}], "}"}]}], "]"}], ",", 
        RowBox[{"AxesLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"\"\<1/\[CapitalDelta]\[Beta]\>\"", ",", "\"\<err\>\""}], 
          "}"}]}], ",", 
        RowBox[{"PlotLabel", "\[Rule]", 
         RowBox[{
         "\"\<\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[Beta]\)\\\ H/2\
\)]\) MPO approximation error (Strang splitting)\\nt=\>\"", "<>", 
          RowBox[{"ToString", "[", "t", "]"}], "<>", "\"\<, U=\>\"", "<>", 
          RowBox[{"ToString", "[", "U", "]"}], "<>", "\"\<, \[Mu]=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "\[Mu]", "]"}], "]"}], "<>", 
          "\"\<, M=\>\"", "<>", 
          RowBox[{"ToString", "[", "M", "]"}], "<>", "\"\<, L=\>\"", "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, \[Beta]=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"N", "[", "\[Beta]", "]"}], "]"}], "<>", 
          "\"\<, tol=\!\(\*SuperscriptBox[\(10\), \(-12\)]\)\>\""}]}], ",", 
        RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
      RowBox[{"LogLogPlot", "[", 
       RowBox[{
        RowBox[{"0.014", 
         SuperscriptBox["inv\[CapitalDelta]\[Beta]", 
          RowBox[{"-", "2"}]]}], ",", 
        RowBox[{"{", 
         RowBox[{"inv\[CapitalDelta]\[Beta]", ",", "1", ",", "100"}], "}"}], 
        ",", 
        RowBox[{"PlotStyle", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{
            RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}], ",", 
           "Dashed"}], "}"}]}]}], "]"}]}], "]"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, {{}, 
     {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
      0.019444444444444445`], AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJwB8QEO/iFib1JlAgAAAB4AAAACAAAAIae9/HhD8z+yngYgjkYbwBjEOnya
Wv4/gD9DVGtPIMAWVbW7sWsCQP5ahYaL6SHAiPDb/d24BEDHLVzxVA4jwCqa
VXrdgQZAi1HLE/nxI8CR43N7QvcHQMeOZEw7rCTAvAB41fUyCUBelRlgx0kl
wAR/mr1uRApAjdqoL1nSJcCb1gv5pjULQF3xemLVSibApigUOm4NDEDxLQUZ
qbYmwNwK3jWg0AxAOwVwplAZJ8ANcjI704INQIdK717xcifA4V+QqcAmDkAL
vrGcecQnwDiPNpWGvg5AAcgGHToQKMCvG6y30ksPQOw/5BvSVijAgA1Zff/P
D0DyoH7Wo5gowIWpLCAUJhBApghZk2rWKMCLMmXcm2AQQHPZ7tdiECnAXsMx
QvmXEECKOut1LUcpwJFb6Xx/zBBAHRBZVNN5KcAhQWeJdf4QQHOmYJFQqSnA
rEzOehguEUBXDWBKTdcpwMBDGD6dWxFApW76qNkBKsBEgHj9MYcRQPrGkNyz
JyrAYjAmO/+wEUDq2+HINE0qwC93p7Qo2RFAXK78HqhyKsAQLDEbzv8RQIIb
J5jxkyrA2o56qgslEkDOuUqxnLYqwNhoFqX6SBJA0Qb0rxHTKsAWVbW7sWsS
QFOIzoZX7SrAWkPazw==
       "]]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwVxXs0lGkcAOBJ5DIxvs9gXMN8M3hbsaWMSd63C3vYNOimC2ZqUapDLiHi
LHWKFJXLNqmmduVs2TBRq5IfKRUrCl0lt5qiOUI1TsXu/vGcx35LTHCEFovF
CvjP/18okecniVO8C0Mb5AITCtCiiMtRzHqcoLawMjCj4BN3j+dCJgoHZ8Sd
UvMo2Lh/asqKScKcc/ySa7YUGN5slHGYgzh78MBpP0TBmyeMiT5TjNN2+Ct2
LaXg8VDXsA5ThremPC6tiaHg/s55IdrMNbygcKjSp5WClopN251t7uH7L2sZ
TQENz2IvihrfdWBVjGdXaKAJ9O/eKjlY9gTr5xsnm+lx4fJYyerevh7sAMXJ
sodceBX12xnV0z7ctPhBTXi2KfgWORjMnR7EYc3lgaPBZlCrMcC1Zir8tfdN
z2OeOazMVkRyJ99juxWtZdEd5tCw4bN2rYUaL/lb9vDESR6g8m/+hZmjuD/p
/ILYNRaw18dFMz76Eec0iXPOsi3hxlSdNCl9HCP7LG/ZI0uYLSldJvs4gYPv
73HtPmwFq+pHemOyPuOEXy3Te9ZYQ6HfgIwx0uDiu6b1HpY2MBLtForTJ/Hy
9Te9fB7ZgHt5j0mG4Vf89gvNGzppC7n7+5YLMr9hepDrJlozB7rSfFxHTaew
dezAIyOOHfDzQqal56dxhbtq1tw4O1hqLWOsc1hE9+yyZ4o2O1Cx7grlwTPI
Rirxee98ezD/sTuixVCLxDl/T0nOtwc/9ZJiyR0twtarOi4esYf4G2uFkbkz
iULt9fyOxAEEnbwxV19tMrnXFi6WO0D7t8NWuRwdsorztDOE4sM+5TqPxV06
RBBdt8UtgQ/KK615p4/MIvXRmqOydj68bhrzOb5Wl6yLZ7/f5M5AkX2TSGys
R6rsEwYqjjEgYX+wWdisR44W6a1z+cAAS+eutPGIPok0SfwSHygAT3//11o/
GZCZizw8uH8JIPpsel0Xh01OSTtK91FC4JOwJ5ta2ETj1qAkMULo3VU44J41
m3Q3vxS5tAih4FJagMLfkFRGtn/on+cIHe6ciVvaRkRyyWLp2GFHmNUWpIlp
MyLvvohvPxh1BO+JYXV8AYfosA/dal3tBNNK3rFCoTEZuo1CnCqd4EX8iQ3X
c4xJw/5SuwCuM6Q+3woilTGRDScebNntDCW6UsXr5RTJ5MVFxf/jDNe93CuC
yiiiCPDdM+iGoMQ8bLO1Nk0ynWL5FUcQWIobq67r0IT1c2dyQB6Ck5uFuht0
aZKxS9Q2nI+g6Jy6qtCAJmlKVopTAYK8uRm6HIomiV7H2s7JEWRihXKGLU22
BSpTCsoQREX16731oElA8sTDlAYEb7J9ww540qRVHiLg3UbwS/nFK/zFNPGv
u7n3ahMC6ce4MKk3TXy1DgjGmxFsTJ1Z/WwFTUiuaerONgQr85jw1iCazFcs
Eoa/QPCg6lB19GqaVDbKU7+/RODXOaKvv5YmrkNT7adeIfC1qKn2CaHJD6g5
9WkfAvy7j0F9GE0E1es7glQIbt35MzxUSpM/um8IR98h8FIZ1nyV0cRhck7a
0WEEIpfucFEETWy9VcIWNYKrEnFNdyRNSqQr07aPIlgYd8YgcRtNrLIqO3TH
EFQXaElNomkiL+U6XhhHMP9aZE3VDprw7iWnrfiE4F/pZTHZ
      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/\[CapitalDelta]\[Beta]\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{1.0788636558468268`, -13.945831881699963`},
  CoordinatesToolOptions:>{"DisplayFunction" -> ({
      Exp[
       Part[#, 1]], 
      Exp[
       Part[#, 2]]}& ), "CopiedValueFunction" -> ({
      Exp[
       Part[#, 1]], 
      Exp[
       Part[#, 2]]}& )},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledFrameTicks[{Log, Exp}]}, {
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledFrameTicks[{Log, Exp}]}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotLabel->FormBox[
   "\"\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \\(\\(-\[Beta]\\)\\\\ \
H/2\\)]\\) MPO approximation error (Strang splitting)\\nt=1, U=5, \[Mu]=1/7, \
M=2, L=5, \[Beta]=0.6, tol=\\!\\(\\*SuperscriptBox[\\(10\\), \\(-12\\)]\\)\"",
     TraditionalForm],
  PlotRange->{{1.133114525541308, 
   4.605170185988092}, {-13.832706003248123`, -6.818901539234206}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->FrontEndValueCache[{
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledTicks[{Log, Exp}]}, {{{1.6094379124341003`, 
       FormBox["5", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {2.302585092994046, 
       FormBox["10", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {3.912023005428146, 
       FormBox["50", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {4.605170185988092, 
       FormBox["100", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {0., 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {0.6931471805599453, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.0986122886681098`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.3862943611198906`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.791759469228055, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.9459101490553132`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.0794415416798357`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.1972245773362196`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.995732273553991, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {3.4011973816621555`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {3.6888794541139363`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {4.0943445622221, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {4.248495242049359, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {4.382026634673881, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {4.499809670330265, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}, {{-13.815510557964274`, 
       FormBox[
        TemplateBox[{"\[Times]", "\"\[Times]\"", "1.`", 
          TemplateBox[{"10", 
            RowBox[{"-", "6"}]}, "Superscript", SyntaxForm -> 
           SuperscriptBox]}, "RowWithSeparators"], TraditionalForm], {0.01, 
       0.}, {
        AbsoluteThickness[0.1]}}, {-12.206072645530174`, 
       FormBox[
        TemplateBox[{"\[Times]", "\"\[Times]\"", "5.`", 
          TemplateBox[{"10", 
            RowBox[{"-", "6"}]}, "Superscript", SyntaxForm -> 
           SuperscriptBox]}, "RowWithSeparators"], TraditionalForm], {0.01, 
       0.}, {
        AbsoluteThickness[0.1]}}, {-11.512925464970229`, 
       FormBox[
        TemplateBox[{"\[Times]", "\"\[Times]\"", "1.`", 
          TemplateBox[{"10", 
            RowBox[{"-", "5"}]}, "Superscript", SyntaxForm -> 
           SuperscriptBox]}, "RowWithSeparators"], TraditionalForm], {0.01, 
       0.}, {
        AbsoluteThickness[0.1]}}, {-9.903487552536127, 
       FormBox[
        TemplateBox[{"\[Times]", "\"\[Times]\"", "5.`", 
          TemplateBox[{"10", 
            RowBox[{"-", "5"}]}, "Superscript", SyntaxForm -> 
           SuperscriptBox]}, "RowWithSeparators"], TraditionalForm], {0.01, 
       0.}, {
        AbsoluteThickness[0.1]}}, {-9.210340371976182, 
       FormBox[
        TemplateBox[{"\[Times]", "\"\[Times]\"", "1.`", 
          TemplateBox[{"10", 
            RowBox[{"-", "4"}]}, "Superscript", SyntaxForm -> 
           SuperscriptBox]}, "RowWithSeparators"], TraditionalForm], {0.01, 
       0.}, {
        AbsoluteThickness[0.1]}}, {-7.600902459542082, 
       FormBox[
        TemplateBox[{"\[Times]", "\"\[Times]\"", "5.`", 
          TemplateBox[{"10", 
            RowBox[{"-", "4"}]}, "Superscript", SyntaxForm -> 
           SuperscriptBox]}, "RowWithSeparators"], TraditionalForm], {0.01, 
       0.}, {
        AbsoluteThickness[0.1]}}, {-6.907755278982137, 
       FormBox[
        TemplateBox[{"\[Times]", "\"\[Times]\"", "1.`", 
          TemplateBox[{"10", 
            RowBox[{"-", "3"}]}, "Superscript", SyntaxForm -> 
           SuperscriptBox]}, "RowWithSeparators"], TraditionalForm], {0.01, 
       0.}, {
        AbsoluteThickness[0.1]}}, {-16.11809565095832, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-15.424948470398375`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-15.01948336229021, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-14.73180128983843, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-14.508657738524219`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-14.326336181730264`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-14.172185501903007`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-14.038654109278484`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-13.9208710736221, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-13.122363377404328`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-12.716898269296165`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-12.429216196844383`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-12.02375108873622, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-11.86960040890896, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-11.736069016284437`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-11.618285980628055`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-10.819778284410283`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-10.41431317630212, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-10.126631103850338`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.721165995742174, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.567015315914915, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.433483923290392, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.315700887634009, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-8.517193191416238, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-8.111728083308073, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.824046010856292, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.418580902748128, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.264430222920869, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.1308988302963465`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.013115794639964, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-6.214608098422191, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.809142990314028, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.521460917862246, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.298317366548036, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}}]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"Range", "[", 
       RowBox[{"0", ",", 
        SubscriptBox["M", "val"]}], "]"}]}], ",", 
     RowBox[{"t", "=", "1"}], ",", 
     RowBox[{"U", "=", "5"}], ",", 
     RowBox[{"\[Mu]", "=", 
      FractionBox["1", "7"]}], ",", 
     RowBox[{"M", "=", 
      SubscriptBox["M", "val"]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"\[Beta]", "=", 
      SubscriptBox["\[Beta]", "val"]}], ",", 
     RowBox[{"nsteps", "=", "12"}], ",", "tol", ",", "HB"}], "}"}], ",", 
   RowBox[{
    RowBox[{"HB", "=", 
     RowBox[{"N", "[", 
      RowBox[{"HBoseHubbard", "[", 
       RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
      "]"}]}], ";", 
    RowBox[{"Show", "[", 
     RowBox[{
      RowBox[{"ListLogLogPlot", "[", 
       RowBox[{
        RowBox[{"Table", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"tol", "=", 
            SuperscriptBox["2", 
             RowBox[{"-", "i"}]]}], ";", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"1", "/", "tol"}], ",", 
             RowBox[{
              FractionBox["1", 
               RowBox[{"Z", "[", 
                RowBox[{"HB", ",", "\[Beta]"}], "]"}]], 
              RowBox[{"Norm", "[", 
               RowBox[{
                RowBox[{"MPOMergeFull", "[", 
                 RowBox[{"First", "/@", 
                  RowBox[{"MPOStrangEvolution", "[", 
                   RowBox[{
                    RowBox[{"IdMPO", "[", 
                    RowBox[{"M", ",", "L"}], "]"}], ",", 
                    RowBox[{"N", "[", 
                    RowBox[{"h2", "[", 
                    RowBox[{"t", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}],
                     "]"}], "]"}], ",", "qd", ",", 
                    FractionBox["\[Beta]", "2"], ",", "nsteps", ",", "tol"}], 
                   "]"}]}], "]"}], "-", 
                RowBox[{"MatrixExp", "[", 
                 RowBox[{
                  RowBox[{"-", 
                   FractionBox["\[Beta]", "2"]}], "HB"}], "]"}]}], "]"}]}]}], 
            "}"}]}], ",", 
          RowBox[{"{", 
           RowBox[{"i", ",", "1", ",", "65"}], "}"}]}], "]"}], ",", 
        RowBox[{"AxesLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"\"\<1/tol\>\"", ",", "\"\<err\>\""}], "}"}]}], ",", 
        RowBox[{"PlotLabel", "\[Rule]", 
         RowBox[{
         "\"\<\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[Beta]\)\\\ H/2\
\)]\) MPO approximation error (Strang splitting)\\nt=\>\"", "<>", 
          RowBox[{"ToString", "[", "t", "]"}], "<>", "\"\<, U=\>\"", "<>", 
          RowBox[{"ToString", "[", "U", "]"}], "<>", "\"\<, \[Mu]=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "\[Mu]", "]"}], "]"}], "<>", 
          "\"\<, M=\>\"", "<>", 
          RowBox[{"ToString", "[", "M", "]"}], "<>", "\"\<, L=\>\"", "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, \[Beta]=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"N", "[", "\[Beta]", "]"}], "]"}], "<>", 
          "\"\<, \[CapitalDelta]\[Beta]=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"N", "[", 
            RowBox[{"\[Beta]", "/", "nsteps"}], "]"}], "]"}]}]}]}], "]"}], 
      ",", 
      RowBox[{"LogLogPlot", "[", 
       RowBox[{
        RowBox[{"0.5", 
         SuperscriptBox["invtol", 
          RowBox[{
           RowBox[{"-", "1"}], "/", "2"}]]}], ",", 
        RowBox[{"{", 
         RowBox[{"invtol", ",", "1", ",", 
          SuperscriptBox["2", "65"]}], "}"}], ",", 
        RowBox[{"PlotStyle", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{
            RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}], ",", 
           "Dashed"}], "}"}]}]}], "]"}]}], "]"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, {{}, 
     {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
      0.016666666666666666`], AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJxTTMoPSmViYGBwBGIQ/d7y1z8nvWf2Bos7eJn1+A5A+N/g/OLV1vabFjE4
oMqzwfnZJ3bsu7yT2wFVvQCcv/GT1PyqDGE0/WJwvm7jzTjuLxJo5knD+Sv5
Z8jNqZdDM1/BYenHlktXzwkcEPLXzp/GquTwOtnb5O9+Cah9ynB+wDSu83Gn
VeB8iP1qcH7f3Zd66hPVHd4d/jVPj00S6h4NBz0Z8bBQGakDZ1RO9r0P03Io
mnCChYFRGuo+bQfrGYqK2ttlDnDlrHi3XUbXoedUat69d7JQ9+o5hIorv7hT
IXfAY3O7X8MjfQeX3zv/zqhQhLrfwEHx1K1b4VlKB5xrjcNVQgwdmhduraua
rgz1j5GDXqKz9AU7lQOPFJTbObYbOXSIR+s926MC9Z+xQ6l11VSXFtUDjUeE
tr+RNHEIPXnuWOMvVah/TRwKX9yocOxSO6CQwfT8Qo2pwxaHjnm9AepQ/5s5
7Ntvp7suSv3Afu5PYlvvmzlkWoZlrUhTh4aHuYNJcLtoTqb6gbj1D91mOlk4
zJ53iJ8hVx0aPhYO84p6ll/PUz/wN+hiWe1SS4e8Yxv0NhWoQ8PLyuFAxD+h
n4XqB+Z8O7AskcPaob/534vNRerQ8LN2+HJ6ZbkmkG81a8M112wbB9dX8y8s
BaqHhKetQ/EPDxFzIP+m7QI2rXO2Dvcca7PdgHxI+No5eJQIlFsD+RUP+834
DO0dekIcI02BfEh42zvcbmj21Qbyew7ZG//0dHA46dSgawLkQ8LfwaEyOrYG
pD56irl39m8Hh3Nn7jy3BPIh8eHosCROVccWyNdO00++u8bR4dLxyE4rIB8S
P04O/UFbakDqf5mrV/vHOTlETQvpAvEh8eXkEPj+bz+If4pTfvJBfmeHPOOS
dhAfEn/ODgcEHlWC+DNvi602Pujs8GFzRSqID4lPF4fnj/szQfzMtXyHlxa5
OEyb3hYC4kPi18XhGNvGbxZAvkU9221xFVeHv06+T0F8SHy7OlwuFjoO4rMH
/vvUedXVYUnfhR0gPiT+3RykTfetBfGvK33j+tPm5rCW98MyEB8Am0POgA==

       "]]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwVz3s0lAkYBvCJltwK5VJGx2WMS5gxpvlclu9lxicZsS6HU06skmLluGxM
khrltm6HiWJa3ezJrUiRxc5LKqW0ZOqQTqVdSuje0mbs7B/Pef56zvk95jFJ
wbEqNBotQJn/e+SsKW3L+CXP96J7n/mOU7I34rYSm4Ai8tMZo6Cne6ZkLWLL
8RmhlPx6O6bhQO2UrFz8ZHlQ2ESqGi7urNedluWIO8q7hd2k0RWrgdUfp2WH
xFYTV4X3SHLmcPVYx2tZhniC1iqcIIu2O5FJXnOyAyouay8LZ8kTpv6CALsP
MvY3hkVU1hKpW1OqOyxflFkX5H1c9+o7WBMidq3JpiFxKK4sZ04bqoQf8oJV
VqJ+7tqIOh99KFk3YsQbVseHEq020UMDCLS8m6IZpYWqKamBB5vXQzaNs0bL
dQ0639AtyP7ZFB5fjGPkH9HDKoeXt9wOm4E8rY+pKliLg88/vx6MswANG7mf
xMEAd3dIUuRsBpxTpI6c/mKIS75Dfi/eWYF7aXN9fbsxDslkXqqPrUFbvfbs
oHQDrtzhUXtaagve5+jLsTF0TH6aYrotfxNcZgRnGW7biM/W82doCQ5Qwtar
221shq2iWrq9AwvSo0nPg4tmuPP5WEd7IRuWcu5MV8+Z4wkDO0nFfifgdq7v
Tx+2wL2ej45kxnJAffJmS9SAJbr3P5D8Fe4M43Gy/oHfGdi7o/SJhhsXopcP
a81LrXByqoHjxtoMRwurYzaWM7E9p6ibuY4HYdaHZjXTrbEwqytR8okHtuaN
pzPCbfBrPMXSeUXAqdW8qPdbbZEeX2XpPegCXTp5IUxHOxyPFNiIe11BRONG
7GFswpNNnqH8NjcgghyPWRvao8bq5SsocYeLrfOTF/6xR4NdJhZ+Bd/DVTWt
YIdZBxy9s3SjONEDUhPnPib/6YgVxQ7FIQGewHEy7SFaWDgv6NzDABKotFD/
Yz+wUZF7vDNCD+B+RNbw3T42hsRO3GYUAVgQo88qPZzwqLDy7ZACIGhjibpX
ixOyJr80uCZ5wXLbfF+jGQcbk4/P2772goP8LDVpNQdpmun+C9u94cGT/bvi
tZ3RUlrJFj7yhg+JJVv+yHPGWxOR9dGBfKi8FNo7QuMin5nrHoJ80F/ICrmZ
zMXifU/DBt0EEOkuT/SY5WLrtaoC82YBHMkrPVuxczOGtSwEuZj6AEP8bm/D
0Ga8fSHvzGilD1QeyL5ObeGh/jmRRuAqCl6kJpv3dvLwfmd0j58mBdJfIuRd
XTzMH/ZNFmhTEH6eLGjv4aGCZjjmqkvB/RGd9429PJyJunKRYUxBp1MDVt7h
4Q3TN75frSkofzsZ9dMYD9NORebW+VIgSAj91WiRh6xWvtsZPwoUYvdg/X+V
+wG7+Wp/5b7aQk1niYfRCwthZYEUsO6+S1RZQWBA+AmrzHAK6LbFHnOrCGQa
DPUHxVHweermRJ8xgS/sr2X476OgRdFU1rOBQKlAak8lUJBgKBFcpxOonxYv
cU9S/vOJaWo2I1Axorabma70X1BknrQhsHNmzshcREF+99+sCjsC01TkgyaZ
Su/ovZfF9gTOOJ131stW+lRr/HPYBNb5FU5rHaUgzUS8nMUhMPrH5Bq1HKXX
eV9bBpdAuigicMVxCma3BsWl8gh8XEaqfsul4LcYwmS/C4H/AaP/OIo=
      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/tol\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{-1.6572806123739579`, -12.301158362285028`},
  CoordinatesToolOptions:>{"DisplayFunction" -> ({
      Exp[
       Part[#, 1]], 
      Exp[
       Part[#, 2]]}& ), "CopiedValueFunction" -> ({
      Exp[
       Part[#, 1]], 
      Exp[
       Part[#, 2]]}& )},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledFrameTicks[{Log, Exp}]}, {
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledFrameTicks[{Log, Exp}]}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotLabel->FormBox[
   "\"\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \\(\\(-\[Beta]\\)\\\\ \
H/2\\)]\\) MPO approximation error (Strang splitting)\\nt=1, U=5, \[Mu]=1/7, \
M=2, L=5, \[Beta]=0.6, \[CapitalDelta]\[Beta]=0.05\"", TraditionalForm],
  PlotRange->{{-0.9386368070082594, 
   45.054566736396445`}, {-12.165782305111932`, -3.7724667603801194`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->FrontEndValueCache[{
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledTicks[{Log, Exp}]}, {{{0., 
       FormBox["1", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {9.210340371976184, 
       FormBox[
        TemplateBox[{"10", "4"}, "Superscript", SyntaxForm -> SuperscriptBox],
         TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {18.420680743952367`, 
       FormBox[
        TemplateBox[{"10", "8"}, "Superscript", SyntaxForm -> SuperscriptBox],
         TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {27.631021115928547`, 
       FormBox[
        TemplateBox[{"10", "12"}, "Superscript", SyntaxForm -> 
         SuperscriptBox], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {36.841361487904734`, 
       FormBox[
        TemplateBox[{"10", "16"}, "Superscript", SyntaxForm -> 
         SuperscriptBox], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {46.051701859880914`, 
       FormBox[
        TemplateBox[{"10", "20"}, "Superscript", SyntaxForm -> 
         SuperscriptBox], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {4.605170185988092, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {13.815510557964274`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {23.025850929940457`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {32.23619130191664, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {41.44653167389282, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}, {{-11.512925464970229`, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "5"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.210340371976182, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "4"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-6.907755278982137, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "3"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.605170185988091, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "2"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-13.815510557964274`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-13.122363377404328`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-12.716898269296165`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-12.429216196844383`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-12.206072645530174`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-12.02375108873622, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-11.86960040890896, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-11.736069016284437`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-11.618285980628055`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-10.819778284410283`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-10.41431317630212, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-10.126631103850338`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.903487552536127, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.721165995742174, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.567015315914915, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.433483923290392, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.315700887634009, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-8.517193191416238, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-8.111728083308073, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.824046010856292, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.600902459542082, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.418580902748128, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.264430222920869, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.1308988302963465`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.013115794639964, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-6.214608098422191, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.809142990314028, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.521460917862246, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.298317366548036, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.115995809754082, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.961845129926823, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.8283137373023015`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.710530701645918, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.912023005428146, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.506557897319982, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.2188758248682006`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.995732273553991, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.8134107167600364`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.659260036932778, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.5257286443082556`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.4079456086518722`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.3025850929940455`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}}]]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[{
 Cell[BoxData[
  FormBox[
   SuperscriptBox["\[ExponentialE]", 
    RowBox[{
     RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", "H"}]], TraditionalForm]],
  FormatType->"TraditionalForm"],
 " MPO approximation"
}], "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"Range", "[", 
       RowBox[{"0", ",", 
        SubscriptBox["M", "val"]}], "]"}]}], ",", 
     RowBox[{"tH", "=", "1"}], ",", 
     RowBox[{"U", "=", "5"}], ",", 
     RowBox[{"\[Mu]", "=", 
      FractionBox["1", "7"]}], ",", 
     RowBox[{"M", "=", 
      SubscriptBox["M", "val"]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"t", "=", "4"}], ",", 
     RowBox[{"tol", "=", 
      SuperscriptBox["10", 
       RowBox[{"-", "8"}]]}], ",", "HB"}], "}"}], ",", 
   RowBox[{
    RowBox[{"HB", "=", 
     RowBox[{"N", "[", 
      RowBox[{"HBoseHubbard", "[", 
       RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
      "]"}]}], ";", 
    RowBox[{"Show", "[", 
     RowBox[{
      RowBox[{"ListLogLogPlot", "[", 
       RowBox[{
        RowBox[{"Table", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            FractionBox["nsteps", "t"], ",", 
            RowBox[{"Norm", "[", 
             RowBox[{
              RowBox[{"MPOMergeFull", "[", 
               RowBox[{"First", "/@", 
                RowBox[{"MPOStrangEvolution", "[", 
                 RowBox[{
                  RowBox[{"IdMPO", "[", 
                   RowBox[{"M", ",", "L"}], "]"}], ",", 
                  RowBox[{"N", "[", 
                   RowBox[{"h2", "[", 
                    RowBox[{
                    "tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}],
                    "]"}], ",", "qd", ",", 
                  RowBox[{"\[ImaginaryI]", " ", "t"}], ",", "nsteps", ",", 
                  "tol"}], "]"}]}], "]"}], "-", 
              RowBox[{"MatrixExp", "[", 
               RowBox[{
                RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", "HB"}], 
               "]"}]}], "]"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"nsteps", ",", "8", ",", "120", ",", "8"}], "}"}]}], "]"}],
         ",", 
        RowBox[{"AxesLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"\"\<1/\[CapitalDelta]t\>\"", ",", "\"\<err\>\""}], "}"}]}],
         ",", 
        RowBox[{"PlotLabel", "\[Rule]", 
         RowBox[{
         "\"\<\!\(\*SuperscriptBox[\(\[ExponentialE]\), \
\(\(-\[ImaginaryI]\)\\\ t\\\ H\)]\) MPO approximation error (Strang \
splitting)\\n\!\(\*SubscriptBox[\(t\), \(H\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", "tH", "]"}], "<>", "\"\<, U=\>\"", "<>", 
          RowBox[{"ToString", "[", "U", "]"}], "<>", "\"\<, \[Mu]=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "\[Mu]", "]"}], "]"}], "<>", 
          "\"\<, M=\>\"", "<>", 
          RowBox[{"ToString", "[", "M", "]"}], "<>", "\"\<, L=\>\"", "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, t=\>\"", "<>", 
          RowBox[{"ToString", "[", "t", "]"}], "<>", 
          "\"\<, tol=\!\(\*SuperscriptBox[\(10\), \(-8\)]\)\>\""}]}], ",", 
        RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
      RowBox[{"LogLogPlot", "[", 
       RowBox[{
        RowBox[{"22", 
         SuperscriptBox["inv\[CapitalDelta]t", 
          RowBox[{"-", "2"}]]}], ",", 
        RowBox[{"{", 
         RowBox[{"inv\[CapitalDelta]t", ",", 
          RowBox[{"1", "/", "10"}], ",", "30"}], "}"}], ",", 
        RowBox[{"PlotStyle", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{
            RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}], ",", 
           "Dashed"}], "}"}]}], ",", 
        RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]}], "]"}]}]}], 
  "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, {{}, 
     {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
      0.019444444444444445`], AbsoluteThickness[1.6], 
      PointBox[{{0.6931471805599453, 0.6926938402834071}, {
       1.3862943611198906`, 0.17228563675280764`}, {
       1.791759469228055, -0.5498445167753276}, {
       2.0794415416798357`, -1.1027310951356486`}, {
       2.302585092994046, -1.539825638197942}, {
       2.4849066497880004`, -1.8997536035289495`}, {
       2.6390573296152584`, -2.2037536795890182`}, {
       2.772588722239781, -2.4655917972955486`}, {
       2.8903717578961645`, -2.6959775908204775`}, {
       2.995732273553991, -2.9022440816777335`}, {
       3.091042453358316, -3.085767778221212}, {
       3.1780538303479458`, -3.252906795619997}, {
       3.258096538021482, -3.399502433095986}, {
       3.332204510175204, -3.5386699519405114`}, {
       3.4011973816621555`, -3.6613593637723882`}}]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwB4QQe+yFib1JlAgAAAE0AAAACAAAAGrsVrLFrAsD+nbTn68geQM0EMoQc
aALAsefQv1bFHkCATk5ch2QCwGQx7ZfBwR5A5uGGDF1dAsDKxCVIl7oeQLII
+GwITwLAluuWqEKsHkBLVtotXzICwC85eWmZjx5AfPGerwz5AcBg1D3rRlYe
QN8nKLNnhgHAwwrH7qHjHUC0GBxf1I0AwJj7upoO6xxAd1XlGHRL/7+fjRFI
9AIcQH6oAY5ahP2/I7efgmcfG0CmA+FMrpb7v7dkD2KRKBpAMaGFDvTJ+b98
s+FCNEIZQN1G7Rmn1ve/UoaVyI1IGECBG8Q/dez1v6TwgNt0UxdAiDJgaDUj
9L8n/M7v1G4WQLBRv9piM/K/vIv+qOt2FUA7s+NPgmTwv4G8kGN7jxRAfIfu
vnk97b/DhFqrmKwTQMS4m3HJZOm/FdEFmGy2EkDSbtMp/c3lv5i+E4a50BFA
IjWRdQvq4b8sMAMZvdcQQMOyWuyfMNy/eHJUcpzGD0DPBKj48BDVv/vGZ7Ww
/g1Ave4CWO6tyr+fIz5CMhAMQOzNv6kVg7i/psLZ0aVCCkBO/lYBc/uaP85p
OKuGTghAyy68wY63wj/uPwafgmMGQFi1kYYPhNA/cliZlXCZBEDIMjmFokbY
PxV579XLqAJAq6bLeG2F3z8c3AoZGdkAQFevUAHmT+M/ONwq7QIl/j8Xe7Wy
OirnP3cQxjuuSvo/EcKPXqvC6j9+yeuPPbL2P8n443ZBqO4/xpKXd6fM8j/J
6Cyt0D3xP/tzQyiP8u0/yZIinI4G8z/4y2xsl8/mP6g0VUHf9fQ/+ohEr6kk
3j8klMLjPcT2PzYaszdpY88/qMTAa4GJ+D8IkIC+hXmYPwvt+6lXdfo/NXTi
KzOuy78L03HlO0D8PxtqoHE7Lty/6rAk17Ix/j+LrJt/+dzlvzMmCeMbAQBA
eBpSOw0f7b92XEjN0OQAQEjmpUZaHvK/qA6mEs/bAUARrxxcU/r1v6gfoVZU
wgJAEfMIbGiU+b+YrLr1IrwDQNEmb+iie/2/DKKcB2SxBEBRfvuXU6gAwE72
GxgslgVA1Sb6uONxAsCAxrmDPY4GQDnHNZAGYgTAgPX07dV1B0A4JaxkNzEG
wASN+MrgWAhAQVSzHk33B8B4oBoDNU8JQCl794714wnAuhLaORA1CkCtX3b8
q68LwGJbmJQSOQpA/PDysbC3C8AJpFbvFD0KQEuCb2e1vwvAWDXTpBlFCkDp
pGjSvs8LwPZXzA8jVQpAJepaqNHvC8Aznb7lNXUKQJ90P1T3LwzArCejkVu1
CkCRiQisQrAMwFRwYexduQpA4RqFYUe4DMD7uB9HYL0KQC+sARdMwAzASkqc
/GTFCkDNzvqBVdAMwOlslWdu1QpAChTtV2jwDMAmsoc9gfUKQIWe0QOOMA3A
zvpFmIP5CkDUL065kjgNwHVDBPOF/QpAI8HKbpdADcDE1ICoigULQMHjw9mg
UA3AYvd5E5QVC0D8KLavs3ANwApAOG6WGQtATLoyZbh4DcCxiPbImB0LQJpL
rxq9gA3AABpzfp0lC0A4bqiFxpANwKhiMdmfKQtAiP8kO8uYDcBQq+8zoi0L
QNiQofDPoA3A+POtjqQxC0AoIh6m1KgNwJ88bOmmNQtAdrOaW9mwDcDewVZ5

      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/\[CapitalDelta]t\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{0.5935346568865892, -3.977379354389342},
  CoordinatesToolOptions:>{"DisplayFunction" -> ({
      Exp[
       Part[#, 1]], 
      Exp[
       Part[#, 2]]}& ), "CopiedValueFunction" -> ({
      Exp[
       Part[#, 1]], 
      Exp[
       Part[#, 2]]}& )},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledFrameTicks[{Log, Exp}]}, {
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledFrameTicks[{Log, Exp}]}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotLabel->FormBox[
   "\"\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \
\\(\\(-\[ImaginaryI]\\)\\\\ t\\\\ H\\)]\\) MPO approximation error (Strang \
splitting)\\n\\!\\(\\*SubscriptBox[\\(t\\), \\(H\\)]\\)=1, U=5, \[Mu]=1/7, \
M=2, L=5, t=4, tol=\\!\\(\\*SuperscriptBox[\\(10\\), \\(-8\\)]\\)\"", 
    TraditionalForm],
  PlotRange->{{0.6367294680369826, 3.4011973816621555`}, {-3.903251208442155, 
   0.6926938402834071}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->FrontEndValueCache[{
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledTicks[{Log, Exp}]}, {{{0.6931471805599453, 
       FormBox["2", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {1.6094379124341003`, 
       FormBox["5", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {2.302585092994046, 
       FormBox["10", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {2.995732273553991, 
       FormBox["20", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {0., 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.0986122886681098`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.3862943611198906`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.791759469228055, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.9459101490553132`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.0794415416798357`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.1972245773362196`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {3.4011973816621555`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {3.6888794541139363`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {3.912023005428146, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}, {{-2.995732273553991, 
       FormBox[
        TagBox[
         InterpretationBox["\"0.05\"", 0.05, AutoDelete -> True], 
         NumberForm[#, {
           DirectedInfinity[1], 2.}]& ], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.3025850929940455`, 
       FormBox[
        TagBox[
         InterpretationBox["\"0.10\"", 0.1, AutoDelete -> True], 
         NumberForm[#, {
           DirectedInfinity[1], 2.}]& ], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.6931471805599453, 
       FormBox[
        TagBox[
         InterpretationBox["\"0.50\"", 0.5, AutoDelete -> True], 
         NumberForm[#, {
           DirectedInfinity[1], 2.}]& ], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {0., 
       FormBox["1", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.298317366548036, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.115995809754082, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.961845129926823, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.8283137373023015`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.710530701645918, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.605170185988091, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.912023005428146, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.506557897319982, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.2188758248682006`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.8134107167600364`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.659260036932778, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.5257286443082556`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.4079456086518722`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-1.6094379124341003`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-1.2039728043259361`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.916290731874155, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.5108256237659907, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.35667494393873245`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.2231435513142097, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.10536051565782628`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {0.6931471805599453, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.0986122886681098`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.3862943611198906`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.6094379124341003`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.791759469228055, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.9459101490553132`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.0794415416798357`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.1972245773362196`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.302585092994046, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}}]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"Range", "[", 
       RowBox[{"0", ",", 
        SubscriptBox["M", "val"]}], "]"}]}], ",", 
     RowBox[{"tH", "=", "1"}], ",", 
     RowBox[{"U", "=", "5"}], ",", 
     RowBox[{"\[Mu]", "=", 
      FractionBox["1", "7"]}], ",", 
     RowBox[{"M", "=", 
      SubscriptBox["M", "val"]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"t", "=", "4"}], ",", 
     RowBox[{"\[CapitalDelta]t", "=", 
      RowBox[{"1", "/", "20"}]}], ",", "tol", ",", "HB"}], "}"}], ",", 
   RowBox[{
    RowBox[{"HB", "=", 
     RowBox[{"N", "[", 
      RowBox[{"HBoseHubbard", "[", 
       RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
      "]"}]}], ";", 
    RowBox[{"Show", "[", 
     RowBox[{
      RowBox[{"ListLogLogPlot", "[", 
       RowBox[{
        RowBox[{"Table", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"tol", "=", 
            SuperscriptBox["2", 
             RowBox[{"-", "i"}]]}], ";", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"1", "/", "tol"}], ",", 
             RowBox[{"Norm", "[", 
              RowBox[{
               RowBox[{"MPOMergeFull", "[", 
                RowBox[{"First", "/@", 
                 RowBox[{"MPOStrangEvolution", "[", 
                  RowBox[{
                   RowBox[{"IdMPO", "[", 
                    RowBox[{"M", ",", "L"}], "]"}], ",", 
                   RowBox[{"N", "[", 
                    RowBox[{"h2", "[", 
                    RowBox[{
                    "tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}],
                     "]"}], ",", "qd", ",", 
                   RowBox[{"\[ImaginaryI]", " ", "t"}], ",", 
                   RowBox[{"t", "/", "\[CapitalDelta]t"}], ",", "tol"}], 
                  "]"}]}], "]"}], "-", 
               RowBox[{"MatrixExp", "[", 
                RowBox[{
                 RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", "HB"}], 
                "]"}]}], "]"}]}], "}"}]}], ",", 
          RowBox[{"{", 
           RowBox[{"i", ",", "1", ",", "30"}], "}"}]}], "]"}], ",", 
        RowBox[{"AxesLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"\"\<1/tol\>\"", ",", "\"\<err\>\""}], "}"}]}], ",", 
        RowBox[{"PlotLabel", "\[Rule]", 
         RowBox[{
         "\"\<\!\(\*SuperscriptBox[\(\[ExponentialE]\), \
\(\(-\[ImaginaryI]\)\\\ t\\\ H\)]\) MPO approximation error (Strang \
splitting)\\n\!\(\*SubscriptBox[\(t\), \(H\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", "tH", "]"}], "<>", "\"\<, U=\>\"", "<>", 
          RowBox[{"ToString", "[", "U", "]"}], "<>", "\"\<, \[Mu]=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "\[Mu]", "]"}], "]"}], "<>", 
          "\"\<, M=\>\"", "<>", 
          RowBox[{"ToString", "[", "M", "]"}], "<>", "\"\<, L=\>\"", "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, t=\>\"", "<>", 
          RowBox[{"ToString", "[", "t", "]"}], "<>", 
          "\"\<, \[CapitalDelta]t=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"N", "[", "\[CapitalDelta]t", "]"}], "]"}]}]}]}], "]"}], 
      ",", 
      RowBox[{"LogLogPlot", "[", 
       RowBox[{
        RowBox[{"175", 
         SuperscriptBox["invtol", 
          RowBox[{
           RowBox[{"-", "1"}], "/", "2"}]]}], ",", 
        RowBox[{"{", 
         RowBox[{"invtol", ",", "1", ",", 
          SuperscriptBox["2", "30"]}], "}"}], ",", 
        RowBox[{"PlotStyle", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{
            RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}], ",", 
           "Dashed"}], "}"}]}]}], "]"}]}], "]"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, {{}, 
     {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
      0.019444444444444445`], AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJxTTMoPSmViYGCQA2IQ/d7y1z8nvWf2tTbCd82dH9tD+N/g/OLV1vabFjE4
oMqzwfnZJ3bsu7yT2wFVvQCcv/GT1PyqDGE0/WJwvm7jzTjuLxJo5kk7vMpd
Pqny6gf7lfwz5ObUyzkIRnVMFZ3wHmq+goOGe9+1hSnv7YX8tfOnsSo58J9n
lJbgfga1T9nhqpvpjje+F+0DpnGdjzut4rCT9akai+jS/RD71RxsV06T2lx/
aX/f3Zd66hPVHTrYNBk4be/th7hHw0F63UmOoP2v959ROdn3PkzLYdmXj6s9
5n7aD3GftsOPsLv3A2u/7OfKWfFuu4yug1+d9W3tvX/2Q9yr56B24NHfy/Fs
Bzw2t/s1PNJ3sPWM2Na/ge0AxP0GDrv+8f3ifct2wLnWOFwlxNDhSvdOT31J
9gMQ/xg53MlZmxukzn7gkYJyO8d2I4eYOP7zRTbsByD+M3aQefeaz9eD/UDj
EaHtbyRNHHrNJl0x82U/APGviYNepX1STCD7AQAqDdof
       "]]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwVjns01GkchxmXQRlj5p0kZQY15ZLb/JSl5vfNstXuTu22SO3moK3jkkaR
MUkbpRFlJF3cymZHNUNGQ9lRzZuUs7Tl1tA9YXJyqYg1Nqe1fzznc57z+edx
iBJu2kExMDAQzPL/DnrLSuv3l/B7Db4pvHUZgeCZnULL3k/W6qsqxTIERmXy
ulJ2NikZY2GfiwjCKWN+6ewi0r1/QFdVjCBHdXpmL1tOHmjOJM7nInA8/vZl
HFtN2uTee3QwCUF8St7GaHYLucEuyBQAwanRfslO9lOywScwsbGbCamfFacr
fIfI6NJlfN4EA+i9ra+Vvp9IWm9MziUHBqR/vvP2mWqaLFuU4xKwyRqq4a6q
84UBGJ/IV6/bQ4evmN6xiiXGcFc5UijjW0HKArNtnSoqOFVllJ0UWQKVH24W
5TUHfinu/ralfg6oPoL8zV4aHF2j05vPtwCL+KCmLTN0CBHcyXYINoP1V5Tu
/uUMmGcdyoGrplA9/vPEo9lu5X35FgXdBBJ6/J4eN5wH73tbk0Y3GgFpEqEO
+MMGOHUVBb5VhhDzoL6eE2sLw8+K3eoefiEbfv+ReW2pHazzihXl//SZtNN4
xqxqXghZk4rWNKQntclfvxg9Zg9MydG++dIJcqP/Bq7AhgMZki7jxqAxMjIL
jaz4lwOJFcmdPrtGSMnz6cjppw4QaBLotmC3jqwNPhKsVjjCn5IPHj5tr0ha
0dJQWq4T2HrfZE3I20mh0e7H4ZGLwTkhNLO2u4bsT+yiHPNcAtlax9g4PdYc
rQkm11pzITqIlVaYpdV4MlP0hn1cMFbKpI4dvRpqQF3jD/eXQgNX+uTc8KBm
TMTwE8uWAUubUvB84L2mv53hcX6fM3R0rLbP4I1rjPRuvM2bXUAgrHDfqZ7U
OAe+q53r4gq64mKfVSbTmu1nmvuLp1zhYT99IoWc0bTW3XbS9LjByprkKUqE
AfbTh71+eWU5sHwVewIoFKw1t6zMP+4Ogi1Mc3mzERbzf50IiPCAU413ii2E
Jtj2VnyyzsYTTPyU2fY0Ks5Zc128L8sT/v6u4+zWNjNsGNbWkPHRE2QyvzJp
kgW2DBGZbN3uBY8LtfeH/efi8hB3rn2nFywvubZ+ZtoSrx68nhnh7w2ndV3N
piVWeHfkg+Fdld5QuYPlvVBJxxd3qfL/YfGAdaAvzeuwNY5IlVsJ03hwsrBd
xNnEwHUJ7gXKER74H3lyqNybiS2nDm9OCCVgKP8I1ckY4Ydng6wDwwiI76Cm
tlARzl1JbbXZSsCwdc7onjkI00TZfM22Wc87+RgzEKZP5i2h7SDgY+758nAH
hNGn0nFFIgFT2fVkER9huw83pG/zCDA9PCyyFiP8XCpe35BPQFajcKj+AMIl
Hv5G0gICzCjj4RGHEF4ovJ284tysp+uDqiUI2482bcu8QMDc30yR4AzCjsPt
rk5XCUCpHGWWCuE3OacGJqsJKFCXO3neQLjcNeRCSw0B86a5Z7vVCC+O62Hs
rSPAVrz8ILcRYe67l3p8k4BFIr/vm9oQ1h0rUxXcJqDk+i1NXBfCl5yj4qMx
AfaTwGP2ILwsZuC1VRMBDvvWLoh6hfCg2aWivnsElNW2nDDvQ/jy5ejgG80E
cD4JDGt0CEevc6Hl/DX789qTwt4h7Dw41BzeSoBTYvDglxGE/wOM1jBW
      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/tol\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{-0.7648987441725961, -3.2026431502185218`},
  CoordinatesToolOptions:>{"DisplayFunction" -> ({
      Exp[
       Part[#, 1]], 
      Exp[
       Part[#, 2]]}& ), "CopiedValueFunction" -> ({
      Exp[
       Part[#, 1]], 
      Exp[
       Part[#, 2]]}& )},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledFrameTicks[{Log, Exp}]}, {
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledFrameTicks[{Log, Exp}]}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotLabel->FormBox[
   "\"\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \
\\(\\(-\[ImaginaryI]\\)\\\\ t\\\\ H\\)]\\) MPO approximation error (Strang \
splitting)\\n\\!\\(\\*SubscriptBox[\\(t\\), \\(H\\)]\\)=1, U=5, \[Mu]=1/7, \
M=2, L=5, t=4, \[CapitalDelta]t=0.05\"", TraditionalForm],
  PlotRange->{{-0.4332169878499659, 20.79441541679836}, {-3.1351072606270196`,
    1.0521178940460865`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->FrontEndValueCache[{
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledTicks[{Log, Exp}]}, {{{2.302585092994046, 
       FormBox["10", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {6.907755278982137, 
       FormBox["1000", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {11.512925464970229`, 
       FormBox[
        TemplateBox[{"10", "5"}, "Superscript", SyntaxForm -> SuperscriptBox],
         TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {16.11809565095832, 
       FormBox[
        TemplateBox[{"10", "7"}, "Superscript", SyntaxForm -> SuperscriptBox],
         TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {20.72326583694641, 
       FormBox[
        TemplateBox[{"10", "9"}, "Superscript", SyntaxForm -> SuperscriptBox],
         TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.3025850929940455`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {0., 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {4.605170185988092, 
       FormBox[
        InterpretationBox[
         StyleBox[
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {9.210340371976184, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {13.815510557964274`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {18.420680743952367`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}, {{-2.995732273553991, 
       FormBox[
        TagBox[
         InterpretationBox["\"0.05\"", 0.05, AutoDelete -> True], 
         NumberForm[#, {
           DirectedInfinity[1], 2.}]& ], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.3025850929940455`, 
       FormBox[
        TagBox[
         InterpretationBox["\"0.10\"", 0.1, AutoDelete -> True], 
         NumberForm[#, {
           DirectedInfinity[1], 2.}]& ], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.6931471805599453, 
       FormBox[
        TagBox[
         InterpretationBox["\"0.50\"", 0.5, AutoDelete -> True], 
         NumberForm[#, {
           DirectedInfinity[1], 2.}]& ], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {0., 
       FormBox["1", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.605170185988091, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.912023005428146, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.506557897319982, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.2188758248682006`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.8134107167600364`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.659260036932778, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.5257286443082556`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.4079456086518722`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-1.6094379124341003`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-1.2039728043259361`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.916290731874155, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.5108256237659907, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.35667494393873245`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.2231435513142097, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.10536051565782628`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {0.6931471805599453, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.0986122886681098`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.3862943611198906`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.6094379124341003`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.791759469228055, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.9459101490553132`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.0794415416798357`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.1972245773362196`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.302585092994046, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}}]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "can", " ", "reach", " ", "smaller", " ", "errors", " ", "compared", " ", 
    "to", " ", "Strang", " ", "splitting"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"qd", "=", 
       RowBox[{"Range", "[", 
        RowBox[{"0", ",", 
         SubscriptBox["M", "val"]}], "]"}]}], ",", 
      RowBox[{"tH", "=", "1"}], ",", 
      RowBox[{"U", "=", "5"}], ",", 
      RowBox[{"\[Mu]", "=", 
       FractionBox["1", "7"]}], ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"t", "=", "4"}], ",", 
      RowBox[{"tol", "=", 
       SuperscriptBox["10", 
        RowBox[{"-", "12"}]]}], ",", "HB"}], "}"}], ",", 
    RowBox[{
     RowBox[{"HB", "=", 
      RowBox[{"N", "[", 
       RowBox[{"HBoseHubbard", "[", 
        RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
       "]"}]}], ";", 
     RowBox[{"Show", "[", 
      RowBox[{
       RowBox[{"ListLogLogPlot", "[", 
        RowBox[{
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             FractionBox["nsteps", "t"], ",", 
             RowBox[{"Norm", "[", 
              RowBox[{
               RowBox[{"MPOMergeFull", "[", 
                RowBox[{"First", "/@", 
                 RowBox[{"MPOSRKNb6Evolution", "[", 
                  RowBox[{
                   RowBox[{"IdMPO", "[", 
                    RowBox[{"M", ",", "L"}], "]"}], ",", 
                   RowBox[{"N", "[", 
                    RowBox[{"h2", "[", 
                    RowBox[{
                    "tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}],
                     "]"}], ",", "qd", ",", 
                   RowBox[{"\[ImaginaryI]", " ", "t"}], ",", "nsteps", ",", 
                   "tol"}], "]"}]}], "]"}], "-", 
               RowBox[{"MatrixExp", "[", 
                RowBox[{
                 RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", "HB"}], 
                "]"}]}], "]"}]}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"nsteps", ",", "2", ",", "50", ",", "2"}], "}"}]}], "]"}],
          ",", 
         RowBox[{"AxesLabel", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"\"\<1/\[CapitalDelta]t\>\"", ",", "\"\<err\>\""}], 
           "}"}]}], ",", 
         RowBox[{"PlotLabel", "\[Rule]", 
          RowBox[{
          "\"\<\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[ImaginaryI]\)\
\\\ t\\\ H\)]\) MPO approximation error (\!\(\*SubsuperscriptBox[\(SRKN\), \
\(6\), \(b\)]\))\\n\!\(\*SubscriptBox[\(t\), \(H\)]\)=\>\"", "<>", 
           RowBox[{"ToString", "[", "tH", "]"}], "<>", "\"\<, U=\>\"", "<>", 
           RowBox[{"ToString", "[", "U", "]"}], "<>", "\"\<, \[Mu]=\>\"", "<>", 
           RowBox[{"ToString", "[", 
            RowBox[{"InputForm", "[", "\[Mu]", "]"}], "]"}], "<>", 
           "\"\<, M=\>\"", "<>", 
           RowBox[{"ToString", "[", "M", "]"}], "<>", "\"\<, L=\>\"", "<>", 
           RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, t=\>\"", "<>", 
           RowBox[{"ToString", "[", "t", "]"}], "<>", 
           "\"\<, tol=\!\(\*SuperscriptBox[\(10\), \(-12\)]\)\>\""}]}], ",", 
         RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
       RowBox[{"LogLogPlot", "[", 
        RowBox[{
         RowBox[{"0.4", 
          SuperscriptBox["inv\[CapitalDelta]t", 
           RowBox[{"-", "4"}]]}], ",", 
         RowBox[{"{", 
          RowBox[{"inv\[CapitalDelta]t", ",", 
           RowBox[{"1", "/", "10"}], ",", "15"}], "}"}], ",", 
         RowBox[{"PlotStyle", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}], ",", 
            "Dashed"}], "}"}]}]}], "]"}]}], "]"}]}]}], "]"}]}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, {{}, 
     {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
      0.019444444444444445`], AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJxTTMoPSmViYGCQBGIQ/d7y1z8nvWf7wz/uZ+3XfWbPAAUrdr3X37Ps+X6f
GfvfKH++ad+4extfacqv/VD19qzLw9RYo7gPVDx48MEh6K29SkY791E7oQPc
zGurXk3+aH/raM/Oe9aiBxJst+oFcn+x5w77IMy9V/wARP83e5YbbxU9n0ke
kHt5p3SzwA/7ieIpn8TOSh8w7n373fHAT/sjH4513qmXPbAgsPH9Urff9sLn
d5//xiF/gElB6xf36j/2fGmP/vaZKxxY9fvptWef/tp7XTn3yP+OwoHwKKN1
RUr/7edk1j6oKVE8sHhnX2WrHIND8mGfHeZMSgeKV1vbb1rE4KBRfNzqapvS
gX8frJluyzE6qPz/5O/LrAx1P6PD9pkMq+9XKB/YqOLmtpSJyeF8VYag3wvl
A2KhW3dvzGZyEJ44LZspSOWAqcLGK3PPMzkUvDPMn7tN5YCPef32x3rMDn41
WXtTxFQPlKgK273tZHY4XLFjxcki1QO18y7vEXvI7OC19tEm5TOqB3b807PY
aMLicOqK0gxmebUDAFwQwXM=
       "]]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwB4QQe+yFib1JlAgAAAE0AAAACAAAAacf7rbFrAsBiue2ejZYgQCIj+fqL
aALAGxXr62eTIEDcfvZHZmUCwNRw6DhCkCBATjbx4RpfAsBGKOPS9okgQDKl
5hWEUgLAK5fYBmB9IED6gtF9VjkCwPJ0w24yZCBAij6nTfsGAsCDMJk+1zEg
QKq1Uu1EogHARU+JvEGaH0CtmI7T5scAwEsVAYmF5R1AGv/JhgL4/78L461o
uk0cQCx13Tc3aP6/HVnBGe+9GkDB1Lo2ibb8v7K4nhhBDBlAETzNSMwh+78C
ILEqhHcXQOOMqagsa/m/1HCNiuTAFUAIhuzZjLz3v/lp0LtEEhRA5oZkHt4q
9r/XakgAloASQEdxprBMd/S/OFWKkgTNEEBjYx1WrODyv6iOAnDIbA5A0v36
zAtS8b+Gw71dh08LQIUDRSMRQ++/Z8sM54DuB0DbGv7S7Bvsv73ixZZcxwRA
NgVLHgOx6L8YzRLiclwBQDZAZQwZVuW/MRBaoBED/D+riukgETXivxqlYskB
wfU/SVADooeg3b8cwCVTzu7tPyaqB0+xSte/1nMurSFD4T8MqjMzUG3Qv/Oc
M6z7Qrw/eJb0udxfw78FlNhtyOTTv7NaqJyGMqu/ycm2SZ+F5r8wdET1u1ar
P8L+GPf3E/K/8RIkCHeQwz+2eYL8W3H4vyDj4EOgBdA/WVNRvMCu/r+/FojM
j8rWP31DfCLYuQLAdCtbCLsb3T/YzWXAbeIFwBBNg4Y4+uE/LoW7wshOCcDB
swvmk1blP97rQyIkqwzA/QoqHw156D8aQ2Jbnc0PwDSPtLxL3+s/qWN2/O2Z
EcD2A9UzqAvvPwmeBjgcMBPACRQUhAIU8T8YMDCiSr4UwJW8c6ATxPI/o9iP
vltuFsBmXZ6pM1f0P3V5usd7ARjAthT/ZDYM9j/FMBuDfrYZwEvEKg1IpPc/
WuBGK5BOG8CNy+/jWTT5P5znCwKi3hzATenqbE7m+j9cBQeLlpAewFL/sOJR
e/w/sY1mAM0SIMDWK60KODL+P/OjZBRA7iDAB7BCYR7h/z8LZq8/s8UhwD6W
UdKJuQBARaRf4a2OIsC43xzNdZMBQL/tKtyZaCPAVaVNPuleAkBcs1tNDTQk
wMkWy8ZcJgNA0CTZ1YD7JMB8k2Oowf4DQIOhcbfl0yXAUYxhAK7IBEBYmm8P
0p0mwApVDqEzzARAEWMcsFehJsDCHbtBuc8EQMoryVDdpCbANK8Ug8TWBEA7
vSKS6KsmwBbSxwXb5ARAHeDVFP+5JsDaFy4LCAEFQOIlPBos1ibAYqP6FWI5
BUBpsQglhg4nwBpsp7bnPAVAInq1xQsSJ8DTNFRXbUAFQNpCYmaRFSfARMat
mHhHBUBL1LunnBwnwCbpYBuPVQVALfduKrMqJ8DqLscgvHEFQPI81S/gRifA
ovdzwUF1BUCqBYLQZUonwFvAIGLHeAVAYs4ucetNJ8DMUXqj0n8FQNNfiLL2
VCfArnQtJumNBUC2gjs1DWMnwGY92sZukQVAbkvo1ZJmJ8AfBodn9JQFQCcU
lXYYaifAkJfgqP+bBUCXpe63I3EnwEhgjUmFnwVAT26bWKl0J8ABKTrqCqMF
QAk3SPkueCfAuvHmipCmBUDB//SZtHsnwHK6kysWqgVAecihOjp/J8BID0ia

      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/\[CapitalDelta]t\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{-0.8115498394825061, -11.913660756361619`},
  CoordinatesToolOptions:>{"DisplayFunction" -> ({
      Exp[
       Part[#, 1]], 
      Exp[
       Part[#, 2]]}& ), "CopiedValueFunction" -> ({
      Exp[
       Part[#, 1]], 
      Exp[
       Part[#, 2]]}& )},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledFrameTicks[{Log, Exp}]}, {
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledFrameTicks[{Log, Exp}]}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotLabel->FormBox[
   "\"\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \
\\(\\(-\[ImaginaryI]\\)\\\\ t\\\\ H\\)]\\) MPO approximation error \
(\\!\\(\\*SubsuperscriptBox[\\(SRKN\\), \\(6\\), \
\\(b\\)]\\))\\n\\!\\(\\*SubscriptBox[\\(t\\), \\(H\\)]\\)=1, U=5, \[Mu]=1/7, \
M=2, L=5, t=4, tol=\\!\\(\\*SuperscriptBox[\\(10\\), \\(-12\\)]\\)\"", 
    TraditionalForm],
  PlotRange->{{-0.7602070935780328, 
   2.5257286443082556`}, {-11.713554056062451`, 0.693061362485916}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->FrontEndValueCache[{
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledTicks[{Log, Exp}]}, {{{-0.6931471805599453, 
       FormBox[
        TagBox[
         InterpretationBox["\"0.5\"", 0.5, AutoDelete -> True], NumberForm[#, {
           DirectedInfinity[1], 1.}]& ], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {0., 
       FormBox["1", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {1.6094379124341003`, 
       FormBox["5", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {2.302585092994046, 
       FormBox["10", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.3025850929940455`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-1.6094379124341003`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-1.2039728043259361`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.916290731874155, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.5108256237659907, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.35667494393873245`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.2231435513142097, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.10536051565782628`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {0.6931471805599453, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.0986122886681098`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.3862943611198906`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.791759469228055, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.9459101490553132`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.0794415416798357`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.1972245773362196`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}, {{-11.512925464970229`, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "5"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.210340371976182, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "4"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-6.907755278982137, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "3"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.605170185988091, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "2"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.3025850929940455`, 
       FormBox["0.1`", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {0., 
       FormBox["1", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-13.815510557964274`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-13.122363377404328`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-12.716898269296165`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-12.429216196844383`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-12.206072645530174`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-12.02375108873622, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-11.86960040890896, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-11.736069016284437`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-11.618285980628055`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-10.819778284410283`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-10.41431317630212, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-10.126631103850338`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.903487552536127, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.721165995742174, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.567015315914915, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.433483923290392, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.315700887634009, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-8.517193191416238, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-8.111728083308073, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.824046010856292, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.600902459542082, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.418580902748128, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.264430222920869, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.1308988302963465`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.013115794639964, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-6.214608098422191, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.809142990314028, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.521460917862246, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.298317366548036, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.115995809754082, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.961845129926823, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.8283137373023015`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.710530701645918, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.912023005428146, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.506557897319982, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.2188758248682006`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.995732273553991, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.8134107167600364`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.659260036932778, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.5257286443082556`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.4079456086518722`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-1.6094379124341003`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-1.2039728043259361`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.916290731874155, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.6931471805599453, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.5108256237659907, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.35667494393873245`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.2231435513142097, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.10536051565782628`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {0.6931471805599453, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.0986122886681098`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.3862943611198906`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.6094379124341003`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.791759469228055, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.9459101490553132`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.0794415416798357`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.1972245773362196`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.302585092994046, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}}]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"Range", "[", 
       RowBox[{"0", ",", 
        SubscriptBox["M", "val"]}], "]"}]}], ",", 
     RowBox[{"tH", "=", "1"}], ",", 
     RowBox[{"U", "=", "5"}], ",", 
     RowBox[{"\[Mu]", "=", 
      FractionBox["1", "7"]}], ",", 
     RowBox[{"M", "=", 
      SubscriptBox["M", "val"]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"t", "=", "4"}], ",", 
     RowBox[{"\[CapitalDelta]t", "=", 
      RowBox[{"1", "/", "8"}]}], ",", "tol", ",", "HB"}], "}"}], ",", 
   RowBox[{
    RowBox[{"HB", "=", 
     RowBox[{"N", "[", 
      RowBox[{"HBoseHubbard", "[", 
       RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
      "]"}]}], ";", 
    RowBox[{"Show", "[", 
     RowBox[{
      RowBox[{"ListLogLogPlot", "[", 
       RowBox[{
        RowBox[{"Table", "[", 
         RowBox[{
          RowBox[{
           RowBox[{"tol", "=", 
            SuperscriptBox["2", 
             RowBox[{"-", "i"}]]}], ";", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"1", "/", "tol"}], ",", 
             RowBox[{"Norm", "[", 
              RowBox[{
               RowBox[{"MPOMergeFull", "[", 
                RowBox[{"First", "/@", 
                 RowBox[{"MPOSRKNb6Evolution", "[", 
                  RowBox[{
                   RowBox[{"IdMPO", "[", 
                    RowBox[{"M", ",", "L"}], "]"}], ",", 
                   RowBox[{"N", "[", 
                    RowBox[{"h2", "[", 
                    RowBox[{
                    "tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}],
                     "]"}], ",", "qd", ",", 
                   RowBox[{"\[ImaginaryI]", " ", "t"}], ",", 
                   RowBox[{"t", "/", "\[CapitalDelta]t"}], ",", "tol"}], 
                  "]"}]}], "]"}], "-", 
               RowBox[{"MatrixExp", "[", 
                RowBox[{
                 RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", "HB"}], 
                "]"}]}], "]"}]}], "}"}]}], ",", 
          RowBox[{"{", 
           RowBox[{"i", ",", "2", ",", "40", ",", "2"}], "}"}]}], "]"}], ",", 
        RowBox[{"AxesLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"\"\<1/tol\>\"", ",", "\"\<err\>\""}], "}"}]}], ",", 
        RowBox[{"PlotLabel", "\[Rule]", 
         RowBox[{
         "\"\<\!\(\*SuperscriptBox[\(\[ExponentialE]\), \
\(\(-\[ImaginaryI]\)\\\ t\\\ H\)]\) MPO approximation error \
(\!\(\*SubsuperscriptBox[\(SRKN\), \(6\), \
\(b\)]\))\\n\!\(\*SubscriptBox[\(t\), \(H\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", "tH", "]"}], "<>", "\"\<, U=\>\"", "<>", 
          RowBox[{"ToString", "[", "U", "]"}], "<>", "\"\<, \[Mu]=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "\[Mu]", "]"}], "]"}], "<>", 
          "\"\<, M=\>\"", "<>", 
          RowBox[{"ToString", "[", "M", "]"}], "<>", "\"\<, L=\>\"", "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, t=\>\"", "<>", 
          RowBox[{"ToString", "[", "t", "]"}], "<>", 
          "\"\<, \[CapitalDelta]t=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"N", "[", "\[CapitalDelta]t", "]"}], "]"}]}]}]}], "]"}], 
      ",", 
      RowBox[{"LogLogPlot", "[", 
       RowBox[{
        RowBox[{"128", 
         SuperscriptBox["invtol", 
          RowBox[{
           RowBox[{"-", "2"}], "/", "3"}]]}], ",", 
        RowBox[{"{", 
         RowBox[{"invtol", ",", "1", ",", 
          SuperscriptBox["2", "50"]}], "}"}], ",", 
        RowBox[{"PlotStyle", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{
            RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}], ",", 
           "Dashed"}], "}"}]}]}], "]"}]}], "]"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, {{}, 
     {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
      0.019444444444444445`], AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJxTTMoPSmViYGAQAWIQ/d7y1z8nvW/2HIp/Kxr23bOH8NkcYPzi1db2mxYJ
OKDKizkI7F4p51b02j77xI59l3dKO8xlPsa2/NEbqHoFhxmVh24VBF6y3/hJ
an5VhrJD7pbJiavmXN8P0a/mwFiz3r0i8dN+3cabcdxfNBwqrp/7bR/DcABi
nrbD5wVfrHdF8h1YyT9Dbk69nkO+UsLPQ2zCByDmGzjkbvwQt4BF/ICQv3b+
NFYjh6DJ/muV5kgdgNhn7JDcq/mTl0n+QMA0rvNxp00cNp258e5Gv+IBiP1m
DsKn96tKpykd6Lv7Uk99ornDkmo2d5kJSgcg7rFw6LnTvli2R+nAGZWTfe/D
rBz8/gl8WNmuBHWftQPbH0uVa21KBwAmzZu5
       "]]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwVxXk4lAkcAOBxDDHGMaNIrXEz5Zj5cgzi+33bOU3kbBvskist6TFKhxKb
lA21RKVVmvKo3ahc64j5VWO2i3lUimofWkc2ySpEs7K7f7zPaxm9MyhOnUaj
+f3n/01D63rOtlT6nrRNO7Q/gQ0mee8GiPYjZM+lfQOCrWyoftGYpNFeTHKs
Dq77JGbDZzXOzVF5BXndPNtgl4gN5QuDnvTJ68kOk8ILO5zZkHohcbBX3k7q
6lbLoiZZEBE78+6ZvJs8/H5ofm0mC7oUvind8iFy92+hmewzRsCaazrgdn2a
rPH2kwkoAxg4GdIy0ksDyxdBtzWLGWAyl1aSB1oQ8sbb5WuVNnQmrnkWtVQP
ssu0wyLZmkA3PNSj/8AQImw97rkn0yAukb/3CLIh9lrh8MupGbJmxayW/dVF
UDJ60NjJdYK8be4+cCtyMRA/by0cGh8gWYz7E28DlkKN8fpWmQpJO7MuP6Yh
B9JLIjZ6dj6VsUV7Nlb1W0BRv0VezN0RWZ0On1G+2QpmE1bLFjpOyhrEFX/n
1VqDuO0Gn56ikol/WT3e7mQLff3Li82uqqHkZnKc8UU7ePTxnC11lI7vhMHq
36rsgeV2RVJlpYPaA9GNExIuhHV0qXvpMfEw06k4s2sZzN1/aJ8jNsRygdXx
cD9H6NzSunM+mIWuZtIZ0R0n8OW1qsEaY+Tmv8pzN3eBF+YMifXCRRhJsyxr
EPFguvGNhomeKb5U52srVTygvmftqnq9GAujtJwkV/jAjRU5M6qXYKlvSmRL
DAFFOmzdfRe/wqA4z4os1grgKhzkuakcDNc7/WlMuQIsTg9vCm2wwAv6zfSh
XFdIH5dFC6st8ZTYy17s4QZJwThYUGyFvTYBoakf3cCceWxPxElrVAruluhe
cof4x2n70vfbIO2Kqshxkwf805Jk8SXSFrNO3y+b1BFAsIrbs0Bsh7XKyWbP
RgHAWv35WMoe3Y7VD9rs9oSx4SZ3oY8DJuQ+scy39QJ+Ud4fGQ5cfDbUYJb5
2AvkMfFcU4NlWHzHxWJxgTeY/qid46mzHDVH6J4uPitB7ZYy8NqH5SjPT/lu
9PNKuLYq0rly3BFlBVKSqPeBivGp6/QRJ0zs4blOR/uCW2Vteb3SGbdJQ9yi
OCQcqRNIxx64oHF9t3CdkoSGeEluSxgPM4z081/5AATSNxrXdPCwdMGB9IRz
AA/9cyuTNvBR//KZjzUfAIzMwz4o2/jYG2zQJJgE4NT6XX6OfLyskZPRNgXg
vJ7a3HeHj14xqToPZgBEEofm9wo+xlv5c15/AchRTGcxlXxsK9cQGTAoUCUX
GYn6+JhclixNtKZgWPaIp5jno6ff0LYJGwqmQvDPDjUCNefCnfbYUaDxtvZU
twaBpRHCxh+4FFgan5sZ1CZQscSm86wLBeEJ21HDkEDz0t7Z370p6DLUCqAs
CPxLGCDz86Ggr2JWTWhFYN2sIvuJLwXvvcZqA2wI3CCuM+ijKGDEPTWJciAw
zfSE7fQ6CtY2SfsyeARS9+ij6UIKQv1LfsohCNTbe+CGmoiCmIHcVQWuBEqf
b/dm+lOQxUypLBMQuONoP61oEwUnpLHiCi8CBR7fKEwDKTjvsYVRtZJA9Tcd
x88HUfDrI1FrnS+BHSWrA21CKGjeSu68BQT+C0yyJYE=
      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/tol\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{-1.0198649922301277`, -10.020636703261014`},
  CoordinatesToolOptions:>{"DisplayFunction" -> ({
      Exp[
       Part[#, 1]], 
      Exp[
       Part[#, 2]]}& ), "CopiedValueFunction" -> ({
      Exp[
       Part[#, 1]], 
      Exp[
       Part[#, 2]]}& )},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledFrameTicks[{Log, Exp}]}, {
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledFrameTicks[{Log, Exp}]}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotLabel->FormBox[
   "\"\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \
\\(\\(-\[ImaginaryI]\\)\\\\ t\\\\ H\\)]\\) MPO approximation error \
(\\!\\(\\*SubsuperscriptBox[\\(SRKN\\), \\(6\\), \
\\(b\\)]\\))\\n\\!\\(\\*SubscriptBox[\\(t\\), \\(H\\)]\\)=1, U=5, \[Mu]=1/7, \
M=2, L=5, t=4, \[CapitalDelta]t=0.125\"", TraditionalForm],
  PlotRange->{{-0.5776226504666211, 27.725887222397812`}, {-9.847250921700567,
    0.9026675350470331}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->FrontEndValueCache[{
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledTicks[{Log, Exp}]}, {{{0., 
       FormBox["1", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {4.605170185988092, 
       FormBox["100", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {9.210340371976184, 
       FormBox[
        TemplateBox[{"10", "4"}, "Superscript", SyntaxForm -> SuperscriptBox],
         TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {13.815510557964274`, 
       FormBox[
        TemplateBox[{"10", "6"}, "Superscript", SyntaxForm -> SuperscriptBox],
         TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {18.420680743952367`, 
       FormBox[
        TemplateBox[{"10", "8"}, "Superscript", SyntaxForm -> SuperscriptBox],
         TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {23.025850929940457`, 
       FormBox[
        TemplateBox[{"10", "10"}, "Superscript", SyntaxForm -> 
         SuperscriptBox], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {27.631021115928547`, 
       FormBox[
        TemplateBox[{"10", "12"}, "Superscript", SyntaxForm -> 
         SuperscriptBox], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {2.302585092994046, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {6.907755278982137, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {11.512925464970229`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {16.11809565095832, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {20.72326583694641, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {25.328436022934504`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}, {{-9.210340371976182, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "4"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-6.907755278982137, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "3"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.605170185988091, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "2"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.3025850929940455`, 
       FormBox["0.1`", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {0., 
       FormBox["1", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-11.512925464970229`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-10.819778284410283`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-10.41431317630212, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-10.126631103850338`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.903487552536127, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.721165995742174, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.567015315914915, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.433483923290392, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.315700887634009, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-8.517193191416238, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-8.111728083308073, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.824046010856292, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.600902459542082, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.418580902748128, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.264430222920869, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.1308988302963465`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.013115794639964, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-6.214608098422191, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.809142990314028, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.521460917862246, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.298317366548036, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.115995809754082, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.961845129926823, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.8283137373023015`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.710530701645918, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.912023005428146, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.506557897319982, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.2188758248682006`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.995732273553991, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.8134107167600364`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.659260036932778, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.5257286443082556`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.4079456086518722`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-1.6094379124341003`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-1.2039728043259361`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.916290731874155, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.6931471805599453, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.5108256237659907, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.35667494393873245`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.2231435513142097, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.10536051565782628`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {0.6931471805599453, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.0986122886681098`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.3862943611198906`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.6094379124341003`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.791759469228055, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.9459101490553132`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.0794415416798357`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.1972245773362196`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.302585092994046, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}}]]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell[TextData[{
 Cell[BoxData[
  FormBox[
   RowBox[{
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{
      RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", "H"}]], "X", " ", 
    SuperscriptBox["\[ExponentialE]", 
     RowBox[{"\[ImaginaryI]", " ", "t", " ", "H"}]]}], TraditionalForm]]],
 " MPO approximation"
}], "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "42", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["A", "rnd"], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"qd", "=", 
        RowBox[{"Range", "[", 
         RowBox[{"0", ",", 
          SubscriptBox["M", "val"]}], "]"}]}], ",", 
       RowBox[{"(*", " ", 
        RowBox[{
        "fictitious", " ", "virtual", " ", "bond", " ", "quantum", " ", 
         "numbers"}], " ", "*)"}], 
       RowBox[{"qA", "=", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", "0", "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"-", "1"}], ",", "0", ",", "1", ",", "0", ",", 
            RowBox[{"-", "2"}], ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"3", ",", 
            RowBox[{"-", "1"}], ",", "0", ",", 
            RowBox[{"-", "4"}], ",", 
            RowBox[{"-", "2"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"-", "4"}], ",", "2", ",", "0", ",", 
            RowBox[{"-", "3"}], ",", "1", ",", "0", ",", "3"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"-", "1"}], ",", "1", ",", "2", ",", "1", ",", "0", ",", 
            "0"}], "}"}], ",", 
          RowBox[{"{", "0", "}"}]}], "}"}]}], ",", 
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", "zmax"}], "}"}], ",", 
     RowBox[{
      RowBox[{"zmax", "=", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "2"}]}], ";", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Outer", "[", 
           RowBox[{
            RowBox[{
             RowBox[{"If", "[", 
              RowBox[{
               RowBox[{
                RowBox[{"#1", "-", "#2", "+", "#3", "-", "#4"}], "\[Equal]", 
                "0"}], ",", 
               RowBox[{"RandomComplex", "[", 
                RowBox[{"{", 
                 RowBox[{
                  RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], "]"}], ",", 
               "0"}], "]"}], "&"}], ",", "qd", ",", "qd", ",", 
            RowBox[{
            "qA", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], ",", 
            RowBox[{"qA", "\[LeftDoubleBracket]", 
             RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "]"}], ",", 
          RowBox[{
          "qA", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], ",", 
          RowBox[{"qA", "\[LeftDoubleBracket]", 
           RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"j", ",", "L"}], "}"}]}], "]"}]}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "/@", 
  RowBox[{"(", 
   RowBox[{"First", "/@", "%"}], ")"}]}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "1", ",", "6"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "6", ",", "5"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "5", ",", "7"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "7", ",", "6"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "6", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"Range", "[", 
       RowBox[{"0", ",", 
        SubscriptBox["M", "val"]}], "]"}]}], ",", 
     RowBox[{"tH", "=", "1"}], ",", 
     RowBox[{"U", "=", "5"}], ",", 
     RowBox[{"\[Mu]", "=", 
      FractionBox["1", "7"]}], ",", 
     RowBox[{"M", "=", 
      SubscriptBox["M", "val"]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"t", "=", "4"}], ",", 
     RowBox[{"tol", "=", 
      SuperscriptBox["10", 
       RowBox[{"-", "8"}]]}], ",", "HB"}], "}"}], ",", 
   RowBox[{
    RowBox[{"HB", "=", 
     RowBox[{"N", "[", 
      RowBox[{"HBoseHubbard", "[", 
       RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
      "]"}]}], ";", 
    RowBox[{"Show", "[", 
     RowBox[{
      RowBox[{"ListLogLogPlot", "[", 
       RowBox[{
        RowBox[{"Table", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            FractionBox["nsteps", "t"], ",", 
            RowBox[{"Norm", "[", 
             RowBox[{
              RowBox[{"MPOMergeFull", "[", 
               RowBox[{"First", "/@", 
                RowBox[{"MPOStrangLiouvilleEvolution", "[", 
                 RowBox[{
                  SubscriptBox["A", "rnd"], ",", 
                  RowBox[{"N", "[", 
                   RowBox[{"h2", "[", 
                    RowBox[{
                    "tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}],
                    "]"}], ",", "qd", ",", 
                  RowBox[{"\[ImaginaryI]", " ", "t"}], ",", "nsteps", ",", 
                  "tol"}], "]"}]}], "]"}], "-", 
              RowBox[{
               RowBox[{"MatrixExp", "[", 
                RowBox[{
                 RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", "HB"}], "]"}],
                ".", 
               RowBox[{"MPOMergeFull", "[", 
                RowBox[{"First", "/@", 
                 SubscriptBox["A", "rnd"]}], "]"}], ".", 
               RowBox[{"MatrixExp", "[", 
                RowBox[{"\[ImaginaryI]", " ", "t", " ", "HB"}], "]"}]}]}], 
             "]"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"nsteps", ",", "8", ",", "120", ",", "8"}], "}"}]}], "]"}],
         ",", 
        RowBox[{"AxesLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"\"\<1/\[CapitalDelta]t\>\"", ",", "\"\<err\>\""}], "}"}]}],
         ",", 
        RowBox[{"PlotLabel", "\[Rule]", 
         RowBox[{
         "\"\<\!\(\*SuperscriptBox[\(\[ExponentialE]\), \
\(\(-\[ImaginaryI]\)\\\ t\\\ H\)]\) X \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\[ImaginaryI]\\\ t\\\ H\)]\) MPO \
approximation error (Strang splitting)\\n\!\(\*SubscriptBox[\(t\), \
\(H\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", "tH", "]"}], "<>", "\"\<, U=\>\"", "<>", 
          RowBox[{"ToString", "[", "U", "]"}], "<>", "\"\<, \[Mu]=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "\[Mu]", "]"}], "]"}], "<>", 
          "\"\<, M=\>\"", "<>", 
          RowBox[{"ToString", "[", "M", "]"}], "<>", "\"\<, L=\>\"", "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, t=\>\"", "<>", 
          RowBox[{"ToString", "[", "t", "]"}], "<>", 
          "\"\<, tol=\!\(\*SuperscriptBox[\(10\), \(-8\)]\)\>\""}]}], ",", 
        RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
      RowBox[{"LogLogPlot", "[", 
       RowBox[{
        RowBox[{"2.75", 
         SuperscriptBox["inv\[CapitalDelta]t", 
          RowBox[{"-", "2"}]]}], ",", 
        RowBox[{"{", 
         RowBox[{"inv\[CapitalDelta]t", ",", 
          RowBox[{"1", "/", "10"}], ",", "30"}], "}"}], ",", 
        RowBox[{"PlotStyle", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
           RowBox[{
            RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}], ",", 
           "Dashed"}], "}"}]}], ",", 
        RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]}], "]"}]}]}], 
  "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, {{}, 
     {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
      0.019444444444444445`], AbsoluteThickness[1.6], 
      PointBox[{{0.6931471805599453, -1.2000677822734123`}, {
       1.3862943611198906`, -1.86776027432242}, {
       1.791759469228055, -2.589316697601851}, {
       2.0794415416798357`, -3.141691955051034}, {
       2.302585092994046, -3.5783256235480385`}, {
       2.4849066497880004`, -3.9385611596824703`}, {
       2.6390573296152584`, -4.24473488984217}, {
       2.772588722239781, -4.511158813287554}, {
       2.8903717578961645`, -4.745427317738269}, {
       2.995732273553991, -4.955493947534192}, {
       3.091042453358316, -5.145772839142905}, {
       3.1780538303479458`, -5.319453380526988}, {
       3.258096538021482, -5.478889593012692}, {
       3.332204510175204, -5.626223525004238}, {
       3.4011973816621555`, -5.762824528577667}}]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwB4QQe+yFib1JlAgAAAE0AAAACAAAAGrsVrLFrAsBEyBbIkncWQM0EMoQc
aALA9xEzoP1zFkCATk5ch2QCwKpbT3hocBZA5uGGDF1dAsAQ74coPmkWQLII
+GwITwLA3BX5iOlaFkBLVtotXzICwHVj20lAPhZAfPGerwz5AcCm/p/L7QQW
QN8nKLNnhgHACTUpz0iSFUC0GBxf1I0AwN4lHXu1mRRAd1XlGHRL/7/mt3Mo
m7ETQH6oAY5ahP2/aeEBYw7OEkCmA+FMrpb7v/2OcUI41xFAMaGFDvTJ+b/D
3UMj2/AQQN1G7Rmn1ve/MWHvUWnuD0CBG8Q/dez1v9U1xnc3BA5AiDJgaDUj
9L/cTGKg9zoMQLBRv9piM/K/BGzBEiVLCkA7s+NPgmTwv5DN5YdEfAhAfIfu
vnk97b8SXnkXf7YGQMS4m3HJZOm/tvbP8CbKBEDSbtMp/c3lv73R68zA/gJA
IjWRdQvq4b/ltMryxwwBQMOyWuyfMNy/Co4xZtRH/j/PBKj48BDVvw83WOz8
t/o/ve4CWO6tyr9Y8AQGANv2P+zNv6kVg7i/Zi48Jec/8z9O/lYBc/uaP2v5
8q9Rr+4/yy68wY63wj/sUSp/QQPnP1i1kYYPhNA/9WftsvK13z/IMjmFokbY
PxBtnrXMMNA/q6bLeG2F3z+FVJjnbDObP1evUAHmT+M/dNVjigwDyb8Xe7Wy
OirnP74ZxQrZ6tu/EcKPXqvC6j/SGhfdTSblv8n443ZBqO4/Qoi/DXrx7L/J
6Cyt0D3xP+mcVeocTPK/yZIinI4G8z/r8EDImN31v6g0VUHf9fQ/qDSmEjq8
+b8klMLjPcT2P6DzgFf3WP2/qMTAa4GJ+D9Tqr4zv3EAwAvt+6lXdfo/t9L5
cZVdAsAL03HlO0D8P7e4b615KATA6rAk17Ix/j+WliKf8BkGwDMmCeMbAQBA
ETIQjnXqB8B2XEjN0OQAQJeejmLfsQnAqA6mEs/bAUD8Akrt258LwKgfoVZU
wgJA/CRAdeZsDcCYrLr1IrwDQNw+c7ODYA/ADKKcB2SxBEDilJvrgqUQwE72
GxgslgVAJOka/EqKEcCAxrmDPY4GQFa5uGdcghLAgPX07dV1B0BW6PPR9GkT
wASN+MrgWAhA2n/3rv9MFMB4oBoDNU8JQE6TGedTQxXAuhLaORA1CkCQBdkd
LykWwGJbmJQSOQpAOE6XeDEtFsAJpFbvFD0KQN+WVdMzMRbAWDXTpBlFCkAu
KNKIODkWwPZXzA8jVQpAzErL80FJFsAznb7lNXUKQAmQvclUaRbArCejkVu1
CkCCGqJ1eqkWwFRwYexduQpAKmNg0HytFsD7uB9HYL0KQNGrHit/sRbASkqc
/GTFCkAgPZvgg7kWwOlslWdu1QpAv1+US43JFsAmsoc9gfUKQPykhiGg6RbA
zvpFmIP5CkCk7UR8ou0WwHVDBPOF/QpASzYD16TxFsDE1ICoigULQJrHf4yp
+RbAYvd5E5QVC0A46nj3sgkXwApAOG6WGQtA4DI3UrUNF8CxiPbImB0LQId7
9ay3ERfAABpzfp0lC0DWDHJivBkXwKhiMdmfKQtAflUwvb4dF8BQq+8zoi0L
QCae7hfBIRfA+POtjqQxC0DO5qxywyUXwJ88bOmmNQtAdS9rzcUpF8Aj2Fae

      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/\[CapitalDelta]t\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{0.5935346568865892, -6.093992356938462},
  CoordinatesToolOptions:>{"DisplayFunction" -> ({
      Exp[
       Part[#, 1]], 
      Exp[
       Part[#, 2]]}& ), "CopiedValueFunction" -> ({
      Exp[
       Part[#, 1]], 
      Exp[
       Part[#, 2]]}& )},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledFrameTicks[{Log, Exp}]}, {
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledFrameTicks[{Log, Exp}]}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotLabel->FormBox[
   "\"\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \
\\(\\(-\[ImaginaryI]\\)\\\\ t\\\\ H\\)]\\) X \\!\\(\\*SuperscriptBox[\\(\
\[ExponentialE]\\), \\(\[ImaginaryI]\\\\ t\\\\ H\\)]\\) MPO approximation \
error (Strang splitting)\\n\\!\\(\\*SubscriptBox[\\(t\\), \\(H\\)]\\)=1, U=5, \
\[Mu]=1/7, M=2, L=5, t=4, tol=\\!\\(\\*SuperscriptBox[\\(10\\), \
\\(-8\\)]\\)\"", TraditionalForm],
  PlotRange->{{0.6367294680369826, 
   3.4011973816621555`}, {-6.01631101448346, -1.2000677822734123`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->FrontEndValueCache[{
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledTicks[{Log, Exp}]}, {{{0.6931471805599453, 
       FormBox["2", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {1.6094379124341003`, 
       FormBox["5", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {2.302585092994046, 
       FormBox["10", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {2.995732273553991, 
       FormBox["20", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {0., 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.0986122886681098`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.3862943611198906`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.791759469228055, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.9459101490553132`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.0794415416798357`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.1972245773362196`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {3.4011973816621555`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {3.6888794541139363`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {3.912023005428146, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}, {{-5.298317366548036, 
       FormBox[
        TemplateBox[{"\[Times]", "\"\[Times]\"", "5.`", 
          TemplateBox[{"10", 
            RowBox[{"-", "3"}]}, "Superscript", SyntaxForm -> 
           SuperscriptBox]}, "RowWithSeparators"], TraditionalForm], {0.01, 
       0.}, {
        AbsoluteThickness[0.1]}}, {-4.605170185988091, 
       FormBox[
        TemplateBox[{"\[Times]", "\"\[Times]\"", "1.`", 
          TemplateBox[{"10", 
            RowBox[{"-", "2"}]}, "Superscript", SyntaxForm -> 
           SuperscriptBox]}, "RowWithSeparators"], TraditionalForm], {0.01, 
       0.}, {
        AbsoluteThickness[0.1]}}, {-2.995732273553991, 
       FormBox[
        TagBox[
         InterpretationBox["\"0.05\"", 0.05, AutoDelete -> True], 
         NumberForm[#, {
           DirectedInfinity[1], 2.}]& ], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.3025850929940455`, 
       FormBox[
        TagBox[
         InterpretationBox["\"0.10\"", 0.1, AutoDelete -> True], 
         NumberForm[#, {
           DirectedInfinity[1], 2.}]& ], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-6.907755278982137, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-6.214608098422191, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.809142990314028, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.521460917862246, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.115995809754082, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.961845129926823, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.8283137373023015`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.710530701645918, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.912023005428146, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.506557897319982, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.2188758248682006`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.8134107167600364`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.659260036932778, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.5257286443082556`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.4079456086518722`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-1.6094379124341003`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-1.2039728043259361`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.916290731874155, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.6931471805599453, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.5108256237659907, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.35667494393873245`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.2231435513142097, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-0.10536051565782628`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {0., 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}}]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "can", " ", "reach", " ", "smaller", " ", "errors", " ", "compared", " ", 
    "to", " ", "Strang", " ", "splitting"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"qd", "=", 
       RowBox[{"Range", "[", 
        RowBox[{"0", ",", 
         SubscriptBox["M", "val"]}], "]"}]}], ",", 
      RowBox[{"tH", "=", "1"}], ",", 
      RowBox[{"U", "=", "5"}], ",", 
      RowBox[{"\[Mu]", "=", 
       FractionBox["1", "7"]}], ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"t", "=", "4"}], ",", 
      RowBox[{"tol", "=", 
       SuperscriptBox["10", 
        RowBox[{"-", "12"}]]}], ",", "HB"}], "}"}], ",", 
    RowBox[{
     RowBox[{"HB", "=", 
      RowBox[{"N", "[", 
       RowBox[{"HBoseHubbard", "[", 
        RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
       "]"}]}], ";", 
     RowBox[{"Show", "[", 
      RowBox[{
       RowBox[{"ListLogLogPlot", "[", 
        RowBox[{
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             FractionBox["nsteps", "t"], ",", 
             RowBox[{"Norm", "[", 
              RowBox[{
               RowBox[{"MPOMergeFull", "[", 
                RowBox[{"First", "/@", 
                 RowBox[{"MPOSRKNb6LiouvilleEvolution", "[", 
                  RowBox[{
                   SubscriptBox["A", "rnd"], ",", 
                   RowBox[{"N", "[", 
                    RowBox[{"h2", "[", 
                    RowBox[{
                    "tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}],
                     "]"}], ",", "qd", ",", 
                   RowBox[{"\[ImaginaryI]", " ", "t"}], ",", "nsteps", ",", 
                   "tol"}], "]"}]}], "]"}], "-", 
               RowBox[{
                RowBox[{"MatrixExp", "[", 
                 RowBox[{
                  RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", "HB"}], 
                 "]"}], ".", 
                RowBox[{"MPOMergeFull", "[", 
                 RowBox[{"First", "/@", 
                  SubscriptBox["A", "rnd"]}], "]"}], ".", 
                RowBox[{"MatrixExp", "[", 
                 RowBox[{"\[ImaginaryI]", " ", "t", " ", "HB"}], "]"}]}]}], 
              "]"}]}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"nsteps", ",", "5", ",", "50", ",", "5"}], "}"}]}], "]"}],
          ",", 
         RowBox[{"AxesLabel", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"\"\<1/\[CapitalDelta]t\>\"", ",", "\"\<err\>\""}], 
           "}"}]}], ",", 
         RowBox[{"PlotLabel", "\[Rule]", 
          RowBox[{
          "\"\<\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[ImaginaryI]\)\
\\\ t\\\ H\)]\) X \!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\[ImaginaryI]\\\
\ t\\\ H\)]\) MPO approximation error (\!\(\*SubsuperscriptBox[\(SRKN\), \
\(6\), \(b\)]\))\\n\!\(\*SubscriptBox[\(t\), \(H\)]\)=\>\"", "<>", 
           RowBox[{"ToString", "[", "tH", "]"}], "<>", "\"\<, U=\>\"", "<>", 
           RowBox[{"ToString", "[", "U", "]"}], "<>", "\"\<, \[Mu]=\>\"", "<>", 
           RowBox[{"ToString", "[", 
            RowBox[{"InputForm", "[", "\[Mu]", "]"}], "]"}], "<>", 
           "\"\<, M=\>\"", "<>", 
           RowBox[{"ToString", "[", "M", "]"}], "<>", "\"\<, L=\>\"", "<>", 
           RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, t=\>\"", "<>", 
           RowBox[{"ToString", "[", "t", "]"}], "<>", 
           "\"\<, tol=\!\(\*SuperscriptBox[\(10\), \(-12\)]\)\>\""}]}], ",", 
         RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
       RowBox[{"LogLogPlot", "[", 
        RowBox[{
         RowBox[{"0.045", 
          SuperscriptBox["inv\[CapitalDelta]t", 
           RowBox[{"-", "4"}]]}], ",", 
         RowBox[{"{", 
          RowBox[{"inv\[CapitalDelta]t", ",", 
           RowBox[{"1", "/", "10"}], ",", "15"}], "}"}], ",", 
         RowBox[{"PlotStyle", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}], ",", 
            "Dashed"}], "}"}]}]}], "]"}]}], "]"}]}]}], "]"}]}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, {{}, 
     {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
      0.019444444444444445`], AbsoluteThickness[1.6], 
      PointBox[{{0.22314355131420976`, -3.346266735121757}, {
       0.9162907318741551, -6.784533088765946}, {
       1.3217558399823195`, -8.418356268831916}, {
       1.6094379124341003`, -9.573495547108216}, {
       1.8325814637483102`, -10.468206449079336`}, {
       2.0149030205422647`, -11.198645087685648`}, {
       2.169053700369523, -11.816028543269793`}, {
       2.302585092994046, -12.350775077017154`}, {
       2.4203681286504293`, -12.822610715521428`}, {
       2.5257286443082556`, -13.24382026080131}}]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwB4QQe+yFib1JlAgAAAE0AAAACAAAAacf7rbFrAsAEdLl93m8YQCIj+fqL
aALAdiu0F5NpGEDcfvZHZmUCwOnirrFHYxhATjbx4RpfAsDOUaTlsFYYQDKl
5hWEUgLAli+PTYM9GED6gtF9VjkCwCbrZB0oCxhAij6nTfsGAsBGYhC9caYX
QKq1Uu1EogHAhlBn/ATdFkCtmI7T5scAwIwW38hIKBVAGv/JhgL4/79M5Iuo
fZATQCx13Tc3aP6/XlqfWbIAEkDB1Lo2ibb8v/O5fFgETxBAETzNSMwh+7+G
Qh7VjnQNQOOMqagsa/m/KeTWlE8HCkAIhuzZjLz3v3PWXPcPqgZA5oZkHt4q
9r8w2EyAsoYDQEdxprBMd/S/8qzQpI8fAEBjYx1WrODyv1Qifd+d5Pk/0v36
zAtS8b8PjPO6G6rzP4UDRSMRQ++/oTcjmx3Q6T/bGv7S7Bvsv/EpD7QYZ9o/
NgVLHgOx6L99ZjAxngaOvzZAZQwZVuW/Mau3gIXH27+riukgETXiv8arSm7i
Z+q/SVADooeg3b/vGvXWi/3zvyaqB0+xSte/EsHwKWJT+r8MqjMzUG3Qv5dg
4qJhmADAeJb0udxfw7//D/+NEvcDwLNaqJyGMqu/8a+xUuEbB8AwdET1u1ar
P9980Ht1hArA8RIkCHeQwz9aOoV+J7MNwCDj4EOgBdA/llM27+xoEMC/FojM
j8rWP34gYNEoGhLAdCtbCLsb3T+r5VSgc64TwBBNg4Y4+uE/VsF/IaFkFcDB
swvmk1blP670Q9HOEhfA/QoqHw156D9NINNtC6QYwDSPtLxL3+s/aGKYvCpX
GsD2A9UzqAvvP8mcKPhY7RvACRQUhAIU8T/XLlJih3sdwJW8c6ATxPI/Y9ex
fpgrH8BmXZ6pM1f0Pxo87kNcXyDAthT/ZDYM9j/Cl56h3TkhwEvEKg1IpPc/
jW+0deYFIsCNy+/jWTT5Py7zFmHvzSLATenqbE7m+j8NgpSl6aYjwFL/sOJR
e/w/EI13YGtxJMDWK60KODL+P1KjdXTeTCXAB7BCYR7h/z9qZcCfUSQmwD6W
UdKJuQBApaNwQUztJsC43xzNdZMBQB/tOzw4xyfAVaVNPuleAkC8smytq5Io
wMkWy8ZcJgNAMCTqNR9aKcB8k2Oowf4DQOOggheEMirAUYxhAK7IBEC4mYBv
cPwqwApVDqEzzARAcWItEPb/KsDCHbtBuc8EQCkr2rB7AyvANK8Ug8TWBECb
vDPyhgorwBbSxwXb5ARAfd/mdJ0YK8DaFy4LCAEFQEElTXrKNCvAYqP6FWI5
BUDJsBmFJG0rwBpsp7bnPAVAgXnGJapwK8DTNFRXbUAFQDpCc8YvdCvARMat
mHhHBUCr08wHO3srwCbpYBuPVQVAjfZ/ilGJK8DqLscgvHEFQFE85o9+pSvA
ovdzwUF1BUAJBZMwBKkrwFvAIGLHeAVAws0/0YmsK8DMUXqj0n8FQDNfmRKV
syvArnQtJumNBUAVgkyVq8ErwGY92sZukQVAzUr5NTHFK8AfBodn9JQFQIYT
pta2yCvAkJfgqP+bBUD3pP8Xws8rwEhgjUmFnwVAr22suEfTK8ABKTrqCqMF
QGg2WVnN1ivAuvHmipCmBUAh/wX6UtorwHK6kysWqgVA2ceymtjdK8CewE6/

      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/\[CapitalDelta]t\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{0.13844559704717618`, -13.962191081213538`},
  CoordinatesToolOptions:>{"DisplayFunction" -> ({
      Exp[
       Part[#, 1]], 
      Exp[
       Part[#, 2]]}& ), "CopiedValueFunction" -> ({
      Exp[
       Part[#, 1]], 
      Exp[
       Part[#, 2]]}& )},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledFrameTicks[{Log, Exp}]}, {
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledFrameTicks[{Log, Exp}]}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotLabel->FormBox[
   "\"\\!\\(\\*SuperscriptBox[\\(\[ExponentialE]\\), \
\\(\\(-\[ImaginaryI]\\)\\\\ t\\\\ H\\)]\\) X \\!\\(\\*SuperscriptBox[\\(\
\[ExponentialE]\\), \\(\[ImaginaryI]\\\\ t\\\\ H\\)]\\) MPO approximation \
error (\\!\\(\\*SubsuperscriptBox[\\(SRKN\\), \\(6\\), \
\\(b\\)]\\))\\n\\!\\(\\*SubscriptBox[\\(t\\), \\(H\\)]\\)=1, U=5, \[Mu]=1/7, \
M=2, L=5, t=4, tol=\\!\\(\\*SuperscriptBox[\\(10\\), \\(-12\\)]\\)\"", 
    TraditionalForm],
  PlotRange->{{0.17517302854350048`, 
   2.5257286443082556`}, {-13.793684345561287`, -3.346266735121757}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->FrontEndValueCache[{
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledTicks[{Log, Exp}]}, {{{0.6931471805599453, 
       FormBox["2", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {1.0986122886681098`, 
       FormBox["3", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {1.791759469228055, 
       FormBox["6", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {2.3978952727983707`, 
       FormBox["11", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {0.9162907318741551, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.3862943611198906`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.6094379124341003`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {1.9459101490553132`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.0794415416798357`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.1972245773362196`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {2.302585092994046, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}, {{-13.815510557964274`, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "6"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-11.512925464970229`, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "5"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.210340371976182, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "4"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-6.907755278982137, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "3"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.605170185988091, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "2"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-16.11809565095832, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-15.424948470398375`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-15.01948336229021, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-14.73180128983843, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-14.508657738524219`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-14.326336181730264`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> Baseline]
          , "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-14.172185501903007`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-14.038654109278484`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-13.9208710736221, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-13.122363377404328`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-12.716898269296165`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-12.429216196844383`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-12.206072645530174`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-12.02375108873622, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-11.86960040890896, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-11.736069016284437`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-11.618285980628055`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-10.819778284410283`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-10.41431317630212, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-10.126631103850338`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.903487552536127, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.721165995742174, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.567015315914915, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.433483923290392, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-9.315700887634009, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-8.517193191416238, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-8.111728083308073, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.824046010856292, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.600902459542082, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.418580902748128, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.264430222920869, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.1308988302963465`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-7.013115794639964, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-6.214608098422191, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.809142990314028, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.521460917862246, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.298317366548036, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-5.115995809754082, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.961845129926823, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.8283137373023015`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-4.710530701645918, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.912023005428146, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.506557897319982, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-3.2188758248682006`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.995732273553991, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.8134107167600364`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.659260036932778, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.5257286443082556`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.4079456086518722`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.3025850929940455`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}}]]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "virtual", " ", "bond", " ", "dimensions", " ", "seem", " ", "to", " ", 
    "be", " ", "maxed", " ", "out"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"qd", "=", 
       RowBox[{"Range", "[", 
        RowBox[{"0", ",", 
         SubscriptBox["M", "val"]}], "]"}]}], ",", 
      RowBox[{"tH", "=", "1"}], ",", 
      RowBox[{"U", "=", "5"}], ",", 
      RowBox[{"\[Mu]", "=", 
       FractionBox["1", "7"]}], ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"t", "=", "1"}], ",", 
      RowBox[{"\[CapitalDelta]t", "=", 
       RowBox[{"1", "/", "8"}]}], ",", 
      RowBox[{"tol", "=", 
       SuperscriptBox["10", 
        RowBox[{"-", "8"}]]}]}], "}"}], ",", 
    RowBox[{"Dimensions", "/@", 
     RowBox[{"(", 
      RowBox[{"First", "/@", 
       RowBox[{"MPOSRKNb6LiouvilleEvolution", "[", 
        RowBox[{
         SubscriptBox["A", "rnd"], ",", 
         RowBox[{"N", "[", 
          RowBox[{"h2", "[", 
           RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
          "]"}], ",", "qd", ",", 
         RowBox[{"\[ImaginaryI]", " ", "t"}], ",", 
         RowBox[{"t", "/", "\[CapitalDelta]t"}], ",", "tol"}], "]"}]}], 
      ")"}]}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "1", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "9", ",", "81"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "81", ",", "81"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "81", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "3", ",", "9", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Response function using MPO approximation", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"tH", "=", "1"}], ",", 
      RowBox[{"U", "=", "5"}], ",", 
      RowBox[{"\[Mu]", "=", 
       FractionBox["1", "7"]}], ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", 
      RowBox[{"t", "=", "4"}]}], "}"}], ",", 
    RowBox[{"\[Chi]A", "[", 
     RowBox[{
      RowBox[{"N", "[", 
       RowBox[{
        SubscriptBox["A", "op"], "[", 
        RowBox[{"0", ",", "M", ",", "L"}], "]"}], "]"}], ",", 
      RowBox[{"N", "[", 
       RowBox[{
        SubscriptBox["A", "op"], "[", 
        RowBox[{"2", ",", "M", ",", "L"}], "]"}], "]"}], ",", 
      RowBox[{"N", "[", 
       RowBox[{"HBoseHubbard", "[", 
        RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
       "]"}], ",", "\[Beta]", ",", "t"}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"0.4651634836229739`", "\[VeryThinSpace]", "+", 
  RowBox[{"0.005860786728824328`", " ", "\[ImaginaryI]"}]}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"MPOSingleSiteTopUpdate", "[", 
   RowBox[{"A_List", ",", "j_", ",", "op_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"B", "=", "A"}], "}"}], ",", 
    RowBox[{
     RowBox[{
      RowBox[{"B", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], 
      "=", 
      RowBox[{"MPOComposition", "[", 
       RowBox[{"op", ",", 
        RowBox[{"A", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}]}],
        "]"}]}], ";", "B"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"MPOSingleSiteBottomUpdate", "[", 
   RowBox[{"A_List", ",", "j_", ",", "op_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"B", "=", "A"}], "}"}], ",", 
    RowBox[{
     RowBox[{
      RowBox[{"B", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], 
      "=", 
      RowBox[{"MPOComposition", "[", 
       RowBox[{
        RowBox[{"A", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], 
        ",", "op"}], "]"}]}], ";", "B"}]}], "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"compare", " ", 
    RowBox[{"(", 
     RowBox[{"scheme", " ", "A"}], ")"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"qd", "=", 
       RowBox[{"Range", "[", 
        RowBox[{"0", ",", 
         SubscriptBox["M", "val"]}], "]"}]}], ",", 
      RowBox[{"nop", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"ArrayReshape", "[", 
          RowBox[{
           RowBox[{"NumberOp", "[", 
            SubscriptBox["M", "val"], "]"}], ",", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{
              SubscriptBox["M", "val"], "+", "1"}], ",", 
             RowBox[{
              SubscriptBox["M", "val"], "+", "1"}], ",", "1", ",", "1"}], 
            "}"}]}], "]"}], ",", 
         RowBox[{"{", "0", "}"}], ",", 
         RowBox[{"{", "0", "}"}]}], "}"}]}], ",", 
      RowBox[{"tH", "=", "1"}], ",", 
      RowBox[{"U", "=", "5"}], ",", 
      RowBox[{"\[Mu]", "=", 
       FractionBox["1", "7"]}], ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", 
      RowBox[{"\[CapitalDelta]\[Beta]", "=", 
       RowBox[{"1", "/", "50"}]}], ",", "\[Rho]\[Beta]", ",", 
      RowBox[{"t", "=", "4"}], ",", 
      RowBox[{"\[CapitalDelta]t", "=", 
       RowBox[{"1", "/", "8"}]}], ",", "\[Rho]\[Beta]A", ",", 
      "\[Rho]\[Beta]B", ",", 
      RowBox[{"tol", "=", 
       SuperscriptBox["10", 
        RowBox[{"-", "12"}]]}]}], "}"}], ",", 
    RowBox[{
     RowBox[{"\[Rho]\[Beta]", "=", 
      RowBox[{"MPOStrangEvolution", "[", 
       RowBox[{
        RowBox[{"IdMPO", "[", 
         RowBox[{"M", ",", "L"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"h2", "[", 
          RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
         "]"}], ",", "qd", ",", 
        RowBox[{
         FractionBox["1", "2"], "\[Beta]"}], ",", 
        RowBox[{"\[Beta]", "/", "\[CapitalDelta]\[Beta]"}], ",", "tol"}], 
       "]"}]}], ";", 
     RowBox[{"\[Rho]\[Beta]A", "=", 
      RowBox[{"MPOSRKNb6Evolution", "[", 
       RowBox[{
        RowBox[{"MPOSingleSiteTopUpdate", "[", 
         RowBox[{"\[Rho]\[Beta]", ",", "3", ",", "nop"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"h2", "[", 
          RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
         "]"}], ",", "qd", ",", 
        RowBox[{"\[ImaginaryI]", " ", "t"}], ",", 
        RowBox[{"t", "/", "\[CapitalDelta]t"}], ",", "tol"}], "]"}]}], ";", 
     RowBox[{"\[Rho]\[Beta]B", "=", 
      RowBox[{"MPOSRKNb6Evolution", "[", 
       RowBox[{
        RowBox[{"MPOSRKNb6Evolution", "[", 
         RowBox[{
          RowBox[{"MPOSingleSiteTopUpdate", "[", 
           RowBox[{
            RowBox[{"IdMPO", "[", 
             RowBox[{"M", ",", "L"}], "]"}], ",", "5", ",", "nop"}], "]"}], 
          ",", 
          RowBox[{"N", "[", 
           RowBox[{"h2", "[", 
            RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}],
            "]"}], ",", "qd", ",", 
          RowBox[{
           RowBox[{"-", "\[ImaginaryI]"}], " ", "t"}], ",", 
          RowBox[{"t", "/", "\[CapitalDelta]t"}], ",", "tol"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"h2", "[", 
          RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
         "]"}], ",", "qd", ",", 
        RowBox[{
         FractionBox["1", "2"], "\[Beta]"}], ",", 
        RowBox[{"\[Beta]", "/", "\[CapitalDelta]\[Beta]"}], ",", "tol"}], 
       "]"}]}], ";", 
     RowBox[{"Abs", "[", 
      RowBox[{
       RowBox[{
        SuperscriptBox[
         RowBox[{"MPOFrobeniusNorm", "[", 
          RowBox[{"First", "/@", "\[Rho]\[Beta]"}], "]"}], 
         RowBox[{"-", "2"}]], 
        RowBox[{"MPOTraceProduct", "[", 
         RowBox[{
          RowBox[{"First", "/@", "\[Rho]\[Beta]B"}], ",", 
          RowBox[{"First", "/@", "\[Rho]\[Beta]A"}]}], "]"}]}], "-", 
       RowBox[{"\[Chi]A", "[", 
        RowBox[{
         RowBox[{"N", "[", 
          RowBox[{
           SubscriptBox["A", "op"], "[", 
           RowBox[{"0", ",", "M", ",", "L"}], "]"}], "]"}], ",", 
         RowBox[{"N", "[", 
          RowBox[{
           SubscriptBox["A", "op"], "[", 
           RowBox[{"2", ",", "M", ",", "L"}], "]"}], "]"}], ",", 
         RowBox[{"N", "[", 
          RowBox[{"HBoseHubbard", "[", 
           RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
          "]"}], ",", "\[Beta]", ",", "t"}], "]"}]}], "]"}]}]}], 
   "]"}]}]], "Input"],

Cell[BoxData["1.9839708573783616`*^-6"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"compare", " ", 
    RowBox[{"(", 
     RowBox[{"scheme", " ", "C"}], ")"}]}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"qd", "=", 
       RowBox[{"Range", "[", 
        RowBox[{"0", ",", 
         SubscriptBox["M", "val"]}], "]"}]}], ",", 
      RowBox[{"nop", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"ArrayReshape", "[", 
          RowBox[{
           RowBox[{"NumberOp", "[", 
            SubscriptBox["M", "val"], "]"}], ",", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{
              SubscriptBox["M", "val"], "+", "1"}], ",", 
             RowBox[{
              SubscriptBox["M", "val"], "+", "1"}], ",", "1", ",", "1"}], 
            "}"}]}], "]"}], ",", 
         RowBox[{"{", "0", "}"}], ",", 
         RowBox[{"{", "0", "}"}]}], "}"}]}], ",", 
      RowBox[{"tH", "=", "1"}], ",", 
      RowBox[{"U", "=", "5"}], ",", 
      RowBox[{"\[Mu]", "=", 
       FractionBox["1", "7"]}], ",", 
      RowBox[{"M", "=", 
       SubscriptBox["M", "val"]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", 
      RowBox[{"\[CapitalDelta]\[Beta]", "=", 
       RowBox[{"1", "/", "50"}]}], ",", "\[Rho]\[Beta]", ",", 
      RowBox[{"t", "=", "4"}], ",", "tA", ",", "tB", ",", 
      RowBox[{"\[CapitalDelta]t", "=", 
       RowBox[{"1", "/", "8"}]}], ",", "\[Rho]\[Beta]A", ",", 
      "\[Rho]\[Beta]B", ",", 
      RowBox[{"tol", "=", 
       SuperscriptBox["10", 
        RowBox[{"-", "12"}]]}]}], "}"}], ",", 
    RowBox[{
     RowBox[{"tA", "=", 
      FractionBox["t", "2"]}], ";", 
     RowBox[{"tB", "=", 
      FractionBox["t", "2"]}], ";", 
     RowBox[{"\[Rho]\[Beta]", "=", 
      RowBox[{"MPOStrangEvolution", "[", 
       RowBox[{
        RowBox[{"IdMPO", "[", 
         RowBox[{"M", ",", "L"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"h2", "[", 
          RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
         "]"}], ",", "qd", ",", 
        RowBox[{
         FractionBox["1", "2"], "\[Beta]"}], ",", 
        RowBox[{"\[Beta]", "/", "\[CapitalDelta]\[Beta]"}], ",", "tol"}], 
       "]"}]}], ";", 
     RowBox[{"\[Rho]\[Beta]A", "=", 
      RowBox[{"MPOSRKNb6LiouvilleEvolution", "[", 
       RowBox[{
        RowBox[{"MPOSingleSiteTopUpdate", "[", 
         RowBox[{"\[Rho]\[Beta]", ",", "3", ",", "nop"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"h2", "[", 
          RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
         "]"}], ",", "qd", ",", 
        RowBox[{"\[ImaginaryI]", " ", "tA"}], ",", 
        RowBox[{"tA", "/", "\[CapitalDelta]t"}], ",", "tol"}], "]"}]}], ";", 
     RowBox[{"\[Rho]\[Beta]B", "=", 
      RowBox[{"MPOSRKNb6LiouvilleEvolution", "[", 
       RowBox[{
        RowBox[{"MPOSingleSiteBottomUpdate", "[", 
         RowBox[{"\[Rho]\[Beta]", ",", "5", ",", "nop"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"h2", "[", 
          RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
         "]"}], ",", "qd", ",", 
        RowBox[{
         RowBox[{"-", "\[ImaginaryI]"}], " ", "tB"}], ",", 
        RowBox[{"tB", "/", "\[CapitalDelta]t"}], ",", "tol"}], "]"}]}], ";", 
     RowBox[{"Abs", "[", 
      RowBox[{
       RowBox[{
        SuperscriptBox[
         RowBox[{"MPOFrobeniusNorm", "[", 
          RowBox[{"First", "/@", "\[Rho]\[Beta]"}], "]"}], 
         RowBox[{"-", "2"}]], 
        RowBox[{"MPOTraceProduct", "[", 
         RowBox[{
          RowBox[{"First", "/@", "\[Rho]\[Beta]B"}], ",", 
          RowBox[{"First", "/@", "\[Rho]\[Beta]A"}]}], "]"}]}], "-", 
       RowBox[{"\[Chi]C", "[", 
        RowBox[{
         RowBox[{"N", "[", 
          RowBox[{
           SubscriptBox["A", "op"], "[", 
           RowBox[{"0", ",", "M", ",", "L"}], "]"}], "]"}], ",", 
         RowBox[{"N", "[", 
          RowBox[{
           SubscriptBox["A", "op"], "[", 
           RowBox[{"2", ",", "M", ",", "L"}], "]"}], "]"}], ",", 
         RowBox[{"N", "[", 
          RowBox[{"HBoseHubbard", "[", 
           RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
          "]"}], ",", "\[Beta]", ",", "t"}], "]"}]}], "]"}]}]}], 
   "]"}]}]], "Input"],

Cell[BoxData["8.71663332963517`*^-6"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"Range", "[", 
       RowBox[{"0", ",", 
        SubscriptBox["M", "val"]}], "]"}]}], ",", 
     RowBox[{"nop", "=", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"ArrayReshape", "[", 
         RowBox[{
          RowBox[{"NumberOp", "[", 
           SubscriptBox["M", "val"], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             SubscriptBox["M", "val"], "+", "1"}], ",", 
            RowBox[{
             SubscriptBox["M", "val"], "+", "1"}], ",", "1", ",", "1"}], 
           "}"}]}], "]"}], ",", 
        RowBox[{"{", "0", "}"}], ",", 
        RowBox[{"{", "0", "}"}]}], "}"}]}], ",", 
     RowBox[{"tH", "=", "1"}], ",", 
     RowBox[{"U", "=", "5"}], ",", 
     RowBox[{"\[Mu]", "=", 
      FractionBox["1", "7"]}], ",", 
     RowBox[{"M", "=", 
      SubscriptBox["M", "val"]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"\[Beta]", "=", 
      SubscriptBox["\[Beta]", "val"]}], ",", 
     RowBox[{"\[CapitalDelta]\[Beta]", "=", 
      RowBox[{"1", "/", "20"}]}], ",", "\[Rho]\[Beta]", ",", 
     RowBox[{"\[CapitalDelta]t", "=", 
      RowBox[{"1", "/", "8"}]}], ",", "\[Rho]\[Beta]A", ",", "\[Rho]\[Beta]B",
      ",", 
     RowBox[{"tol", "=", 
      SuperscriptBox["10", 
       RowBox[{"-", "8"}]]}]}], "}"}], ",", 
   RowBox[{
    RowBox[{"\[Rho]\[Beta]", "=", 
     RowBox[{"MPOStrangEvolution", "[", 
      RowBox[{
       RowBox[{"IdMPO", "[", 
        RowBox[{"M", ",", "L"}], "]"}], ",", 
       RowBox[{"N", "[", 
        RowBox[{"h2", "[", 
         RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
        "]"}], ",", "qd", ",", 
       RowBox[{
        FractionBox["1", "2"], "\[Beta]"}], ",", 
       RowBox[{"\[Beta]", "/", "\[CapitalDelta]\[Beta]"}], ",", "tol"}], 
      "]"}]}], ";", 
    RowBox[{"Show", "[", 
     RowBox[{
      RowBox[{"ListPlot", "[", 
       RowBox[{
        RowBox[{"Re", "[", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"n", " ", "\[CapitalDelta]t"}], ",", 
             RowBox[{
              RowBox[{"\[Rho]\[Beta]A", "=", 
               RowBox[{"MPOSRKNb6Evolution", "[", 
                RowBox[{
                 RowBox[{"MPOSingleSiteTopUpdate", "[", 
                  RowBox[{"\[Rho]\[Beta]", ",", "3", ",", "nop"}], "]"}], ",", 
                 RowBox[{"N", "[", 
                  RowBox[{"h2", "[", 
                   RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}],
                    "]"}], "]"}], ",", "qd", ",", 
                 RowBox[{"\[ImaginaryI]", " ", "n", " ", "\[CapitalDelta]t"}],
                  ",", "n", ",", "tol"}], "]"}]}], ";", 
              RowBox[{"\[Rho]\[Beta]B", "=", 
               RowBox[{"MPOSRKNb6Evolution", "[", 
                RowBox[{
                 RowBox[{"MPOSRKNb6Evolution", "[", 
                  RowBox[{
                   RowBox[{"MPOSingleSiteTopUpdate", "[", 
                    RowBox[{
                    RowBox[{"IdMPO", "[", 
                    RowBox[{"M", ",", "L"}], "]"}], ",", "5", ",", "nop"}], 
                    "]"}], ",", 
                   RowBox[{"N", "[", 
                    RowBox[{"h2", "[", 
                    RowBox[{
                    "tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}],
                     "]"}], ",", "qd", ",", 
                   RowBox[{
                    RowBox[{"-", "\[ImaginaryI]"}], " ", "n", " ", 
                    "\[CapitalDelta]t"}], ",", "n", ",", "tol"}], "]"}], ",", 
                 RowBox[{"N", "[", 
                  RowBox[{"h2", "[", 
                   RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}],
                    "]"}], "]"}], ",", "qd", ",", 
                 RowBox[{
                  FractionBox["1", "2"], "\[Beta]"}], ",", 
                 RowBox[{"\[Beta]", "/", "\[CapitalDelta]\[Beta]"}], ",", 
                 "tol"}], "]"}]}], ";", 
              RowBox[{
               SuperscriptBox[
                RowBox[{"MPOFrobeniusNorm", "[", 
                 RowBox[{"First", "/@", "\[Rho]\[Beta]"}], "]"}], 
                RowBox[{"-", "2"}]], 
               RowBox[{"MPOTraceProduct", "[", 
                RowBox[{
                 RowBox[{"First", "/@", "\[Rho]\[Beta]B"}], ",", 
                 RowBox[{"First", "/@", "\[Rho]\[Beta]A"}]}], "]"}]}]}]}], 
            "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"n", ",", "0", ",", "40"}], "}"}]}], "]"}], "]"}], ",", 
        RowBox[{"AxesLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
          "\"\<t\>\"", ",", 
           "\"\<Re[\!\(\*SubscriptBox[\(\[Chi]\), \(A, \
B\)]\)[\[Beta],t]]\>\""}], "}"}]}], ",", 
        RowBox[{"PlotLabel", "\[Rule]", 
         RowBox[{"\"\<\!\(\*SubscriptBox[\(t\), \(H\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", "tH", "]"}], "<>", "\"\<, U=\>\"", "<>", 
          RowBox[{"ToString", "[", "U", "]"}], "<>", "\"\<, \[Mu]=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "\[Mu]", "]"}], "]"}], "<>", 
          "\"\<, M=\>\"", "<>", 
          RowBox[{"ToString", "[", "M", "]"}], "<>", "\"\<, L=\>\"", "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, \[Beta]=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"N", "[", "\[Beta]", "]"}], "]"}], "<>", 
          "\"\< (scheme A)\>\""}]}]}], "]"}], ",", 
      RowBox[{"ListLinePlot", "[", 
       RowBox[{
        RowBox[{"Re", "[", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"t", ",", 
             RowBox[{"\[Chi]A", "[", 
              RowBox[{
               RowBox[{"N", "[", 
                RowBox[{
                 SubscriptBox["A", "op"], "[", 
                 RowBox[{"0", ",", "M", ",", "L"}], "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{
                 SubscriptBox["A", "op"], "[", 
                 RowBox[{"2", ",", "M", ",", "L"}], "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"HBoseHubbard", "[", 
                 RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], 
                 "]"}], "]"}], ",", "\[Beta]", ",", "t"}], "]"}]}], "}"}], 
           ",", 
           RowBox[{"{", 
            RowBox[{"t", ",", "0", ",", "5", ",", "0.1"}], "}"}]}], "]"}], 
         "]"}], ",", 
        RowBox[{"PlotStyle", "\[Rule]", 
         RowBox[{
          RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}]}]}], "]"}]}],
      "]"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.019444444444444445`],
      AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJxTTMoPSmViYGDQBGIQDQOPRZ/x8F+6ZQ/hHbC32b6bc9seGP+C/YXFX6fl
zofxb9hL6bydF3QKxn9g77X3jXpdzm0o/4n9LiGzX7FZd6D8F/aMWVn8iXl3
ofw39tONmvIk1e5B+R/sdxsWv7Sph/E/2c/JW1yduh7G/2K/K26myluO+1D+
N3ud5R+0rPfC+D/sfx/RbDwR+wDK/2X/SPnd0lv3YPw/9lN6vQ5wWD6E8v/Z
d37dIr4hEMZncGBykNqfrALjMzrUcHklKu6H6WdyiL13OP2BBYzP7DCHWV/p
YwDMfhaHHB+N7Up2MPeyOjzjK1jD7AfzL5vDwaQH7Lk9sPBgd9DfnfbRjBnG
53DQczWaJ7wXFn6cDv1VE2rYDsL4XA6nrsU//MkBU8/tcENj22aBGhifx+Hs
4wVGsl9hfF6HM8FS0v+CYfbzOaS8fbkppBfG53co3Ry66+5qGF/AoX69Xubm
w1B+g4ADv9S+tMAnMHlBB9cEu70VIlD/NQg6MKzPNZENg/lXyKHn9VX9DStg
8kIONjPnM/9ghYWPsEN2/MwZi+Kh/AZhB5k4kWDTJTB5EYeCkOUq107ctwcA
tMm+ng==
      "]]}, {}}, {{}, {{}, {}, 
     {RGBColor[0.922526, 0.385626, 0.209179], PointSize[
      0.016666666666666666`], AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJw10m1IU2EUAOClm5pON7dS7IMaZcUSsU0jpDgHxPwTCdkvM2Gj/ChW+AFR
Cbr6U0oGRVtJFqRJKwXTBKfmFjmGy7KmFXq3u81S2rCYNEapaC7Pe+Byudxz
nvfcc49Ce/HE2SiBQKBeuyJ3FtaMpqtdE9PQ8iASZti3XWL9OMKeR6HFpFrW
PJuGbHUkJuDgnaRefMreT8G5kVZ/0DcN65oXAjO2gQYdR/nfwL6nQ1eW44Ly
skjMwZJWs/tWopvq/dCnu3bIbHPD+7FIzINT8amzC3nygtAcUC+q9DzlL8DQ
eWNwoYMn/zeIkmOePHTzVB+CjFJJ55UCD50Xhl4wmz789JD3B5p+OFzWUi95
f+GyJW1u3u4lbwlufjGk2rf5yFuGNK74Xc0xH3krsDdQcnj2uI88AU5YdsxC
OssXYPNM+uKjr8zfgI7GWrmtykv1URjtSfUGVz10XjTq+zPj69NYf0JMqRzN
ugvse4SoMnG/hHVsXiLUtw0roz+zecagcXP+rvpCF3mx2FcZO+AIcuTFobgi
RacZ5siLw5O5s7fbBznyNuKBpre51+c48uKxYGt4Z2oO8xKw4tWbtiKDizwx
9mRo66rCLvLEOFnYXnsmn/WXiIGjcmXMWr/rXhJq9NUlilY3eRI0WqxDCT1u
8qQolp6WHLGxfCmOi069QJ7tgxS/j485nQIe/perkzFvsuZCUSbbh2Rs7hm6
kVnO9kWG2Zd8/fee8+TJcKoxwbQaYvOUYVVL4etiYPOXo+Fx3v3qBg95ctxi
eenP6mb/YxOuKPeHBh0e+AeFN26O
       "]]}}, {}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"t\"", TraditionalForm], 
    FormBox[
    "\"Re[\\!\\(\\*SubscriptBox[\\(\[Chi]\\), \\(A, B\\)]\\)[\[Beta],t]]\"", 
     TraditionalForm]},
  AxesOrigin->{0, 0.4097186708234439},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotLabel->FormBox[
   "\"\\!\\(\\*SubscriptBox[\\(t\\), \\(H\\)]\\)=1, U=5, \[Mu]=1/7, M=2, L=5, \
\[Beta]=0.6 (scheme A)\"", TraditionalForm],
  PlotRange->{{0, 5.}, {0.415980718060891, 0.5412216628098331}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"Range", "[", 
       RowBox[{"0", ",", 
        SubscriptBox["M", "val"]}], "]"}]}], ",", 
     RowBox[{"nop", "=", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"ArrayReshape", "[", 
         RowBox[{
          RowBox[{"NumberOp", "[", 
           SubscriptBox["M", "val"], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             SubscriptBox["M", "val"], "+", "1"}], ",", 
            RowBox[{
             SubscriptBox["M", "val"], "+", "1"}], ",", "1", ",", "1"}], 
           "}"}]}], "]"}], ",", 
        RowBox[{"{", "0", "}"}], ",", 
        RowBox[{"{", "0", "}"}]}], "}"}]}], ",", 
     RowBox[{"tH", "=", "1"}], ",", 
     RowBox[{"U", "=", "5"}], ",", 
     RowBox[{"\[Mu]", "=", 
      FractionBox["1", "7"]}], ",", 
     RowBox[{"M", "=", 
      SubscriptBox["M", "val"]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"\[Beta]", "=", 
      SubscriptBox["\[Beta]", "val"]}], ",", 
     RowBox[{"\[CapitalDelta]\[Beta]", "=", 
      RowBox[{"1", "/", "20"}]}], ",", "\[Rho]\[Beta]", ",", "tA", ",", "tB", 
     ",", 
     RowBox[{"\[CapitalDelta]t", "=", 
      RowBox[{"1", "/", "8"}]}], ",", "\[Rho]\[Beta]A", ",", "\[Rho]\[Beta]B",
      ",", 
     RowBox[{"tol", "=", 
      SuperscriptBox["10", 
       RowBox[{"-", "12"}]]}]}], "}"}], ",", 
   RowBox[{
    RowBox[{"\[Rho]\[Beta]", "=", 
     RowBox[{"MPOStrangEvolution", "[", 
      RowBox[{
       RowBox[{"IdMPO", "[", 
        RowBox[{"M", ",", "L"}], "]"}], ",", 
       RowBox[{"N", "[", 
        RowBox[{"h2", "[", 
         RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], "]"}], 
        "]"}], ",", "qd", ",", 
       RowBox[{
        FractionBox["1", "2"], "\[Beta]"}], ",", 
       RowBox[{"\[Beta]", "/", "\[CapitalDelta]\[Beta]"}], ",", "tol"}], 
      "]"}]}], ";", 
    RowBox[{"Show", "[", 
     RowBox[{
      RowBox[{"ListPlot", "[", 
       RowBox[{
        RowBox[{"Re", "[", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"n", " ", "\[CapitalDelta]t"}], ",", 
             RowBox[{
              RowBox[{"tA", "=", 
               FractionBox[
                RowBox[{"n", " ", "\[CapitalDelta]t"}], "2"]}], ";", 
              RowBox[{"tB", "=", 
               FractionBox[
                RowBox[{"n", " ", "\[CapitalDelta]t"}], "2"]}], ";", 
              RowBox[{"\[Rho]\[Beta]A", "=", 
               RowBox[{"MPOSRKNb6LiouvilleEvolution", "[", 
                RowBox[{
                 RowBox[{"MPOSingleSiteTopUpdate", "[", 
                  RowBox[{"\[Rho]\[Beta]", ",", "3", ",", "nop"}], "]"}], ",", 
                 RowBox[{"N", "[", 
                  RowBox[{"h2", "[", 
                   RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}],
                    "]"}], "]"}], ",", "qd", ",", 
                 RowBox[{"\[ImaginaryI]", " ", "tA"}], ",", 
                 RowBox[{"tA", "/", "\[CapitalDelta]t"}], ",", "tol"}], 
                "]"}]}], ";", 
              RowBox[{"\[Rho]\[Beta]B", "=", 
               RowBox[{"MPOSRKNb6LiouvilleEvolution", "[", 
                RowBox[{
                 RowBox[{"MPOSingleSiteBottomUpdate", "[", 
                  RowBox[{"\[Rho]\[Beta]", ",", "5", ",", "nop"}], "]"}], ",", 
                 RowBox[{"N", "[", 
                  RowBox[{"h2", "[", 
                   RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}],
                    "]"}], "]"}], ",", "qd", ",", 
                 RowBox[{
                  RowBox[{"-", "\[ImaginaryI]"}], " ", "tB"}], ",", 
                 RowBox[{"tB", "/", "\[CapitalDelta]t"}], ",", "tol"}], 
                "]"}]}], ";", 
              RowBox[{
               SuperscriptBox[
                RowBox[{"MPOFrobeniusNorm", "[", 
                 RowBox[{"First", "/@", "\[Rho]\[Beta]"}], "]"}], 
                RowBox[{"-", "2"}]], 
               RowBox[{"MPOTraceProduct", "[", 
                RowBox[{
                 RowBox[{"First", "/@", "\[Rho]\[Beta]B"}], ",", 
                 RowBox[{"First", "/@", "\[Rho]\[Beta]A"}]}], "]"}]}]}]}], 
            "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"n", ",", "0", ",", "40", ",", "2"}], "}"}]}], "]"}], 
         "]"}], ",", 
        RowBox[{"AxesLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
          "\"\<t\>\"", ",", 
           "\"\<Re[\!\(\*SubscriptBox[\(\[Chi]\), \(A, \
B\)]\)[\[Beta],t]]\>\""}], "}"}]}], ",", 
        RowBox[{"PlotLabel", "\[Rule]", 
         RowBox[{"\"\<\!\(\*SubscriptBox[\(t\), \(H\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", "tH", "]"}], "<>", "\"\<, U=\>\"", "<>", 
          RowBox[{"ToString", "[", "U", "]"}], "<>", "\"\<, \[Mu]=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "\[Mu]", "]"}], "]"}], "<>", 
          "\"\<, M=\>\"", "<>", 
          RowBox[{"ToString", "[", "M", "]"}], "<>", "\"\<, L=\>\"", "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, \[Beta]=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"N", "[", "\[Beta]", "]"}], "]"}], "<>", 
          "\"\< (scheme C)\>\""}]}]}], "]"}], ",", 
      RowBox[{"ListLinePlot", "[", 
       RowBox[{
        RowBox[{"Re", "[", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"t", ",", 
             RowBox[{"\[Chi]C", "[", 
              RowBox[{
               RowBox[{"N", "[", 
                RowBox[{
                 SubscriptBox["A", "op"], "[", 
                 RowBox[{"0", ",", "M", ",", "L"}], "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{
                 SubscriptBox["A", "op"], "[", 
                 RowBox[{"2", ",", "M", ",", "L"}], "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"HBoseHubbard", "[", 
                 RowBox[{"tH", ",", "U", ",", "\[Mu]", ",", "M", ",", "L"}], 
                 "]"}], "]"}], ",", "\[Beta]", ",", "t"}], "]"}]}], "}"}], 
           ",", 
           RowBox[{"{", 
            RowBox[{"t", ",", "0", ",", "5", ",", "0.1"}], "}"}]}], "]"}], 
         "]"}], ",", 
        RowBox[{"PlotStyle", "\[Rule]", 
         RowBox[{
          RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}]}]}], "]"}]}],
      "]"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.019444444444444445`],
      AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQMbI9y6pl25ZQ/hXbB3sdusfGchjP/A/u/z7J6Y
vNtQ/gv7pY3HP58vuAvlf7CX+dcbcb/xHpT/xf4cF1vJKu77UP4Pe2n1mwoq
8Q+g/D/2jle3yMZaPYTyGRzeO7cZrVCF8ZkcKspiaiStYOpZHFY2305vcYCZ
z+bANOnmyy19d6B8DgdPe8bsiP0w93E59F+48cCAGybP47BL6Cej53cYn8/B
0YI7fXE/zP0CDqabHHZqHoPxBR00e03yhcVh9gk5LFsjXViwGsYXdrh27X1n
WhLMfyIO938tL644fd8eAIPBYho=
      "]]}, {}}, {{}, {{}, {}, 
     {RGBColor[0.922526, 0.385626, 0.209179], PointSize[
      0.016666666666666666`], AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJw10l1IU3EUAPDppi6/Nt1qSEWJWbBs2ZYQUpwDob2EQj5ly3CkJrFCJwUl
qfVgOEKotJQsSJNWSrZ6UGdukWO5tJn2Qbvb3WYoTawmDSmTzOX5H7hcLvec
3//cc0+67uyRsmiBQKBZvSJ3FrYs48XeKTe0t0ViADI2S2wTI+x5FG6a1Mul
D92wVxOJKdh9PfkZPmDvP4N2pCMYCrhhTfNDeNo+WK/nKP8LOLZ368tzPFBR
HolZCOtKt11L8lJ9EJ7oL+8bsHthfCwS8+BKf9fTizx5ITDOaZbUDTzlL4Dl
9K3QQjdP/k8QpsTev+PlqT4Mu0okPRcO+ei8RTDDgOntNx95v8D41emxlfjJ
+w3nrGmz8w4/eX+g6WOrwrEpQN4yyLniN4bDAfL+wo457f6ZggB5Ahy3bpmB
TJYvwObpzKW7n5gfha+bamT2Kj/VR6PYp/CHVnx0nhAv9avi69JYfyJUVI5m
3wD2PSJUm7jvolo2rxhs7BxWCj+wecZi+/q8jLpCD3lxaK6MG3SGOPLEGHVq
g750mCNPjEdzZ5q7LBx561BtfJV7ZZYjLx4LNi5uVeQwLwHLnr/sLGr1kJeI
fVm62qpFD3mJOFHYVXMyj/WXhD/yZcrY1X7XvGQ80VCtTe/wkifBRqttKMHs
JU+KculxyQE7y5eiK+bYY+TZPkgx4BqbnBTw8L9ck4L57w1nilRsH1KwxTx0
VVXB9iUV95wP9Lc84slLRXdTgmklzOaZiob2whfFwOYvw7Z7B29X1/vIk2GG
9Wkwu4/9DzmuKHeGLU4f/APzsG5l
       "]]}}, {}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"t\"", TraditionalForm], 
    FormBox[
    "\"Re[\\!\\(\\*SubscriptBox[\\(\[Chi]\\), \\(A, B\\)]\\)[\[Beta],t]]\"", 
     TraditionalForm]},
  AxesOrigin->{0, 0.41001687880096904`},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotLabel->FormBox[
   "\"\\!\\(\\*SubscriptBox[\\(t\\), \\(H\\)]\\)=1, U=5, \[Mu]=1/7, M=2, L=5, \
\[Beta]=0.6 (scheme C)\"", TraditionalForm],
  PlotRange->{{0, 5.}, {0.4161291454920255, 0.5383744793131556}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1626, 920},
WindowMargins->{{198, Automatic}, {72, Automatic}},
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
Cell[1486, 35, 70, 0, 63, "Section"],
Cell[1559, 37, 123, 3, 31, "Input"],
Cell[1685, 42, 53, 1, 31, "Input"],
Cell[CellGroupData[{
Cell[1763, 47, 61, 0, 43, "Subsection"],
Cell[1827, 49, 297, 9, 31, "Input"],
Cell[2127, 60, 524, 15, 52, "Input"],
Cell[2654, 77, 185, 5, 31, "Input"],
Cell[2842, 84, 178, 6, 31, "Input"],
Cell[CellGroupData[{
Cell[3045, 94, 181, 4, 52, "Input"],
Cell[3229, 100, 821, 24, 134, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4087, 129, 182, 4, 52, "Input"],
Cell[4272, 135, 821, 24, 134, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5130, 164, 243, 6, 52, "Input"],
Cell[5376, 172, 773, 21, 116, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6186, 198, 252, 8, 31, "Input"],
Cell[6441, 208, 775, 21, 116, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7253, 234, 407, 12, 52, "Input"],
Cell[7663, 248, 733, 21, 101, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[8433, 274, 437, 12, 52, "Input"],
Cell[8873, 288, 116, 3, 31, "Output"]
}, Open  ]],
Cell[9004, 294, 3424, 91, 167, "Input"],
Cell[12431, 387, 233, 7, 52, "Input"],
Cell[12667, 396, 285, 9, 52, "Input"],
Cell[CellGroupData[{
Cell[12977, 409, 475, 13, 72, "Input"],
Cell[13455, 424, 77, 2, 31, "Output"],
Cell[13535, 428, 73, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13645, 435, 1909, 50, 72, "Input"],
Cell[15557, 487, 28219, 522, 283, "Output"]
}, Open  ]],
Cell[43791, 1012, 122, 4, 31, "Input"],
Cell[CellGroupData[{
Cell[43938, 1020, 1030, 30, 67, "Input"],
Cell[44971, 1052, 2565, 48, 176, "Output"]
}, Open  ]],
Cell[47551, 1103, 725, 22, 33, "Input"],
Cell[CellGroupData[{
Cell[48301, 1129, 201, 6, 31, "Input"],
Cell[48505, 1137, 77, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[48619, 1144, 230, 6, 52, "Input"],
Cell[48852, 1152, 1155, 28, 161, "Output"]
}, Open  ]],
Cell[50022, 1183, 330, 11, 46, "Input"],
Cell[CellGroupData[{
Cell[50377, 1198, 729, 21, 52, "Input"],
Cell[51109, 1221, 45, 0, 31, "Output"]
}, Open  ]],
Cell[51169, 1224, 231, 7, 31, "Input"],
Cell[CellGroupData[{
Cell[51425, 1235, 955, 28, 67, "Input"],
Cell[52383, 1265, 50, 0, 31, "Output"]
}, Open  ]],
Cell[52448, 1268, 1183, 36, 69, "Input"],
Cell[CellGroupData[{
Cell[53656, 1308, 1096, 31, 67, "Input"],
Cell[54755, 1341, 143, 2, 31, "Output"]
}, Open  ]],
Cell[54913, 1346, 1747, 50, 69, "Input"],
Cell[CellGroupData[{
Cell[56685, 1400, 1665, 47, 95, "Input"],
Cell[58353, 1449, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[58440, 1454, 2144, 56, 95, "Input"],
Cell[60587, 1512, 1914, 44, 267, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[62550, 1562, 36, 0, 43, "Subsection"],
Cell[62589, 1564, 2601, 74, 143, "Input"],
Cell[CellGroupData[{
Cell[65215, 1642, 1502, 39, 76, "Input"],
Cell[66720, 1683, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[66785, 1688, 488, 13, 52, "Input"],
Cell[67276, 1703, 4916, 153, 120, "Output"]
}, Open  ]],
Cell[72207, 1859, 789, 23, 52, "Input"],
Cell[CellGroupData[{
Cell[73021, 1886, 351, 10, 72, "Input"],
Cell[73375, 1898, 4723, 152, 72, "Output"],
Cell[78101, 2052, 448, 12, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[78586, 2069, 540, 16, 54, "Input"],
Cell[79129, 2087, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[79194, 2092, 225, 8, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[79444, 2104, 1479, 41, 88, "Input"],
Cell[80926, 2147, 452, 12, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[81415, 2164, 229, 6, 54, "Input"],
Cell[81647, 2172, 3052, 86, 72, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[84736, 2263, 777, 23, 54, "Input"],
Cell[85516, 2288, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[85583, 2293, 1478, 41, 88, "Input"],
Cell[87064, 2336, 452, 12, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[87553, 2353, 776, 23, 52, "Input"],
Cell[88332, 2378, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[88399, 2383, 1677, 48, 103, "Input"],
Cell[90079, 2433, 120, 3, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[90236, 2441, 3804, 95, 153, "Input"],
Cell[94043, 2538, 22104, 539, 268, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[116184, 3082, 3922, 99, 181, "Input"],
Cell[120109, 3183, 21185, 514, 279, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[141343, 3703, 248, 8, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[141616, 3715, 3657, 92, 179, "Input"],
Cell[145276, 3809, 17762, 434, 282, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[163075, 4248, 3789, 95, 159, "Input"],
Cell[166867, 4345, 15062, 362, 280, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[181966, 4712, 3931, 96, 179, "Input"],
Cell[185900, 4810, 28582, 710, 282, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[214519, 5525, 3833, 96, 159, "Input"],
Cell[218355, 5623, 23442, 577, 281, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[241846, 6206, 335, 10, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[242206, 6220, 2872, 77, 112, "Input"],
Cell[245081, 6299, 448, 12, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[245566, 6316, 4003, 100, 243, "Input"],
Cell[249572, 6418, 16544, 401, 269, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[266153, 6824, 4282, 103, 235, "Input"],
Cell[270438, 6929, 23478, 578, 282, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[293953, 7512, 1429, 40, 67, "Input"],
Cell[295385, 7554, 452, 12, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[295886, 7572, 66, 0, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[295977, 7576, 1096, 31, 67, "Input"],
Cell[297076, 7609, 143, 2, 31, "Output"]
}, Open  ]],
Cell[297234, 7614, 533, 15, 31, "Input"],
Cell[297770, 7631, 537, 15, 31, "Input"],
Cell[CellGroupData[{
Cell[298332, 7650, 4714, 125, 187, "Input"],
Cell[303049, 7777, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[303136, 7782, 4400, 116, 243, "Input"],
Cell[307539, 7900, 48, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[307624, 7905, 6707, 163, 231, "Input"],
Cell[314334, 8070, 2759, 59, 267, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[317130, 8134, 6477, 159, 279, "Input"],
Cell[323610, 8295, 2477, 54, 267, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature qwDNcO0GIM9#9Bw3nRZkMOke *)
