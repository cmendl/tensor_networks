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
NotebookDataLength[     22724,        540]
NotebookOptionsPosition[     22604,        513]
NotebookOutlinePosition[     22947,        528]
CellTagsIndexPosition[     22904,        525]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Energy minimization and ground state computation", "Section"],

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

Cell["Construct full Heisenberg Hamiltonian", "Subsection"],

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

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "construct", " ", "Heisenberg", " ", "Hamiltonian", " ", "with", " ", 
    "open", " ", "boundary", " ", "conditions"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"HeisenbergHamiltonian", "[", 
    RowBox[{"J_List", ",", "h_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
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
              RowBox[{"-", "1"}]}], "}"}]}], "}"}]}], "}"}]}]}], "}"}], ",", 
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
           "S", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], ",", 
           RowBox[{
           "S", "\[LeftDoubleBracket]", "i", "\[RightDoubleBracket]"}], ",", 
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
           "S", "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}], ",", 
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox["2", 
             RowBox[{"L", "-", "j"}]], "]"}]}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"j", ",", "1", ",", "L"}], "}"}]}], "]"}]}]}]}], 
    "]"}]}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Diagonalization", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["L", "val"], "=", "10"}], ";"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     SubscriptBox["\[Lambda]", "val"], ",", 
     SubscriptBox["\[Psi]", "val"]}], "}"}], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", "HH", ",", "\[Lambda]", ",", 
       "\[Psi]", ",", "p"}], "}"}], ",", 
     RowBox[{
      RowBox[{"HH", "=", 
       RowBox[{"N", "[", 
        RowBox[{"Normal", "[", 
         RowBox[{"HeisenbergHamiltonian", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"4", "/", "5"}], ",", 
             RowBox[{"4", "/", "5"}], ",", 
             RowBox[{"8", "/", "3"}]}], "}"}], ",", 
           RowBox[{
            RowBox[{"-", "2"}], "/", "7"}], ",", "L"}], "]"}], "]"}], "]"}]}],
       ";", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"\[Lambda]", ",", "\[Psi]"}], "}"}], "=", 
       RowBox[{"Eigensystem", "[", "HH", "]"}]}], ";", 
      RowBox[{"p", "=", 
       RowBox[{"Ordering", "[", "\[Lambda]", "]"}]}], ";", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{
        "\[Lambda]", "\[LeftDoubleBracket]", "p", "\[RightDoubleBracket]"}], 
        ",", 
        RowBox[{
        "\[Psi]", "\[LeftDoubleBracket]", "p", "\[RightDoubleBracket]"}]}], 
       "}"}]}]}], "]"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Length", "[", 
  SubscriptBox["\[Lambda]", "val"], "]"}]], "Input"],

Cell[BoxData["1024"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListPlot", "[", 
  RowBox[{
   SubscriptBox["\[Lambda]", "val"], ",", 
   RowBox[{"AxesLabel", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{
     "\"\<i\>\"", ",", "\"\<\!\(\*SubscriptBox[\(\[Lambda]\), \(i\)]\)\>\""}],
      "}"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, 
   {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.008333333333333333], 
    AbsoluteThickness[1.6], PointBox[CompressedData["
1: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
jcoezP0tGFjqaXTiA4vub8HDXZk50ldklgt2TTNbWlpCZrugr0w1IOw8GS54
PvzHTqVdZI4LtE0KxuqKyDwXPFnXPPFBHFnigqKOvHnsMLLUBdF++nt1HJn7
Ljjj/+JMxRrmvite6LPLJyxk7ruifEXBRjc95r4rvgyNUrnUj7nvCpn5o/Hx
z/9c7rzvitv3toUfukyWuELZqsuX3GKy1BV643SadkeS5a646H/A3ceGzHKD
ZJer/t6lZLYb6g731l40kAw31B443ut84e9Oc9yQebxReO0wmeeGXFc4XGIs
cYPZtFXzJwaSpW6I7zN8/QTGcjcUrYmx2DSKzHKHxtgRjm6XftF9d4SveNE7
bTkZ7hju5mvUfzGZ446k/MK2tyDz3FGZOeLz7ZlkiTt8H7rvqhtDlrpjWo8J
GyUjyXJ3zC9c7r9HlczaCt0lG8zOfP9J97dCI+bBzKL7ZGyFWUzUygVCMmcr
Wk89XD/cm8zbiuvqweefTiNLtuK866c7I8aTpVsxdPGwouPDyfKtmFo77XZm
dzLLA58b+gT6/PlB9z2wYUjXxb73yfCA0pPsP1sZczzw5PjtL5LbZJ4Hhp5g
x+w8SpZ44N3qj5f108lSD2yvLdi3fRFZ7oFzwUWLP40nszzx1U69+5/XHXTf
E19Mqu2qK8nwhNp1pfbEKDLHE6NaG/dsDiHzPPFTzlkUOZss8cSQuuHfTg0k
Sz0xrmpB17+We6I62lipre073ffCO+kO3qh6MtsLDvwbacMYwwutbwM35uwn
c7zgPnVdttSezPOCV7GX276VZIkXpq5qKv2PsdQL2dtLDJ0ftdN9L9R9LhhY
dp7M8obTAc3eH46Q2d4I37KQr7eLDG88Uv8scbIkc7zRcq1wu40pmeeNyRd/
rWjXJ0u8EXD6fgNXnSz1xuC0CfZeJd/ovjeO2lUufltAZnHhwp/9Lk1E1uBi
5DqJbs8EMpuLwWuLF32YTzbiovSn8coWxuDilda2UXnDyJZcZPbY5dGgSeZw
sfPooxtvu5C5XEwPrxhk3dJG35+LLS9ORka9I6dyIdtWqju4lCzhIqHgbMPn
i+Q8LpJOnWpyLiZLubCZ0LF/fRZZxoXtlx723SPJci7WfviT+SeC3MrFiJtb
vcfPI7N8MLE7a8KrmWQNH+B71S4HQzJbMQ9M1e8q/kr5fbBW+9r8yXwyfOD5
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
     "]]}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"i\"", TraditionalForm], 
    FormBox[
    "\"\\!\\(\\*SubscriptBox[\\(\[Lambda]\\), \\(i\\)]\\)\"", 
     TraditionalForm]},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotRange->{{0., 1024.}, {-6.667640181059419, 7.428571428571429}},
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
 RowBox[{
  RowBox[{"Min", "[", 
   SubscriptBox["\[Lambda]", "val"], "]"}], "//", "FullForm"}]], "Input"],

Cell[BoxData[
 TagBox[
  StyleBox[
   RowBox[{"-", "6.667640181059419`"}],
   ShowSpecialCharacters->False,
   ShowStringCharacters->True,
   NumberMarks->True],
  FullForm]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "wavefunction", " ", "to", " ", "disk"}], " ", "*)"}],
   "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], "}"}], ",", 
     RowBox[{"Export", "[", 
      RowBox[{
       RowBox[{
        SubscriptBox["fn", "base"], "<>", "\"\<_psi.dat\>\""}], ",", 
       RowBox[{"Transpose", "[", 
        RowBox[{
         RowBox[{"ArrayReshape", "[", 
          RowBox[{
           RowBox[{
            RowBox[{"-", 
             RowBox[{
              SubscriptBox["\[Psi]", "val"], "\[LeftDoubleBracket]", "1", 
              "\[RightDoubleBracket]"}]}], "+", 
            RowBox[{"0.", "\[ImaginaryI]"}]}], ",", 
           RowBox[{"ConstantArray", "[", 
            RowBox[{"2", ",", "L"}], "]"}]}], "]"}], ",", 
         RowBox[{"Reverse", "[", 
          RowBox[{"Range", "[", "L", "]"}], "]"}]}], "]"}], ",", 
       "\"\<Complex128\>\""}], "]"}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1349, 987},
WindowMargins->{{297, Automatic}, {Automatic, 50}},
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
Cell[1556, 37, 123, 3, 31, "Input"],
Cell[1682, 42, 174, 5, 31, "Input"],
Cell[CellGroupData[{
Cell[1881, 51, 59, 0, 43, "Subsection"],
Cell[1943, 53, 297, 9, 31, "Input"],
Cell[2243, 64, 2742, 75, 116, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5022, 144, 37, 0, 43, "Subsection"],
Cell[5062, 146, 93, 3, 31, "Input"],
Cell[5158, 151, 1355, 41, 92, "Input"],
Cell[CellGroupData[{
Cell[6538, 196, 91, 2, 31, "Input"],
Cell[6632, 200, 31, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6700, 205, 275, 8, 31, "Input"],
Cell[6978, 215, 14194, 245, 245, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[21209, 465, 120, 3, 31, "Input"],
Cell[21332, 470, 185, 7, 45, "Output"]
}, Open  ]],
Cell[21532, 480, 1044, 29, 52, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature ju0i@nG8xOt7#Dg1e176FGfL *)
