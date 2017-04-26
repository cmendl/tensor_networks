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
NotebookDataLength[    317837,       8083]
NotebookOptionsPosition[    313665,       7922]
NotebookOutlinePosition[    314008,       7937]
CellTagsIndexPosition[    313965,       7934]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Matrix product operators for a Ising-type model", "Section"],

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

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "construct", " ", "Ising", " ", "Hamiltonian", " ", "with", " ", 
    "longitudinal", " ", "field", " ", 
    RowBox[{"(", 
     RowBox[{"open", " ", "boundary", " ", "conditions"}], ")"}]}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"HIsing", "[", 
    RowBox[{"J_", ",", "h_", ",", "g_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"\[Sigma]", "=", 
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
             RowBox[{"-", "1"}]}], "}"}]}], "}"}]}], "}"}]}], "}"}], ",", 
     RowBox[{
      RowBox[{"Sum", "[", 
       RowBox[{
        RowBox[{"J", " ", 
         RowBox[{"KroneckerProduct", "[", 
          RowBox[{
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox["2", 
             RowBox[{"l", "-", "1"}]], "]"}], ",", 
           RowBox[{
           "\[Sigma]", "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}],
            ",", 
           RowBox[{
           "\[Sigma]", "\[LeftDoubleBracket]", "3", "\[RightDoubleBracket]"}],
            ",", 
           RowBox[{"SparseIdentityMatrix", "[", 
            SuperscriptBox["2", 
             RowBox[{"L", "-", "l", "-", "1"}]], "]"}]}], "]"}]}], ",", 
        RowBox[{"{", 
         RowBox[{"l", ",", "1", ",", 
          RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], "+", 
      RowBox[{"Sum", "[", 
       RowBox[{
        RowBox[{"KroneckerProduct", "[", 
         RowBox[{
          RowBox[{"SparseIdentityMatrix", "[", 
           SuperscriptBox["2", 
            RowBox[{"l", "-", "1"}]], "]"}], ",", 
          RowBox[{
           RowBox[{"g", " ", 
            RowBox[{
            "\[Sigma]", "\[LeftDoubleBracket]", "1", 
             "\[RightDoubleBracket]"}]}], "+", 
           RowBox[{"h", " ", 
            RowBox[{
            "\[Sigma]", "\[LeftDoubleBracket]", "3", 
             "\[RightDoubleBracket]"}]}]}], ",", 
          RowBox[{"SparseIdentityMatrix", "[", 
           SuperscriptBox["2", 
            RowBox[{"L", "-", "l"}]], "]"}]}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"l", ",", "1", ",", "L"}], "}"}]}], "]"}]}]}], 
    "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"number", " ", "of", " ", "lattice", " ", "sites"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["L", "val"], "=", "5"}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{"HIsing", "[", 
   RowBox[{"1", ",", 
    FractionBox["1", "2"], ",", 
    RowBox[{"-", "1"}], ",", 
    SubscriptBox["L", "val"]}], "]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"32", ",", "32"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Sort", "[", 
  RowBox[{"N", "[", 
   RowBox[{"Eigenvalues", "[", 
    RowBox[{"HIsing", "[", 
     RowBox[{"1", ",", 
      FractionBox["1", "2"], ",", 
      RowBox[{"-", "1"}], ",", 
      SubscriptBox["L", "val"]}], "]"}], "]"}], "]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "6.249690849453475`"}], ",", 
   RowBox[{"-", "5.506012145494968`"}], ",", 
   RowBox[{"-", "4.510617817195866`"}], ",", 
   RowBox[{"-", "3.896649998686851`"}], ",", 
   RowBox[{"-", "3.6281297504096974`"}], ",", 
   RowBox[{"-", "3.219817093176536`"}], ",", 
   RowBox[{"-", "2.608280434376132`"}], ",", 
   RowBox[{"-", "2.4422515763494457`"}], ",", 
   RowBox[{"-", "2.1559411511357385`"}], ",", 
   RowBox[{"-", "1.7956077660337582`"}], ",", 
   RowBox[{"-", "1.654508519320202`"}], ",", 
   RowBox[{"-", "1.3416441153241758`"}], ",", 
   RowBox[{"-", "1.282813742112429`"}], ",", 
   RowBox[{"-", "0.8106644061812787`"}], ",", 
   RowBox[{"-", "0.33285851770633507`"}], ",", 
   RowBox[{"-", "0.28472462876976373`"}], ",", "0.031328684403757176`", ",", 
   "0.1526768168295081`", ",", "0.7557350879589811`", ",", 
   "1.0109063362088961`", ",", "1.0829087771638024`", ",", 
   "1.677439331509757`", ",", "1.7135324396570744`", ",", 
   "1.9088831859675992`", ",", "2.342293427144311`", ",", "2.90457225127669`",
    ",", "3.0597981161671477`", ",", "3.553003621080191`", ",", 
   "4.061903540030044`", ",", "4.788349594030948`", ",", 
   "4.9205100637459775`", ",", "7.756371238551968`"}], "}"}]], "Output"]
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
       RowBox[{"J", "=", "1"}], ",", 
       RowBox[{"h", "=", 
        FractionBox["1", "2"]}], ",", 
       RowBox[{"g", "=", 
        RowBox[{"-", "1"}]}], ",", 
       RowBox[{"L", "=", "3"}], ",", 
       RowBox[{"\[Beta]", "=", 
        SubscriptBox["\[Beta]", "val"]}]}], "}"}], ",", 
     RowBox[{"MatrixExp", "[", 
      RowBox[{
       RowBox[{"-", 
        FractionBox["\[Beta]", "2"]}], 
       RowBox[{"N", "[", 
        RowBox[{"HIsing", "[", 
         RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}]}], "]"}]}],
     "]"}], "//", "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"0.42605602475963916`", "0.19478713891940339`", "0.2716151222035078`", 
      "0.07945194294440422`", "0.1947871389194033`", "0.08946644355176299`", 
      "0.07945194294440425`", "0.023947521494563768`"},
     {"0.19478713891940327`", "0.9933845152150551`", "0.09651776009605681`", 
      "0.33468112546240225`", "0.08943355270290455`", "0.457429713649945`", 
      "0.0290243999531682`", "0.10356907664035062`"},
     {"0.2716151222035078`", "0.09651776009605682`", "1.750000001473873`", 
      "0.44445202897952113`", "0.09651776009605681`", "0.03546103334405843`", 
      "0.4444520289795213`", "0.1130747406435615`"},
     {"0.07945194294440425`", "0.3346811254624024`", "0.4444520289795212`", 
      "1.3226481091554751`", "0.0290243999531682`", "0.1260524253139853`", 
      "0.11304042113409062`", "0.33713404426070687`"},
     {"0.1947871389194033`", "0.08943355270290455`", "0.09651776009605682`", 
      "0.029024399953168203`", "0.9933845152150548`", "0.457429713649945`", 
      "0.33468112546240225`", "0.10356907664035064`"},
     {"0.08946644355176304`", "0.4574297136499453`", "0.03546103334405844`", 
      "0.1260524253139853`", "0.45742971364994517`", "2.343157416642397`", 
      "0.12605242531398533`", "0.4600536733102448`"},
     {"0.07945194294440425`", "0.029024399953168203`", "0.4444520289795212`", 
      "0.11304042113409063`", "0.33468112546240236`", "0.1260524253139853`", 
      "1.322648109155475`", "0.337134044260707`"},
     {"0.023947521494563775`", "0.10356907664035066`", "0.1130747406435615`", 
      "0.3371340442607069`", "0.10356907664035063`", "0.4600536733102448`", 
      "0.3371340442607069`", "1.0079630940589315`"}
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
    Automatic, {8, 8}, 0., {
     1, {{0, 8, 16, 24, 32, 40, 48, 56, 64}, {{1}, {2}, {3}, {4}, {5}, {6}, {
       7}, {8}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {1}, {2}, {3}, {4}, {
       5}, {6}, {7}, {8}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {1}, {2}, {
       3}, {4}, {5}, {6}, {7}, {8}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {
       1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {1}, {2}, {3}, {4}, {5}, {6}, {
       7}, {8}}}, CompressedData["
1:eJxTTMoPSmVkYGBwAOL282q1DS637Q17V38+8e6E/bTFe1NUki7a9xzpyfgW
tsVeDyq+9a3KTdfn2+z7oOKiB/u+bWqdYa8Lla8rWhZ07uR7e7cmCf/krTvs
S47IJGVlX7X31GTjkHu6zV5EXMy93e2uvfLrsKZJO+baXxPjOdrQvAtunztU
3zKPVKCr/tgvfO725lnhHbh5nrV/r3xSX2S/BCr+MVIwsvzTHrh7yqH2LYLK
a7L5C0zU/Aq37w63elKN0gH75wue9pt/2GP//tPc1bMmX4X7D+ZOmDtUoPqq
of6CuR/mrxtQ9++EhoskVN4L6k6YfeJQcdn75wJO7mNyuAsVt8oO/NZSeBfu
fph9MPe/gLqzDGofzDwNqL8+Qt0vDo2Hm1D3wMLlA1T+OlQcZh9M/MXbEy/m
KnywBwDFVgQU
      "]}]]]]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"\[Sigma]zOp", "[", 
   RowBox[{"n_", ",", "L_"}], "]"}], ":=", 
  RowBox[{"KroneckerProduct", "[", 
   RowBox[{
    RowBox[{"SparseIdentityMatrix", "[", 
     SuperscriptBox["2", 
      RowBox[{
       RowBox[{"Floor", "[", 
        RowBox[{"L", "/", "2"}], "]"}], "+", "n"}]], "]"}], ",", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"1", ",", "0"}], "}"}], ",", 
      RowBox[{"{", 
       RowBox[{"0", ",", 
        RowBox[{"-", "1"}]}], "}"}]}], "}"}], ",", 
    RowBox[{"SparseIdentityMatrix", "[", 
     SuperscriptBox["2", 
      RowBox[{"L", "-", 
       RowBox[{"Floor", "[", 
        RowBox[{"L", "/", "2"}], "]"}], "-", "1", "-", "n"}]], "]"}]}], 
   "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{"\[Sigma]zOp", "[", 
   RowBox[{"0", ",", 
    SubscriptBox["L", "val"]}], "]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"32", ",", "32"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"\[Sigma]zOp", "[", 
    RowBox[{"1", ",", "3"}], "]"}], "//", "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"1", "0", "0", "0", "0", "0", "0", "0"},
     {"0", 
      RowBox[{"-", "1"}], "0", "0", "0", "0", "0", "0"},
     {"0", "0", "1", "0", "0", "0", "0", "0"},
     {"0", "0", "0", 
      RowBox[{"-", "1"}], "0", "0", "0", "0"},
     {"0", "0", "0", "0", "1", "0", "0", "0"},
     {"0", "0", "0", "0", "0", 
      RowBox[{"-", "1"}], "0", "0"},
     {"0", "0", "0", "0", "0", "0", "1", "0"},
     {"0", "0", "0", "0", "0", "0", "0", 
      RowBox[{"-", "1"}]}
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
    Automatic, {8, 8}, 0, {
     1, {{0, 1, 2, 3, 4, 5, 6, 7, 8}, {{1}, {2}, {3}, {4}, {5}, {6}, {7}, {
       8}}}, {1, -1, 1, -1, 1, -1, 1, -1}}]]]]], "Output"]
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
      RowBox[{"J", "=", "1"}], ",", 
      RowBox[{"h", "=", 
       FractionBox["1", "2"]}], ",", 
      RowBox[{"g", "=", 
       RowBox[{"-", "1"}]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}]}], "}"}], ",", 
    RowBox[{"Z", "[", 
     RowBox[{
      RowBox[{"N", "[", 
       RowBox[{"HIsing", "[", 
        RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
      "\[Beta]"}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["143.14475772339722`"], "Output"]
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
      RowBox[{"J", "=", "1"}], ",", 
      RowBox[{"h", "=", 
       FractionBox["1", "2"]}], ",", 
      RowBox[{"g", "=", 
       RowBox[{"-", "1"}]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}]}], "}"}], ",", 
    RowBox[{"Abs", "[", 
     RowBox[{
      RowBox[{"Z", "[", 
       RowBox[{
        RowBox[{"N", "[", 
         RowBox[{"HIsing", "[", 
          RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
        "\[Beta]"}], "]"}], "-", 
      RowBox[{"Zref", "[", 
       RowBox[{
        RowBox[{"N", "[", 
         RowBox[{"HIsing", "[", 
          RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
        "\[Beta]"}], "]"}]}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["0.`"], "Output"]
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
      RowBox[{"J", "=", "1"}], ",", 
      RowBox[{"h", "=", 
       FractionBox["1", "2"]}], ",", 
      RowBox[{"g", "=", 
       RowBox[{"-", "1"}]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", 
      RowBox[{"t", "=", "7"}]}], "}"}], ",", 
    RowBox[{"\[Chi]A", "[", 
     RowBox[{
      RowBox[{"N", "[", 
       RowBox[{"\[Sigma]zOp", "[", 
        RowBox[{"0", ",", "L"}], "]"}], "]"}], ",", 
      RowBox[{"N", "[", 
       RowBox[{"\[Sigma]zOp", "[", 
        RowBox[{"2", ",", "L"}], "]"}], "]"}], ",", 
      RowBox[{"N", "[", 
       RowBox[{"HIsing", "[", 
        RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
      "\[Beta]", ",", "t"}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"0.11688140723211236`", "\[VeryThinSpace]", "+", 
  RowBox[{"0.05067719682656435`", " ", "\[ImaginaryI]"}]}]], "Output"]
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
      RowBox[{"J", "=", "1"}], ",", 
      RowBox[{"h", "=", 
       FractionBox["1", "2"]}], ",", 
      RowBox[{"g", "=", 
       RowBox[{"-", "1"}]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", 
      RowBox[{"t", "=", "7"}]}], "}"}], ",", 
    RowBox[{"Abs", "[", 
     RowBox[{
      RowBox[{"\[Chi]C", "[", 
       RowBox[{
        RowBox[{"N", "[", 
         RowBox[{"\[Sigma]zOp", "[", 
          RowBox[{"0", ",", "L"}], "]"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"\[Sigma]zOp", "[", 
          RowBox[{"2", ",", "L"}], "]"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"HIsing", "[", 
          RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
        "\[Beta]", ",", "t"}], "]"}], "-", 
      RowBox[{"\[Chi]A", "[", 
       RowBox[{
        RowBox[{"N", "[", 
         RowBox[{"\[Sigma]zOp", "[", 
          RowBox[{"0", ",", "L"}], "]"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"\[Sigma]zOp", "[", 
          RowBox[{"2", ",", "L"}], "]"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"HIsing", "[", 
          RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
        "\[Beta]", ",", "t"}], "]"}]}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["1.1102230246251565`*^-16"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"J", "=", "1"}], ",", 
     RowBox[{"h", "=", 
      FractionBox["1", "2"]}], ",", 
     RowBox[{"g", "=", 
      RowBox[{"-", "1"}]}], ",", 
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
             RowBox[{"\[Sigma]zOp", "[", 
              RowBox[{"0", ",", "L"}], "]"}], "]"}], ",", 
            RowBox[{"N", "[", 
             RowBox[{"\[Sigma]zOp", "[", 
              RowBox[{"2", ",", "L"}], "]"}], "]"}], ",", 
            RowBox[{"N", "[", 
             RowBox[{"HIsing", "[", 
              RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
            "\[Beta]", ",", "t"}], "]"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"t", ",", "0", ",", "20", ",", "0.02"}], "}"}]}], "]"}], 
      "]"}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<t\>\"", ",", 
        "\"\<Re[\!\(\*SubscriptBox[\(\[Chi]\), \(A, B\)]\)[\[Beta],t]]\>\""}],
        "}"}]}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", 
      RowBox[{"\"\<h=\>\"", "<>", 
       RowBox[{"ToString", "[", 
        RowBox[{"InputForm", "[", "h", "]"}], "]"}], "<>", "\"\<, g=\>\"", "<>", 
       RowBox[{"ToString", "[", "g", "]"}], "<>", "\"\<, L=\>\"", "<>", 
       RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, \[Beta]=\>\"", "<>", 
       RowBox[{"ToString", "[", 
        RowBox[{"N", "[", "\[Beta]", "]"}], "]"}]}]}]}], "]"}]}], 
  "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, 
   {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.006944444444444445], 
    AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJw923dcze0bB/CUhqS9997jDCPz+5G9t4jI3iQjIySS8DQIRUUpifbep9Ok
QWlSRlYkSUQSfj3Puc6vf7yOTud87+t9f+5zdd/fDNbvWbxJVERE5IOYiMi/
/wq/Bvo112j8qWKOKifMaDsSxKw5tOuo9v8fRzH8JM/hpoOPs3S9Py7KSmB6
N3DSR///+2lMy71S3wWDj6+F/PuVzfjw7/7e+//nFzCs6cef3xh83Lno3//h
M34HnKa3/P/nS5i9EdcvmP6tYqSbbrlOlC5n7F4xI0//Fb7eA2bTgFzz98HH
Fqv9i3rNq5jKvyXKJ0Wq6fUfMpEyG/aaDKlmogZ/uulWDfO+W3z6u8HHgver
Zc69XRtRKlrNcP/7qmN+XbWxKRWrpvevZ1Jb3yi8G1rNFPeaD75DA/O9/c0T
c4lqup4mZkLOnqX/SFYzi/97w2Zmz7W0Q4rDqun6njA+4txZGdLVTNuRf1/w
KfPDPS/zgEw1XW8rE9ex8txc2Wpm77+X5/qMGfHMcfIoeeH1P2cWrsz+Y65Y
zQg0XjLZIQv26CkLx/OSWfEyKV1WtZqZKXgDRrlwmuNHNeH42hjOuZtWdzSq
mX/fbbX/K6bv3fz5o7WE433NWFYtUvLWrmYEw3nNlOpt/HNSRzj+N8y0VSPz
1XWrGb1/L0f3LbPxeLIxV1dYj7eMj78PO3vw+Vs2//v1jjGrej08UFtYn3bm
66kg2Rua1cy/r6ac0M7c2BBUW6omrNd7ZmycjP07pWrm+78v1/ue6dnXcPKF
rLB+Hxj7oIMu/lLVzKT/XrCD0ZgTI/dYRFjPDmZY87S9Xj+qmP8uz/sjc35X
rvWRTuF86GRM8nJrA19UMdVV/351Mj8VZ/+5WVNF9f7EvAh973OcV8Wo/HeB
XYz1jZoYkTjh/Oxi2LUylr8vVzH/vdzqz4zL95k3Zh2rIo9u5tcTo8DcdVU0
nm5mdFJFlvmUKvLpZl6Uh4/ZYlBF4+tm/NbdrJ03UEleX5j8y0ss0uoqabxf
mAu7Hw64xVSS3xem4UXIho3ulTT+HmadhfSIjVMqybOHsfBKOL5geCXVo4dJ
KNu3WOJRBfl+ZeLWKu7f7ldB9fnKmDxY7ewyq4K8vzLimqKLHv19QPX6xqQ/
WH4pIvkB+X9j2tPTb5aseUD1+8Zs4Miss5B8QPOhl/HKM1lRcvc+1bOXSama
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
YYlraSz+dyceeVjCaMJbj7SvPPKwxN3g8btGTCskD0tIuq7USPQrJA9LGI4c
ttuxsZA8rGD+gK8apsUnDytUr7hSorKGTx5WeClRm7E8jE8eVtju8mVabzOf
PAZ/fp2tq498EXlYYZ/8xc1RU4rIwwpVI/I13u4tIg8r9D13Kn1zrYg8rHDk
5dzDkwuKyMMKrZMCb4S2FJGHFbwiPh273lNEHlbwHbU9pV20mDysoOSWHGsn
U0weVtDct0/WTLaYPKywsLWP5SNVTB5W+Nikv1nuVxF5WKG7Ws3Z+20ReVjB
Psx8R3p5EXlYYeJc/Wq3iCLysMKqzrpnV92KyMMKoal7J0uMLyIPK2iccxGP
6eeThxX0l1xI257MJw8ryESou8xayycPK7j1+oU6DOWThzVWlGbtc75ZSB7W
EP+2Z84dbiF5WCMj49KpvR488rCGkRXnz3LPAvKwRvba5IEZ+/LJwxqa7xaE
BC/LIw9r3E7WPxlrlkse1jA4VLCk/UM2eVjjekR974NQYT6s8WLn5OY6ZJKH
NZTfRY0KbEwnD2vkp42beXVNGnlYY93KtsOnngjXK2tYXGAF9M9IJg9rjKn4
GrdgWSJ5WENkh4T/oaHC+5WsUbvVbW9LuPD+KGu8WSip0GkSTR7WKJC+HGl8
PYI8rPEoxv2clEgoeVjjlNhMSa24IPKwRoVZW4jS0XPkYY3HOudrPZ4dJA9r
bFiTws8ZtYb6K2uIyrvmOeidov7KBj5WCWPdZgdSf2UDqfTL6xrlQ6i/ssE3
ttj9z3tuUn9lg/T8Z47LnKKov7LBwkVikazpd6i/skGrQ98CHU4c9Vc2OFl4
dPxa2STqr2wwPt/ba61oCvVXNvD2nymz7Vsq9Vc2yBAvinjyOp36KxtEXJJb
o1Qj7HdtsP4NCjyysqm/ssHW+EuxnqG51F/ZILpOep/f0XzaTx78/g2nBo1l
POqvbHC6QOnAvKBC6q9sEHS3Qrb8CJ/6Kxv0jgyUy3EW7v/boH3WuvfvJxRT
f2WD7axLmurqJdRf2eByu4Sd7OcS6q9scKwmN/4Sv5T6KxsceDpadZ9/GfVX
Ntj1fcSTQyvKycMGM7a9XbxP+z552MIqXf8Bp+U+edhCcsaxrb5Bwv0rW9ze
wp82Z2YFedjiS2mYy/zvFeQx+POP6+5sD68kD1t8HREjfgRV5GGLdK9La1e0
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
ua+SKR8j8TRyusV4q2Tmf5GfMRo=
     "]]}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"t\"", TraditionalForm], 
    FormBox[
    "\"Re[\\!\\(\\*SubscriptBox[\\(\[Chi]\\), \\(A, B\\)]\\)[\[Beta],t]]\"", 
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
  PlotLabel->FormBox["\"h=1/2, g=-1, L=5, \[Beta]=0.6\"", TraditionalForm],
  PlotRange->{{0, 20.}, {-0.14886940198530213`, 0.38050677045194725`}},
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
    RowBox[{"J_", ",", "h_", ",", "g_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"\[Sigma]", "=", 
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
              RowBox[{"-", "1"}]}], "}"}]}], "}"}]}], "}"}]}], ",", "opI", 
       ",", "Iop"}], "}"}], ",", 
     RowBox[{
      RowBox[{"opI", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         RowBox[{
          RowBox[{"g", " ", 
           RowBox[{
           "\[Sigma]", "\[LeftDoubleBracket]", "1", 
            "\[RightDoubleBracket]"}]}], "+", 
          RowBox[{"h", " ", 
           RowBox[{
           "\[Sigma]", "\[LeftDoubleBracket]", "3", 
            "\[RightDoubleBracket]"}]}]}], ",", 
         RowBox[{"IdentityMatrix", "[", "2", "]"}]}], "]"}]}], ";", 
      RowBox[{"Iop", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{
         RowBox[{"IdentityMatrix", "[", "2", "]"}], ",", 
         RowBox[{
          RowBox[{"g", " ", 
           RowBox[{
           "\[Sigma]", "\[LeftDoubleBracket]", "1", 
            "\[RightDoubleBracket]"}]}], "+", 
          RowBox[{"h", " ", 
           RowBox[{
           "\[Sigma]", "\[LeftDoubleBracket]", "3", 
            "\[RightDoubleBracket]"}]}]}]}], "]"}]}], ";", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{
         RowBox[{"J", " ", 
          RowBox[{"KroneckerProduct", "[", 
           RowBox[{
            RowBox[{
            "\[Sigma]", "\[LeftDoubleBracket]", "3", 
             "\[RightDoubleBracket]"}], ",", 
            RowBox[{
            "\[Sigma]", "\[LeftDoubleBracket]", "3", 
             "\[RightDoubleBracket]"}]}], "]"}]}], "+", 
         RowBox[{"If", "[", 
          RowBox[{
           RowBox[{"j", "\[Equal]", "1"}], ",", 
           RowBox[{"opI", "+", 
            RowBox[{
             FractionBox["1", "2"], "Iop"}]}], ",", 
           RowBox[{"If", "[", 
            RowBox[{
             RowBox[{"j", "<", 
              RowBox[{"L", "-", "1"}]}], ",", 
             RowBox[{
              FractionBox["1", "2"], 
              RowBox[{"(", 
               RowBox[{"opI", "+", "Iop"}], ")"}]}], ",", 
             RowBox[{
              RowBox[{
               FractionBox["1", "2"], "opI"}], "+", "Iop"}]}], "]"}]}], 
          "]"}]}], ",", 
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
     RowBox[{"J", ",", "h", ",", "g", ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}]}], "}"}], ",", 
    RowBox[{"Norm", "[", 
     RowBox[{
      RowBox[{"Sum", "[", 
       RowBox[{
        RowBox[{"KroneckerProduct", "[", 
         RowBox[{
          RowBox[{"SparseIdentityMatrix", "[", 
           SuperscriptBox["2", 
            RowBox[{"l", "-", "1"}]], "]"}], ",", 
          RowBox[{
           RowBox[{"h2", "[", 
            RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], 
           "\[LeftDoubleBracket]", "l", "\[RightDoubleBracket]"}], ",", 
          RowBox[{"SparseIdentityMatrix", "[", 
           SuperscriptBox["2", 
            RowBox[{"L", "-", "l", "-", "1"}]], "]"}]}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"l", ",", "1", ",", 
          RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], "-", 
      RowBox[{"HIsing", "[", 
       RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}]}], "]"}]}], 
   "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"MatrixForm", "/@", 
   RowBox[{"h2", "[", 
    RowBox[{"J", ",", "h", ",", "g", ",", 
     SubscriptBox["L", "val"]}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {
        RowBox[{
         FractionBox[
          RowBox[{"3", " ", "h"}], "2"], "+", "J"}], 
        FractionBox["g", "2"], "g", "0"},
       {
        FractionBox["g", "2"], 
        RowBox[{
         FractionBox["h", "2"], "-", "J"}], "0", "g"},
       {"g", "0", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["h", "2"]}], "-", "J"}], 
        FractionBox["g", "2"]},
       {"0", "g", 
        FractionBox["g", "2"], 
        RowBox[{
         RowBox[{"-", 
          FractionBox[
           RowBox[{"3", " ", "h"}], "2"]}], "+", "J"}]}
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
        RowBox[{"h", "+", "J"}], 
        FractionBox["g", "2"], 
        FractionBox["g", "2"], "0"},
       {
        FractionBox["g", "2"], 
        RowBox[{"-", "J"}], "0", 
        FractionBox["g", "2"]},
       {
        FractionBox["g", "2"], "0", 
        RowBox[{"-", "J"}], 
        FractionBox["g", "2"]},
       {"0", 
        FractionBox["g", "2"], 
        FractionBox["g", "2"], 
        RowBox[{
         RowBox[{"-", "h"}], "+", "J"}]}
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
        RowBox[{"h", "+", "J"}], 
        FractionBox["g", "2"], 
        FractionBox["g", "2"], "0"},
       {
        FractionBox["g", "2"], 
        RowBox[{"-", "J"}], "0", 
        FractionBox["g", "2"]},
       {
        FractionBox["g", "2"], "0", 
        RowBox[{"-", "J"}], 
        FractionBox["g", "2"]},
       {"0", 
        FractionBox["g", "2"], 
        FractionBox["g", "2"], 
        RowBox[{
         RowBox[{"-", "h"}], "+", "J"}]}
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
         FractionBox[
          RowBox[{"3", " ", "h"}], "2"], "+", "J"}], "g", 
        FractionBox["g", "2"], "0"},
       {"g", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["h", "2"]}], "-", "J"}], "0", 
        FractionBox["g", "2"]},
       {
        FractionBox["g", "2"], "0", 
        RowBox[{
         FractionBox["h", "2"], "-", "J"}], "g"},
       {"0", 
        FractionBox["g", "2"], "g", 
        RowBox[{
         RowBox[{"-", 
          FractionBox[
           RowBox[{"3", " ", "h"}], "2"]}], "+", "J"}]}
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
   RowBox[{"IdMPO", "[", "L_", "]"}], ":=", 
   RowBox[{"Table", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"ArrayReshape", "[", 
        RowBox[{
         RowBox[{"IdentityMatrix", "[", "2", "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"2", ",", "2", ",", "1", ",", "1"}], "}"}]}], "]"}], ",", 
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
    SubscriptBox["L", "val"], "]"}], "\[IndentingNewLine]", 
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
          RowBox[{"{", "0", "}"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
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
          RowBox[{"{", "0", "}"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
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
          RowBox[{"{", "0", "}"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
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
          RowBox[{"{", "0", "}"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
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
          RowBox[{"{", "0", "}"}], "}"}]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
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
    RowBox[{"2", ",", "2", ",", "1", ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "1", ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "1", ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "1", ",", "1"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "1", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "check", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], "}"}], ",", 
    RowBox[{"Norm", "[", 
     RowBox[{
      RowBox[{"MPOMergeFull", "[", 
       RowBox[{"First", "/@", 
        RowBox[{"IdMPO", "[", "L", "]"}]}], "]"}], "-", 
      RowBox[{"IdentityMatrix", "[", 
       SuperscriptBox["2", "L"], "]"}]}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
}, Open  ]],

Cell["\<\
In what follows, we effectively disable quantum number conservation by \
setting all quantum numbers to zero.\
\>", "Text"],

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
     SubscriptBox["expH", "test"], "=", 
     RowBox[{"Block", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"qd", "=", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0"}], "}"}]}], ",", 
         RowBox[{"J", "=", "1"}], ",", 
         RowBox[{"h", "=", 
          FractionBox["1", "2"]}], ",", 
         RowBox[{"g", "=", 
          RowBox[{"-", "1"}]}], ",", 
         RowBox[{"L", "=", 
          SubscriptBox["L", "val"]}], ",", 
         RowBox[{"\[Beta]", "=", 
          SubscriptBox["\[Beta]", "val"]}], ",", 
         RowBox[{"nsteps", "=", "20"}], ",", 
         RowBox[{"tol", "=", 
          SuperscriptBox["10", 
           RowBox[{"-", "12"}]]}], ",", "expH"}], "}"}], ",", 
       RowBox[{"MPOStrangEvolution", "[", 
        RowBox[{
         RowBox[{"IdMPO", "[", "L", "]"}], ",", 
         RowBox[{"N", "[", 
          RowBox[{"h2", "[", 
           RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
         "qd", ",", 
         FractionBox["\[Beta]", "2"], ",", "nsteps", ",", "tol"}], "]"}]}], 
      "]"}]}], ";"}], "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "/@", 
    RowBox[{"(", 
     RowBox[{"First", "/@", "%"}], ")"}]}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "1", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "4", ",", "6"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "6", ",", "6"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "6", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "4", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "compare", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"J", "=", "1"}], ",", 
      RowBox[{"h", "=", 
       FractionBox["1", "2"]}], ",", 
      RowBox[{"g", "=", 
       RowBox[{"-", "1"}]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}]}], "}"}], ",", 
    RowBox[{
     FractionBox["1", 
      RowBox[{"Z", "[", 
       RowBox[{
        RowBox[{"N", "[", 
         RowBox[{"HIsing", "[", 
          RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
        "\[Beta]"}], "]"}]], 
     RowBox[{"Norm", "[", 
      RowBox[{
       RowBox[{"MPOMergeFull", "[", 
        RowBox[{"First", "/@", 
         SubscriptBox["expH", "test"]}], "]"}], "-", 
       RowBox[{"MatrixExp", "[", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["\[Beta]", "2"]}], 
         RowBox[{"N", "[", 
          RowBox[{"HIsing", "[", 
           RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}]}], 
        "]"}]}], "]"}]}]}], "]"}]}]], "Input"],

Cell[BoxData["9.184761615978821`*^-7"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"{", 
       RowBox[{"0", ",", "0"}], "}"}]}], ",", 
     RowBox[{"J", "=", "1"}], ",", 
     RowBox[{"h", "=", 
      FractionBox["1", "2"]}], ",", 
     RowBox[{"g", "=", 
      RowBox[{"-", "1"}]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"\[Beta]", "=", 
      SubscriptBox["\[Beta]", "val"]}], ",", 
     RowBox[{"tol", "=", 
      SuperscriptBox["10", 
       RowBox[{"-", "12"}]]}], ",", "ZH", ",", "expHref"}], "}"}], ",", 
   RowBox[{
    RowBox[{"ZH", "=", 
     RowBox[{"Z", "[", 
      RowBox[{
       RowBox[{"N", "[", 
        RowBox[{"HIsing", "[", 
         RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
       "\[Beta]"}], "]"}]}], ";", 
    RowBox[{"expHref", "=", 
     RowBox[{"MatrixExp", "[", 
      RowBox[{
       RowBox[{"-", 
        FractionBox["\[Beta]", "2"]}], 
       RowBox[{"N", "[", 
        RowBox[{"HIsing", "[", 
         RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}]}], "]"}]}],
     ";", 
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
             FractionBox["1", "ZH"], 
             RowBox[{"Norm", "[", 
              RowBox[{
               RowBox[{"MPOMergeFull", "[", 
                RowBox[{"First", "/@", 
                 RowBox[{"MPOStrangEvolution", "[", 
                  RowBox[{
                   RowBox[{"IdMPO", "[", "L", "]"}], ",", 
                   RowBox[{"N", "[", 
                    RowBox[{"h2", "[", 
                    RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}],
                    ",", "qd", ",", 
                   FractionBox["\[Beta]", "2"], ",", "nsteps", ",", "tol"}], 
                  "]"}]}], "]"}], "-", "expHref"}], "]"}]}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"nsteps", ",", "1", ",", "30"}], "}"}]}], "]"}], ",", 
        RowBox[{"AxesLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"\"\<1/\[CapitalDelta]\[Tau]\>\"", ",", "\"\<err\>\""}], 
          "}"}]}], ",", 
        RowBox[{"PlotLabel", "\[Rule]", 
         RowBox[{
         "\"\<\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[Beta]\)\\\ H/2\
\)]\) MPO approximation error (Strang splitting)\\nJ=\>\"", "<>", 
          RowBox[{"ToString", "[", "J", "]"}], "<>", "\"\<, h=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "h", "]"}], "]"}], "<>", "\"\<, g=\>\"", 
          "<>", 
          RowBox[{"ToString", "[", "g", "]"}], "<>", "\"\<, L=\>\"", "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, \[Beta]=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"N", "[", "\[Beta]", "]"}], "]"}], "<>", 
          "\"\<, tol=\!\(\*SuperscriptBox[\(10\), \(-12\)]\)\>\""}]}], ",", 
        RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
      RowBox[{"LogLogPlot", "[", 
       RowBox[{
        RowBox[{"0.004", 
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
1:eJwB8QEO/iFib1JlAgAAAB4AAAACAAAAIae9/HhD8z8ZjkZw/uQfwBjEOnya
Wv4/QyZXFUaxIsAWVbW7sWsCQLBRpZFFTyTAiPDb/d24BEAUHC3jfnUlwCqa
VXrdgQZALJ6OYXRZJsCR43N7QvcHQLKaEeyhFCfAvAB41fUyCUD73wymHLMn
wAR/mr1uRApANmpK/Gg8KMCb1gv5pjULQNIkq5pasyjApigUOm4NDECXPkXm
wiQpwNwK3jWg0AxA18sof36GKcANcjI704INQKnxpy162ynA4V+QqcAmDkAc
U1d+/TQqwDiPNpWGvg5Aip187Xt+KsCvG6y30ksPQDemC/ivwCrAgA1Zff/P
D0D8LE5nDAgrwIWpLCAUJhBAC2DkOOE/K8CLMmXcm2AQQLXQSeeXbCvAXsMx
QvmXEEB3xjPcuqkrwJFb6Xx/zBBARrnr3xTNK8AhQWeJdf4QQLS1EPnl7yvA
rEzOehguEUDSga8ZzxIswMBDGD6dWxFAEdU3mNEgLMBEgHj9MYcRQJEg62l3
JyzAYjAmO/+wEUAwQYyr3EQswC93p7Qo2RFArkznf9M4LMAQLDEbzv8RQOfM
oTiENyzA2o56qgslEkC2uN5LfgoswNhoFqX6SBJAix+6KH4RLMAWVbW7sWsS
QPPEWTUIBizAPwnZTg==
       "]]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwVxXk41GkcAPAhE0Zj+GGYjBgz5PrRQaHlfRMjjCZ5ZivGNLaYonI9pWu1
j9oUetQw7PbI0dYqWdaVxabvWqXSo2YZtK1bKPK4j/Kwu398ng/nm5h9EeoU
CiXwP///c+6tG4nuZz0/lZwcXjJigt22iFIZbz9q8WiO7DFhwpzhaTcXngw9
aDUfaTRlQsjllRVTXiKSTb4ZSeMwgf57YziDl4L6t279YEYyYbiTZ6DNy0Ht
dQtjO72Z0PZeNUblFaH6599NXYtnwovjjgc0eDUobUi+zHrNhJay0GO2Zs8R
x0EW+yrHGN7GFrs2flAi/GTYYkuwCQzEHRamFHWi8N7Hf36ksaB0Oje4t78b
nWP4NLn8xYIe2Q95o139iJ2WqOacvh742ZY0+9Uh9IgZktskMoXaRRqqZY6i
YKcs2/umbBBcK4g0XPqIzmSenfFsZ8MfB+c1alkTSKHJMD2aawZ2Jcv+iuRJ
5NYsvOi9fwOc8yEXZyanUL/BqCpB1xzqVx5LE5NmUHLsplQXlTmsE97zCp+a
RaJ1cg+RrwXseTLeG3NpHkWODg51PbQAhd9gOE93ES2khlOv6HJgPGpTGEpa
QoFtzk3pURxwLuk2uEj/gvK5feXiVg6kX+7fZZW8jKpZ/R5X7C1BdcHHadJo
BT03rls8c8MSuBkHVqV3VlHoPw0OihlL2MkO57FTKbiSz1ql7eXCKOWZ9a19
anhtbQDFv4oLxps7Ilro6niDsi1/QJ8HfhMeOcKn6rimLOW3uyd4kFAvso5M
X4MF2QaUTUoeWLWbTDvxNfA9y7n3ho5W8GY5zTSdQcWfH5V+bpRbwbcVX2/f
oaJipX7W1VtzVlBR+Srj9vW1OJp4XdUSZA19TdM+cpEmVjcdYDyrtoZsTpOr
u54WDnvhr73eYCMIdT6ZuTRrYXfP3vM5JzcChfpM2nhdGxP1AWY9yo3g5u/f
p+5Lw2Xd9LAkRxuIyk96rGLoYF+t+y0jchvgYklnaIsOvtuV01U8aQO9JxSD
zpfW4eSYSkmOwBayHl4ILPCnY7FukUHgr7agdGbMNmjo4i/7JiPFdDtY2xq0
GNOqixX5+h+c4+3Ac3ZsIiGLgcsrJEPbVHawWmFyU2Gth29GqyXJN9vDu4TM
g3WpeviEwwV+jcIezv99GFxH9TA9U/CLy4w95GpKC/p26WNH2H29e48D1H3l
XBZUpI8Fc+zcPRUOkGssEbM1COz4hu/HYpCw3r2xvI5K4JLp4rwaPRJ+FFtr
HtQksL0RY1ZEkJBdOFGuoBHYJqQzT25EQob9RU2GPoE5Q7JZHTYJyaigQm0D
gQ0Xr+av2JAgkw1ojWwn8JJ5y9ygFwnD1/iS790IfMbLKSDZm4QjJcWV3B0E
nj+SWWDBJ0E6FS+RehJ4+kFoQJgfCSHn11S99Sbw+Nbxgg4hCYIM3qFXQQTu
8aULXohJeFl+tSoqmMDiqLhCmYQEv/ZxbW0Rgd+lq+apUhL4rOoqnwME7lLe
LvQ6TAL6yYf2REJgZajjQv0xEhqePjgUJiXw3iS5ICSahK9G6dVfwgncWjBf
uHicBFey45BrBIFfvm8QuMSS8EjoXt0RSeDdWtw7bXEkuMTn0U4dJXCzXcpC
XAIJVVnqUoMoAvMDxwR6p0jYUhNZXR5N4KYY4Z3S0yT8C6ZpMb8=
      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/\[CapitalDelta]\[Tau]\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{1.0788636558468268`, -14.581655942294496`},
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
H/2\\)]\\) MPO approximation error (Strang splitting)\\nJ=1, h=1/2, g=-1, \
L=5, \[Beta]=0.6, tol=\\!\\(\\*SuperscriptBox[\\(10\\), \\(-12\\)]\\)\"", 
    TraditionalForm],
  PlotRange->{{1.133114525541308, 
   4.605170185988092}, {-14.47676659172065, -7.973626856142368}},
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
        AbsoluteThickness[0.1]}}, {-6.907755278982137, 
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
      RowBox[{"{", 
       RowBox[{"0", ",", "0"}], "}"}]}], ",", 
     RowBox[{"J", "=", "1"}], ",", 
     RowBox[{"h", "=", 
      FractionBox["1", "2"]}], ",", 
     RowBox[{"g", "=", 
      RowBox[{"-", "1"}]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"\[Beta]", "=", 
      SubscriptBox["\[Beta]", "val"]}], ",", 
     RowBox[{"nsteps", "=", "12"}], ",", "tol", ",", "ZH", ",", "expHref"}], 
    "}"}], ",", 
   RowBox[{
    RowBox[{"ZH", "=", 
     RowBox[{"Z", "[", 
      RowBox[{
       RowBox[{"N", "[", 
        RowBox[{"HIsing", "[", 
         RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
       "\[Beta]"}], "]"}]}], ";", 
    RowBox[{"expHref", "=", 
     RowBox[{"MatrixExp", "[", 
      RowBox[{
       RowBox[{"-", 
        FractionBox["\[Beta]", "2"]}], 
       RowBox[{"N", "[", 
        RowBox[{"HIsing", "[", 
         RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}]}], "]"}]}],
     ";", 
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
             FractionBox["1", "tol"], ",", 
             RowBox[{
              FractionBox["1", "ZH"], 
              RowBox[{"Norm", "[", 
               RowBox[{
                RowBox[{"MPOMergeFull", "[", 
                 RowBox[{"First", "/@", 
                  RowBox[{"MPOStrangEvolution", "[", 
                   RowBox[{
                    RowBox[{"IdMPO", "[", "L", "]"}], ",", 
                    RowBox[{"N", "[", 
                    RowBox[{"h2", "[", 
                    RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}],
                     ",", "qd", ",", 
                    FractionBox["\[Beta]", "2"], ",", "nsteps", ",", "tol"}], 
                   "]"}]}], "]"}], "-", "expHref"}], "]"}]}]}], "}"}]}], ",", 
          RowBox[{"{", 
           RowBox[{"i", ",", "1", ",", "65"}], "}"}]}], "]"}], ",", 
        RowBox[{"AxesLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"\"\<1/tol\>\"", ",", "\"\<err\>\""}], "}"}]}], ",", 
        RowBox[{"PlotLabel", "\[Rule]", 
         RowBox[{
         "\"\<\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[Beta]\)\\\ H/2\
\)]\) MPO approximation error (Strang splitting)\\nJ=\>\"", "<>", 
          RowBox[{"ToString", "[", "J", "]"}], "<>", "\"\<, h=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "h", "]"}], "]"}], "<>", "\"\<, g=\>\"", 
          "<>", 
          RowBox[{"ToString", "[", "g", "]"}], "<>", "\"\<, L=\>\"", "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, \[Beta]=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"N", "[", "\[Beta]", "]"}], "]"}], "<>", 
          "\"\<, tol=\!\(\*SuperscriptBox[\(10\), \(-12\)]\)\>\""}]}], ",", 
        RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
      RowBox[{"LogLogPlot", "[", 
       RowBox[{
        RowBox[{"10", 
         SuperscriptBox["invtol", 
          RowBox[{
           RowBox[{"-", "2"}], "/", "3"}]]}], ",", 
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
1:eJxd0XtIU1EcB/AluNShK8NlZWvq1jyOpm6+l+3n5sSeptlTWaVkmtHKJMoy
k0rRwh6maSwtc0tZUVoxe9iuU8xlaREly8wySotwJLVIzbqXe7mgf1wuH+65
5/zO9+udqknc4cBgMKLxh3jbIsYmFeIvcsEa48+N71wx0nba+w0yeVMtA6Z+
Z9LO6mx+/Oo+C6aun0W7cXR+TW7GnGn/c2gvKbCqWT89p+23gHYDu5KrzedO
259H2z1epKlw9IG6zpJ99ZaF1Hm+tNdWuPSou/i0yfMX0y7t/yoWnhPSJufx
o/2Mbym1bfCnTc4nou2yu37E6LUEpB5DJc6MRdS8YthW96N+eB0Pi7tTtObY
YACcmGHt9f7Oo+YPBOvfws0Zud6YMk+6kZ8UBJcH7nCq9/hQ95FAsaXpTHam
LzbI8y1yMkpgn6X5V6OET91PCpVx/uE8iQAraHc3fp8XDB/0yuPsbwLqvsFQ
pclZ3OAqxHgZDkMvjoTAQPa5J2c7hNT9Q4HXsr4tfZcfZmKNcu4NhILJK6Xs
ki+i8ggDl7ivyG8nwtS3PsZWKcJh5Eb1b3QNUfmEQ1rtsCyiE2F/E18eyNNF
gDlSdTSkG1F5RcKfWwqubhBhWjum3+4kA0i3255/QlR+MkCObLZnP8IiL91+
o8paCtE6TZJoAFF5RoG6Jqnd6z3CrFFXmP7dUZCyR+A/+y2i8l0G5hazgwr3
wY9nQt2C5FCXsKU8ETeZtxxsgisBLNynzXLpn+UAfas3zUS4yfwB0OeT2mQr
wpIvhK3MGgdo6HB02oub7CMatp6XBebhFqUHpPXfiAZDCbOrFDfZjwKM5TnF
FbjHwoSH49UK6H+oZ9bhJvtSQL2H3H4d91PnRWWtbCXwxrjjBtxkf0oIXFqR
qsNd1ccxSFuVYBLl/iPWk33GAKujxkDsl3nTrU2XHQPmyrvtxHqy3xhw1T46
pMcdns/sm8tXwaoVE27E/2TfKsi8OrSF8MyEydHi1yowPWi5SJjsPxYKysU9
hHt97C4ThbEw/utUH+H/ODPzpg==
       "]]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwVzns0lAkcxvFpqA1tIaQjmzHDCGMY5TLv8v6Y8VprxCaHImGTorKjdstS
MjJokRhUq6JSua07ic0vrC4KMZLQRYUkW6fsOrnt7B/P+f71nPNhhERuCaXT
aDQPxf5vT4E+7bunfzgiGbm3MoIO7yTV6SYeqeTq5JL8Xj86VEiYTydEeWRY
91j/tAsdMiWDix2iUnJVcBDFN6BDgqQ+s0nURO6Q/MBslS+BWInRUI3oATnb
Zj0sd1gCRyRDtErREGnz/YzXzCoa/EK3W10umiS3FdHFx/bMkpZzLMOdR+fJ
YN9rQdEWH0l2StInrfGlwHvYf/9u0jPSNjYsI+H9CkhcMX1aq7ixWVO62q/Q
RRMCGeOjxW1jzb0yteroXm2oGgls/C1gulkp6qDnr2VrQWp5r3KkYLHZulU9
Je5nfbAoV5u9NKiMuZxX7fxjBsDumi/JPqWCHS+m33aEGcJXZdwa3aKVuKte
FtVnyYIvbjmhU7UaOO/a6fbygxGIa9NOeKtpYWdzs5NSPxuGF1ldx7N0UNnf
4eL5vA3Q1cko2PxBF8XDUfqbk82gLvbWhddxevh8rWCCFsGBC4by8qNK32Bl
9MV15hwuSK+yrwxyDDDwxUB93UlLsDPbJA04yMBsbVNZ1gErMI+aLuFcNsQ9
jo+Px4Ty4Nz1xLGQSSYSbV2y177WoOLfU3qWa4S3/U8NqvA3QmPXo1qDHcY4
MlrM43M3wZh1gVztChvrElKbjLVswG8709a1zwRPHm3cL/tsA3fmgpknaKb4
JZzifj1uC1XpPxkZuZjhuvBcpnOHHTwfsYrQOWSOTwOEJpLb9pBk3Noe0cTB
M6WOWwXVfOCOqpe2LFigysrFKpQRsLImeaJG2xK1f9QzdEv5FnDyQ8rNG5Yo
vzffmrbfAbKlPPdxLyvMSuOkeXs4Qnjglkc6o1Y4JWzYzQIS5jjbQ/5N4uGC
NLHBTwOgIpDQpq23Ru/QoTusVABGknLvzRZrjBfl/N25AFCjfq3qvP9G5I78
U2wf6QTUE7Zv/MeNWCJOnNrw1glycjOWrZFtQprqYfeZ7c6w/EZPv9zMBpl5
OZaix85g0z1XLey2wfahgKIgTwGEGi/1qRXbosBYSnijAOqGR9dsXm6HaXuH
fTr4QmhLrXhzpsQOK2tzUxhlQvic592nJrRHn4oZLzt9F2C9k6fEDdjjnStJ
+fIcF9CwcnQrjOGj5qVoFc/lFBg8OW76SZPAhw1Bf7qpUrDWQ/WvHG0Ckx+5
ioUrKNBsydrJ1yVwgaYzYK9OwdLSq7J4fQIndlZdZ+lSMBH3YGGVCYGt+u9c
v7ApqGPr9po7EHjobIC00JUCj8PlMbvDCORWCvj5bhRQk3Y6quGK/13TqXPu
FJDBLRVl+wgMmpnxyfCkgOfe9+azmEAP32yjGF+FZ/2sZ0IsgcbanW1eYRS8
aadY+acJfGlee8R9LwXPiO5bAhmBecI8cyqCgicV27aN5RCoeShcRkRScP/c
vnSLPIW/Z9ku48MUVBzInGm6SmDDxPs1jGgKil7pZQUVKbz0vg69GAou+RVy
lEsVPqvL1hpxFGQ73whxrySw0O3kmFo8Ben1TvNT1QpvsPj3ZQkUJJt35GbW
Ebgu2s9zSSIFkoKtPJsGAvszSKU5KQWxOs8eDDQS+B+a7z2l
      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/tol\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{-0.9386368070082594, -13.613568199354104`},
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
H/2\\)]\\) MPO approximation error (Strang splitting)\\nJ=1, h=1/2, g=-1, \
L=5, \[Beta]=0.6, tol=\\!\\(\\*SuperscriptBox[\\(10\\), \\(-12\\)]\\)\"", 
    TraditionalForm],
  PlotRange->{{-0.23104906018664848`, 
   45.054566736396445`}, {-13.45672726980257, -3.7325896376076053`}},
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
     RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", "H"}]], TraditionalForm]]],
 " MPO approximation"
}], "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"{", 
       RowBox[{"0", ",", "0"}], "}"}]}], ",", 
     RowBox[{"J", "=", "1"}], ",", 
     RowBox[{"h", "=", 
      FractionBox["1", "2"]}], ",", 
     RowBox[{"g", "=", 
      RowBox[{"-", "1"}]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"t", "=", "5"}], ",", 
     RowBox[{"tol", "=", 
      SuperscriptBox["10", 
       RowBox[{"-", "8"}]]}], ",", "expHref"}], "}"}], ",", 
   RowBox[{
    RowBox[{"expHref", "=", 
     RowBox[{"MatrixExp", "[", 
      RowBox[{
       RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", 
       RowBox[{"N", "[", 
        RowBox[{"HIsing", "[", 
         RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}]}], "]"}]}],
     ";", 
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
                  RowBox[{"IdMPO", "[", "L", "]"}], ",", 
                  RowBox[{"N", "[", 
                   RowBox[{"h2", "[", 
                    RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}],
                   ",", "qd", ",", 
                  RowBox[{"\[ImaginaryI]", " ", "t"}], ",", "nsteps", ",", 
                  "tol"}], "]"}]}], "]"}], "-", "expHref"}], "]"}]}], "}"}], 
          ",", 
          RowBox[{"{", 
           RowBox[{"nsteps", ",", "8", ",", "200", ",", "8"}], "}"}]}], "]"}],
         ",", 
        RowBox[{"AxesLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"\"\<1/\[CapitalDelta]t\>\"", ",", "\"\<err\>\""}], "}"}]}],
         ",", 
        RowBox[{"PlotLabel", "\[Rule]", 
         RowBox[{
         "\"\<\!\(\*SuperscriptBox[\(\[ExponentialE]\), \
\(\(-\[ImaginaryI]\)\\\ t\\\ H\)]\) MPO approximation error (Strang \
splitting)\\nJ=\>\"", "<>", 
          RowBox[{"ToString", "[", "J", "]"}], "<>", "\"\<, h=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "h", "]"}], "]"}], "<>", "\"\<, g=\>\"", 
          "<>", 
          RowBox[{"ToString", "[", "g", "]"}], "<>", "\"\<, L=\>\"", "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, t=\>\"", "<>", 
          RowBox[{"ToString", "[", "t", "]"}], "<>", 
          "\"\<, tol=\!\(\*SuperscriptBox[\(10\), \(-8\)]\)\>\""}]}], ",", 
        RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
      RowBox[{"LogLogPlot", "[", 
       RowBox[{
        RowBox[{"1.75", 
         SuperscriptBox["inv\[CapitalDelta]t", 
          RowBox[{"-", "2"}]]}], ",", 
        RowBox[{"{", 
         RowBox[{"inv\[CapitalDelta]t", ",", 
          RowBox[{"1", "/", "10"}], ",", "20"}], "}"}], ",", 
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
1:eJwBoQFe/iFib1JlAgAAABkAAAACAAAAzyYnGooU3j+bYBbn1bzdv6vmBgZE
nPI/ZYWcxrPz/L++zDYBDRn5P0KHnrlt6gTAowOEhWWz/T/AtXmewn4JwHOr
Oz+yogBAZ9scL5kPDcDb9FlAFxgCQJfiqOMp+A/ABRJemspTA0BHBFqF4DER
wE2QgIJDZQRAJ18Yzgo3EsDk5/G9e1YFQPnbiPT1ERPA7zn6/kIuBkD9kTCM
0cgTwCYcxPp08QZA2gXdK/REFMBXgxgAqKMHQBIR36nrkRTAK3F2bpVHCEAg
48I/vdYUwIGgHFpb3whAxwjFqLjBFMD5LJJ8p2wJQEf1EdoCyRTAyR4/QtTw
CUDCA49rHagUwFNkPwX9bApArcJZ4thiFMBgdrB9DOIKQBv6HfEbRhTABphJ
ScdQC0CxI+4WEAoUwGvIuL7TuQtAhNOmucjeE8CLk7TXvx0MQAHnXrtEmRPA
oaqCugV9DEDnnSm+qZMTwMqYFkEP2AxAz9u54ElKE8DSEde/OC8NQOjPCHm2
KxPADXIyO9OCDUCbeXPw6/YSwJjDu9U=
       "]]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwVyns01FkAwPGZwfxmRAy/O+UxlI3qZK2oKUfcu5KcKfJsKYnMnKT3JBV5
VchWIlvsYdoO9kQRGauJ6t4MPTZR2SaPkh7aRgoxCMO2f3zP55/v/G17AyQs
BoPh873/nTFwqri+k0XMAOP326U0Mo8Zv7ElmkWWSe8V7/iTRsL7dxq4Ehbx
az19DRTRaE/quvbIcBY5mWnWuLuARi81Yh0TfxYZ1ToNCLJopOjOC5UKWeTZ
B8mapAM0klZp9ZyZLHJa8WjI3Z1GvYEPw2suMMnM5jwRaTNFNuYVVc2VDLLK
JqGwvd8EBYs3J4irZrBnXcJid2CC2MzabyXcaSzjlEV3/8xDksIyhTGcwutV
Nt6/hRmjsC7VZ37uBM7+JG1yMDRCTDNZlLdyHC9f7OIa4WaIvJS33AYmR3F8
Wwig4mahBTx+lmOgBofMr5Z4P+aiqi0ca1n6MH6/u2S0hsFB//gssytpH8Kc
8Cfa+gA2yr9yM2ee8yBurgvesbJCFwGDqoTstn4M+bGg5x0LLdGPIHSSGotA
8wobFyaS6XmkD/T0YrZd/HLr59NwQ6eK/ivoLVZMzG587z0Jxf23rbfO6sYF
/Dnw9bcx+MbKaS6zW4U7fvJ3dYwagQ2vT6sNljzB3tnTP9Ryh6BcmBd/6uld
vORlvYXt0z44fYGx0COtECNRT4q86h3c9NE0qSVODuPOqBJ/AZ2wWc/+jqXd
A1g0Fq1dHXwfBiSSNTOPn8HIbKpvSl6I4Rq9AvPtHfAmL+hr/8Rj7Modjmtc
2wPXFn+yCvR9hUsWDcrvXXwHjxjv4zoE9+JqUf1eqdu/8HwQOzXtXD9OyW3b
5vyoD845UCDXeTGEBecP78AWX2BNLKo7u1CDK5sPHproGISjh+WwCY/jFVc1
yviMr5AtlLc3mU9ha4FleZr9CHxhxijrEs/gTdllgRKNBtqlGB71SWCSqa3a
E1f+GIMPNkRWnLPVIYOOioONu7/BW/MsL5YP65J14S6DqwWTkO8rm2tfzCaU
dSTbt3EKts1uchCKOAS8GeiyPzsN3zwJ1AVAnzQlF8kUAgbaOFAaFXp3Fik9
y/ixSY+JLI0kx6Q5hsRVvVQ/T81EHg33V/FDjQhrv1e5xR0W+hh9mBilGhPp
kdnXfi3RQSH7UUPSdh7hV92MLU/QRVOXP5285G5CYhxXZub66iG/RTGyDJ4p
2b40Rit2ZiOfxYW80FFTkheRLFRzKJQYcl306hFNjtmGFhQZUChacKryQitN
9vQ5McKMKRT0Vkz7tdHEK/bDw5Y5FLLfNbe7oZMmIxk+W2rsKNSZnLy/VE0T
v0qLE8meFBJe9sk/QAHCmb7xFKRQ6ItG3ctdDchIQ46w9fj3v04pUnoB8jpj
Z8HJDAo1Jcsqj4oAqeVZSyazKFTI9T8y4A+I2DZ9vEdGIZFAYfA8ApC764Os
y+spdNkz3flSEiDlPIcTEkyhc9yI/NBjgOSrKLWVkkJJLS5ak3RA9kXUV+f8
TaGNIZ/vpZ0BxCrWxutQB4V0dwVt2lkIiL7L1BXHVxQadHTACy4BotE+N+rr
oVCXhlrQXQxIc0ZmR9hHClUn13/2uwqIYn2UO7+fQhc9zwfoVwJSzHMrbh2g
UCZ37w1lNSBZKj4nc5hCsS3elom1gMQXDO7yGKNQRK5NqrAOkP8ADt9CBw==

      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/\[CapitalDelta]t\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{0.35160097032317494`, -5.554105506580603},
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
splitting)\\nJ=1, h=1/2, g=-1, L=5, t=5, \
tol=\\!\\(\\*SuperscriptBox[\\(10\\), \\(-8\\)]\\)\"", TraditionalForm],
  PlotRange->{{0.4029437162276482, 
   3.6888794541139363`}, {-5.473320508186454, -0.46465060774927175`}},
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
        AbsoluteThickness[0.1]}}, {-0.6931471805599453, 
       FormBox[
        TagBox[
         InterpretationBox["\"0.50\"", 0.5, AutoDelete -> True], 
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
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"{", 
       RowBox[{"0", ",", "0"}], "}"}]}], ",", 
     RowBox[{"J", "=", "1"}], ",", 
     RowBox[{"h", "=", 
      FractionBox["1", "2"]}], ",", 
     RowBox[{"g", "=", 
      RowBox[{"-", "1"}]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"t", "=", "5"}], ",", 
     RowBox[{"\[CapitalDelta]t", "=", 
      RowBox[{"1", "/", "16"}]}], ",", "tol", ",", "expHref"}], "}"}], ",", 
   RowBox[{
    RowBox[{"expHref", "=", 
     RowBox[{"MatrixExp", "[", 
      RowBox[{
       RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", 
       RowBox[{"N", "[", 
        RowBox[{"HIsing", "[", 
         RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}]}], "]"}]}],
     ";", 
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
             FractionBox["1", "tol"], ",", 
             RowBox[{"Norm", "[", 
              RowBox[{
               RowBox[{"MPOMergeFull", "[", 
                RowBox[{"First", "/@", 
                 RowBox[{"MPOStrangEvolution", "[", 
                  RowBox[{
                   RowBox[{"IdMPO", "[", "L", "]"}], ",", 
                   RowBox[{"N", "[", 
                    RowBox[{"h2", "[", 
                    RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}],
                    ",", "qd", ",", 
                   RowBox[{"\[ImaginaryI]", " ", "t"}], ",", 
                   RowBox[{"t", "/", "\[CapitalDelta]t"}], ",", "tol"}], 
                  "]"}]}], "]"}], "-", "expHref"}], "]"}]}], "}"}]}], ",", 
          RowBox[{"{", 
           RowBox[{"i", ",", "1", ",", "30"}], "}"}]}], "]"}], ",", 
        RowBox[{"AxesLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"\"\<1/tol\>\"", ",", "\"\<err\>\""}], "}"}]}], ",", 
        RowBox[{"PlotLabel", "\[Rule]", 
         RowBox[{
         "\"\<\!\(\*SuperscriptBox[\(\[ExponentialE]\), \
\(\(-\[ImaginaryI]\)\\\ t\\\ H\)]\) MPO approximation error (Strang \
splitting)\\nJ=\>\"", "<>", 
          RowBox[{"ToString", "[", "J", "]"}], "<>", "\"\<, h=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "h", "]"}], "]"}], "<>", "\"\<, g=\>\"", 
          "<>", 
          RowBox[{"ToString", "[", "g", "]"}], "<>", "\"\<, L=\>\"", "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, t=\>\"", "<>", 
          RowBox[{"ToString", "[", "t", "]"}], "<>", 
          "\"\<, \[CapitalDelta]t=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"N", "[", "\[CapitalDelta]t", "]"}], "]"}]}]}]}], "]"}], 
      ",", 
      RowBox[{"LogLogPlot", "[", 
       RowBox[{
        RowBox[{"450", 
         SuperscriptBox["invtol", 
          RowBox[{
           RowBox[{"-", "2"}], "/", "3"}]]}], ",", 
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
1:eJxTTMoPSmViYGCQA2IQ/d7y1z8nvWf24cvFdspOeGgP4X+D84tXW9tvWsTg
gCrPBudnn9ix7/JObgdU9QJw/sZPUvOrMoTR9IvB+bqNN+O4v0igmScN56/k
nyE3p17OYeXDnggJy7dQ8xUc2MKEd+beeGQv5K+dP41VyWHJzbyTjUUXofYp
O1x+92N96uOp9gHTuM7HnVZx8Obt/nOh6d1+iP1qDjpWJmvXLfm+v+/uSz31
ieoODLUznwiq/9sPcY+Gw/b/J3lcdjMdOKNysu99mJbDX9FN+UJnWA9A3Kft
wLtRcEu2IucBrpwV77bL6DoEPnY8fsGf5wDEvXoOb8OK8w+58B/w2Nzu1/BI
32GztzVbyhOBAxD3GzjwbltjcVFF6IBzrXG4Soihw5pDEjwW+sIHIP4xcrB8
WsF8dbLwgUcKyu0c240cjngzbuN/KHwA4j9jhyMr9VZm/hQ+0HhEaPsbSRMH
w6oyTx5ukQMQ/5o4CLi5Lv4nIHIAAGcx248=
       "]]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwVins403scgKelyWExsgm/qdXktoafcjj5fQ468vToSkg8I6QiktvydLos
QxzbQ7qsdFdYZbUmUfY9HXFKl0mpRs4qIeJhWW1O6jh/vM/7x/vOj09bnziD
RCKFTvO/Bz2rKhv2nPIPseYKe9MYENptJ+1i7iGovESdYAcDyGdrFZXMw8Qz
qSTBeSsDYmdofQ8wJUR0oHFgZiwDiuUVUxnMWmJnhvrH7FAGLCgZ6N3BbCTK
VIf43i4MSM0Vr0lmPiS6S16nlPTRoXy0ryCJqSZSjAUbfKPokPdNWnHJZ5io
FsnN2K42YPG2XSPzmSC4hGK3jeVcOPDtz4Fu+SShFb0NFn2zgjr4S975hgSP
+cOU4yoa/GzluV26aCboCluzqhosIXeeSUynnALeHvueBhRZAMU/1iTe4yfg
6VrcOpqpIB+H2ncZVBh95m7DLjcD09QVLVFTFnD13bqXEh9TCKmRcfwu0GDm
csYEY5YJ1H2O1j0Fa+h47TV8udcY0l/5qkuMbEBVbdq4sZAMhDGvMeAiHZLu
Cfqom4xg26OGBsfttrDZPv3xY8MU0XRundUNJzt46SMQngk3EHZK7rZf2uzh
4JD6i8BIR3RlB74ZLcJATKqxqV4zRqzxW80OpTtCZURO993uASKu0Hpk6b+O
oByhdYTf7iEKeibjJtXz4eW+e3mpTi3EzbBDYY3SBVCToNdk/XZXSZU4baSW
suCKRjCmdVcr08g7X8TGLQRFTff9730flH27n88o4i4CiHKsRcJRpfB6GBFs
yQaS451jRtrPSq5VrsHoPRu8f2exxGv1SkqA4t7aVieYlWv9o9dsSqnNofny
qxZDVra7lfA1CfV10JacznKGtUmcVeUzyYhscPOKiHABPStTuj/WGDkHDd00
c3EFk2N0WYKYgrYcbes7qXeF822J6mW3ZqN2RTNL+coNzFv1bsNmZsjXEKnp
rXEHDf8jq8KXirpmm18pK+EA2is6J1plgfj+CboA3hIIso0iqxItke3d1Ox+
OhfEVvqvBXtoqPjXen5WIRdQ5m2S7JIVMopUNR0c50KVrCa6s9kamYfnGG/a
4gHpG+48TBqdiy6Ec9hYpweQwi8+2sWgo+WD9fk8P09Y4dHkmMthoJ1xjz6l
XPGEjMyJwtFoW3Q+RV72da4XrC/bHMjLmod4ebVz0vZ6gZ4qEYcU2SFFOueI
bMQL8rWG8fM37ZG5XhCRvhGH+7LCqq/tDujJsRWWQZE4OMiWDXWpHFDpMko7
fRMOGXX9nPoXDoiac9hfGTPdrwU1ZP7jgCy+iBdRE3HIlZLax7UOyHqi8rN0
Nw7ul3LHhm0xZDd2SzQgxqHiZLKfZiuGekT8kKYyHEYk9P3KFAydWuJHFh3B
IUDS2nJ6F4bs05qzlx6f7scXro7JwxA22hKTfwaH4KManroUQws+dbiyruEw
JY4UPldg6F1x+YcvdTisF1Pa5Y0YuuAafubhdRxqRfVzypUYWrjjFS1DgUNE
qfWJdQ8wxB7qNaA7ONwoVkmf9GCov+is/EgzDpTifWNX32LosnN8ajLCgXeY
4/1HP4YWb/ugmdOCg3lRSfOqMQwNmlyWvL+PQ3yhH9lVh6Hq6uSwW204NBQM
BZtOYih5pQu1+MH0X3Ci5ON3DDkPDrfFtuOQKFzZ8TeZif4DjkU9qA==
      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/tol\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{-0.7648987441725961, -5.4469862357513765`},
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
splitting)\\nJ=1, h=1/2, g=-1, L=5, t=5, \[CapitalDelta]t=0.0625\"", 
    TraditionalForm],
  PlotRange->{{-0.4332169878499659, 20.79441541679836}, {-5.34603058729751, 
   0.9132196168421177}},
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
        AbsoluteThickness[0.1]}}}, {{-4.605170185988091, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "2"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.3025850929940455`, 
       FormBox["0.1`", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {0., 
       FormBox["1", TraditionalForm], {0.01, 0.}, {
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
       RowBox[{"{", 
        RowBox[{"0", ",", "0"}], "}"}]}], ",", 
      RowBox[{"J", "=", "1"}], ",", 
      RowBox[{"h", "=", 
       FractionBox["1", "2"]}], ",", 
      RowBox[{"g", "=", 
       RowBox[{"-", "1"}]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"t", "=", "5"}], ",", 
      RowBox[{"tol", "=", 
       SuperscriptBox["10", 
        RowBox[{"-", "12"}]]}], ",", "expHref"}], "}"}], ",", 
    RowBox[{
     RowBox[{"expHref", "=", 
      RowBox[{"MatrixExp", "[", 
       RowBox[{
        RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", 
        RowBox[{"N", "[", 
         RowBox[{"HIsing", "[", 
          RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}]}], 
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
                   RowBox[{"IdMPO", "[", "L", "]"}], ",", 
                   RowBox[{"N", "[", 
                    RowBox[{"h2", "[", 
                    RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}],
                    ",", "qd", ",", 
                   RowBox[{"\[ImaginaryI]", " ", "t"}], ",", "nsteps", ",", 
                   "tol"}], "]"}]}], "]"}], "-", "expHref"}], "]"}]}], "}"}], 
           ",", 
           RowBox[{"{", 
            RowBox[{"nsteps", ",", "4", ",", "80", ",", "4"}], "}"}]}], "]"}],
          ",", 
         RowBox[{"AxesLabel", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"\"\<1/\[CapitalDelta]t\>\"", ",", "\"\<err\>\""}], 
           "}"}]}], ",", 
         RowBox[{"PlotLabel", "\[Rule]", 
          RowBox[{
          "\"\<\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[ImaginaryI]\)\
\\\ t\\\ H\)]\) MPO approximation error (\!\(\*SubsuperscriptBox[\(SRKN\), \
\(6\), \(b\)]\))\\nJ=\>\"", "<>", 
           RowBox[{"ToString", "[", "J", "]"}], "<>", "\"\<, h=\>\"", "<>", 
           RowBox[{"ToString", "[", 
            RowBox[{"InputForm", "[", "h", "]"}], "]"}], "<>", "\"\<, g=\>\"",
            "<>", 
           RowBox[{"ToString", "[", "g", "]"}], "<>", "\"\<, L=\>\"", "<>", 
           RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, t=\>\"", "<>", 
           RowBox[{"ToString", "[", "t", "]"}], "<>", 
           "\"\<, tol=\!\(\*SuperscriptBox[\(10\), \(-12\)]\)\>\""}]}], ",", 
         RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
       RowBox[{"LogLogPlot", "[", 
        RowBox[{
         RowBox[{"0.02", 
          SuperscriptBox["inv\[CapitalDelta]t", 
           RowBox[{"-", "4"}]]}], ",", 
         RowBox[{"{", 
          RowBox[{"inv\[CapitalDelta]t", ",", 
           RowBox[{"1", "/", "10"}], ",", "10"}], "}"}], ",", 
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
1:eJwBUQGu/iFib1JlAgAAABQAAAACAAAAIJqax/ePzL+qN4/bohT9v88mJxqK
FN4/d6w5Z885FsCMX3MD1wPsP4hFB9u0FR7Aq+YGBkSc8j+0CM2RUmMhwO85
+v5CLvY/vHyDbckwI8C+zDYBDRn5Pz/sAzTFoCTAEwc/tXOQ+z9GmfL+kt0l
wKMDhIVls/0/gfAYVuvnJsDRsmb81ZX/Py++Byu3wifAc6s7P7KiAECc8SZS
r4UowKqNBTvkZQFAO/apIch6KMDb9FlAFxgCQDH2WGCpIinAr+K3rgS8AkCh
KjHimEoowAUSXprKUwNAbaaeap9cKMB9ntO8FuEDQL01iYpnqijATZCAgkNl
BECYJ1ES8FsowNjVgEVs4QRA/vfbbWxdKMDk5/G9e1YFQBWTEl4ATSjAigmL
iTbFBUD17PGDiAwowO85+v5CLgZAz0OMxs1mKMBad5rG
       "]]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwB4QQe+yFib1JlAgAAAE0AAAACAAAAThkYr7FrAsDFJFoCejEVQHCIvy7N
aALACQOpAbErFUCR92au6GUCwErh9wDoJRVA1NW1rR9gAsDRnZX/VRoVQFqS
U6yNVALA3BbR/DEDFUBmC4+paT0CwPQISPfp1BRAf/0FpCEPAsAm7TXsWXgU
QLDh85iRsgHAiLUR1jm/E0Aamh8l3+kAwFwmae7ULRJA/AagdHkuAMAgAGqN
CbcQQLXNkaOB7f6/u393jzCPDkCCbYOi6179v1S/Wo0EcgtAP3YeKO/q+7/P
0JCYC4oIQAtfWfLNV/q/aKIGLcljBUDRLeXXBsz4v/I/Hvg6TAJAh2UaRNla
97++XhGhv9P+P0x97/SGyvW/0b1lZHaS+D8C/m0szlT0v6vAX0KTu/I/smQ9
f2/m8r/QtjobMQTqP3GrrBbsWPG/mNlprSsw2z9AtoppBMzvv0FS0zs2BrA/
vdX7Luen7L+PL4JFXB/Vvy7BDit+kum/Bmp1MlLl5r+AfnQ0SLLmv2A6bwYV
M/G/8PsZx8iT4798PyThE3D3v0BLEmd8quC/3aAzoaxC/b9etZQgzQXbvwHB
YSfsyAHAJWxI4AnU1L+d5YfHzeEEwFmNQ3VZGc6/WThbWnzFB8DgQvVOeZHB
v/jK7mN05wrAov/Id5V5p7+1iy9gOdQNwO5MJuJ2Z6Y/P0DnEiVZEMDmZQaq
RgvCP5TaFjFS5xHAEPE3ZuOnzT/6C53I5VoTwOA9tf7SHtU/UF2DG57tFMBP
6wrdS0zbP6vIGFP8eBbAf3pdUK+H4D8XywQEwekXwDi/9SiCp+M/dO1QcKp5
GcARMjv0IZLmP+Cm81X67hrA9djeiA1u6T9SekUg8FwcwLu/QpRCiOw/tW33
pQrqHcCh1FOSRG3vPyj4/6SLXB/AtJSSA0hI8T9GUbSvGHcgwCjWUTdUv/I/
APKTyZ4yIcChMcBPBi/0P7wfy9V36iHAC62OI9299T9xXbI/47EiwIW/s3Aa
Mvc/ruZE5gFsI8Dw8Th5fMX4P+R/h+qyNSTAYT5tZoRR+j8cpiHhtvskwOIh
+Mzywvs/3RdnFG60JcBTJePuhVP9P5WZXKW3fCbA1L8kin/J/j/WZv1ytDcn
wC26CoUPHABAGcH1MgTvJ8BoJLOi8eIAQFQrnlDmtSjAK9oG/YacAUAX4fGq
e28pwCgfz6fDnwFAFCa6VbhyKcAkZJdSAKMBQBBrggD1dSnAHu4nqHmpAUAK
9RJWbnwpwBACSVNstgFA/Ag0AWGJKcD0KYupUdABQOAwdldGoynAvHkPVhwE
AkCogPoDEdcpwLi+1wBZBwJApMXCrk3aKcC1A6CrlQoCQKEKi1mK3SnAro0w
AQ8RAkCalBuvA+QpwKChUawBHgJAjKg8WvbwKcCFyZMC5zcCQHHQfrDbCirA
gg5crSM7AkBuFUdbGA4qwH5TJFhgPgJAaloPBlURKsB43bSt2UQCQGTkn1vO
FyrAavHVWMxRAkBW+MAGwSQqwGY2ngMJVQJAUj2Jsf0nKsBje2auRVgCQE+C
UVw6KyrAXAX3A79eAkBIDOKxszEqwFhKv677YQJARFGqXPA0KsBVj4dZOGUC
QEGWcgctOCrAUtRPBHVoAkA+2zqyaTsqwE4ZGK+xawJAOiADXaY+KsBJRkes

      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/\[CapitalDelta]t\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{-0.3333381303869965, -13.347952063817653`},
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
(\\!\\(\\*SubsuperscriptBox[\\(SRKN\\), \\(6\\), \\(b\\)]\\))\\nJ=1, h=1/2, \
g=-1, L=5, t=5, tol=\\!\\(\\*SuperscriptBox[\\(10\\), \\(-12\\)]\\)\"", 
    TraditionalForm],
  PlotRange->{{-0.28555464034658457`, 
   2.772588722239781}, {-13.164929620354862`, -1.8175381256619212`}},
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
        AbsoluteThickness[0.1]}}, {2.302585092994046, 
       FormBox["10", TraditionalForm], {0.01, 0.}, {
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
        AbsoluteThickness[0.1]}}, {3.912023005428146, 
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
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "1"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
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
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"{", 
       RowBox[{"0", ",", "0"}], "}"}]}], ",", 
     RowBox[{"J", "=", "1"}], ",", 
     RowBox[{"h", "=", 
      FractionBox["1", "2"]}], ",", 
     RowBox[{"g", "=", 
      RowBox[{"-", "1"}]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"t", "=", "5"}], ",", 
     RowBox[{"\[CapitalDelta]t", "=", 
      RowBox[{"1", "/", "8"}]}], ",", "tol", ",", "expHref"}], "}"}], ",", 
   RowBox[{
    RowBox[{"expHref", "=", 
     RowBox[{"MatrixExp", "[", 
      RowBox[{
       RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", 
       RowBox[{"N", "[", 
        RowBox[{"HIsing", "[", 
         RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}]}], "]"}]}],
     ";", 
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
             FractionBox["1", "tol"], ",", 
             RowBox[{"Norm", "[", 
              RowBox[{
               RowBox[{"MPOMergeFull", "[", 
                RowBox[{"First", "/@", 
                 RowBox[{"MPOSRKNb6Evolution", "[", 
                  RowBox[{
                   RowBox[{"IdMPO", "[", "L", "]"}], ",", 
                   RowBox[{"N", "[", 
                    RowBox[{"h2", "[", 
                    RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}],
                    ",", "qd", ",", 
                   RowBox[{"\[ImaginaryI]", " ", "t"}], ",", 
                   RowBox[{"t", "/", "\[CapitalDelta]t"}], ",", "tol"}], 
                  "]"}]}], "]"}], "-", "expHref"}], "]"}]}], "}"}]}], ",", 
          RowBox[{"{", 
           RowBox[{"i", ",", "2", ",", "50", ",", "2"}], "}"}]}], "]"}], ",", 
        RowBox[{"AxesLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"\"\<1/tol\>\"", ",", "\"\<err\>\""}], "}"}]}], ",", 
        RowBox[{"PlotLabel", "\[Rule]", 
         RowBox[{
         "\"\<\!\(\*SuperscriptBox[\(\[ExponentialE]\), \
\(\(-\[ImaginaryI]\)\\\ t\\\ H\)]\) MPO approximation error \
(\!\(\*SubsuperscriptBox[\(SRKN\), \(6\), \(b\)]\))\\nJ=\>\"", "<>", 
          RowBox[{"ToString", "[", "J", "]"}], "<>", "\"\<, h=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "h", "]"}], "]"}], "<>", "\"\<, g=\>\"", 
          "<>", 
          RowBox[{"ToString", "[", "g", "]"}], "<>", "\"\<, L=\>\"", "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, t=\>\"", "<>", 
          RowBox[{"ToString", "[", "t", "]"}], "<>", 
          "\"\<, \[CapitalDelta]t=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"N", "[", "\[CapitalDelta]t", "]"}], "]"}]}]}]}], "]"}], 
      ",", 
      RowBox[{"LogLogPlot", "[", 
       RowBox[{
        RowBox[{"200", 
         SuperscriptBox["invtol", 
          RowBox[{
           RowBox[{"-", "2"}], "/", "3"}]]}], ",", 
        RowBox[{"{", 
         RowBox[{"invtol", ",", "1", ",", 
          SuperscriptBox["2", "40"]}], "}"}], ",", 
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
1:eJxTTMoPSmViYGCQBGIQ/d7y1z8nvW/2K7aJJBmcuWoP4bM5wPjFq63tNy0S
cECVF3PYbFfcm7f8jX32iR37Lu+Udoj3vC3EveYlVL2CQ1OIf/E9gxn2Gz9J
za/KUHa4zXU+TaP0836IfjWHTx9r7h+YzHhAt/FmHPcXDQed4HlGOQs5D0DM
03YwuSO6+/JZvgMr+WfIzanXcxC1fOOZoCt8AGK+gcMbA4npxt5iB4T8tfOn
sRo5lEzg02M9IXUAYp+xg4yrNbfYFZkDAdO4zsedNnF4+CO9gHmywgGI/WYO
81Y9uGE9X+lA392XeuoTzR3aZvjsnMKpAnWPhcOKC9ILnkurHTijcrLvfZiV
g94Pjj7GRHWo+6wd5nxUC1rfqnGAK2fFu+0ytg4ed05t/L9MA+peOwfpeK/m
y1s0DnhsbvdreGTvcP3h9pLKwxpQ9zs45JzeN+fsIY0DzrXG4Sohjg5akw2k
5wH5AMH5vTE=
       "]]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwVxX0803kcAPBYktYkzOO0NWbbb0ZmCj/1+1RzmqfhdeFlrchDGS9RJ9Sl
l87JU6ZFk9MpSXpViIReLV90pVzCrQduKqcH0tUl56Frubs/3q/36p17QuP0
Fy1aFPif//8mvdvs4JfqDZ5zm/UPuFLhmbeappBnE4TsxeQlHhXCqXftE+TH
CZ+u7x+NsKhQqhfADpOfJUKKWuo22lChKd34YoD8KiFnsCVGJCp0Nn2Y8JV3
EhVbllWWa8xBHBxV4CMfIP4p73dvTTcHSlV5pEg+Sqg9ZQnTajO4oLsbc5s1
RVCmTrc480xBnn2Dt3HmM5HkembCutkELul4Pusf6IG7V/T23hxjWB+22Mfm
0BLgLvQ3/xFLhjPW5cdeapeB92D3U+mBpVCV0eK4p2IFjCsNer4NMYBIbqnB
O4YpuFyOGTZepw8P/Hk0VYA5OF3Iz9ha85WgeBtKmRcsgDcw0V8kmyOuj8KG
miErkFsG9xzNniLeili+VD1bUNs9Iy/LnSDepQVlxIfbgUluQ5ThqmEifNuj
wPof6dC7fJgvflpL+Ob1sxI/MoB0srNrRvq4g9NZ2LrfhgkxGv69/cVvOm5p
0n465GIPtaHpmS1FHztwyZET01IHmHzePu/ycLYjqUY9Ev8dC/4Knhl+Xavr
yImy9RbXOELMvvtmD3V6KPpgEP9cHxsa43QnE6wN0FRKY8rcSw6MiK/4VS8Y
IvkDYY/aFIN9YCyUOpCRavF4apYTDyY57wKbzIxRfkVK/XVwghhtGNPhgAna
qbJd2J7Ehxx+iUeDkSn6kPz3Wf0cZyibNdyVn2WGYq58jLBodoHf/SIaz5lS
UdD56IHg5DUwkGqzW1ZlgUSj0XTz+TXQutLWI36lFaoP3peuULjCgNc0s6Ha
Gu3lV2YspQlAqyU7+lrbolPtLpvV5wVwKrRMlZVHQ26ZGksMd4P8kFn7GYtV
iF1bUlZ6xw0S7ql6bhbQkWLJdrtWmRCIuKW3R4sZKESzKejJWyFsYr5sWO6/
GqWFKLe4pbkD7d5c6FESE1H0PwX4kteC8lomqbqXiRboiZ8jVGvhsNYaYnPt
UVzq9FWmyzowFDsW3Al2QPy94wLO7XWwqyqxMMOShSQvPm3jSTyAEPRbDfaz
0Ktsk+OvX3lAk9HZ5t5TjuhRiSi5aq8nVNodH07aykZsyZh56RdP2GF7o01G
4aA/4cQvoPSCmzJJzXsNB1HORNIn7XBQakk0toKL2uhNnZEMHPa72lfFK7ko
tsoo9j4TB2nuJmZtGRfd+Lmt7iIbB/s12RxWJRftPm0h2O2Kw/UfvgrtL3JR
V8Wg6JUIh6fYfCC9m4vSy/zkzxNxoGe+P2w5y0VMavVySTIOpD4KKfwzF/WV
ztffSsFhnMnPPanjIofSuk+n03Bo/DWxiLoYQ4PKJYe2HcZhM2Oi3GwlhpxK
uhRDShzi745dXcHD0JMVNgJxGQ5+NJK7xBlDRxSpmjYVDs6pzLZiVwwNFTOs
yytxmLWJvkXxwFDusazqsFoc8pKf3Sf7YEhAeSy6U4dDcrcu0H8LhkaK+G/c
L+EQamU3UOCPIWGRlkdtxMG2S/rEKBRDz8nCvpwmHBYsDkaKt2KooLAwZfoa
DmOJFSN5ERhaSx4zjW3FoQe1R/VIMTRa4NXyWzsOl6lDY4Y7MPQvY1ogqA==

      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/tol\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{-1.27483124028766, -13.345455528050248`},
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
(\\!\\(\\*SubsuperscriptBox[\\(SRKN\\), \\(6\\), \\(b\\)]\\))\\nJ=1, h=1/2, \
g=-1, L=5, t=5, \[CapitalDelta]t=0.125\"", TraditionalForm],
  PlotRange->{{-0.7220283130832764, 34.657359027997266`}, {-13.11940959176776,
    0.8954384577463855}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->FrontEndValueCache[{
     Charting`ScaledTicks[{Log, Exp}], 
     Charting`ScaledTicks[{Log, Exp}]}, {{{4.605170185988092, 
       FormBox["100", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {11.512925464970229`, 
       FormBox[
        TemplateBox[{"10", "5"}, "Superscript", SyntaxForm -> SuperscriptBox],
         TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {18.420680743952367`, 
       FormBox[
        TemplateBox[{"10", "8"}, "Superscript", SyntaxForm -> SuperscriptBox],
         TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {25.328436022934504`, 
       FormBox[
        TemplateBox[{"10", "11"}, "Superscript", SyntaxForm -> 
         SuperscriptBox], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {32.23619130191664, 
       FormBox[
        TemplateBox[{"10", "14"}, "Superscript", SyntaxForm -> 
         SuperscriptBox], TraditionalForm], {0.01, 0.}, {
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
        AbsoluteThickness[0.1]}}, {23.025850929940457`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {27.631021115928547`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {29.933606208922594`, 
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
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"d", "=", "2"}], ",", 
       RowBox[{"D", "=", 
        RowBox[{"{", 
         RowBox[{"1", ",", "5", ",", "4", ",", "6", ",", "3", ",", "1"}], 
         "}"}]}], ",", "zmax"}], "}"}], ",", 
     RowBox[{
      RowBox[{"zmax", "=", 
       RowBox[{"2", 
        RowBox[{
         RowBox[{"(", 
          RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", "5"}]}]}], ";", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"RandomComplex", "[", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{
              RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"d", ",", "d", ",", 
              RowBox[{
              "D", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], 
              ",", 
              RowBox[{"D", "\[LeftDoubleBracket]", 
               RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "}"}]}], 
           "]"}], ",", 
          RowBox[{"ConstantArray", "[", 
           RowBox[{"0", ",", 
            RowBox[{
            "D", "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}]}], 
           "]"}], ",", 
          RowBox[{"ConstantArray", "[", 
           RowBox[{"0", ",", 
            RowBox[{"D", "\[LeftDoubleBracket]", 
             RowBox[{"j", "+", "1"}], "\[RightDoubleBracket]"}]}], "]"}]}], 
         "}"}], ",", 
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
    RowBox[{"2", ",", "2", ",", "1", ",", "5"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "5", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "4", ",", "6"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "6", ",", "3"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "3", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Norm", "[", 
  RowBox[{"MPOMergeFull", "[", 
   RowBox[{"First", "/@", 
    SubscriptBox["A", "rnd"]}], "]"}], "]"}]], "Input"],

Cell[BoxData["0.9669475580828061`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"{", 
       RowBox[{"0", ",", "0"}], "}"}]}], ",", 
     RowBox[{"J", "=", "1"}], ",", 
     RowBox[{"h", "=", 
      FractionBox["1", "2"]}], ",", 
     RowBox[{"g", "=", 
      RowBox[{"-", "1"}]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"t", "=", "5"}], ",", 
     RowBox[{"tol", "=", 
      SuperscriptBox["10", 
       RowBox[{"-", "8"}]]}], ",", "Atref"}], "}"}], ",", 
   RowBox[{
    RowBox[{"Atref", "=", 
     RowBox[{
      RowBox[{"MatrixExp", "[", 
       RowBox[{
        RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", 
        RowBox[{"N", "[", 
         RowBox[{"HIsing", "[", 
          RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}]}], "]"}], 
      ".", 
      RowBox[{"MPOMergeFull", "[", 
       RowBox[{"First", "/@", 
        SubscriptBox["A", "rnd"]}], "]"}], ".", 
      RowBox[{"MatrixExp", "[", 
       RowBox[{"\[ImaginaryI]", " ", "t", " ", 
        RowBox[{"N", "[", 
         RowBox[{"HIsing", "[", 
          RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}]}], 
       "]"}]}]}], ";", 
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
                    RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}],
                   ",", "qd", ",", 
                  RowBox[{"\[ImaginaryI]", " ", "t"}], ",", "nsteps", ",", 
                  "tol"}], "]"}]}], "]"}], "-", "Atref"}], "]"}]}], "}"}], 
          ",", 
          RowBox[{"{", 
           RowBox[{"nsteps", ",", "16", ",", "320", ",", "16"}], "}"}]}], 
         "]"}], ",", 
        RowBox[{"AxesLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"\"\<1/\[CapitalDelta]t\>\"", ",", "\"\<err\>\""}], "}"}]}],
         ",", 
        RowBox[{"PlotLabel", "\[Rule]", 
         RowBox[{
         "\"\<\!\(\*SuperscriptBox[\(\[ExponentialE]\), \
\(\(-\[ImaginaryI]\)\\\ t\\\ H\)]\) X \
\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\[ImaginaryI]\\\ t\\\ H\)]\) MPO \
approximation error (Strang splitting)\\nJ=\>\"", "<>", 
          RowBox[{"ToString", "[", "J", "]"}], "<>", "\"\<, h=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "h", "]"}], "]"}], "<>", "\"\<, g=\>\"", 
          "<>", 
          RowBox[{"ToString", "[", "g", "]"}], "<>", "\"\<, L=\>\"", "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, t=\>\"", "<>", 
          RowBox[{"ToString", "[", "t", "]"}], "<>", 
          "\"\<, tol=\!\(\*SuperscriptBox[\(10\), \(-8\)]\)\>\""}]}], ",", 
        RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
      RowBox[{"LogLogPlot", "[", 
       RowBox[{
        RowBox[{"1.25", 
         SuperscriptBox["inv\[CapitalDelta]t", 
          RowBox[{"-", "2"}]]}], ",", 
        RowBox[{"{", 
         RowBox[{"inv\[CapitalDelta]t", ",", 
          RowBox[{"1", "/", "10"}], ",", "64"}], "}"}], ",", 
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
      0.019444444444444445`], AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJwBUQGu/iFib1JlAgAAABQAAAACAAAAq+YGBkSc8j9+2JJftvwAwKMDhIVl
s/0/EAU6olz2C8Db9FlAFxgCQGq6mDTBNRHATZCAgkNlBECtRGsunYITwO85
+v5CLgZAHM1ebHBIFcBXgxgAqKMHQHnIEEmvuhbAgaAcWlvfCEC1uTaOru0X
wMkeP0LU8AlAXm880ZryGMBgdrB9DOIKQDbFalLyzRnAa8i4vtO5C0B8w/MO
voYawKGqgroFfQxA9FWsGW0HG8DSEde/OC8NQDG50xMSMBvAp/80LibTDUBw
xOT8/TYbwP0u2xnsag5AvFbAkXkGG8B1u1A8OPgOQA0vwyqg3xrARa39AWV8
D0ASAy/T8sUawM/y/cSN+A9ADGTqVCGSGsBugreezjYQQBr3+RJucxrAQROE
BCxuEECmlH14+DsawHOrOz+yohBABFyW2qD3GcBVHZMb
       "]]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwB4QQe+yFib1JlAgAAAE0AAAACAAAAWW0CqrFrAsAqQj9oMVATQMa4j6yi
ZwLAl43MaiJME0A0BB2vk2MCwAXZWW0TSBNADps3tHVbAsDfb3Ry9T8TQMLI
bL45SwLAk52pfLkvE0AqJNfSwSoCwPv4E5FBDxNA/Nqr+9HpAcDNr+i5Uc4S
QJ9IVU3yZwHAcB2SC3JMEkDFd7u1WU4AwJZM+HPZMhFAQWL5nNSO/r/yhbkM
6isQQNZvV5JGi/y/eRnRDkZUDkAqJdwRBlz6v8zOVY4FJQxA6+4W8hdS+L+N
mJBuFxsKQGtgeFx3HPa/DQry2HblB0DIbLWKJ/Hzv2oWLwcnugVAko2oGSrr
8b80NyKWKbQDQDashGX0cu+/vf87r3mCAUAhZiRZOVrrv2W5F1I47P4/xlV7
1B9W578LqW7NHuj6P+qUH2Sh+uK/L+gSXaCM9j/O+V9qj9PdvypQI67Ge/I/
xGgbNRID1b9MDwInECfsP2CGih6wt8i/uOkrAdZ/4z85vR2xnSexv64rXLzK
29Y/XBZvOEzbsT+SB1ceV2m1P5RRTQuIRMk/CwkATxj5xb8B7ZbUfnzVP/SM
YMUBsdy/wcUYlHYt3j86HzKieAnnv2gmYWiSJOM/Sabb3iYl779xmmhyzonn
Py1HdXnP9/O/oeUDu2Wk6z9dkhDCZhL4vxb753tbqu8/0af0glwY/L+HYD8U
2wPyP+W2xZfbOgDAFq/UCTYN9D90BVuNNkQCwOZVQ3VDQvY/RKzJ+EN5BMDZ
YdYcAG34Pze4XKAApAbAX1mzY2py+j+9rznnaqkIwCapaSCHo/w/hP/vo4fa
CsCA5Gl8Ua/+P9468P9R5gzAfkJHimVYAEBa2xSYy+cOwNw+RpH7bgFAC2oJ
03uKEMAEMepn6HICQDNcralojhHATc96ea6MA0B8+j27LqgSwF9jsFrLkwRA
jo5znEuvE8ADKvjZv5UFQDJVuxtAsRTAx5wslI2tBkD2x+/VDckVwFUFBh6y
sgdAhDDJXzLOFsADGszir80IQDJFjyQw6RfAQmGkRYXjCUBxjGeHBf8YwEue
IXix5gpAesnkuTECGsB1h4vltv8LQKSyTic3GxvAaGaaIhMGDUCXkV1kkyEc
wO13u/1GBw5AHKN+P8ciHcCSNckTVB4PQMFgjFXUOR7AgfS9/FsREEAxFD87
OD4fwI6FpFWhExBASzYM7cJCH8CaFouu5hUQQGNY2Z5NRx/AsjhYYHEaEECT
nHMCY1AfwOR88sOGIxBA9ySoyY1iH8BGBSeLsTUQQLs1EVjjhh/ACxaQGQda
EEBFV+N0js8fwBindnJMXBBAX3mwJhnUH8AkOF3LkV4QQHebfdij2B/APFoq
fRxjEECn3xc8ueEfwG6exOAxbBBAC2hMA+TzH8DQJvmnXH4QQGi82sgcDCDA
3LffAKKAEEBzTcEhYg4gwOhIxlnnghBAgN6neqcQIMABa5MLcocQQJgAdSwy
FSDAMq8tb4eQEEDJRA+QRx4gwD5AFMjMkhBA1dX16IwgIMBL0fogEpUQQONm
3EHSIiDAZPPH0pyZEED8iKnzXCcgwHCErivimxBABxqQTKIpIMB8FZWEJ54Q
QBOrdqXnKyDAiKZ73WygEEAfPF3+LC4gwJU3YjayohBALM1DV3IwIMCglTDa

      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/\[CapitalDelta]t\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{1.0529562307328943`, -7.1434030750070034`},
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
error (Strang splitting)\\nJ=1, h=1/2, g=-1, L=5, t=5, \
tol=\\!\\(\\*SuperscriptBox[\\(10\\), \\(-8\\)]\\)\"", TraditionalForm],
  PlotRange->{{1.1007397207733063`, 
   4.1588830833596715`}, {-7.06372040277721, -2.1233947245301}},
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
        AbsoluteThickness[0.1]}}, {2.995732273553991, 
       FormBox["20", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {3.912023005428146, 
       FormBox["50", TraditionalForm], {0.01, 0.}, {
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
        AbsoluteThickness[0.1]}}, {4.605170185988092, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}, {{-6.907755278982137, 
       FormBox[
        TemplateBox[{"\[Times]", "\"\[Times]\"", "1.`", 
          TemplateBox[{"10", 
            RowBox[{"-", "3"}]}, "Superscript", SyntaxForm -> 
           SuperscriptBox]}, "RowWithSeparators"], TraditionalForm], {0.01, 
       0.}, {
        AbsoluteThickness[0.1]}}, {-6.214608098422191, 
       FormBox[
        TemplateBox[{"\[Times]", "\"\[Times]\"", "2.`", 
          TemplateBox[{"10", 
            RowBox[{"-", "3"}]}, "Superscript", SyntaxForm -> 
           SuperscriptBox]}, "RowWithSeparators"], TraditionalForm], {0.01, 
       0.}, {
        AbsoluteThickness[0.1]}}, {-5.298317366548036, 
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
        AbsoluteThickness[0.1]}}, {-3.912023005428146, 
       FormBox[
        TagBox[
         InterpretationBox["\"0.02\"", 0.02, AutoDelete -> True], 
         NumberForm[#, {
           DirectedInfinity[1], 2.}]& ], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-2.995732273553991, 
       FormBox[
        TagBox[
         InterpretationBox["\"0.05\"", 0.05, AutoDelete -> True], 
         NumberForm[#, {
           DirectedInfinity[1], 2.}]& ], TraditionalForm], {0.01, 0.}, {
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
        AbsoluteThickness[0.1]}}, {-0.6931471805599453, 
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
       RowBox[{"{", 
        RowBox[{"0", ",", "0"}], "}"}]}], ",", 
      RowBox[{"J", "=", "1"}], ",", 
      RowBox[{"h", "=", 
       FractionBox["1", "2"]}], ",", 
      RowBox[{"g", "=", 
       RowBox[{"-", "1"}]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"t", "=", "5"}], ",", 
      RowBox[{"tol", "=", 
       SuperscriptBox["10", 
        RowBox[{"-", "12"}]]}], ",", "Atref"}], "}"}], ",", 
    RowBox[{
     RowBox[{"Atref", "=", 
      RowBox[{
       RowBox[{"MatrixExp", "[", 
        RowBox[{
         RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", 
         RowBox[{"N", "[", 
          RowBox[{"HIsing", "[", 
           RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}]}], "]"}],
        ".", 
       RowBox[{"MPOMergeFull", "[", 
        RowBox[{"First", "/@", 
         SubscriptBox["A", "rnd"]}], "]"}], ".", 
       RowBox[{"MatrixExp", "[", 
        RowBox[{"\[ImaginaryI]", " ", "t", " ", 
         RowBox[{"N", "[", 
          RowBox[{"HIsing", "[", 
           RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}]}], 
        "]"}]}]}], ";", 
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
                    RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}],
                    ",", "qd", ",", 
                   RowBox[{"\[ImaginaryI]", " ", "t"}], ",", "nsteps", ",", 
                   "tol"}], "]"}]}], "]"}], "-", "Atref"}], "]"}]}], "}"}], 
           ",", 
           RowBox[{"{", 
            RowBox[{"nsteps", ",", "8", ",", "120", ",", "8"}], "}"}]}], 
          "]"}], ",", 
         RowBox[{"AxesLabel", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"\"\<1/\[CapitalDelta]t\>\"", ",", "\"\<err\>\""}], 
           "}"}]}], ",", 
         RowBox[{"PlotLabel", "\[Rule]", 
          RowBox[{
          "\"\<\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[ImaginaryI]\)\
\\\ t\\\ H\)]\) X \!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\[ImaginaryI]\\\
\ t\\\ H\)]\) MPO approximation error (\!\(\*SubsuperscriptBox[\(SRKN\), \
\(6\), \(b\)]\))\\nJ=\>\"", "<>", 
           RowBox[{"ToString", "[", "J", "]"}], "<>", "\"\<, h=\>\"", "<>", 
           RowBox[{"ToString", "[", 
            RowBox[{"InputForm", "[", "h", "]"}], "]"}], "<>", "\"\<, g=\>\"",
            "<>", 
           RowBox[{"ToString", "[", "g", "]"}], "<>", "\"\<, L=\>\"", "<>", 
           RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, t=\>\"", "<>", 
           RowBox[{"ToString", "[", "t", "]"}], "<>", 
           "\"\<, tol=\!\(\*SuperscriptBox[\(10\), \(-12\)]\)\>\""}]}], ",", 
         RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
       RowBox[{"LogLogPlot", "[", 
        RowBox[{
         RowBox[{"0.0125", 
          SuperscriptBox["inv\[CapitalDelta]t", 
           RowBox[{"-", "4"}]]}], ",", 
         RowBox[{"{", 
          RowBox[{"inv\[CapitalDelta]t", ",", 
           RowBox[{"1", "/", "10"}], ",", "25"}], "}"}], ",", 
         RowBox[{"PlotStyle", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{
             RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}], ",", 
            "Dashed"}], "}"}]}], ",", 
         RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]}], "]"}]}]}], 
   "]"}]}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, {{}, 
     {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
      0.019444444444444445`], AbsoluteThickness[1.6], 
      PointBox[{{0.47000362924573563`, -6.01078348443618}, {
       1.1631508098056809`, -9.044697256426348}, {
       1.5686159179138452`, -10.685251644043673`}, {
       1.8562979903656263`, -11.842302495170248`}, {
       2.0794415416798357`, -12.737771849124977`}, {
       2.2617630984737906`, -13.468623109703412`}, {
       2.4159137783010487`, -14.086166999828471`}, {
       2.5494451709255714`, -14.620902392616607`}, {
       2.667228206581955, -15.09245220867986}, {
       2.772588722239781, -15.217405999473076`}, {
       2.8678989020441064`, -15.551084723732531`}, {
       2.954910279033736, -15.566869321278125`}, {
       3.0349529867072724`, -15.272254768553315`}, {
       3.109060958860994, -15.346227254180334`}, {
       3.1780538303479458`, -15.557401129528015`}}]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwB4QQe+yFib1JlAgAAAE0AAAACAAAAB5SVrLFrAsDJp7JbMVATQMbe0tU5
aALARz0trkFJE0CEKRD/wWQCwMTSpwBSQhNAAL+KUdJdAsC8/ZylcjQTQPjp
f/byTwLArFOH77MYE0DqP2pANDQCwJD/W4M24RJAzes+1Lb8AcBWVwWrO3IS
QJND6Pu7jQHA4QZY+kWUEUCMvLnCGp0AwKfx9Q8HZg9AIBP0fdd4/7+2JfcA
S+MLQNX4XA1KwP2/IvHIHzByCEBjccOLZeL7vz3ilRxntgRACJIHdWUk+r+I
Ix7vZjoBQIdFSU0OQfi/ChVDP3Hn+j+yRHO8h2b2v7YR6/tWffM/9Ot6luWr
9L9/XRPInCXpPxAmgF/sy/K/tlx6IKZL1D9CCGOT1wvxv5UAXoWa1r6/Q2xc
vCap7r8VUVL69JThv7Xt7S/w7+q/qSUGluc88L9Uvzp5gnbnv2mCbAPDL/e/
praCoGay47/Fk9y0+rf+v6SKNuvX/9+/NrtVBXgOA8BXSN5AdBrZv13cgdop
gQbAb1F8UrSf0b/R17LRiT4KwMT1IR8MScW/F4Mo8yC8DcDYfd9E3J+ov1aE
URszwhDA4rLfijJlsT9yeyYmhZ0SwKNRKkUGjsY/ecodxvJYFMCEGXzmFcrS
P6aGF3e3ORbA3Gns/pbN2T+8mjO9l/oXwMDF3d3qVuA/JGNnbKeyGcDfMEpe
uBHkP7OYnSwOkBvA0Uv7CL2M5z8tJvaBkE0dwBBBsdVvUus/zSBR6GkwH8D1
npZ0gQbvP+Dn4Vs5hSDAVlbgHmU98T9NayyOS2IhwFnKd5TgHPM/TyX4SAlS
IsBFljGfd9z0P0ULVc7UMSPAhBYDEz6T9j9kyz0IOA0kwOoD15dbb/g/F8Kn
ykb7JMA5Sc2xlCv6P7/koldj2SXAr/vF3CQN/D/6PR9tK8omwA4G4ZzQzv0/
KcMsTQGrJ8DAxBPGq4f/P4IixuFuhyjATHgkAO+yAEBvuOD+h3YpwC060OcV
kgFAT3qM5q5VKsChMv1X6IMCQMNyuVaBRyvAPwW2fFJxA0BhRXJ76zQswNID
AGzKTgRA9EO8amMSLcD4OMvj7T4FQBp5h+KGAi7AEponJh8fBkA02uMkuOIu
wFbVDx3o+gZAeBXMG4G+L8AtR3mcXOkHQKjDms16VjDA+eRz5t7HCECOEpjy
u8UwwJZMfXLAywhAXMacuKzHMMAytIb+oc8IQCp6oX6dyTDAbIOZFmXXCEDH
4aoKf80wwN4hv0br5ghAALG9IkLVMMDEXgqn9wUJQHNP41LI5DDAjtigZxBE
CUBYjC6z1AMxwCtAqvPxRwlAJ0AzecUFMcDIp7N/00sJQPXzNz+2BzHAAXfG
l5ZTCUCSW0HLlwsxwHQV7MccYwlAyypU41oTMcBZUjcoKYIJQD7JeRPhIjHA
9rlAtAqGCUAMfX7Z0SQxwJIhSkDsiQlA2jCDn8ImMcDM8FxYr5EJQHeYjCuk
KjHAPo+CiDWhCUCwZ59DZzIxwNv2ixQXpQlAfxukCVg0McB4XpWg+KgJQE3P
qM9INjHAsS2ouLuwCUDqNrJbKjoxwE6VsUSdtAlAuOq2IRs8McDq/LrQfrgJ
QIaeu+cLPjHAh2TEXGC8CUBVUsCt/D8xwCTMzehBwAlAIwbFc+1BMcBeSlbD

      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/\[CapitalDelta]t\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{0.37039110557237964`, -16.260456196532783`},
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
error (\\!\\(\\*SubsuperscriptBox[\\(SRKN\\), \\(6\\), \\(b\\)]\\))\\nJ=1, \
h=1/2, g=-1, L=5, t=5, tol=\\!\\(\\*SuperscriptBox[\\(10\\), \\(-12\\)]\\)\"",
     TraditionalForm],
  PlotRange->{{0.41358591672277295`, 
   3.1780538303479458`}, {-16.097762978880453`, -6.01078348443618}},
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
        AbsoluteThickness[0.1]}}}, {{-16.11809565095832, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "7"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-13.815510557964274`, 
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
        AbsoluteThickness[0.1]}}, {-18.420680743952367`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-17.72753356339242, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-17.322068455284256`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-17.034386382832476`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-16.811242831518264`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-16.62892127472431, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-16.474770594897052`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-16.34123920227253, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-16.223456166616145`, 
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
        AbsoluteThickness[0.1]}}, {-4.605170185988091, 
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

Cell["Response function using MPO approximation", "Subsubsection"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{"J", "=", "1"}], ",", 
      RowBox[{"h", "=", 
       FractionBox["1", "2"]}], ",", 
      RowBox[{"g", "=", 
       RowBox[{"-", "1"}]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", 
      RowBox[{"t", "=", "5"}]}], "}"}], ",", 
    RowBox[{"\[Chi]A", "[", 
     RowBox[{
      RowBox[{"N", "[", 
       RowBox[{"\[Sigma]zOp", "[", 
        RowBox[{"0", ",", "L"}], "]"}], "]"}], ",", 
      RowBox[{"N", "[", 
       RowBox[{"\[Sigma]zOp", "[", 
        RowBox[{"2", ",", "L"}], "]"}], "]"}], ",", 
      RowBox[{"N", "[", 
       RowBox[{"HIsing", "[", 
        RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
      "\[Beta]", ",", "t"}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"-", "0.02479236160468455`"}], "+", 
  RowBox[{"0.01644609853019221`", " ", "\[ImaginaryI]"}]}]], "Output"]
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
       RowBox[{"{", 
        RowBox[{"0", ",", "0"}], "}"}]}], ",", 
      RowBox[{"\[Sigma]z", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"ArrayReshape", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"1", ",", "0"}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"0", ",", 
               RowBox[{"-", "1"}]}], "}"}]}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"2", ",", "2", ",", "1", ",", "1"}], "}"}]}], "]"}], ",", 
         RowBox[{"{", "0", "}"}], ",", 
         RowBox[{"{", "0", "}"}]}], "}"}]}], ",", 
      RowBox[{"J", "=", "1"}], ",", 
      RowBox[{"h", "=", 
       FractionBox["1", "2"]}], ",", 
      RowBox[{"g", "=", 
       RowBox[{"-", "1"}]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", 
      RowBox[{"\[CapitalDelta]\[Beta]", "=", 
       RowBox[{
        SubscriptBox["\[Beta]", "val"], "/", "16"}]}], ",", "\[Rho]\[Beta]", 
      ",", 
      RowBox[{"t", "=", "5"}], ",", 
      RowBox[{"\[CapitalDelta]t", "=", 
       RowBox[{"1", "/", "8"}]}], ",", "\[Rho]\[Beta]A", ",", 
      "\[Rho]\[Beta]B", ",", 
      RowBox[{"tol", "=", 
       SuperscriptBox["10", 
        RowBox[{"-", "13"}]]}]}], "}"}], ",", 
    RowBox[{
     RowBox[{"\[Rho]\[Beta]", "=", 
      RowBox[{"MPOStrangEvolution", "[", 
       RowBox[{
        RowBox[{"IdMPO", "[", "L", "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"h2", "[", 
          RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
        "qd", ",", 
        RowBox[{
         FractionBox["1", "2"], "\[Beta]"}], ",", 
        RowBox[{"\[Beta]", "/", "\[CapitalDelta]\[Beta]"}], ",", "tol"}], 
       "]"}]}], ";", 
     RowBox[{"\[Rho]\[Beta]A", "=", 
      RowBox[{"MPOSRKNb6Evolution", "[", 
       RowBox[{
        RowBox[{"MPOSingleSiteTopUpdate", "[", 
         RowBox[{"\[Rho]\[Beta]", ",", "3", ",", "\[Sigma]z"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"h2", "[", 
          RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
        "qd", ",", 
        RowBox[{"\[ImaginaryI]", " ", "t"}], ",", 
        RowBox[{"t", "/", "\[CapitalDelta]t"}], ",", "tol"}], "]"}]}], ";", 
     RowBox[{"\[Rho]\[Beta]B", "=", 
      RowBox[{"MPOSRKNb6Evolution", "[", 
       RowBox[{
        RowBox[{"MPOSRKNb6Evolution", "[", 
         RowBox[{
          RowBox[{"MPOSingleSiteTopUpdate", "[", 
           RowBox[{
            RowBox[{"IdMPO", "[", "L", "]"}], ",", "5", ",", "\[Sigma]z"}], 
           "]"}], ",", 
          RowBox[{"N", "[", 
           RowBox[{"h2", "[", 
            RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
          "qd", ",", 
          RowBox[{
           RowBox[{"-", "\[ImaginaryI]"}], " ", "t"}], ",", 
          RowBox[{"t", "/", "\[CapitalDelta]t"}], ",", "tol"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"h2", "[", 
          RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
        "qd", ",", 
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
          RowBox[{"\[Sigma]zOp", "[", 
           RowBox[{"0", ",", "L"}], "]"}], "]"}], ",", 
         RowBox[{"N", "[", 
          RowBox[{"\[Sigma]zOp", "[", 
           RowBox[{"2", ",", "L"}], "]"}], "]"}], ",", 
         RowBox[{"N", "[", 
          RowBox[{"HIsing", "[", 
           RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
         "\[Beta]", ",", "t"}], "]"}]}], "]"}]}]}], "]"}]}]], "Input"],

Cell[BoxData["2.26612742439616`*^-6"], "Output"]
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
       RowBox[{"{", 
        RowBox[{"0", ",", "0"}], "}"}]}], ",", 
      RowBox[{"\[Sigma]z", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"ArrayReshape", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"1", ",", "0"}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"0", ",", 
               RowBox[{"-", "1"}]}], "}"}]}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"2", ",", "2", ",", "1", ",", "1"}], "}"}]}], "]"}], ",", 
         RowBox[{"{", "0", "}"}], ",", 
         RowBox[{"{", "0", "}"}]}], "}"}]}], ",", 
      RowBox[{"J", "=", "1"}], ",", 
      RowBox[{"h", "=", 
       FractionBox["1", "2"]}], ",", 
      RowBox[{"g", "=", 
       RowBox[{"-", "1"}]}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", 
      RowBox[{"\[CapitalDelta]\[Beta]", "=", 
       RowBox[{
        SubscriptBox["\[Beta]", "val"], "/", "16"}]}], ",", "\[Rho]\[Beta]", 
      ",", 
      RowBox[{"t", "=", "5"}], ",", "tA", ",", "tB", ",", 
      RowBox[{"\[CapitalDelta]t", "=", 
       RowBox[{"1", "/", "8"}]}], ",", "\[Rho]\[Beta]A", ",", 
      "\[Rho]\[Beta]B", ",", 
      RowBox[{"tol", "=", 
       SuperscriptBox["10", 
        RowBox[{"-", "13"}]]}]}], "}"}], ",", 
    RowBox[{
     RowBox[{"tA", "=", 
      FractionBox["t", "2"]}], ";", 
     RowBox[{"tB", "=", 
      FractionBox["t", "2"]}], ";", 
     RowBox[{"\[Rho]\[Beta]", "=", 
      RowBox[{"MPOStrangEvolution", "[", 
       RowBox[{
        RowBox[{"IdMPO", "[", "L", "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"h2", "[", 
          RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
        "qd", ",", 
        RowBox[{
         FractionBox["1", "2"], "\[Beta]"}], ",", 
        RowBox[{"\[Beta]", "/", "\[CapitalDelta]\[Beta]"}], ",", "tol"}], 
       "]"}]}], ";", 
     RowBox[{"\[Rho]\[Beta]A", "=", 
      RowBox[{"MPOSRKNb6LiouvilleEvolution", "[", 
       RowBox[{
        RowBox[{"MPOSingleSiteTopUpdate", "[", 
         RowBox[{"\[Rho]\[Beta]", ",", "3", ",", "\[Sigma]z"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"h2", "[", 
          RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
        "qd", ",", 
        RowBox[{"\[ImaginaryI]", " ", "tA"}], ",", 
        RowBox[{"tA", "/", "\[CapitalDelta]t"}], ",", "tol"}], "]"}]}], ";", 
     RowBox[{"\[Rho]\[Beta]B", "=", 
      RowBox[{"MPOSRKNb6LiouvilleEvolution", "[", 
       RowBox[{
        RowBox[{"MPOSingleSiteBottomUpdate", "[", 
         RowBox[{"\[Rho]\[Beta]", ",", "5", ",", "\[Sigma]z"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"h2", "[", 
          RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
        "qd", ",", 
        RowBox[{
         RowBox[{"-", "\[ImaginaryI]"}], " ", "tB"}], ",", 
        RowBox[{"tB", "/", "\[CapitalDelta]t"}], ",", "tol"}], "]"}]}], ";", 
     RowBox[{"{", 
      RowBox[{
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
            RowBox[{"\[Sigma]zOp", "[", 
             RowBox[{"0", ",", "L"}], "]"}], "]"}], ",", 
           RowBox[{"N", "[", 
            RowBox[{"\[Sigma]zOp", "[", 
             RowBox[{"2", ",", "L"}], "]"}], "]"}], ",", 
           RowBox[{"N", "[", 
            RowBox[{"HIsing", "[", 
             RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", 
           "\[Beta]", ",", "t"}], "]"}]}], "]"}], ",", 
       RowBox[{"Rest", "/@", "\[Rho]\[Beta]B"}]}], "}"}]}]}], 
   "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"2.583015896637376`*^-6", ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", "0", "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
        "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", 
         "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",",
          "0", ",", "0"}], "}"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
        "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", 
         "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",",
          "0", ",", "0"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
        "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", 
         "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",",
          "0", ",", "0"}], "}"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
        "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", 
         "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",", "0", ",",
          "0", ",", "0"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"0", ",", "0", ",", "0", ",", "0"}], "}"}], ",", 
       RowBox[{"{", "0", "}"}]}], "}"}]}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"{", 
       RowBox[{"0", ",", "0"}], "}"}]}], ",", 
     RowBox[{"\[Sigma]z", "=", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"ArrayReshape", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"1", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", 
              RowBox[{"-", "1"}]}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"2", ",", "2", ",", "1", ",", "1"}], "}"}]}], "]"}], ",", 
        RowBox[{"{", "0", "}"}], ",", 
        RowBox[{"{", "0", "}"}]}], "}"}]}], ",", 
     RowBox[{"J", "=", "1"}], ",", 
     RowBox[{"h", "=", 
      FractionBox["1", "2"]}], ",", 
     RowBox[{"g", "=", 
      RowBox[{"-", "1"}]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"\[Beta]", "=", 
      SubscriptBox["\[Beta]", "val"]}], ",", 
     RowBox[{"\[CapitalDelta]\[Beta]", "=", 
      RowBox[{
       SubscriptBox["\[Beta]", "val"], "/", "16"}]}], ",", "\[Rho]\[Beta]", 
     ",", 
     RowBox[{"\[CapitalDelta]t", "=", 
      RowBox[{"1", "/", "8"}]}], ",", "\[Rho]\[Beta]A", ",", "\[Rho]\[Beta]B",
      ",", 
     RowBox[{"tol", "=", 
      SuperscriptBox["10", 
       RowBox[{"-", "13"}]]}]}], "}"}], ",", 
   RowBox[{
    RowBox[{"\[Rho]\[Beta]", "=", 
     RowBox[{"MPOStrangEvolution", "[", 
      RowBox[{
       RowBox[{"IdMPO", "[", "L", "]"}], ",", 
       RowBox[{"N", "[", 
        RowBox[{"h2", "[", 
         RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", "qd",
        ",", 
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
           RowBox[{
            RowBox[{"\[Rho]\[Beta]A", "=", 
             RowBox[{"MPOSRKNb6Evolution", "[", 
              RowBox[{
               RowBox[{"MPOSingleSiteTopUpdate", "[", 
                RowBox[{"\[Rho]\[Beta]", ",", "3", ",", "\[Sigma]z"}], "]"}], 
               ",", 
               RowBox[{"N", "[", 
                RowBox[{"h2", "[", 
                 RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], 
               ",", "qd", ",", 
               RowBox[{"\[ImaginaryI]", " ", "n", " ", "\[CapitalDelta]t"}], 
               ",", "n", ",", "tol"}], "]"}]}], ";", 
            RowBox[{"\[Rho]\[Beta]B", "=", 
             RowBox[{"MPOSRKNb6Evolution", "[", 
              RowBox[{
               RowBox[{"MPOSRKNb6Evolution", "[", 
                RowBox[{
                 RowBox[{"MPOSingleSiteTopUpdate", "[", 
                  RowBox[{
                   RowBox[{"IdMPO", "[", "L", "]"}], ",", "5", ",", 
                   "\[Sigma]z"}], "]"}], ",", 
                 RowBox[{"N", "[", 
                  RowBox[{"h2", "[", 
                   RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], 
                 ",", "qd", ",", 
                 RowBox[{
                  RowBox[{"-", "\[ImaginaryI]"}], " ", "n", " ", 
                  "\[CapitalDelta]t"}], ",", "n", ",", "tol"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"h2", "[", 
                 RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], 
               ",", "qd", ",", 
               RowBox[{
                FractionBox["1", "2"], "\[Beta]"}], ",", 
               RowBox[{"\[Beta]", "/", "\[CapitalDelta]\[Beta]"}], ",", 
               "tol"}], "]"}]}], ";", 
            RowBox[{"{", 
             RowBox[{
              RowBox[{"n", " ", "\[CapitalDelta]t"}], ",", 
              RowBox[{
               SuperscriptBox[
                RowBox[{"MPOFrobeniusNorm", "[", 
                 RowBox[{"First", "/@", "\[Rho]\[Beta]"}], "]"}], 
                RowBox[{"-", "2"}]], 
               RowBox[{"MPOTraceProduct", "[", 
                RowBox[{
                 RowBox[{"First", "/@", "\[Rho]\[Beta]B"}], ",", 
                 RowBox[{"First", "/@", "\[Rho]\[Beta]A"}]}], "]"}]}]}], 
             "}"}]}], ",", 
           RowBox[{"{", 
            RowBox[{"n", ",", "0", ",", "40"}], "}"}]}], "]"}], "]"}], ",", 
        RowBox[{"AxesLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
          "\"\<t\>\"", ",", 
           "\"\<Re[\!\(\*SubscriptBox[\(\[Chi]\), \(A, \
B\)]\)[\[Beta],t]]\>\""}], "}"}]}], ",", 
        RowBox[{"PlotLabel", "\[Rule]", 
         RowBox[{"\"\<J=\>\"", "<>", 
          RowBox[{"ToString", "[", "J", "]"}], "<>", "\"\<, h=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "h", "]"}], "]"}], "<>", "\"\<, g=\>\"", 
          "<>", 
          RowBox[{"ToString", "[", "g", "]"}], "<>", "\"\<, L=\>\"", "<>", 
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
                RowBox[{"\[Sigma]zOp", "[", 
                 RowBox[{"0", ",", "L"}], "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"\[Sigma]zOp", "[", 
                 RowBox[{"2", ",", "L"}], "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"HIsing", "[", 
                 RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], 
               ",", "\[Beta]", ",", "t"}], "]"}]}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"t", ",", "0", ",", "5", ",", "0.01"}], "}"}]}], "]"}], 
         "]"}], ",", 
        RowBox[{"PlotStyle", "\[Rule]", 
         RowBox[{
          RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}]}]}], "]"}]}],
      "]"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.019444444444444445`],
      AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJxTTMoPSmViYGDQBGIQDQONVzg/HP17xh7CO2DPwK7XHPUPxr9grxB49Z05
41ko/4Z9Sdud15kcMP4De2lzVfUnwjD+E/vgRj3+elkY/4X9wgv3s8+Iwvhv
7B+vvxpx+RHM/A/2PzdMEZueCON/sp/0t/nvoqzTUP4X+4/v7IQNbp6E8r/Z
n0y05942+TiU/8NeKDrZnHXKESj/l33Nw6SWjW8OQPl/7LUezFZ9NnknlP/P
XvX48Y6GWxugfAYHc+HZykcmLoDyGR1iLJ7pG3nGQ/lMDh2OnImG36fvh/CZ
HV4K7baLaVwK5bM4cDy2Ml2qtBrKZ3XQsjh3MfX0GiifzSFw6s20rqOroHx2
h53RKdtubYTp53Aocw0NCv05B8rndJi14XqYqH4nlM/l8OzyLBu+e5lQ93A7
CK/VknLhnwDl8zhEVCnVVj+eDuXzOoS9Se140TwTyudz6Fp59wnb0SlQPr/D
XT+OjkeqrVC+gANL/7fNvw9lQuxrEHB4XZE1+a/BJKj9gg76vya1r7k0Hyov
6PDWg0n42d8lUHkhhxOdBTM+LlsOlRdyCBI7srZ1A5TPIOzQeCokxi4J6t8G
YQfJqWaeMpkLofIiDkt+cFROTpq5HwCudcVC
      "]]}, {}}, {{}, {{}, {}, 
     {RGBColor[0.922526, 0.385626, 0.209179], PointSize[0.008333333333333333],
       AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJw92Hk8VO0XAPCx78yihV6VXqVQKRVv9fYc7VKKFvX+KIWkVYuUSohUZBeS
fZli0iKS1Eh2M2UpFMlOlCwREb+pObf7j89h5t77nO9zzzmX+r5jZraiNBpt
QIRG+/WTOkZ/qO5WGeORc8qp6xqdPYihg6+G6p84mOw+c+TcX4I4c6pnl2lm
FBHTgyPT//w9gby47yo3SxDfDP913CH7ii8cnfvn86lkwHph+hJB/Nn0128e
EPsNDImVf77/iNSm5F/dLIhlq+Md/pV9TLydOk7t+XO+J8TrRfLP44J4joVf
7sDsbDJq72jl9ef8z4nuWpf6aEGcIPh2dXwOKWNsffb0z/VeEF/H/9bWCmK9
38dLct3RuGDsz/XzyPHYCJ9Z4zzycmC24Ar5ZNi2pdNsnLqfQjK/iSzyEMRm
vy9YRPrvRmZnjVP3V0xsR5VqBgVxo/OvE5aQywGM9wY0Pt4vj5SO5ym7CeLj
v27PgU88kufWvBbEwvt/ReLkrY/PFOEToUYZcc5/PsddEAvXU0Y6eiTWtgni
9b8vUE7qtvpKmInycX3l5Frrnth8QfzrahZ+FSR/5VZjQzE+rreSjITOnZsv
iH8vp7qSVPtn2ZmK83H9b0haXQujTRBP+3U7U98Sv2q+/iUJPubjLRlsb3k3
W5JP7Pb/OqqIqfp4V5UgFuanmizPOrbtuhSf/Dqbcmo1MWtV7zKW5mO+asix
m4/OMGX4ZPDX6QZqyPK6sPQGQSzM3zviJaFnlCHLJyt+n/A90UwaLwqU42M+
35PvTtmPHeX55PftedYS568hHrsVqPzWEU7nrmsbFfmEz/t11JHFY/cUiRKV
7w9E4YO54WI6n0z4fYP15OL2o8vmMaj815Mtu56MzWbyye/TWXwkbp4jpzRY
lEcDeRK++dg0ZWo9DcTZ2Cdx8gTKp4HsbLifrjiRWl8Dedf739+0SZRXI1HO
WWPeNYlabyMROVYZ9Woy5ddIFl6L0b6tQq2/ibhpzGCdVqU8m8hQm4nJkilU
PppIsuXWJ21TKN9mosUzZXn+ReWnmQyWzx1TVKO8m0n+NJsxNzUqXy3E80K3
c60a5d9C1vxv0bPJU6n8tZChGdK9S6ZS+6GV2Lg80NCbSuWzlWQ9FzeSnUrt
j1bi5ee14Ikald82oqEWH7xcjdovbUST1ywX8BeV7zZim7BWOW0KtX/aSf+l
YMVoVSr/7cRtYSkxVaH2UzuJtg4uz59EeXSQdY9KKoYmUB4d5B+OvEEbi/Lo
IDF5lnVXGZRHB+k7+dbtoyLl8YmsMrCoaJKjPD4Rg+DTVn7SlMcnYtmjdrtB
nPLoJCrGbKUKwfPq/9ujk/AiH3fsHqWe904iU7PmuPt3qr50kZRNyW/0+3jo
0UW8jzzVcf7MQ48ukhr43X11G1XPPpOZ2U/LAz5S9egzWdB7WcKyhocen8kw
c8NYTBkPPb6Q6KqX/juLeOjxhXy81eHlwqXq1xfiU7U9SSGDhx7dRCe6jE3j
8NCjm+gueL3SLJaqn91kQbm81s8Qqt59JSqFmoqjV3no8ZVYDa6PNrrAQ4+v
ZGvsG9+GYzz06CEj7/4OeLqXWk8PeaW+ds9bM6pe9pAl90syZ6+i1tdDYsv8
be8vpOp1D/lYGKVvp06tt4esSRyTX6/EQ78e4rs3pnzTaCmuv5ecSgK3kx2l
6NlLnoVsnfOoshTz0Uu86/s6ZZ+Xom8v8Tn6avQEuxTz00vOiU272+5Xit69
5O3HcGsbp1LMVx9Z1mAT32JZiv59ZO8cWQWbVaWYvz4SmHjQql6zFJ/PPjLH
PdVls1wp5rOPdNUuPJz2pQT3Rx9JLThpJvm6BPPbT9bV9LqtvleC+6WfcPYw
Tx30LcF895OWQ8O8U4dLcP/0k5nFFpZWRiWY/37yeuJmDa2ZJbif+omEqqjp
6/Fi9PhGsh0urt70rhg9vpH04h1BsQ+K0eMbiSsEqZIrxejxjbSnp8fk7S5G
j2/k/VKnMD+9YvT4RqwXyu+dI1WMHt/Ixqa5t/3fFaHHAHHPnrkzL7kIPQbI
m3bV8JfORegxQB7yTCquGxWhxwCJ/rQuZcakIvQYIA3/dMq7NxeixwCxP39+
Bie1ED0GyYz08P9izxSixyDpX6N4YJ9hIXoMkinSMSt7pAvRY5D4vM3R3Pi6
AD0Gic6IVoRTcAF6DJLtKnZ2p3YWoMd3YjS6NGr1lAL0+E5WSImEd9blo8d3
ol3ZPnQgMh89vhN+qgo71yIfPb4Tp6zSNz9U89HjO5lrvWhEuSYPPYbIGbp9
rXJwHnoMkRkNM1zGTPLQY4gcszioVyWdhx5DZM8MrcCYFy/RY4g8OX/bad/Z
l+gxRELEOiTVdV+ixxAxtvrKbmzNRY9hkrJ7SDL5Zi56DBMvj8ssV5Nc9Bgm
Mxxtx+1FctFjmMQ6+P17NO0FegyTwC2jrkE2L9BjmLgf3PW0QfkFevwg3eXJ
UyzzctDjB1lxvkqefjIHPX6QadUqi0TUc7Be/iAnat7UO9zioscPEnzMg31u
4Dl6/CDbiu/v0Nv0HD1GSJ+Jb/vt+GfoMUK+jK3I/DKUjR4j5N32ak/Wpmz0
GCH+m1Ye0Il5ih4jpHKh5KsNfVnoMUI8p312cluVhR6j5Oug96nmoCfoMUpm
v3o+xaM5Ez1GSV/GsIzTwkz0GCXbPwdOKXN9jB6jZMS+3y7+VQZ6jBJf2uPl
En9loMcouTKSPVnWPh09fpK209rsgvRH6PGTvLlol7VZ9BF6/CTdM8XXZZmk
ocdPMhKWvHtKxEP0+EkcnH5qXWl/gB4/yZ0DZzsmLHqAHmNE8a/tje9c76PH
GHl3Lb+sIuIeeoyRE0s72WlLUtFjjDyrD+p1reCgxxjRsB0ysj2Wgh5jhLFg
fLG3QjJ6jJM3QyYqandvo8c4iaCf1lljwkaPcXLnoe7Jub2J6DFOyjPLHo6H
JKDHOJmkVnKgdXk8eoyT/x21eyHVFoseNFBZecfXLyAG10MDljLbZcPFKPSh
QTrDnNPYEIHro0FuZ3mu3vpw9KKB55EnLb7pN8jv5e6nAb0jSgvmBKMfDXxl
FgUFxQdgfaCBhU9bO9vIFz1pEGd8+U3If1cxHzSYKDP/ppvgPUjoS4P2pE3n
+7ZexPzQIH/iY3F6pSN600BmTs28d20HMF8iUH4iOjTsvhH6i8DA5F3Mj37m
XGH+REBVQbr1YNoRrnA/iECNjMPnuclOXGE+RWC6/blGfS1XrnB/iEDal5ka
RYc8uML8ikBgwY7328OvcIX7RQRGsywTTjz04QrzLQJfCw7X7vqfP1e4f0Rg
3oG2bzVmgVxh/kXghd6OZg8SzBXuJxGY1pNeMlf9BlfIIQqttLWPEr+HcoUe
omBvOTk4JzecK/QQBbkadZNt7hFcoYcozEl5k2WwJJIr9BAFX/t1Kevqo7jC
/ScKF4scT8/7N4Yr9BCFb0GHZmlLxHKFHqIg7WbGlymM5Qo9RCEn2mn7U/c4
rtBDFLZ3p3EWGMRzhR6iUHvVKH9PezxX6CEKTc+Cbvzjn8AVeojClBZvtUcL
E7lCDzHQlZ1pmf8qkSv0EIODO1x329gkoYcYDE4Y1b3an4QeYlBvN61T5zwb
PcTgo7VNotEYGz3EYCii6dL7s7fRQwx2cGtTartvo4cYZP+ts36D5R30EAO7
xhgvjfw76CEG6VMW37KflYweYpAxop+l4paMHmJQ+N5i0pK3yeghDifrMz7l
zEhBD3GYZhW7/5l9CnqIw1K9Gy/mJ6eghzjY1PVpqbWkoIc4nI27+8p7Egc9
xGHnppEK99Uc9BAHzoq2HbKHOOghDtqnqh20vTnoIQ4yXxhzexI46CEO77Om
+1hnctBDHOYN6LsF5HPQQxzYEVd6LvM46CG43m6vu6Z8DnpIgOGEWWdpRRz0
kIC2W+Pjcdkc9JAAXY5jjVEKBz0koIKe4yoZzEEPCZj08LNF12kOekhAmu/r
R3LbOOghAROqGx+c0+aghwSEaStZbvmZgh4SUNx57FZ0cQp6SIDn/q+6rv4p
6CEBTrl1aTJmKeghAa2zbYO3KaaghyT4fhtQds5PRg9JqDT3XB/slIweklAm
naP0XCMZPSThjoXqRBb/DnpIwtp1L1/dc7iDHpLQG+J0/IHSHfSQhOZqve+L
k2+jhyToLH050QJuo4ckrCqcY7iqgo0ekpC+tyNSzoqNHpJAr50sVfUpCT0k
oT3aSiLvWBJ6SIKoZWbp917q+ZCCswuk9IIdqOdDCp72+qVndyWghxTEzJx/
MMQ6AT2koOH4gfGVNfHoIQVWy1dmdBrFo4cUONl3WzzMjEMPKXinT4xyNOLQ
QwqOrm83W+Ybix5S8HCiB3/DQAx6SEHv/BPuE/+LQQ8p8DF7u+362Wj0kALr
2gq+1LIo9JCGybsyT3cP3UIPadgapCcfnBaBHtLg9HZ1n/Ghm+ghDZeSt8w8
OD0cPaQhgJ6ntaoyFD2kYeKKjSI6HjfQQxoOnYmnO+uFcIX9UxoyX32bfKkx
CD2kwayzRj3SNxA9pGH+he4DU5cFoIc0tB6eEZP1yg89pKFe2vaGleZ19JCG
A6fvRdS6XkMPGZi14ZJDTa0XesjA5BuXroj944keMhBo4tEsHe6OHjKgOJPB
0xy+iB4yEKzuuC+qyBk9ZCB/qOxbUawjeshAZZ9G3pCnA3rIQOjGXVrDn/ej
h+D7b3RPuVXsQg8Z8NPqr3qlaoAeMsCbbjqWK22M84gM+KtZ/6i1scJ+Lguf
6Jt+6jTZYz+XhTuH13XXRBzHfi4LJ0+Yq7stOI39XBbqzYfkG+47Yz+XhYbD
Iaq8yRdxfpGFgKbuZ/RHbtjPZcFJZAJpfHUJ5xlZ2Ksd0m1c54n9XBZEjSyu
FdV6YT+XBQuxtzsreFexn8vC/q3Pt3SkemM/lwVNa0u47nYd+7ng+jZD/etW
+2E/l4NVcnl3Tc/5Yz+Xg6jqAvNJGwNwHpKDtT4XSlYoB+J8JwchBQrTgysD
cT6Sg4R9i0tbrwbhvCcHGxMT2OL6wTgvycFpy+cyee+Dcf6Tg3afdP7wqRCc
n+Qg0pq230XiBs6DcnDCdfInHZ8bOE8Jzp/tOrVZOhQ95MC/S9rb7VwoesjD
9F3rz3c1h6KHPHgw1rOkVoahhzx8XrPD5FlIGHrIw8qro4wf9WHoIQ+RzcwF
HLVw9JCHbfM6T+abhqOHPKSdvBK19Fw4esjDXwF9jmI3w9FDHvbccslTTQ1H
D3no/1vb0uVxOHrIw4vk72rzM8LRQx5qjJf16iaHo4c8mL8b5F8LCkcPBbDf
MP3x2hPh6KEA8mmtT46vDUcPBRgMbeucQg9HDwXQ5O3bt/N1GHooAPfmbv1/
PcLQQwEunsg+2zwvDD0UQL1oo7bd61D0UIAr+9/qt9uGoocCPKplHPbsozwU
oFr/3qH9jpSHAlSVrkl60B2CHgrwmrHNOGB3CHooQq71in8X5gejhyIMp5iL
5c0IRg9FeBj0PeuMUxB6KILnzngpz5eB6KEILndNRKdLBaKHImzIyNK8tDIA
PRTBwm54TaejP3oogvwWg4pZq/zQQxG8Muf4XvC+jh6KQGuJ3W6Z740eivDj
g84zk96r6KEI3Gs7tOuVrqCHIvSujE6OUL+MHkrwyXx2lqqmB3oowUUZbbW+
6e7ooQTLZ22681TJFT2UwGuYrzm74xx6COLTkecXRzqhhxLkjp0TbSYn0UMJ
ZlWEf+iNO4IeSjCzW1vNK8kGPZTANzTM2ljVHD2UgKlbIhJTuhA9lODHDtVu
r0Jj7B9KkC8n66dtZoX9gw7st5F6j/Lssf7SIVo0wmBf/HHsJ3ToHuq2Kj94
Guux4PMDiUs36J/D/kKHJzylxMdirlif6VBzsfJ+72F37Dd0mBi3UCaxygPr
NR0kqnYpaoAX9h86lHDKvr64fRXrNx1CxV40Vyj5cIXvM3SIOHPXknPKF+s5
HaJUDePMDvljf6JDYdMAy/tmANZ3Osj0HsviFAbi/ECH8v1xb2z7grDe02GF
rtlLW9UQ7F90SNP6rG5JbmD9pwNt6uv6n1ah2M/o4NZB2zriEob9gA4KmWt3
yYaHY3+jQ/i2MJvG1JvYH+hQN709xCAnAvsdHeDygvJi3i3MPx0c1erKt7yJ
xP5HB/cFG1Z4V1H9nAFiSfeyDCqj0YMB+3Z4X1CwjUEPBmQrb+h0/hCDHgwI
kKxMKjSLRQ8G1CbWVlXnxaIHA9jlTfn+enHowYCacmZ3TVQcejBAV+bBWKhk
PHowoGdApSnjIDXfMOCa8/qX00rjcT5gQJZnO/O5ZgJ6MODN0S/eLq4J6MGA
5X45+pvfJqAHAzrrWo5Pm5WIHgxYbLew6+OJRPRgALQFc9yfJqIHAz7EbVMZ
GU9EDwYcWPqp519IQg8GzO7ZscXwfBJ6MKBsz6S00bQk9GCAYZhv/4H2JPRg
wLISBWPXiWz0YIBdvY3pCkM2ejAg5oD4aLQdGz0YMBj84Fb8VTZ6MEGKz/+4
ns1GDyZMbtcr8c9howcTpD9yMi68ZaMHE/pnj5mx2tjowYQybtCtHX1s9GDC
UsOiuk0/2OjBhPbt/ASa4P1K6MGEb+1Lip1+stGDCSqu2pbPhqj3MSZwDi2/
W/eVjR6Cz+t0/NPURL2fMYFWWfygtpyNHkxobnXqqs5mowcTHDwmfGyLZ6MH
EyROhUWreLHRgwmOuQVb3fez0YMJjc+65y1ayUYPJlzr/Z/9KlVq/mZCRaW3
QX435cEEy1aNwtdcyoMJt+sf6jhfpzyYoBmtZVtnTs3nTJjjarBeaVoSejCh
JPp/rjrNiejBhN2FZW4mCYnowYK9xza7+e+j5ncWLD4ScVBxaiJ6sGDz6y9V
LVUJ6MEC5U36YguuJ6AHC/QKVxTQDan5ngU8EnU5ri8ePQRxUIyuRFw8erDA
0lZUZ+dm6vlgQerJMNOnP+LQgwVfOB8aTBLi0IMF+oaHHPU2xqEHC6JaLEav
9sWiBwue+8TfORkaix4saC9Y/4WxjPp/AAtk2hIOXBY830IPFhzRvdbc5xKD
HiwwXWFneHZaDHqwwGF//ufTLtHowYJ9cq1DGdlR6MGCnLFG/8HhSPRgwSlL
a5ezSyLRgwUZjAXbL524hR6C9VUctDRPjUAPFvzty7tg0HkTPVgwMU98lv2s
m+ihDKPu6v9oW4dz/w8qbf48
       "]]}}, {}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"t\"", TraditionalForm], 
    FormBox[
    "\"Re[\\!\\(\\*SubscriptBox[\\(\[Chi]\\), \\(A, B\\)]\\)[\[Beta],t]]\"", 
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
  PlotLabel->FormBox[
   "\"J=1, h=1/2, g=-1, L=5, \[Beta]=0.6 (scheme A)\"", TraditionalForm],
  PlotRange->{{0, 5.}, {-0.05623930154898489, 0.22746265641490968`}},
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
      RowBox[{"{", 
       RowBox[{"0", ",", "0"}], "}"}]}], ",", 
     RowBox[{"\[Sigma]z", "=", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"ArrayReshape", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"1", ",", "0"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"0", ",", 
              RowBox[{"-", "1"}]}], "}"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"2", ",", "2", ",", "1", ",", "1"}], "}"}]}], "]"}], ",", 
        RowBox[{"{", "0", "}"}], ",", 
        RowBox[{"{", "0", "}"}]}], "}"}]}], ",", 
     RowBox[{"J", "=", "1"}], ",", 
     RowBox[{"h", "=", 
      FractionBox["1", "2"]}], ",", 
     RowBox[{"g", "=", 
      RowBox[{"-", "1"}]}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"\[Beta]", "=", 
      SubscriptBox["\[Beta]", "val"]}], ",", 
     RowBox[{"\[CapitalDelta]\[Beta]", "=", 
      RowBox[{
       SubscriptBox["\[Beta]", "val"], "/", "16"}]}], ",", "\[Rho]\[Beta]", 
     ",", "tA", ",", "tB", ",", 
     RowBox[{"\[CapitalDelta]t", "=", 
      RowBox[{"1", "/", "8"}]}], ",", "\[Rho]\[Beta]A", ",", "\[Rho]\[Beta]B",
      ",", 
     RowBox[{"tol", "=", 
      SuperscriptBox["10", 
       RowBox[{"-", "13"}]]}]}], "}"}], ",", 
   RowBox[{
    RowBox[{"\[Rho]\[Beta]", "=", 
     RowBox[{"MPOStrangEvolution", "[", 
      RowBox[{
       RowBox[{"IdMPO", "[", "L", "]"}], ",", 
       RowBox[{"N", "[", 
        RowBox[{"h2", "[", 
         RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], ",", "qd",
        ",", 
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
                  RowBox[{"\[Rho]\[Beta]", ",", "3", ",", "\[Sigma]z"}], 
                  "]"}], ",", 
                 RowBox[{"N", "[", 
                  RowBox[{"h2", "[", 
                   RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], 
                 ",", "qd", ",", 
                 RowBox[{"\[ImaginaryI]", " ", "tA"}], ",", 
                 RowBox[{"tA", "/", "\[CapitalDelta]t"}], ",", "tol"}], 
                "]"}]}], ";", 
              RowBox[{"\[Rho]\[Beta]B", "=", 
               RowBox[{"MPOSRKNb6LiouvilleEvolution", "[", 
                RowBox[{
                 RowBox[{"MPOSingleSiteBottomUpdate", "[", 
                  RowBox[{"\[Rho]\[Beta]", ",", "5", ",", "\[Sigma]z"}], 
                  "]"}], ",", 
                 RowBox[{"N", "[", 
                  RowBox[{"h2", "[", 
                   RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], 
                 ",", "qd", ",", 
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
         RowBox[{"\"\<J=\>\"", "<>", 
          RowBox[{"ToString", "[", "J", "]"}], "<>", "\"\<, h=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "h", "]"}], "]"}], "<>", "\"\<, g=\>\"", 
          "<>", 
          RowBox[{"ToString", "[", "g", "]"}], "<>", "\"\<, L=\>\"", "<>", 
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
                RowBox[{"\[Sigma]zOp", "[", 
                 RowBox[{"0", ",", "L"}], "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"\[Sigma]zOp", "[", 
                 RowBox[{"2", ",", "L"}], "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"HIsing", "[", 
                 RowBox[{"J", ",", "h", ",", "g", ",", "L"}], "]"}], "]"}], 
               ",", "\[Beta]", ",", "t"}], "]"}]}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"t", ",", "0", ",", "5", ",", "0.01"}], "}"}]}], "]"}], 
         "]"}], ",", 
        RowBox[{"PlotStyle", "\[Rule]", 
         RowBox[{
          RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}]}]}], "]"}]}],
      "]"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.019444444444444445`],
      AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJxTTMoPSmViYGAQBWIQDQPP/Srtpvw9Yw/hXbA/1JbwhZ3xLJT/wP7yNhmB
PcIw/gv7uJlJcqtEYfwP9qIMLW4NiTD9X+z5V2vM1Lx5Esr/YT9LS+Ajx5Qj
UP4f+zdnTu19M3knlM/g8C52vuieiQugfCaH81clAyu/T98P4bM4HHfYPfut
0moon83h84ZFMu+OroLyORwea13Kkfs1B8rncth/gffq/xuZUPN4HP7U/Kjk
fzwdyudzWCyWsnzLkSlQvoDDBOfHIWuOZUL1Czrs2Ss6L+DyfChfyGEFm+Vc
8+XLoXxhh60TL76MTloK5Ys4TDv6fm1d0sz9AB8/aVs=
      "]]}, {}}, {{}, {{}, {}, 
     {RGBColor[0.922526, 0.385626, 0.209179], PointSize[0.008333333333333333],
       AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJw92Hc8lf8XAHDr2uMOLaXSVyk0VRrfb5/TNqLS1JfyC2l+G0JTiCRlhLjJ
Hre4DSVJ6lK2e4kyimRkhITMrN+te56ef3qd5Pk8n/P+POecJ439x81sJcTE
xHrFxcR+/Uldwz/V9k4a5ZPzqg821p1zJ2tP+Giq/YkDyfozx85PEcapUz3a
tqaGk3F6cGz6n5/HkrxHLgqzhPFt9q/rHjmVf/G/uX/+/QPSYb3o6VJh3L71
198kEWsjBm3Nn99PJtWJ2V6bhbF8RcyJf+SfkWtOLaf3/bnfc3I2M2HkpDCe
Y+H7und2OqEddrDy/HP/V2TcBueaCGEcK/ztipgMksvY9vLFn/UyibfDng1V
wljv9/WG+DoY54z+WT+LOEaFXp81xidvemcLV8gmX22/tJqNUc+TS5bWk8Xu
wtjs94J5pP1+WHraGPV8+cRqWKWyTxjXnft1wwJyxp/xcZmYAJ+XT96PZam6
CuOTvx7vhICEJcytLBbGoucvIs8VrU/OFBcQkcZbcj771Rw3YSzaz1vyrZO2
oUkYG/xeoITUbPOhmUkIcH8lxKdxX1S2MP61moVvKXmxZpvxakkB7vcdkQ6Z
OzdbGP/eTsU7UuGXZrdVSoD7f0+iq78wmoTxtF+PM7WMuFQI9C/TBJiPMkJr
+fJhtrSA2B34dZWTrRpjbeXCWJSfCrIk7fj2GzIC8utuqg8qyPpGjTZjWQHm
q5I43k4+w5QTkL5ft+utJH9XhzytFcai/H0g3jQ9wxR5AVn1+4YfiU78WN5N
BQHm8yPpc0p/5qAoIL8fz6OKnPke5L5XicpvNUlqNb+2SVlABPxfVzXRHX2o
TFSofH8iap92rV5CF5Bxvx+whlza8d/KeQwq/zVki/nz0dlMAfl9O4vPxNNj
6LQmi/KoJcnszcenqVL7qSVOxtfjJo6jfGrJ7tpHT5XHU/urJWVde/4Sm0B5
1RFGxvpdbROo/dYR6ePvwosmUn51ZN61SJ27k6j91xMPzRksRzXKs54MNJma
Lp1M5aOeRFlue940mfJtILr8rSyPKVR+GkhfydxRZXXKu4FkT7MZdVWn8vWF
eFzsOFelTvl/Iev/Xfxy4lQqf1/IzxmyXUunUuehkdg4J2nqTaXy2Ugev5Iy
lJ9KnY9G4unrufC5OpXfJjJdPSbwb3XqvDQRLX6Dgv8UKt9N5EjsBtUnk6nz
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
Rg9VUL6ssVzHms37P2+u/PE=
       "]]}}, {}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"t\"", TraditionalForm], 
    FormBox[
    "\"Re[\\!\\(\\*SubscriptBox[\\(\[Chi]\\), \\(A, B\\)]\\)[\[Beta],t]]\"", 
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
  PlotLabel->FormBox[
   "\"J=1, h=1/2, g=-1, L=5, \[Beta]=0.6 (scheme C)\"", TraditionalForm],
  PlotRange->{{0, 5.}, {-0.05300085569399609, 0.22722364886903795`}},
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
WindowSize->{1414, 952},
WindowMargins->{{309, Automatic}, {46, Automatic}},
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
Cell[1486, 35, 66, 0, 63, "Section"],
Cell[1555, 37, 123, 3, 31, "Input"],
Cell[1681, 42, 53, 1, 31, "Input"],
Cell[CellGroupData[{
Cell[1759, 47, 61, 0, 43, "Subsection"],
Cell[1823, 49, 297, 9, 31, "Input"],
Cell[2123, 60, 2831, 80, 98, "Input"],
Cell[4957, 142, 233, 7, 52, "Input"],
Cell[CellGroupData[{
Cell[5215, 153, 209, 6, 46, "Input"],
Cell[5427, 161, 75, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5539, 168, 280, 8, 46, "Input"],
Cell[5822, 178, 1269, 25, 52, "Output"]
}, Open  ]],
Cell[7106, 206, 122, 4, 31, "Input"],
Cell[CellGroupData[{
Cell[7253, 214, 759, 23, 67, "Input"],
Cell[8015, 239, 3136, 56, 146, "Output"]
}, Open  ]],
Cell[11166, 298, 738, 23, 33, "Input"],
Cell[CellGroupData[{
Cell[11929, 325, 151, 4, 31, "Input"],
Cell[12083, 331, 75, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12195, 338, 205, 5, 52, "Input"],
Cell[12403, 345, 1169, 31, 146, "Output"]
}, Open  ]],
Cell[13587, 379, 330, 11, 46, "Input"],
Cell[CellGroupData[{
Cell[13942, 394, 687, 21, 67, "Input"],
Cell[14632, 417, 46, 0, 31, "Output"]
}, Open  ]],
Cell[14693, 420, 231, 7, 31, "Input"],
Cell[CellGroupData[{
Cell[14949, 431, 958, 29, 67, "Input"],
Cell[15910, 462, 30, 0, 31, "Output"]
}, Open  ]],
Cell[15955, 465, 1183, 36, 69, "Input"],
Cell[CellGroupData[{
Cell[17163, 505, 968, 28, 67, "Input"],
Cell[18134, 535, 143, 2, 31, "Output"]
}, Open  ]],
Cell[18292, 540, 1747, 50, 89, "Input"],
Cell[CellGroupData[{
Cell[20064, 594, 1506, 42, 95, "Input"],
Cell[21573, 638, 51, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[21661, 643, 1844, 50, 75, "Input"],
Cell[23508, 695, 15545, 267, 253, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[39102, 968, 36, 0, 43, "Subsection"],
Cell[39141, 970, 3348, 97, 115, "Input"],
Cell[CellGroupData[{
Cell[42514, 1071, 1118, 30, 54, "Input"],
Cell[43635, 1103, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[43700, 1108, 243, 6, 52, "Input"],
Cell[43946, 1116, 4365, 136, 112, "Output"]
}, Open  ]],
Cell[48326, 1255, 668, 19, 52, "Input"],
Cell[CellGroupData[{
Cell[49019, 1278, 298, 8, 72, "Input"],
Cell[49320, 1288, 2713, 92, 52, "Output"],
Cell[52036, 1382, 448, 12, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[52521, 1399, 488, 14, 54, "Input"],
Cell[53012, 1415, 28, 0, 31, "Output"]
}, Open  ]],
Cell[53055, 1418, 133, 3, 30, "Text"],
Cell[CellGroupData[{
Cell[53213, 1425, 225, 8, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[53463, 1437, 1351, 38, 88, "Input"],
Cell[54817, 1477, 448, 12, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[55302, 1494, 1179, 36, 69, "Input"],
Cell[56484, 1532, 49, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[56570, 1537, 3684, 95, 225, "Input"],
Cell[60257, 1634, 20560, 505, 280, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[80854, 2144, 3732, 97, 243, "Input"],
Cell[84589, 2243, 23963, 586, 282, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[108601, 2835, 215, 7, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[108841, 2846, 3286, 85, 187, "Input"],
Cell[112130, 2933, 16198, 392, 269, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[128365, 3330, 3456, 89, 207, "Input"],
Cell[131824, 3421, 17691, 432, 279, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[149552, 3858, 3615, 91, 179, "Input"],
Cell[153170, 3951, 28686, 716, 282, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[181893, 4672, 3498, 89, 179, "Input"],
Cell[185394, 4763, 30266, 754, 281, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[215709, 5523, 335, 10, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[216069, 5537, 1911, 55, 92, "Input"],
Cell[217983, 5594, 448, 12, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[218468, 5611, 151, 4, 31, "Input"],
Cell[218622, 5617, 46, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[218705, 5622, 3792, 98, 207, "Input"],
Cell[222500, 5722, 17191, 416, 269, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[239728, 6143, 4132, 104, 227, "Input"],
Cell[243863, 6249, 26178, 647, 282, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[270090, 6902, 66, 0, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[270181, 6906, 968, 28, 67, "Input"],
Cell[271152, 6936, 141, 3, 31, "Output"]
}, Open  ]],
Cell[271308, 6942, 533, 15, 31, "Input"],
Cell[271844, 6959, 537, 15, 31, "Input"],
Cell[CellGroupData[{
Cell[272406, 6978, 4473, 120, 215, "Input"],
Cell[276882, 7100, 48, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[276967, 7105, 4356, 116, 243, "Input"],
Cell[281326, 7223, 1706, 44, 76, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[283069, 7272, 6250, 157, 259, "Input"],
Cell[289322, 7431, 9185, 164, 252, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[298544, 7600, 6178, 155, 279, "Input"],
Cell[304725, 7757, 8888, 159, 252, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Bv0qDVnwtECQsDgJHSq798E9 *)
