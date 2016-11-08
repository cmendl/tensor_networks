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
NotebookDataLength[     52441,       1395]
NotebookOptionsPosition[     50375,       1301]
NotebookOutlinePosition[     50718,       1316]
CellTagsIndexPosition[     50675,       1313]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Lanczos algorithm test", "Section"],

Cell[BoxData[
 RowBox[{
  RowBox[{"SetDirectory", "[", 
   RowBox[{"NotebookDirectory", "[", "]"}], "]"}], ";"}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["fn", "base"], "=", 
   RowBox[{
    RowBox[{"NotebookDirectory", "[", "]"}], "<>", 
    RowBox[{"FileBaseName", "[", 
     RowBox[{"NotebookFileName", "[", "]"}], "]"}]}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell["General definition of Lanczos iteration", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"LanczosStep", "[", 
   RowBox[{"A_", ",", 
    RowBox[{"{", 
     RowBox[{"_", ",", "\[Beta]_", ",", "v_", ",", "vprev_"}], "}"}]}], "]"}],
   ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"w", ",", "\[Alpha]", ",", "\[Beta]next", ",", "vnext"}], "}"}], 
    ",", 
    RowBox[{
     RowBox[{"w", "=", 
      RowBox[{"A", ".", "v"}]}], ";", 
     RowBox[{"\[Alpha]", "=", 
      RowBox[{"Re", "[", 
       RowBox[{
        RowBox[{"Conjugate", "[", "w", "]"}], ".", "v"}], "]"}]}], ";", 
     RowBox[{"w", "-=", 
      RowBox[{
       RowBox[{"\[Alpha]", " ", "v"}], "+", 
       RowBox[{"\[Beta]", " ", "vprev"}]}]}], ";", 
     RowBox[{"\[Beta]next", "=", 
      RowBox[{"Norm", "[", "w", "]"}]}], ";", 
     RowBox[{"vnext", "=", 
      RowBox[{"w", "/", "\[Beta]next"}]}], ";", 
     RowBox[{"{", 
      RowBox[{"\[Alpha]", ",", "\[Beta]next", ",", "vnext", ",", "v"}], 
      "}"}]}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"LanczosIteration", "[", 
   RowBox[{"A_", ",", "vstart_", ",", "maxiter_"}], "]"}], ":=", 
  RowBox[{"Module", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"Ldat", "=", 
      RowBox[{"NestList", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"LanczosStep", "[", 
          RowBox[{"A", ",", "#"}], "]"}], "&"}], ",", 
        RowBox[{"{", 
         RowBox[{"0", ",", "0", ",", "vstart", ",", 
          RowBox[{"ConstantArray", "[", 
           RowBox[{"0", ",", 
            RowBox[{"Length", "[", "A", "]"}]}], "]"}]}], "}"}], ",", 
        "maxiter"}], "]"}]}], "}"}], ",", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"Ldat", "\[LeftDoubleBracket]", 
       RowBox[{
        RowBox[{"2", ";;", 
         RowBox[{"-", "1"}]}], ",", "1"}], "\[RightDoubleBracket]"}], ",", 
      RowBox[{"Ldat", "\[LeftDoubleBracket]", 
       RowBox[{
        RowBox[{"2", ";;", 
         RowBox[{"-", "2"}]}], ",", "2"}], "\[RightDoubleBracket]"}], ",", 
      RowBox[{"Ldat", "\[LeftDoubleBracket]", 
       RowBox[{
        RowBox[{"1", ";;", 
         RowBox[{"-", "2"}]}], ",", "3"}], "\[RightDoubleBracket]"}]}], 
     "}"}]}], "]"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Define \[OpenCurlyQuote]A\[CloseCurlyQuote] matrix and starting \
vector", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"SeedRandom", "[", "42", "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"RandomComplex", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"-", 
       RowBox[{"(", 
        RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], ",", 
      RowBox[{"(", 
       RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], "}"}], ",", 
    RowBox[{"256", 
     RowBox[{"{", 
      RowBox[{"1", ",", "1"}], "}"}]}]}], "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["A", "mat"], "=", 
   RowBox[{
    FractionBox["1", "2"], 
    RowBox[{"(", 
     RowBox[{"%", "+", 
      RowBox[{"ConjugateTranspose", "[", "%", "]"}]}], ")"}]}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"256", ",", "256"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["A", "mat"], "\[LeftDoubleBracket]", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"1", ",", "2", ",", 
       RowBox[{"-", "1"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{"1", ",", "2", ",", 
       RowBox[{"-", "1"}]}], "}"}]}], "\[RightDoubleBracket]"}], "//", 
   "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{
       RowBox[{"-", "0.14818943256807504`"}], "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.270442570928751`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.2342745319823183`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.2650926619816667`"}], "-", 
       RowBox[{"0.11608043620986552`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.270442570928751`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.2342745319823183`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.8548184757800059`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.05935337273755259`"}], "+", 
       RowBox[{"0.259385763035644`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.2650926619816667`"}], "+", 
       RowBox[{"0.11608043620986552`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.05935337273755259`"}], "-", 
       RowBox[{"0.259385763035644`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.3464540689700004`"}], "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}]}
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

Cell[BoxData[
 RowBox[{
  RowBox[{
   SubscriptBox["\[Lambda]", "full"], "=", 
   RowBox[{"Sort", "[", 
    RowBox[{"Eigenvalues", "[", 
     SubscriptBox["A", "mat"], "]"}], "]"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListPlot", "[", 
  RowBox[{
   SubscriptBox["\[Lambda]", "full"], ",", 
   RowBox[{"AxesLabel", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{
     "\"\<i\>\"", ",", "\"\<\!\(\*SubscriptBox[\(\[Lambda]\), \(i\)]\)\>\""}],
      "}"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, 
   {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.011111111111111112`], 
    AbsoluteThickness[1.6], PointBox[CompressedData["
1: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
B13s8S9827VN
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
  PlotRange->{{0., 256.}, {-18.137864710797384`, 18.249916129299553`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.05], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell[BoxData[{
 RowBox[{"SeedRandom", "[", "43", "]"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"RandomComplex", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"-", 
       RowBox[{"(", 
        RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], ",", 
      RowBox[{"(", 
       RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}]}], "}"}], ",", 
    RowBox[{"Length", "[", 
     SubscriptBox["A", "mat"], "]"}]}], "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["v", "start"], "=", 
   RowBox[{"%", "/", 
    RowBox[{"Norm", "[", "%", "]"}]}]}], ";"}]}], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "as", " ", "reference", " ", "to", " ", "disk"}], " ",
    "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_A.dat\>\""}], ",", 
      RowBox[{"Transpose", "[", 
       SubscriptBox["A", "mat"], "]"}], ",", "\"\<Complex128\>\""}], "]"}], 
    ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_v_start.dat\>\""}], ",", 
      SubscriptBox["v", "start"], ",", "\"\<Complex128\>\""}], "]"}], 
    ";"}]}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Perform Lanczos iteration", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     SubscriptBox["\[Alpha]", "list"], ",", 
     SubscriptBox["\[Beta]", "list"], ",", 
     SubscriptBox["V", "mat"]}], "}"}], "=", 
   RowBox[{"LanczosIteration", "[", 
    RowBox[{
     SubscriptBox["A", "mat"], ",", 
     SubscriptBox["v", "start"], ",", "24"}], "]"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{"Length", "[", 
  SubscriptBox["\[Alpha]", "list"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Length", "[", 
  SubscriptBox["\[Beta]", "list"], "]"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", 
  SubscriptBox["V", "mat"], "]"}]}], "Input"],

Cell[BoxData["24"], "Output"],

Cell[BoxData["23"], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"24", ",", "256"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  SubscriptBox["\[Alpha]", "list"]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "0.2223593271832818`"}], ",", "0.1860427000430147`", ",", 
   RowBox[{"-", "1.2568902530639077`"}], ",", 
   RowBox[{"-", "0.4448767409393225`"}], ",", "0.9130332826443383`", ",", 
   "0.730825775973118`", ",", "0.2743939373070115`", ",", 
   RowBox[{"-", "0.8991815267526495`"}], ",", 
   RowBox[{"-", "0.15934936843237213`"}], ",", 
   RowBox[{"-", "0.8553703669412773`"}], ",", "1.3206668002724422`", ",", 
   "0.24015869299959214`", ",", "0.5872636817854118`", ",", 
   RowBox[{"-", "0.38853265205288434`"}], ",", "0.0767869072182431`", ",", 
   "0.39549965909703805`", ",", "0.21092257490616417`", ",", 
   RowBox[{"-", "0.1444701504707583`"}], ",", "0.04142635990430896`", ",", 
   "0.34770139251572774`", ",", 
   RowBox[{"-", "0.021767657957094178`"}], ",", "0.33221864106673504`", ",", 
   RowBox[{"-", "0.6208991046126491`"}], ",", 
   RowBox[{"-", "1.446347012492789`"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  SubscriptBox["\[Beta]", "list"]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "9.338545158736382`", ",", "9.378231120908168`", ",", "9.211512289211317`", 
   ",", "9.028567218701149`", ",", "8.796461623234382`", ",", 
   "8.924711785838662`", ",", "9.517450325594277`", ",", "8.983510456785645`",
    ",", "9.38278253302513`", ",", "9.594578631857443`", ",", 
   "9.299946164055964`", ",", "8.761711856762076`", ",", "9.260582943673546`",
    ",", "8.845755100428496`", ",", "9.21209880097385`", ",", 
   "8.927452426024992`", ",", "8.32567859308415`", ",", "9.104278568176921`", 
   ",", "8.861589700676783`", ",", "8.796884228535616`", ",", 
   "8.88747194445626`", ",", "8.63461475876748`", ",", "8.9501736169783`"}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", "orthogonal"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["V", "mat"], ".", 
     RowBox[{"ConjugateTranspose", "[", 
      SubscriptBox["V", "mat"], "]"}]}], "-", 
    RowBox[{"IdentityMatrix", "[", 
     RowBox[{"Length", "[", 
      SubscriptBox["V", "mat"], "]"}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["1.605387633707367`*^-14"], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Postprocessing to obtain approximate eigenvectors", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["T", "mat"], "=", 
   RowBox[{
    RowBox[{"DiagonalMatrix", "[", 
     SubscriptBox["\[Alpha]", "list"], "]"}], "+", 
    RowBox[{"DiagonalMatrix", "[", 
     RowBox[{
      SubscriptBox["\[Beta]", "list"], ",", "1"}], "]"}], "+", 
    RowBox[{"DiagonalMatrix", "[", 
     RowBox[{
      SubscriptBox["\[Beta]", "list"], ",", 
      RowBox[{"-", "1"}]}], "]"}]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"24", ",", "24"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListPlot", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"n", ",", 
         RowBox[{"Min", "[", 
          RowBox[{"Eigenvalues", "[", 
           RowBox[{
            SubscriptBox["T", "mat"], "\[LeftDoubleBracket]", 
            RowBox[{
             RowBox[{"1", ";;", "n"}], ",", 
             RowBox[{"1", ";;", "n"}]}], "\[RightDoubleBracket]"}], "]"}], 
          "]"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"n", ",", 
         RowBox[{"Length", "[", 
          SubscriptBox["T", "mat"], "]"}]}], "}"}]}], "]"}], ",", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"n", ",", 
         RowBox[{"RankedMin", "[", 
          RowBox[{
           RowBox[{"Eigenvalues", "[", 
            RowBox[{
             SubscriptBox["T", "mat"], "\[LeftDoubleBracket]", 
             RowBox[{
              RowBox[{"1", ";;", "n"}], ",", 
              RowBox[{"1", ";;", "n"}]}], "\[RightDoubleBracket]"}], "]"}], 
           ",", "2"}], "]"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"n", ",", "2", ",", 
         RowBox[{"Length", "[", 
          SubscriptBox["T", "mat"], "]"}]}], "}"}]}], "]"}]}], "}"}], ",", 
   RowBox[{"AxesLabel", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{"\"\<iter\>\"", ",", "\"\<\[Lambda]\>\""}], "}"}]}], ",", 
   RowBox[{"PlotLegends", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{
     "\"\<\!\(\*SubscriptBox[\(\[Lambda]\), \(1\)]\)\>\"", ",", 
      "\"\<\!\(\*SubscriptBox[\(\[Lambda]\), \(2\)]\)\>\""}], "}"}]}]}], 
  "]"}]], "Input"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{}, {
      Hue[0.67, 0.6, 0.6], 
      Directive[
       PointSize[0.019444444444444445`], 
       RGBColor[0.368417, 0.506779, 0.709798], 
       AbsoluteThickness[1.6]], 
      PointBox[CompressedData["
1:eJxTTMoPSmViYGCQAGIQDQEf7DdaS1u7lp3ZDxVwOHwoOO/YdqUDEC6Hw4Lj
gYpGAtpQvoDD32+7eqI19aF8EQeZhRnx5nUGUL6EQ9yky/M/P4TxZRwuWElu
3ihiCOUrOHTbvD3lawfjKznwT4s8ezgFxldxWHRAymJfP4yv5nDtTPRy7f0w
vobD4rZNt82fwvhaDiF56ck5v2F8HYewVSF3bnEaQfl6DnfLw8PkhWF8AwfX
7wtrqyRhfEOHlMtL//XKwvhGDrFsETvWyMP4xg5bXs94808BxjdxWGu1/u0Z
RRjf1GHF1ehFbkowvpmDc4Ttvn4439zhNev9ol1wvoXDi76b+reBfABgHWyd

       "]], 
      Hue[0.9060679774997897, 0.6, 0.6], 
      Directive[
       PointSize[0.019444444444444445`], 
       RGBColor[0.880722, 0.611041, 0.142051], 
       AbsoluteThickness[1.6]], 
      PointBox[CompressedData["
1:eJxTTMoPSmViYGAQB2IQDQUOMmwdYXpLlRwgXA6HjMbJO+p7n++H8AUcCk4l
W/uHSRyA8EUcDiwzOFZhoATlSzhcjbzAksijBuXLOPRcUWNulNaE8hUc3r/v
7LNy04HylRz0hF4Hvu3Sg/JVHG5VSvbNYTeA8tUcYj+ntf2qhfE1HASv5ih4
7YLxtRycaienfbsO4+s43FHnvNP+BsbXc9BZ7uj0/A+Mb+Cgv3HbzkAeQyjf
0OEHh3rdeikY38jBQ3yNcZkqjG/sYJ7eeURNH8Y3cYidkbnppjmMb+pQkDzx
ark9jG/m8KnhyntnNxjf3OGH4sWLuj4wvoVDtwtTd3iw4QEA9lNhHg==
       "]]}, {}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.02]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0, 24.}, {-18.136157026877214`, 0}}, DisplayFunction -> 
     Identity, AspectRatio -> NCache[GoldenRatio^(-1), 0.6180339887498948], 
     Axes -> {True, True}, AxesLabel -> {
       FormBox["\"iter\"", TraditionalForm], 
       FormBox["\"\[Lambda]\"", TraditionalForm]}, AxesOrigin -> {0, 0}, 
     DisplayFunction :> Identity, Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], Method -> {}, 
     PlotRange -> {{0, 24.}, {-18.136157026877214`, 0}}, PlotRangeClipping -> 
     True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.02]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{
      "\"\\!\\(\\*SubscriptBox[\\(\[Lambda]\\), \\(1\\)]\\)\"", 
       "\"\\!\\(\\*SubscriptBox[\\(\[Lambda]\\), \\(2\\)]\\)\""}, 
      "PointLegend", DisplayFunction -> (FormBox[
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
}, Open  ]],

Cell[BoxData[{
 RowBox[{
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     SubscriptBox["\[Lambda]", "sub"], ",", 
     SubscriptBox["U", "sub"]}], "}"}], "=", 
   RowBox[{"Transpose", "[", 
    RowBox[{"SortBy", "[", 
     RowBox[{
      RowBox[{"Transpose", "[", 
       RowBox[{"Eigensystem", "[", 
        SubscriptBox["T", "mat"], "]"}], "]"}], ",", "First"}], "]"}], 
    "]"}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["U", "sub"], "=", 
   RowBox[{"Transpose", "[", 
    SubscriptBox["U", "sub"], "]"}]}], ";"}]}], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Min", "[", 
  SubscriptBox["\[Lambda]", "sub"], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"-", "18.136157026877214`"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListPlot", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     SubscriptBox["\[Lambda]", "sub"], ",", 
     RowBox[{
      SubscriptBox["\[Lambda]", "full"], "\[LeftDoubleBracket]", 
      RowBox[{"1", ";;", "40"}], "\[RightDoubleBracket]"}]}], "}"}], ",", 
   RowBox[{"AxesLabel", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{
     "\"\<i\>\"", ",", "\"\<\!\(\*SubscriptBox[\(\[Lambda]\), \(i\)]\)\>\""}],
      "}"}]}], ",", 
   RowBox[{"PlotLegends", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{"\"\<Lanczos\>\"", ",", "\"\<full\>\""}], "}"}]}]}], 
  "]"}]], "Input"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{}, {
      Hue[0.67, 0.6, 0.6], 
      Directive[
       PointSize[0.016666666666666666`], 
       RGBColor[0.368417, 0.506779, 0.709798], 
       AbsoluteThickness[1.6]], 
      PointBox[CompressedData["
1:eJxTTMoPSmViYGCQAGIQDQEf7F/03dS/rWR0ACrg0OHC1B0ebAjlczjY5M7i
4b1jAOULOMwSCS1axwPjizjYHPWKK1XRhfIlHB5kqv/l79GC8mUcAvxOu8pc
U4PyFRzKAqfoXqxThvKVHP5M2O4XkCEP5as4aJie1Vl0RAzKV3O4cFJB/NcX
bihfw8FggUdUZevn/RC+loPAPad9/Lmf7CF8HYeIg/Pr1sRxOkD4eg497y/q
bq8Wg/INHI4V5fdOM5aD8g0dXs3s1/yZowzlGzl80Tg9V4pPHco3djAtXaOn
6q8F5Zs42Nxbuq5GWxfKN3W4/af5Rd9EfSjfzOHVvlWiW+4bQPnmDpPqZjds
KTGE8i0cMgW4efbZGzkAAAkBYwU=
       "]], 
      Hue[0.9060679774997897, 0.6, 0.6], 
      Directive[
       PointSize[0.016666666666666666`], 
       RGBColor[0.880722, 0.611041, 0.142051], 
       AbsoluteThickness[1.6]], 
      PointBox[CompressedData["
1:eJxTTMoPSmViYGDQAGIQDQEf7Derckh5KxsdgAo4eP0PY529xRDK53B4vNr+
yV4XGF/A4Qrf9LgF/DC+iAODgdCiut0GUL6Ew49lR604F8L4Mg6civsua1fD
+AoObXGsHftlYHwlB23vLbbtF/ShfBUHleVC8fLv9KB8NYfPu9QqP2+D8TUc
ZqTPfa5iBuNrOWybc3c9/2ldKF/HYV1fusrWSTC+nsO7+W81VPVhfAMH532f
7mxt0YHyDR2ucZn2x/vB+EYOihZm/yLeakP5xg4HRPNFnm6H8U0c5N2dPQyC
YXxThxdJuzSyv2tB+WYOFk1+s6N3w/jmDoe2Thfs9YTxLRwaztpJdQrD+JYO
+1dP+qm5TBPKt3LYKrF097NoGN/aIeJRZOl0aRjfxkH/qmt18yUNKN/WYWmV
MjtbN4xv5/CQq+OoTgCMb+/Ak5e47N5fdSjfwUHBYaNQ5Tkov8HB4ePG9jOq
yTB5R4cuic0+a+Vg8o4OWvFiH8quqkHlnRx4bFQWvumD8hucHIzMr8lvCobJ
OztwBTxg3HlBFSrv7CCfe+5axRQon8HFgVX92aYoC9UDAFLGq4A=
       "]]}, {}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0., 40.}, {-18.137864710797384`, 18.248993637753674`}}, 
     DisplayFunction -> Identity, AspectRatio -> 
     NCache[GoldenRatio^(-1), 0.6180339887498948], Axes -> {True, True}, 
     AxesLabel -> {
       FormBox["\"i\"", TraditionalForm], 
       FormBox[
       "\"\\!\\(\\*SubscriptBox[\\(\[Lambda]\\), \\(i\\)]\\)\"", 
        TraditionalForm]}, AxesOrigin -> {0, 0}, DisplayFunction :> Identity, 
     Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], Method -> {}, 
     PlotRange -> {{0., 40.}, {-18.137864710797384`, 18.248993637753674`}}, 
     PlotRangeClipping -> True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{"\"Lanczos\"", "\"full\""}, "PointLegend", 
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
                    PointSize[0.6], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6]], {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.6], 
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
                    PointSize[0.6], 
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    AbsoluteThickness[1.6]], {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.6], 
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
                   RowBox[{"PointSize", "[", "0.016666666666666666`", "]"}], 
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
                   RowBox[{"PointSize", "[", "0.016666666666666666`", "]"}], 
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

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", "orthogonal"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["U", "sub"], ".", 
     RowBox[{"ConjugateTranspose", "[", 
      SubscriptBox["U", "sub"], "]"}]}], "-", 
    RowBox[{"IdentityMatrix", "[", 
     RowBox[{"Length", "[", 
      SubscriptBox["U", "sub"], "]"}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["1.0430990284422362`*^-14"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", "eigensystem"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["T", "mat"], ".", 
     SubscriptBox["U", "sub"]}], "-", 
    RowBox[{
     SubscriptBox["U", "sub"], ".", 
     RowBox[{"DiagonalMatrix", "[", 
      SubscriptBox["\[Lambda]", "sub"], "]"}]}]}], "]"}]}]], "Input"],

Cell[BoxData["8.568408454436121`*^-14"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"compute", " ", "Ritz", " ", "eigenvectors"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["U", "full"], "=", 
     RowBox[{
      RowBox[{"Transpose", "[", 
       SubscriptBox["V", "mat"], "]"}], ".", 
      SubscriptBox["U", "sub"]}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"256", ",", "24"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "check", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Norm", "[", 
   RowBox[{
    RowBox[{
     RowBox[{"ConjugateTranspose", "[", 
      SubscriptBox["U", "full"], "]"}], ".", 
     SubscriptBox["A", "mat"], ".", 
     SubscriptBox["U", "full"]}], "-", 
    RowBox[{"DiagonalMatrix", "[", 
     SubscriptBox["\[Lambda]", "sub"], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["3.281333536623079`*^-13"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"residual", " ", "of", " ", "Ritz", " ", "eigenvectors"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["R", "mat"], "=", 
     RowBox[{
      RowBox[{
       SubscriptBox["A", "mat"], ".", 
       SubscriptBox["U", "full"]}], "-", 
      RowBox[{
       SubscriptBox["U", "full"], ".", 
       RowBox[{"DiagonalMatrix", "[", 
        SubscriptBox["\[Lambda]", "sub"], "]"}]}]}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"256", ",", "24"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Norm", "/@", 
  RowBox[{"Transpose", "[", 
   SubscriptBox["R", "mat"], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
  "0.06695482792917125`", ",", "0.5664874258983509`", ",", 
   "0.9114797719989239`", ",", "1.539532111790361`", ",", 
   "1.9552483654342294`", ",", "2.167291983877161`", ",", 
   "2.127473775981354`", ",", "2.216749767120352`", ",", 
   "2.7144793444005484`", ",", "2.315803382691647`", ",", 
   "2.2191847624693875`", ",", "2.7898746957446194`", ",", 
   "2.448476163073421`", ",", "2.5857620509265438`", ",", 
   "2.4051362648072683`", ",", "2.5933927104956997`", ",", 
   "1.8850716050781688`", ",", "1.7863034904985882`", ",", 
   "1.7720960581020175`", ",", "1.0218949194747455`", ",", 
   "1.0454940655453653`", ",", "0.7252404264813701`", ",", 
   "0.36193047084962304`", ",", "0.07426332153645265`"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "as", " ", "reference", " ", "to", " ", "disk"}], " ",
    "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_lambda_min.dat\>\""}], ",", 
      RowBox[{"Min", "[", 
       SubscriptBox["\[Lambda]", "sub"], "]"}], ",", "\"\<Real64\>\""}], 
     "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_v_min.dat\>\""}], ",", 
      RowBox[{"-", 
       RowBox[{
        SubscriptBox["U", "full"], "\[LeftDoubleBracket]", 
        RowBox[{";;", ",", "1"}], "\[RightDoubleBracket]"}]}], ",", 
      "\"\<Complex128\>\""}], "]"}], ";"}]}]}]], "Input"]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1758, 823},
WindowMargins->{{Automatic, 136}, {65, Automatic}},
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
Cell[1486, 35, 41, 0, 63, "Section"],
Cell[1530, 37, 123, 3, 31, "Input"],
Cell[1656, 42, 242, 7, 31, "Input"],
Cell[CellGroupData[{
Cell[1923, 53, 61, 0, 43, "Subsection"],
Cell[1987, 55, 974, 29, 31, "Input"],
Cell[2964, 86, 1189, 33, 31, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4190, 124, 94, 1, 43, "Subsection"],
Cell[CellGroupData[{
Cell[4309, 129, 761, 24, 108, "Input"],
Cell[5073, 155, 77, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5187, 162, 436, 13, 52, "Input"],
Cell[5626, 177, 1695, 42, 74, "Output"]
}, Open  ]],
Cell[7336, 222, 200, 6, 31, "Input"],
Cell[CellGroupData[{
Cell[7561, 232, 276, 8, 31, "Input"],
Cell[7840, 242, 4459, 86, 246, "Output"]
}, Open  ]],
Cell[12314, 331, 598, 18, 72, "Input"],
Cell[12915, 351, 690, 20, 72, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[13642, 376, 47, 0, 43, "Subsection"],
Cell[13692, 378, 358, 11, 31, "Input"],
Cell[CellGroupData[{
Cell[14075, 393, 272, 6, 72, "Input"],
Cell[14350, 401, 29, 0, 31, "Output"],
Cell[14382, 403, 29, 0, 31, "Output"],
Cell[14414, 405, 76, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14527, 412, 140, 3, 52, "Input"],
Cell[14670, 417, 958, 17, 52, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15665, 439, 139, 3, 52, "Input"],
Cell[15807, 444, 705, 12, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[16549, 461, 437, 13, 52, "Input"],
Cell[16989, 476, 50, 0, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[17088, 482, 71, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[17184, 486, 500, 14, 52, "Input"],
Cell[17687, 502, 75, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[17799, 509, 1628, 46, 52, "Input"],
Cell[19430, 557, 12370, 262, 235, "Output"]
}, Open  ]],
Cell[31815, 822, 556, 18, 52, "Input"],
Cell[CellGroupData[{
Cell[32396, 844, 88, 2, 31, "Input"],
Cell[32487, 848, 63, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[32587, 854, 591, 17, 31, "Input"],
Cell[33181, 873, 12633, 267, 248, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[45851, 1145, 437, 13, 52, "Input"],
Cell[46291, 1160, 51, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[46379, 1165, 414, 13, 52, "Input"],
Cell[46796, 1180, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[46883, 1185, 433, 13, 72, "Input"],
Cell[47319, 1200, 76, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[47432, 1207, 406, 11, 52, "Input"],
Cell[47841, 1220, 50, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[47928, 1225, 579, 18, 72, "Input"],
Cell[48510, 1245, 76, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[48623, 1252, 114, 3, 31, "Input"],
Cell[48740, 1257, 769, 14, 52, "Output"]
}, Open  ]],
Cell[49524, 1274, 823, 23, 72, "Input"]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature OvDVJ6NzZuZYSCwTV3sqPFpl *)
