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
NotebookDataLength[    307360,       7951]
NotebookOptionsPosition[    303104,       7787]
NotebookOutlinePosition[    303447,       7802]
CellTagsIndexPosition[    303404,       7799]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Matrix product operators for the Heisenberg model", "Section"],

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
   "construct", " ", "Heisenberg", " ", "Hamiltonian", " ", "with", " ", 
    "open", " ", "boundary", " ", "conditions"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"HHeisenberg", "[", 
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
  RowBox[{"HHeisenberg", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      SubscriptBox["J", "x"], ",", 
      SubscriptBox["J", "y"], ",", 
      SubscriptBox["J", "z"]}], "}"}], ",", "1", ",", 
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
    RowBox[{"HHeisenberg", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{"1", ",", "1", ",", "0"}], "}"}], ",", "1", ",", 
      SubscriptBox["L", "val"]}], "]"}], "]"}], "]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"-", "2.5`"}], ",", 
   RowBox[{"-", "2.3660254037844384`"}], ",", 
   RowBox[{"-", "2.`"}], ",", 
   RowBox[{"-", "1.8660254037844386`"}], ",", 
   RowBox[{"-", "1.5`"}], ",", 
   RowBox[{"-", "1.3660254037844386`"}], ",", 
   RowBox[{"-", "1.`"}], ",", 
   RowBox[{"-", "1.`"}], ",", 
   RowBox[{"-", "0.8660254037844386`"}], ",", 
   RowBox[{"-", "0.8660254037844386`"}], ",", 
   RowBox[{"-", "0.6339745962155614`"}], ",", 
   RowBox[{"-", "0.5`"}], ",", 
   RowBox[{"-", "0.5`"}], ",", 
   RowBox[{"-", "0.3660254037844386`"}], ",", 
   RowBox[{"-", "0.1339745962155614`"}], ",", "0.`", ",", "0.`", ",", 
   "0.1339745962155614`", ",", "0.3660254037844386`", ",", "0.5`", ",", 
   "0.5`", ",", "0.6339745962155614`", ",", "0.8660254037844386`", ",", 
   "0.8660254037844386`", ",", "1.`", ",", "1.`", ",", "1.3660254037844386`", 
   ",", "1.5`", ",", "1.8660254037844386`", ",", "2.`", ",", 
   "2.3660254037844384`", ",", "2.5`"}], "}"}]], "Output"]
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
       RowBox[{"J", "=", 
        RowBox[{"{", 
         RowBox[{"1", ",", "1", ",", "0"}], "}"}]}], ",", 
       RowBox[{"h", "=", "1"}], ",", 
       RowBox[{"L", "=", "4"}], ",", 
       RowBox[{"\[Beta]", "=", 
        SubscriptBox["\[Beta]", "val"]}]}], "}"}], ",", 
     RowBox[{"MatrixExp", "[", 
      RowBox[{
       RowBox[{"-", 
        FractionBox["\[Beta]", "2"]}], 
       RowBox[{"N", "[", 
        RowBox[{"HHeisenberg", "[", 
         RowBox[{"J", ",", "h", ",", "L"}], "]"}], "]"}]}], "]"}]}], "]"}], "//",
    "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"1.8221188003905084`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", 
      "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`"},
     {"0.`", "1.3651017732172341`", 
      RowBox[{"-", "0.2040016892863668`"}], "0.`", "0.015271503359704716`", 
      "0.`", "0.`", "0.`", 
      RowBox[{"-", "0.0007618618657355918`"}], "0.`", "0.`", "0.`", "0.`", 
      "0.`", "0.`", "0.`"},
     {"0.`", 
      RowBox[{"-", "0.20400168928636686`"}], "1.3803732765769392`", "0.`", 
      RowBox[{"-", "0.2047635511521024`"}], "0.`", "0.`", "0.`", 
      "0.015271503359704716`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", 
      "0.`"},
     {"0.`", "0.`", "0.`", "1.0113134873150118`", "0.`", 
      RowBox[{"-", "0.15169574795311488`"}], "0.011355865053353472`", "0.`", 
      "0.`", "0.011355865053353472`", 
      RowBox[{"-", "0.0011326148015022035`"}], "0.`", 
      "0.000042377738341505236`", "0.`", "0.`", "0.`"},
     {"0.`", "0.015271503359704725`", 
      RowBox[{"-", "0.20476355115210243`"}], "0.`", "1.380373276576939`", 
      "0.`", "0.`", "0.`", 
      RowBox[{"-", "0.2040016892863668`"}], "0.`", "0.`", "0.`", "0.`", "0.`",
       "0.`", "0.`"},
     {"0.`", "0.`", "0.`", 
      RowBox[{"-", "0.15169574795311486`"}], "0.`", "1.034025217421719`", 
      RowBox[{"-", "0.15282836275461706`"}], "0.`", "0.`", 
      RowBox[{"-", "0.15282836275461706`"}], "0.022754107845048454`", "0.`", 
      RowBox[{"-", "0.0011326148015022037`"}], "0.`", "0.`", "0.`"},
     {"0.`", "0.`", "0.`", "0.011355865053353472`", "0.`", 
      RowBox[{"-", "0.1528283627546171`"}], "1.022711730106707`", "0.`", 
      "0.`", "0.022711730106706945`", 
      RowBox[{"-", "0.1528283627546171`"}], "0.`", "0.01135586505335348`", 
      "0.`", "0.`", "0.`"},
     {"0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.7491837375942069`", 
      "0.`", "0.`", "0.`", 
      RowBox[{"-", "0.11195850086319618`"}], "0.`", "0.008381178744454971`", 
      RowBox[{"-", "0.0004181186570119979`"}], "0.`"},
     {"0.`", 
      RowBox[{"-", "0.0007618618657355928`"}], "0.015271503359704725`", "0.`", 
      RowBox[{"-", "0.20400168928636686`"}], "0.`", "0.`", "0.`", 
      "1.3651017732172341`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`"},
     {"0.`", "0.`", "0.`", "0.011355865053353474`", "0.`", 
      RowBox[{"-", "0.1528283627546171`"}], "0.022711730106706948`", "0.`", 
      "0.`", "1.022711730106707`", 
      RowBox[{"-", "0.15282836275461706`"}], "0.`", "0.011355865053353478`", 
      "0.`", "0.`", "0.`"},
     {"0.`", "0.`", "0.`", 
      RowBox[{"-", "0.0011326148015022033`"}], "0.`", "0.022754107845048457`", 
      RowBox[{"-", "0.15282836275461706`"}], "0.`", "0.`", 
      RowBox[{"-", "0.15282836275461706`"}], "1.034025217421719`", "0.`", 
      RowBox[{"-", "0.15169574795311488`"}], "0.`", "0.`", "0.`"},
     {"0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", 
      RowBox[{"-", "0.11195850086319621`"}], "0.`", "0.`", "0.`", 
      "0.757564916338662`", "0.`", 
      RowBox[{"-", "0.11237661952020822`"}], "0.00838117874445497`", "0.`"},
     {"0.`", "0.`", "0.`", "0.00004237773834150523`", "0.`", 
      RowBox[{"-", "0.0011326148015022033`"}], "0.011355865053353472`", "0.`",
       "0.`", "0.011355865053353474`", 
      RowBox[{"-", "0.15169574795311488`"}], "0.`", "1.011313487315012`", 
      "0.`", "0.`", "0.`"},
     {"0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.00838117874445497`",
       "0.`", "0.`", "0.`", 
      RowBox[{"-", "0.11237661952020822`"}], "0.`", "0.757564916338662`", 
      RowBox[{"-", "0.11195850086319617`"}], "0.`"},
     {"0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", 
      RowBox[{"-", "0.00041811865701199774`"}], "0.`", "0.`", "0.`", 
      "0.008381178744454968`", "0.`", 
      RowBox[{"-", "0.1119585008631962`"}], "0.7491837375942069`", "0.`"},
     {"0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", "0.`", 
      "0.`", "0.`", "0.`", "0.`", "0.`", "0.5488116360940266`"}
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
    Automatic, {16, 16}, 0., {
     1, {{0, 1, 5, 9, 15, 19, 25, 31, 35, 39, 45, 51, 55, 61, 65, 69, 70}, {{
       1}, {2}, {3}, {5}, {9}, {2}, {3}, {5}, {9}, {4}, {6}, {7}, {10}, {
       11}, {13}, {2}, {3}, {5}, {9}, {4}, {6}, {7}, {10}, {11}, {13}, {4}, {
       6}, {7}, {10}, {11}, {13}, {8}, {12}, {14}, {15}, {2}, {3}, {5}, {9}, {
       4}, {6}, {7}, {10}, {11}, {13}, {4}, {6}, {7}, {10}, {11}, {13}, {8}, {
       12}, {14}, {15}, {4}, {6}, {7}, {10}, {11}, {13}, {8}, {12}, {14}, {
       15}, {8}, {12}, {14}, {15}, {16}}}, CompressedData["
1:eJxTTMoPSmVkYGBwA+K3KwW509T/2h++/+tLyfWv9l7qL4x3yZzav+PNm+pV
bv32F0MEn3395rHfByo+b+cnTyaxb/bzLc5pbjRFqLsSocAbrvfB3j3AWOtI
1uH92h90MvY5ttvD6PZ9TI/a+4L27zvbynDDnM1+L1TfAqg5c6Hmwux3g5oz
jecgW1z3B/vDod8tH/Yf3g+jhY11Q275TLfvgJoLs+cIVP7g5gU/2WI/QO2f
DhfXh6orNijVCfj53F66ZPtn/5V79pf/un9ETavRXnefzte7adb7b0H9DXMn
zP+wcNJBs08Hag/MXpg79aDq2qDuFIG6G90/MH/Cwk8W6q64DR3Hf9i+sL+z
YM3FbUf27C+DunMvNBzb0PwPcxfMnKvQeIHpg5kDM1cKao8W1N+lUHUyUHFY
OD1lmZZ9t/+hPQCLcCrD
      "]}]]]]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"SzOp", "[", 
   RowBox[{"n_", ",", "L_"}], "]"}], ":=", 
  RowBox[{"KroneckerProduct", "[", 
   RowBox[{
    RowBox[{"SparseIdentityMatrix", "[", 
     SuperscriptBox["2", 
      RowBox[{
       RowBox[{"Floor", "[", 
        RowBox[{"L", "/", "2"}], "]"}], "+", "n"}]], "]"}], ",", 
    RowBox[{
     FractionBox["1", "2"], 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"1", ",", "0"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"0", ",", 
         RowBox[{"-", "1"}]}], "}"}]}], "}"}]}], ",", 
    RowBox[{"SparseIdentityMatrix", "[", 
     SuperscriptBox["2", 
      RowBox[{"L", "-", 
       RowBox[{"Floor", "[", 
        RowBox[{"L", "/", "2"}], "]"}], "-", "1", "-", "n"}]], "]"}]}], 
   "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{"SzOp", "[", 
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
   RowBox[{"SzOp", "[", 
    RowBox[{"1", ",", "3"}], "]"}], "//", "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      FractionBox["1", "2"], "0", "0", "0", "0", "0", "0", "0"},
     {"0", 
      RowBox[{"-", 
       FractionBox["1", "2"]}], "0", "0", "0", "0", "0", "0"},
     {"0", "0", 
      FractionBox["1", "2"], "0", "0", "0", "0", "0"},
     {"0", "0", "0", 
      RowBox[{"-", 
       FractionBox["1", "2"]}], "0", "0", "0", "0"},
     {"0", "0", "0", "0", 
      FractionBox["1", "2"], "0", "0", "0"},
     {"0", "0", "0", "0", "0", 
      RowBox[{"-", 
       FractionBox["1", "2"]}], "0", "0"},
     {"0", "0", "0", "0", "0", "0", 
      FractionBox["1", "2"], "0"},
     {"0", "0", "0", "0", "0", "0", "0", 
      RowBox[{"-", 
       FractionBox["1", "2"]}]}
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
       8}}}, {Rational[1, 2], Rational[-1, 2], Rational[1, 2], 
       Rational[-1, 2], Rational[1, 2], Rational[-1, 2], Rational[1, 2], 
       Rational[-1, 2]}}]]]]], "Output"]
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
      RowBox[{"J", "=", 
       RowBox[{"{", 
        RowBox[{"1", ",", "1", ",", "0"}], "}"}]}], ",", 
      RowBox[{"h", "=", "1"}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}]}], "}"}], ",", 
    RowBox[{"Z", "[", 
     RowBox[{
      RowBox[{"N", "[", 
       RowBox[{"HHeisenberg", "[", 
        RowBox[{"J", ",", "h", ",", "L"}], "]"}], "]"}], ",", "\[Beta]"}], 
     "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["43.34675792803854`"], "Output"]
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
      RowBox[{"J", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"1", "/", "2"}], ",", 
         RowBox[{"2", "/", "3"}], ",", 
         RowBox[{"5", "/", "7"}]}], "}"}]}], ",", 
      RowBox[{"h", "=", "1"}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}]}], "}"}], ",", 
    RowBox[{"Abs", "[", 
     RowBox[{
      RowBox[{"Z", "[", 
       RowBox[{
        RowBox[{"N", "[", 
         RowBox[{"HHeisenberg", "[", 
          RowBox[{"J", ",", "h", ",", "L"}], "]"}], "]"}], ",", "\[Beta]"}], 
       "]"}], "-", 
      RowBox[{"Zref", "[", 
       RowBox[{
        RowBox[{"N", "[", 
         RowBox[{"HHeisenberg", "[", 
          RowBox[{"J", ",", "h", ",", "L"}], "]"}], "]"}], ",", "\[Beta]"}], 
       "]"}]}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["1.4210854715202004`*^-14"], "Output"]
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
      RowBox[{"J", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"1", "/", "2"}], ",", 
         RowBox[{"2", "/", "3"}], ",", 
         RowBox[{"5", "/", "7"}]}], "}"}]}], ",", 
      RowBox[{"h", "=", "1"}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", 
      RowBox[{"t", "=", "7"}]}], "}"}], ",", 
    RowBox[{"\[Chi]A", "[", 
     RowBox[{
      RowBox[{"N", "[", 
       RowBox[{"SzOp", "[", 
        RowBox[{"0", ",", "L"}], "]"}], "]"}], ",", 
      RowBox[{"N", "[", 
       RowBox[{"SzOp", "[", 
        RowBox[{"2", ",", "L"}], "]"}], "]"}], ",", 
      RowBox[{"N", "[", 
       RowBox[{"HHeisenberg", "[", 
        RowBox[{"J", ",", "h", ",", "L"}], "]"}], "]"}], ",", "\[Beta]", ",", 
      "t"}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"0.07128885994362352`", "\[VeryThinSpace]", "-", 
  RowBox[{"0.0029684020962690992`", " ", "\[ImaginaryI]"}]}]], "Output"]
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
      RowBox[{"J", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"1", "/", "2"}], ",", 
         RowBox[{"2", "/", "3"}], ",", 
         RowBox[{"5", "/", "7"}]}], "}"}]}], ",", 
      RowBox[{"h", "=", "1"}], ",", 
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
         RowBox[{"SzOp", "[", 
          RowBox[{"0", ",", "L"}], "]"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"SzOp", "[", 
          RowBox[{"2", ",", "L"}], "]"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"HHeisenberg", "[", 
          RowBox[{"J", ",", "h", ",", "L"}], "]"}], "]"}], ",", "\[Beta]", 
        ",", "t"}], "]"}], "-", 
      RowBox[{"\[Chi]A", "[", 
       RowBox[{
        RowBox[{"N", "[", 
         RowBox[{"SzOp", "[", 
          RowBox[{"0", ",", "L"}], "]"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"SzOp", "[", 
          RowBox[{"2", ",", "L"}], "]"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"HHeisenberg", "[", 
          RowBox[{"J", ",", "h", ",", "L"}], "]"}], "]"}], ",", "\[Beta]", 
        ",", "t"}], "]"}]}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["2.7758963540648015`*^-17"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"J", "=", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"1", "/", "2"}], ",", 
        RowBox[{"2", "/", "3"}], ",", 
        RowBox[{"5", "/", "7"}]}], "}"}]}], ",", 
     RowBox[{"h", "=", "1"}], ",", 
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
             RowBox[{"SzOp", "[", 
              RowBox[{"0", ",", "L"}], "]"}], "]"}], ",", 
            RowBox[{"N", "[", 
             RowBox[{"SzOp", "[", 
              RowBox[{"2", ",", "L"}], "]"}], "]"}], ",", 
            RowBox[{"N", "[", 
             RowBox[{"HHeisenberg", "[", 
              RowBox[{"J", ",", "h", ",", "L"}], "]"}], "]"}], ",", "\[Beta]",
             ",", "t"}], "]"}]}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"t", ",", "0", ",", "50", ",", "0.1"}], "}"}]}], "]"}], 
      "]"}], ",", 
     RowBox[{"AxesLabel", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{
       "\"\<t\>\"", ",", 
        "\"\<Re[\!\(\*SubscriptBox[\(\[Chi]\), \(A, B\)]\)[\[Beta],t]]\>\""}],
        "}"}]}], ",", 
     RowBox[{"PlotLabel", "\[Rule]", 
      RowBox[{"\"\<h=\>\"", "<>", 
       RowBox[{"ToString", "[", "h", "]"}], "<>", "\"\<, L=\>\"", "<>", 
       RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, \[Beta]=\>\"", "<>", 
       RowBox[{"ToString", "[", 
        RowBox[{"N", "[", "\[Beta]", "]"}], "]"}]}]}]}], "]"}]}], 
  "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, 
   {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.008333333333333333], 
    AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJw9mXlcjdvbxjMkjkShRHNsDZrn8bn21N60y3GMKcpQaETmsWMuJUpORUTz
HCHq5CREyJShwklRZKYUmd7O616//Y/P/vTs73Ota61139dadOeH/eHfV05O
7lMfObn//mWfcTF3z67wjOOSk/77nOXmtMQrqP/vew038+Mb/niPOM7a6r9P
HSc26b7WV8b+3sDxpmQHT3aP437RnnBKjXVRb93Z80+5hftv+H7t5S0K+O/T
xrmrpVlUT2e/b+eO+YzIuTEvjqu9/t/nNWf75PfZFSsY7z2XtWFoks9e9vwH
ThIud2Lvacbv4Py8bNMnt7Pfd3KftNNWJhrF0/u6uAJ3a9fADfHE+8xheYF8
+ZN44n3h5Hj2+0K99hPvK3dpT7Wrx4v9xPvGPYy4PuTrngTi/eAOx0/veut5
gHhy6OK3FQca/kXPy+Gu/2GVcO1E4vfBm4Zw3RqLJPp9X8SuuNXvmV8yva8f
pu8xe/Mq/yDx+mNr6jze6ZEpxOuPRrP77lXJh4knj1rLBUGHNFOJNwAnsio3
f+pJJZ4CiqbX/8x5dpR4AxFlf6GhtuEY8QZCt2mu1KMhjXiDMGvWpGXvmtOJ
9xsEa32SvD5mEG8wDsqHPFEZlEU8RfQYnF6+a2w28RRR0qOjoSLMId4QNB7e
btA9P5d4SqhVEK4P35JHvKEoKNt55e8j+cQbBo0Jeg8VzhbQ88NwctzhOzHX
C4k/DL5OFW776ou4//+5lTIWRy07cjykmN6nDLfylq6S9mLiqUBbVrkvxvc4
8VTwp4+8TdSN48RTQWrpaz952xOkZzjmfTX6GpRwgnjDUSxfdt7l9QnijcBj
l4KtSo4lxBsB1QUirZ2bSog3AvLdWi4BZ0uINxJXOgY/jnhZQryRmHVp9b4q
5ZPEU4WH6ttoE7OTxFNFdfrOkEbBSeKpwthg2Y1u2UniqSGusF9qjcdJ4qnh
Ac9Umi1mvFFYq+MQ89Oa8UZhN8d5eGgw3iiM7Bkur/ON6VNHt8EFw5H3mD51
lH+bNetBVgnxRiPlpqOfxko23tEYrNXPJM2FjXc0RrbtTLDoy3hjoJgYqBp3
gfk3BtZT+Zv3bWH+aSDzxYDkb9wJ4mnggPmPuynf2Hxo4ODkqG7Hs8eJp4nu
psMv41YdJ54m2odNSfG2OU48Ldzgnx2CrmLiaaFsRtnGf88WE08L6ruCGqsj
iomnjRm3b3mvdWfrRRvt5Z7z/Eez9aKDm15Xxtx+yNaXDtxKN7gfii4ivg6q
j2+enSIpot/rYECyZK/2kCJ6nw5G7BibL31cSDxdwD91n/qZQuLpYvi67XPD
UgqJp4ttoxKa+scUEk8Xtit1Z63Ywda7LnrC1+x1iGQ8PcS2T9c+uZ/x9GAT
5/3UMJvx9OBiXHGsporx9BDdeOVKwVPG04NJVZxj06Ai4uljdkeGyyzrIvJH
H+M3KIYozGfj1Ue9t1bZnX1svProd956dXIVG68+lOt3BDp3MN5YWPrtDHdX
Zn6PxdFUy85L49n8jIXRmT2qW5yZ/2PR73vp2C+ebL7Gwjtc5V7uXDYf4yCS
vDqnFcR44/ClY/ffreGMNw6jm1ZbH1zDeOOw48MfwrY1jDcOnmK1ynUrGI+H
pqRbI0b/j8eDuHjw83gfxuPhx6e10dVSxuNBrW/LxCNmjMdDjL6dz2hlxhuP
QVO/JG9vZP6Nx7tx+y0W7mL+jYeB8SqR9gTm33hY9QlS1qlm8zEeu8VuxS9m
sPk1ANf2WazSVEA8A6xtjB/u7svqoQHiRvFDptXnE88AiXHuaXLu+cQzwJ9v
XzwzP5NHPEO8PPdQt06H1VtDNF9a+aZpO6vHhrDvcVkw6wWr14ZwtS0bLJqY
QzxDWEWfO1eYk008IyyxQkTmb9nEM8L6ernpDiFZxDNC3ulFQ8LvZBLPCNJN
iwZ4O2USzwj7M2xbPmRnEM8YPZeLnc00WH8xxrYF3LyfCaz/GCP4Xdcgvlo6
8YxR27+fxYXUNOIZo/pR8A+BVRrxJmBaeu6jJTePEW9C7350OHdt5THiTUB7
2K2UVt4x4k2A7pe9fI2nR4k3AT9nqEnLc1m/NMEz4Y5tnRuPEs8EvAcX85t8
jhLPBMYjbLzXSY4SzwTmjdIF2S6MZ4KP25NWWXOMZwpT732qt90ZzxRBG6fV
qi9gPFOUaYRm7d/GeKZYq/agraSI8UwBzvb5g6eMZ4am2f8YTdFh4zXDuM67
O+YvZOM1Q0Vi5CJhERuvGcIrPHX15Jh/ZtBo3CnlzWD+mWPLiqkK4cWUB9TN
MSrxWKChUjrVG3M4Rh9JDQxN//V7mTlaGv30Z99i82WOH12t17StaH4jzFHi
73G1PSGD3m+OPaUKf77tzvjFKzHHKa8wfugstj7MsV3214uTpzN/8drMUVDr
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

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
  PlotLabel->FormBox["\"h=1, L=5, \[Beta]=0.6\"", TraditionalForm],
  PlotRange->{{0, 50.}, {0, 0.07931194454766402}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
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
    RowBox[{
    "local", " ", "Hamiltonian", " ", "operators", " ", "acting", " ", "on", 
     " ", "neighboring", " ", "lattice", " ", "sites"}], ",", " ", 
    RowBox[{
     RowBox[{"for", " ", "special", " ", "case", " ", 
      SubscriptBox["J", "x"]}], "\[Equal]", 
     SubscriptBox["J", "y"]}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"h2", "[", 
    RowBox[{"Jxy_", ",", "Jz_", ",", "h_", ",", "L_"}], "]"}], ":=", 
   RowBox[{"Module", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"Sup", "=", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"0", ",", "1"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "0"}], "}"}]}], "}"}]}], ",", 
       RowBox[{"Sdn", "=", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"1", ",", "0"}], "}"}]}], "}"}]}], ",", 
       RowBox[{"Sz", "=", 
        RowBox[{
         FractionBox["1", "2"], 
         RowBox[{"{", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"1", ",", "0"}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"0", ",", 
             RowBox[{"-", "1"}]}], "}"}]}], "}"}]}]}], ",", 
       RowBox[{"id", "=", 
        RowBox[{"IdentityMatrix", "[", "2", "]"}]}], ",", "SzI", ",", "ISz"}],
       "}"}], ",", 
     RowBox[{
      RowBox[{"SzI", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{"Sz", ",", "id"}], "]"}]}], ";", 
      RowBox[{"ISz", "=", 
       RowBox[{"KroneckerProduct", "[", 
        RowBox[{"id", ",", "Sz"}], "]"}]}], ";", 
      RowBox[{
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{
          RowBox[{
           FractionBox["1", "2"], "Jxy", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"KroneckerProduct", "[", 
              RowBox[{"Sup", ",", "Sdn"}], "]"}], "+", 
             RowBox[{"KroneckerProduct", "[", 
              RowBox[{"Sdn", ",", "Sup"}], "]"}]}], ")"}]}], "+", 
          RowBox[{"Jz", " ", 
           RowBox[{"KroneckerProduct", "[", 
            RowBox[{"Sz", ",", "Sz"}], "]"}]}]}], ",", 
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

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"check", ":", " ", 
    RowBox[{"compare", " ", "with", " ", "reference", " ", "Hamiltonian"}]}], 
   " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"Jxy", ",", "Jz", ",", "h", ",", 
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
             SuperscriptBox["2", 
              RowBox[{"j", "-", "1"}]], "]"}], ",", 
            RowBox[{
             RowBox[{"h2", "[", 
              RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], 
             "\[LeftDoubleBracket]", "j", "\[RightDoubleBracket]"}], ",", 
            RowBox[{"SparseIdentityMatrix", "[", 
             SuperscriptBox["2", 
              RowBox[{"L", "-", "j", "-", "1"}]], "]"}]}], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{"j", ",", "1", ",", 
            RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}], "-", 
        RowBox[{"HHeisenberg", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"Jxy", ",", "Jxy", ",", "Jz"}], "}"}], ",", "h", ",", 
          "L"}], "]"}]}], "]"}], "]"}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["0"], "Output"]
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
   RowBox[{"h2", "[", 
    RowBox[{
     SubscriptBox["J", "xy"], ",", 
     SubscriptBox["J", "z"], ",", "h", ",", "7"}], "]"}]}]}]], "Input"],

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
   RowBox[{"h2", "[", 
    RowBox[{
     SubscriptBox["J", "xy"], ",", 
     SubscriptBox["J", "z"], ",", "h", ",", 
     SubscriptBox["L", "val"]}], "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   TagBox[
    RowBox[{"(", "\[NoBreak]", GridBox[{
       {
        RowBox[{
         RowBox[{"-", 
          FractionBox[
           RowBox[{"3", " ", "h"}], "4"]}], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0", "0", "0"},
       {"0", 
        RowBox[{
         RowBox[{"-", 
          FractionBox["h", "4"]}], "-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], 
        FractionBox[
         SubscriptBox["J", "xy"], "2"], "0"},
       {"0", 
        FractionBox[
         SubscriptBox["J", "xy"], "2"], 
        RowBox[{
         FractionBox["h", "4"], "-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox[
          RowBox[{"3", " ", "h"}], "4"], "+", 
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
          FractionBox["h", "2"]}], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0", "0", "0"},
       {"0", 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], 
        FractionBox[
         SubscriptBox["J", "xy"], "2"], "0"},
       {"0", 
        FractionBox[
         SubscriptBox["J", "xy"], "2"], 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox["h", "2"], "+", 
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
          FractionBox["h", "2"]}], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0", "0", "0"},
       {"0", 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], 
        FractionBox[
         SubscriptBox["J", "xy"], "2"], "0"},
       {"0", 
        FractionBox[
         SubscriptBox["J", "xy"], "2"], 
        RowBox[{"-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox["h", "2"], "+", 
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
           RowBox[{"3", " ", "h"}], "4"]}], "+", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0", "0", "0"},
       {"0", 
        RowBox[{
         FractionBox["h", "4"], "-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], 
        FractionBox[
         SubscriptBox["J", "xy"], "2"], "0"},
       {"0", 
        FractionBox[
         SubscriptBox["J", "xy"], "2"], 
        RowBox[{
         RowBox[{"-", 
          FractionBox["h", "4"]}], "-", 
         FractionBox[
          SubscriptBox["J", "z"], "4"]}], "0"},
       {"0", "0", "0", 
        RowBox[{
         FractionBox[
          RowBox[{"3", " ", "h"}], "4"], "+", 
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
           RowBox[{
            FractionBox["1", "2"], ",", 
            RowBox[{"-", 
             FractionBox["1", "2"]}]}], "}"}]}], ",", 
         RowBox[{"Jxy", "=", 
          RowBox[{"1", "/", "2"}]}], ",", 
         RowBox[{"Jz", "=", 
          RowBox[{"5", "/", "7"}]}], ",", 
         RowBox[{"h", "=", "1"}], ",", 
         RowBox[{"L", "=", 
          SubscriptBox["L", "val"]}], ",", 
         RowBox[{"\[Beta]", "=", 
          SubscriptBox["\[Beta]", "val"]}], ",", 
         RowBox[{"tol", "=", 
          SuperscriptBox["10", 
           RowBox[{"-", "12"}]]}], ",", 
         RowBox[{"nsteps", "=", "20"}], ",", "expH"}], "}"}], ",", 
       RowBox[{"MPOStrangEvolution", "[", 
        RowBox[{
         RowBox[{"IdMPO", "[", "L", "]"}], ",", 
         RowBox[{"N", "[", 
          RowBox[{"h2", "[", 
           RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], "]"}], ",", 
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
    RowBox[{"2", ",", "2", ",", "4", ",", "7"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "7", ",", "7"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "7", ",", "4"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "4", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"virtual", " ", "bond", " ", "quantum", " ", "numbers"}], " ", 
   "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Rest", "/@", 
   SubscriptBox["expH", "test"]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", "0", "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "1"}], "}"}]}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "1"}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "0", ",", "1", ",", "1"}],
       "}"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "0", ",", "1", ",", "1"}],
       "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "0", ",", "1", ",", "1"}],
       "}"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "1"}], ",", 
       RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "0", ",", "1", ",", "1"}],
       "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "1"}], "}"}]}], "}"}], 
   ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "1"}], "}"}], ",", 
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
      RowBox[{"{", 
       RowBox[{
        FractionBox["1", "2"], ",", 
        RowBox[{"-", 
         FractionBox["1", "2"]}]}], "}"}]}], "}"}], ",", 
    RowBox[{"Total", "[", 
     RowBox[{
      RowBox[{
       RowBox[{"MPOBlockStructureError", "[", 
        RowBox[{"#", ",", 
         RowBox[{"{", 
          RowBox[{"qd", ",", "qd"}], "}"}]}], "]"}], "&"}], "/@", 
      SubscriptBox["expH", "test"]}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData["0.`"], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"{", 
       RowBox[{
        FractionBox["1", "2"], ",", 
        RowBox[{"-", 
         FractionBox["1", "2"]}]}], "}"}]}], ",", 
     RowBox[{"Jxy", "=", 
      RowBox[{"1", "/", "2"}]}], ",", 
     RowBox[{"Jz", "=", 
      RowBox[{"5", "/", "7"}]}], ",", 
     RowBox[{"h", "=", "1"}], ",", 
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
        RowBox[{"HHeisenberg", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"Jxy", ",", "Jxy", ",", "Jz"}], "}"}], ",", "h", ",", 
          "L"}], "]"}], "]"}], ",", "\[Beta]"}], "]"}]}], ";", 
    RowBox[{"expHref", "=", 
     RowBox[{"MatrixExp", "[", 
      RowBox[{
       RowBox[{"-", 
        FractionBox["\[Beta]", "2"]}], 
       RowBox[{"N", "[", 
        RowBox[{"HHeisenberg", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"Jxy", ",", "Jxy", ",", "Jz"}], "}"}], ",", "h", ",", 
          "L"}], "]"}], "]"}]}], "]"}]}], ";", 
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
                    RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], 
                    "]"}], ",", "qd", ",", 
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
\)]\) MPO approximation error (Strang splitting)\\n\!\(\*SubscriptBox[\(J\), \
\(xy\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "Jxy", "]"}], "]"}], "<>", 
          "\"\<, \!\(\*SubscriptBox[\(J\), \(z\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "Jz", "]"}], "]"}], "<>", "\"\<, h=\>\"",
           "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "h", "]"}], "]"}], "<>", "\"\<, L=\>\"", 
          "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, \[Beta]=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"N", "[", "\[Beta]", "]"}], "]"}], "<>", 
          "\"\<, tol=\!\(\*SuperscriptBox[\(10\), \(-12\)]\)\>\""}]}], ",", 
        RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
      RowBox[{"LogLogPlot", "[", 
       RowBox[{
        RowBox[{"0.00035", 
         SuperscriptBox["inv\[CapitalDelta]\[Beta]", 
          RowBox[{"-", "2"}]]}], ",", 
        RowBox[{"{", 
         RowBox[{"inv\[CapitalDelta]\[Beta]", ",", "1", ",", "30"}], "}"}], 
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
1:eJwB8QEO/iFib1JlAgAAAB4AAAACAAAAIae9/HhD8z+bd1CiW8MkwBjEOnya
Wv4/v0c8nySKJ8AWVbW7sWsCQBhheyiwLSnAiPDb/d24BECURyotGlkqwCqa
VXrdgQZA216zZ6Q/K8CR43N7QvcHQJALPDFH6CvAvAB41fUyCUCc6k2kLXAs
wAR/mr1uRApA4Q2ST1lxLMCb1gv5pjULQC61PxPdWyzApigUOm4NDECXeiQQ
BiUswNwK3jWg0AxAuWtt+U8FLMANcjI704INQIAP+AyTzCvA4V+QqcAmDkBq
26dczZUrwDiPNpWGvg5AG6MmbdKFK8CvG6y30ksPQEQyB+bWdivAgA1Zff/P
D0BVIcZCBEwrwIWpLCAUJhBAjXuuv2RCK8CLMmXcm2AQQKwzDmv+OSvAXsMx
QvmXEECqptET8gsrwJFb6Xx/zBBAFYE51xcHK8AhQWeJdf4QQJhsHBCz6SrA
rEzOehguEUCV2ZeNi98qwMBDGD6dWxFAme3vhHm8KsBEgHj9MYcRQEnU1Spd
pSrAYjAmO/+wEUDfdEPI6JsqwC93p7Qo2RFAYzTlEwCIKsAQLDEbzv8RQAr7
/taKbyrA2o56qgslEkC2imT5KWkqwNhoFqX6SBJA/+4y+wBZKsAWVbW7sWsS
QCcGVLxqPCrA3GTUHw==
       "]]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwVx3k41HkcwPFxzGCmkGiK7JgxYY6frtHBs75flCOFtNsmEeNJs/VEInnQ
5ojQbqUeaSRMh+RYobCDfT5atORIJXZGSI1mkIpYx6ht/3g/r+fNFIb7HtIk
kUi7vvW/019y1s5KTjiO7dW3u/iCASMl3i5p9N2otal5deVLBtzfefCrkB6M
Cjec1u7pY4CJ+eEAH3oEEuqPPzd9xQB38tElbvRE1NfceqJQwYDgufEQZ3om
ahGk3G+YYUDYVJkBpkuQj94Xk+glFhB1/ILCkV6BeO+iMm/bWgB/QmHs1NWI
5P0peY0xFtAkSKirPdmGDMul/tMN337X5OLBmG7k+qwhq0ODCY0W+0iKZS9R
9Nq3ikOeTDCsX9DuOSBDvJ9tR4wvMWFh5tnRFq1B9E//dXWyjAmLBY+7zrS9
RumS3ovZliwoLG4a7R57g/503vy88TALzM/Kq9kOI+i9uZRfWsGCBqdl2kSI
Ekl6gjaVzbBAdO6PzX4Jo+ingZ56X3tLGMqNW536ZBxRmGF+tcmWkHT1QJLo
wwSyx9xCwd+WMFde0n6n4CMSifX0IozYUL1P6Mlp+oSyXWqUu/3ZkBZZlKHz
YhLtbEuL8chnA46OY43MT6H5jNPfaajYsHTsVSxDfxoRNlejuog10OjWwfPb
MoP2f+0eCohZA7HK6S52wL8ozbq/9VLjGnBfKBN4hs0iBz41REa2gsXpyU8R
V+eQ6oi/0VtvK2gRPg6fKp5HZqlPI7SzrCBrec8QRbqAvCeXe7X2WcGO0vBi
0yE1ir8Wi71Y1mBcIxakTy4iWzPyG1WoNTTf86HPmn1F8t7K69srrMHxeEG0
mkHC6Qrb7u3z1nBr25ATt4iE67o6qw842sDCr6Fb+xw08LupzMqNaTYQeEGQ
WdWsgcWfYwKZHTbw1/r84d6dmtjT1fZclSEHVnv4BMUPauLZbkoLeT8Hzqzy
cPQSaWGOvdbDsDwO9ASkuReotfAP/SxptpIDm/wNqhjntDHZPzS8l+CCeH4D
XalPxtXcGEldBBc+Lr1xd91NMhYKylQH67iwW+Z1rZBHwZdNKcOmJB7cMXV7
mAsUXG+f9DFrBw/UavkTua8OVpa0xz28woPAa7XO7nIdLJ6zrxnr5UHVXblC
EK6LXRLbdYeZfDA67qrymtPFkYpE6odQPkTJdo1UJOjh2znk9IJiPrTWXjfI
Wk7Fneml5kaf+cDxWS++k0vFv/x4SpizhQDf6PN5evlUfEXEPtS+lYD4XMWt
YxIqLorrPvzFnoBOpfh3u0Iq7pbwjgm/JyAqUbOpuZyK2RODp7jOBEDl8wnF
IypuS3X/TepJwF6T6G1WKio2qV1VKwskIMHhqUfGGBVzn7RIlwQRcC+Y6z3x
noodByIbHIMJUJcN+FVPUrFIu/PRzRACJK5u4a5qKpb6JHUcEREwfmplTqgB
DQepRofnIwhYkXciv20ZDZ9UZyv4kQSgpvbbtsY0nG6wXRkYRcBlw8TymZU0
XGmX//5RNAFb7qmaUlk0TEnaM5sRR4Cwy6VtlE3DZlmkhfp4As5P3+jysqbh
tUVlixOnCRhw8pWt4NPwvk4drT0JBOiISgdjbWn42OsH5JREAtZdoCgG1tFw
4udg3ZokAvY/CBp13kjD2ToGNFUyAcky6YdCOxouMa1fapZCwH/hUFPm
      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/\[CapitalDelta]\[Tau]\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{1.0788636558468268`, -14.500081562719714`},
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
H/2\\)]\\) MPO approximation error (Strang \
splitting)\\n\\!\\(\\*SubscriptBox[\\(J\\), \\(xy\\)]\\)=1/2, \
\\!\\(\\*SubscriptBox[\\(J\\), \\(z\\)]\\)=5/7, h=1, L=5, \[Beta]=0.6, \
tol=\\!\\(\\*SuperscriptBox[\\(10\\), \\(-12\\)]\\)\"", TraditionalForm],
  PlotRange->{{1.133114525541308, 
   4.605170185988092}, {-14.434708180569338`, -10.381558487246187`}},
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
        AbsoluteThickness[0.1]}}}, {{-14.508657738524219`, 
       FormBox[
        TemplateBox[{"\[Times]", "\"\[Times]\"", "5.`", 
          TemplateBox[{"10", 
            RowBox[{"-", "7"}]}, "Superscript", SyntaxForm -> 
           SuperscriptBox]}, "RowWithSeparators"], TraditionalForm], {0.01, 
       0.}, {
        AbsoluteThickness[0.1]}}, {-13.815510557964274`, 
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
        AbsoluteThickness[0.1]}}, {-9.210340371976182, 
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
       RowBox[{
        FractionBox["1", "2"], ",", 
        RowBox[{"-", 
         FractionBox["1", "2"]}]}], "}"}]}], ",", 
     RowBox[{"Jxy", "=", 
      RowBox[{"1", "/", "2"}]}], ",", 
     RowBox[{"Jz", "=", 
      RowBox[{"5", "/", "7"}]}], ",", 
     RowBox[{"h", "=", "1"}], ",", 
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
        RowBox[{"HHeisenberg", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"Jxy", ",", "Jxy", ",", "Jz"}], "}"}], ",", "h", ",", 
          "L"}], "]"}], "]"}], ",", "\[Beta]"}], "]"}]}], ";", 
    RowBox[{"expHref", "=", 
     RowBox[{"MatrixExp", "[", 
      RowBox[{
       RowBox[{"-", 
        FractionBox["\[Beta]", "2"]}], 
       RowBox[{"N", "[", 
        RowBox[{"HHeisenberg", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"Jxy", ",", "Jxy", ",", "Jz"}], "}"}], ",", "h", ",", 
          "L"}], "]"}], "]"}]}], "]"}]}], ";", 
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
                    RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], 
                    "]"}], ",", "qd", ",", 
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
\)]\) MPO approximation error (Strang splitting)\\n\!\(\*SubscriptBox[\(J\), \
\(xy\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "Jxy", "]"}], "]"}], "<>", 
          "\"\<, \!\(\*SubscriptBox[\(J\), \(z\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "Jz", "]"}], "]"}], "<>", "\"\<, h=\>\"",
           "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "h", "]"}], "]"}], "<>", "\"\<, L=\>\"", 
          "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, \[Beta]=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"N", "[", "\[Beta]", "]"}], "]"}], "<>", 
          "\"\<, tol=\!\(\*SuperscriptBox[\(10\), \(-12\)]\)\>\""}]}], ",", 
        RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
      RowBox[{"LogLogPlot", "[", 
       RowBox[{
        RowBox[{"0.7", 
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
1:eJxTTMoPSmViYGBwBGIQ/d7y1z8nvWf2ZgyP7D1fCx6A8L/B+cWrre03LWJw
QJVng/OzT+zYd3kntwOqegE4f+MnqflVGcJo+sXgfN3Gm3HcXyTQzJOG81fy
z5CbUy+HZr4CnC/kr50/jVUJzT5lOD9gGtf5uNMqaParwfl9d1/qqU9Ud5AP
PrDDeqsw1D0aDroe8cu9g0UPnFE52fc+TMsh6oBX4GJvdaj7tOF8rpwV77bL
6ML5EPfqwfkem9v9Gh7pw/kQ9xvA+c61xuEqIYZwPsQ/RnD+IwXldo7tCD7E
f8ZwfuMRoe1vJE3gfIh/EXyFDKbnF2pM4XyI/83g/P3cn8S23jdzSGN5pDwt
Rh0aHuYOG1a+V3JcrX4gbv1Dt5lOFg7OdslVGzM0oOFj4bB2qcSP2cmaB/4G
XSyrXWrpYKHQ5OyirwUNLyuH6/e+S9y6oHVgzrcDyxI5rB3kVtcWLU7Thoaf
tcPCCczTXV9pH7CateGaa7aNg1SfwaaOZB1oeNo6iMV4Oq/8r3Pgpu0CNq1z
tg7p/HtOu2/QhYavncPqNvGFzax6Byoe9pvxGdo78Mfe1P2aoAcNb3sHnf2r
Vz5ZrHeg55C98U9PB4ejX6fdzd6rBw1/B4e72UdNHwP50VPMvbN/OzjEt784
eWGXHjQ+HB1izU/vu71D74B2mn7y3TWODin5tkVBQD4kfpwcji5l3bx+m96B
X+bq1f5xTg76a69nf9+qB40vJ4cps17lHQPyT3HKTz7I7+xgu7l0pgmQD4k/
Z4ddGrkCqkD+zNtiq40POjsw+udVvNiiB41PF4e31099egnkZ67lO7y0yMXh
Dp+Yxx0gHxK/Lg5358nl3AbyLerZbouruDrcOWPXfwbIh8S3q4PEq/c7TwD5
7IH/PnVedXXQERHxA/Eh8e/m8HXxc34Q/7rSN64/bW4Os3Z0fToO5AMAFofc
FA==
       "]]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwVz2s01AkYBvAp2UNRKJU107oM47pjXP4xYl6MPzKiYsl0kZJihahYqTXO
uC2xEpEiWylSIeM4q+YtVhulw7ilUbIioyQrya2d/fCc59Nzzu/RDY7cEbKc
QqF4yfN/d16hUdz7bzv6ioUaf0l6xOOC2rNGXpkcvir18Rdur/iuQL9fxivm
HOTXJJiIesW5gpff2ni3OHFfXg1nX+gTJwvqcxt5jZwrTNv6wD394lMCA+k9
3lPOpxIZf3JkQBwnkFKqeVIOieWdqolD4hPLbdfe4b3nDJeqUO1yxsQWC3S9
fYmLnPfPtgaWxkyLGemp/657pwhzfeJGxUvz4s2nQnOSP6iA4shzM/b2ZaiR
sjbgmqsGLFTdaaTpKKIkb1VtvEQT7jeWb5iqUkKFYzHev1RpwYfCNfemUlXQ
qkkt/cxxGmQf75mZZ6hhgfk/LezTOpDpxPp6Ylwd2wY/j7WF6gFOu1CVutfi
wfq8Y90WdNjVNnRV/bImLrq1e7yZNIApPvUUbe8GbBeLnRR6GdAkUY3lcLVw
Bd+h5FKxMXw9+lvHC2VtjB44RtuWZgqHPqF3xmcqvtZykVHCzaHL/HeqQ98m
rI4voZqZM0HScoJh7aWDewdf1IsyLGCXjNLh66SL5zVN8s4dZUH2D9urWAZ6
eNix59eEEEsIdl8s1KLqo33z87xhfyuwaZ+pEqym40N+9ktltjU0hoimyyfp
ODRSYclm2sDAZIdn31sDFCVnNhquI6A6q7a7udUQMxL/jMibJkCYOpRiWcnA
uTCSqfpuM3yOjXCvvGyE1LACfec2W1gf+2DLYJIx9u/mGgke2kHXoXAnnTgT
vHDL0dellg25opCIN0dMUXn1txrMsweFjYZP93qaoeYBbT2P9C2gFuFsP8ox
x64ni01ZEQ7QLqEPmNJ/xHNZ5lk7vRwhq8D3+icFJk5wGw7RgQPvtg2eeTTD
xKUUYUOAOsD8Kq2W8p8tcGeI9DE9E8BHFtkVM2qBSbz8j+1LAKc7jBdogSxk
Ds1U2EU6gVloRn1aKwsro4UTxmNOcGNm43wc1xIpK096zgY6w+LZlQFuIkvU
L8634PU4g46uicNFlhW2SHffDPJ2gab9k3V3KqzQxTDFfie6AFRquZdpW2PW
kQG/NjYXMiaigr/Pt8bquoJ03Sou3Gab5kcp2aDf3VkfW5or7LDJ3JMaZ4OP
r6aWduW7QrOxdpX+lA1qlMUreyuRsIahuv7yAQKfNQTd91hJQqvj9JMLIQSm
dbhFc1VIEP70MvFcKIFLlPUv7NRImBfefJsWTqBsX80N+kYSRodd62JiCGyi
jbvNMUjAstO+HskExhbuTrnmRkL0psnc6TICmdUu7FIPEsyIXvLjVfn+b5OJ
Ik/53uvB3Nh1AoNmZ/1yvEnYk5gZ/LqCQC//8wYJ/iRslRpZttYQaKjZ3uwT
SoJ+0f6OkkcEvjGri/M8QsKrandhUTOBxdxiMzKchMInTLvzLQRqxIbl2UfK
/31dLM1olfs7vztoeFLu9y+KOt5JYIPswwbdeBJEkUn0qC65d3l3m3aC3Jt6
uC+sR+5j/WGlfkbuExEQ1E/gNY+M0VVJJJS106YDpXLv/uiL3yXLvSMrbvi9
IpAaH+C9TEiC1tI432eQwN4cjsJCCgldmpI1nkME/gc2ik49
      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/tol\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{-0.9386368070082594, -16.161357345142164`},
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
H/2\\)]\\) MPO approximation error (Strang \
splitting)\\n\\!\\(\\*SubscriptBox[\\(J\\), \\(xy\\)]\\)=1/2, \
\\!\\(\\*SubscriptBox[\\(J\\), \\(z\\)]\\)=5/7, h=1, L=5, \[Beta]=0.6, \
tol=\\!\\(\\*SuperscriptBox[\\(10\\), \\(-12\\)]\\)\"", TraditionalForm],
  PlotRange->{{-0.23104906018664848`, 
   45.054566736396445`}, {-15.975935349383217`, -4.479771612328525}},
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
        AbsoluteThickness[0.1]}}, {-4.605170185988091, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "2"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
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
       RowBox[{
        FractionBox["1", "2"], ",", 
        RowBox[{"-", 
         FractionBox["1", "2"]}]}], "}"}]}], ",", 
     RowBox[{"Jxy", "=", 
      RowBox[{"1", "/", "2"}]}], ",", 
     RowBox[{"Jz", "=", 
      RowBox[{"5", "/", "7"}]}], ",", 
     RowBox[{"h", "=", "1"}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"t", "=", "15"}], ",", 
     RowBox[{"tol", "=", 
      SuperscriptBox["10", 
       RowBox[{"-", "8"}]]}], ",", "expHref"}], "}"}], ",", 
   RowBox[{
    RowBox[{"expHref", "=", 
     RowBox[{"MatrixExp", "[", 
      RowBox[{
       RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", 
       RowBox[{"N", "[", 
        RowBox[{"HHeisenberg", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"Jxy", ",", "Jxy", ",", "Jz"}], "}"}], ",", "h", ",", 
          "L"}], "]"}], "]"}]}], "]"}]}], ";", 
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
                    RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], 
                   "]"}], ",", "qd", ",", 
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
splitting)\\n\!\(\*SubscriptBox[\(J\), \(xy\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "Jxy", "]"}], "]"}], "<>", 
          "\"\<, \!\(\*SubscriptBox[\(J\), \(z\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "Jz", "]"}], "]"}], "<>", "\"\<, h=\>\"",
           "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "h", "]"}], "]"}], "<>", "\"\<, L=\>\"", 
          "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, t=\>\"", "<>", 
          RowBox[{"ToString", "[", "t", "]"}], "<>", 
          "\"\<, tol=\!\(\*SuperscriptBox[\(10\), \(-8\)]\)\>\""}]}], ",", 
        RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
      RowBox[{"LogLogPlot", "[", 
       RowBox[{
        RowBox[{"0.7", 
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
1:eJwBoQFe/iFib1JlAgAAABkAAAACAAAAr3JG6I8d5L/71KrTyLzhPwY6nrWY
hbA/IatM/OZg4b/PJicaihTeP1RtOybXJPW/MAGuFfY+6D9gHPOZOTL+v7in
lAf0Yu8/TE0LujCiAsCr5gYGRJzyP4v5dBBoiAXAACEPuqoT9T+ZtFuS7fsH
wJAdVIqcNvc/KgGAtMISCsC+zDYBDRn5P/EoOhRC6gvA1HBHg5vI+j8ldqi1
f5ANwEA123r/Tvw/MSW4dJ4FD8CjA4SFZbP9P6kcIGTkLRDAS98/YkD7/j83
vVMAB8cQwPwexhxmFQBAImgimDxWEcBzqzs/sqIAQE3lEGLX0xHARJ3oBN8m
AUCz3rRNvj8SwM7i6McHowFAO7aX0yahEsDb9FlAFxgCQMYfrun9CBPAgRbz
C9KGAkAsv7UaN1cTwOZGYoHe7wJA11CNOb+aE8AFEl6aylMDQC9OUT77wRPA
HCksfRCzA0BxtDtDWJkTwEUXwAMaDgRAOkvGTnhTE8BNkICCQ2UEQIR+bPbz
NRPAiPDb/d24BEBsZ1gn9/MSwCjZt4U=
       "]]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwB4QQe+yFib1JlAgAAAE0AAAACAAAA/wwyrbFrAsAK+eN6df4QQBpq+Ldd
aALAJVaqhSH7EEA2x77CCWUCwEGzcJDN9xBAboFL2GFeAsB5bf2lJfEQQNz1
ZAMSUQLA5+EW0dXjEEC43pdZcjYCwMPKSSc2yRBAcrD9BTMBAsB9nK/T9pMQ
QOVTyV60lgHA8D97LHgpEEAiGq2wzK8AwFoMvvwghQ5AVWRbe2Sw/79rPL8W
7NUMQAYBtvmkCf6/HNkZlSwvC0BlnKm4ED/8v3t0DVSYZAlAXNvW7RaT+r9y
szqJnrgHQAEZnWNIw/i/F/EA/8/oBUBGw7w97/v2v1ybINl2IQRAJBEWjjBT
9b866XkpuHgCQLBdCB+dhvO/xjVsuiSsAEDUTTQmpNjxv9NLMINX/P0/mKq5
kSAz8L9cBTtaULH6PxUMsHuQ0+y/Qrx3sp8e9z8rCmDAFH7pv1e6J/cjyfM/
nQVChu/g5b/KtQm9/ivwP0/a1hS1VOK/9xQ9l4g/6T9k7L0fXwvev71MTY19
oeI/4R4yGAHe1r9y/oILP+jWP8LfjOkMK9C/WwBxXK0Ewz+zNpd6i9HBv3Yi
KKneCLS//pYAJ0KFnL9uLAHgGkPTv1roE37OdrM/vJn1MZVH4L/MBSy+HCbI
P5CihvHvfOe/Un3ARf/N0j/7HDHY4Dfuvz9FBZsaZ9k/c/K6Fn5o8r87CfN2
xEfgPw5ZK0C1/PW/pCjws8ae4z94eCh9t1P5v7JKu29yPec/h5rzOGPy/L+A
k9NiM8vqP6rxBRYSQADAHZV4ab8b7j94clgZWOgBwK/MdXf62fA/mfQR3HK0
A8A3q/XDeofyPyHTkSjzYQXAHx0crIUs9D8KRbgQ/gYHwFqQqVNl9fU/RLhF
uN3PCMD8X/2Eqp/3P+aHmekiegrA8DC4dcRt+T/aWFTaPEgMwEteOfBDHfs/
NIbVVLz3DcAHH2EGTsT8P/FG/WrGng/AFeHv2yyP/j+ABEag0rQQwMV/op24
HQBAupPwz/SKEcCojwAtxQUBQJ2jTl8BcxLAO+kxCpfpAUAw/X8801YTwAJx
RqwbvgJA94SU3lcrFMByeQ6uiqQDQGeNXODGERXAFrC5dKx7BEALxAen6OgV
wGowOImTTgVAX0SGu8+7FsBnMWr9ZDMGQFxFuC+hoBfAl2B/NukIB0CMdM1o
JXYYwIIlWZuiDAdAdzmnzd55GMBu6jIAXBAHQGP+gDKYfRjARnTmyc4XB0A7
iDT8CoUYwPSHTV20JgdA6Zubj/CTGMBQrxuEf0QHQEXDaba7sRjACP630RWA
B0D9EQYEUu0YwPTCkTbPgwdA6dbfaAvxGMDfh2ubiIcHQNSbuc3E9BjAthEf
ZfuOB0CrJW2XN/wYwGQlhvjgnQdAWTnUKh0LGcDBTFQfrLsHQLZgolHoKBnA
rBEuhGW/B0ChJXy2oSwZwJjWB+kewwdAjepVG1swGcBwYLuykcoHQGV0CeXN
NxnAHnQiRnfZB0ATiHB4s0YZwAo5/Kow3QdA/0xK3WxKGcD1/dUP6uAHQOoR
JEImThnAzIeJ2VzoB0DBm9cLmVUZwLhMYz4W7AdArWCxcFJZGcCjET2jz+8H
QJgli9ULXRnAjtYWCInzB0CD6mQ6xWAZwHqb8GxC9wdAb68+n35kGcCSb1Bw

      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/\[CapitalDelta]t\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{-0.7470113183449351, -5.3381734449976905`},
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
splitting)\\n\\!\\(\\*SubscriptBox[\\(J\\), \\(xy\\)]\\)=1/2, \
\\!\\(\\*SubscriptBox[\\(J\\), \\(z\\)]\\)=5/7, h=1, L=5, t=15, \
tol=\\!\\(\\*SuperscriptBox[\\(10\\), \\(-8\\)]\\)\"", TraditionalForm],
  PlotRange->{{-0.6956685724404618, 2.5902671654458267`}, {-5.244642200149429,
    0.5542949804427332}},
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
       RowBox[{
        FractionBox["1", "2"], ",", 
        RowBox[{"-", 
         FractionBox["1", "2"]}]}], "}"}]}], ",", 
     RowBox[{"Jxy", "=", 
      RowBox[{"1", "/", "2"}]}], ",", 
     RowBox[{"Jz", "=", 
      RowBox[{"5", "/", "7"}]}], ",", 
     RowBox[{"h", "=", "1"}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"t", "=", "15"}], ",", 
     RowBox[{"\[CapitalDelta]t", "=", 
      RowBox[{"1", "/", "4"}]}], ",", 
     RowBox[{"nsteps", "=", "12"}], ",", "tol", ",", "expHref"}], "}"}], ",", 
   RowBox[{
    RowBox[{"expHref", "=", 
     RowBox[{"MatrixExp", "[", 
      RowBox[{
       RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", 
       RowBox[{"N", "[", 
        RowBox[{"HHeisenberg", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"Jxy", ",", "Jxy", ",", "Jz"}], "}"}], ",", "h", ",", 
          "L"}], "]"}], "]"}]}], "]"}]}], ";", 
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
                    RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], 
                    "]"}], ",", "qd", ",", 
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
splitting)\\n\!\(\*SubscriptBox[\(J\), \(xy\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "Jxy", "]"}], "]"}], "<>", 
          "\"\<, \!\(\*SubscriptBox[\(J\), \(z\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "Jz", "]"}], "]"}], "<>", "\"\<, h=\>\"",
           "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "h", "]"}], "]"}], "<>", "\"\<, L=\>\"", 
          "<>", 
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
1:eJxTTMoPSmViYGCQA2IQ/d7y1z8nvWf2mUlzpB5Oe2QP4X+D84tXW9tvWsTg
gCrPBudnn9ix7/JObgdU9QJw/sZPUvOrMoTR9IvB+bqNN+O4v0igmSftYP1W
Xk/58WP7lfwz5ObUyzm49818K+z6BGq+gkPGDJFf3Cdf2wv5a+dPY1VyeKGn
OHvWjTtQ+5QdvN8uPLRr+wH7gGlc5+NOqzh0T2LPKmq9uh9iv5rDk5Nbpkfn
Pt7fd/elnvpEdYf1ngUaUtI/90Pco+Fg3rHY54sF44EzKif73odpOTRdEPec
L8N6AOI+bYf1/nOPHZjMfoArZ8W77TK6Dst/RmrP1+I4AHGvnsNqJ9ms4B6O
Ax6b2/0aHuk7sE4TKFE+w3EA4n4Dh6srTRLYX3MccK41DlcJMXSoE1lktOYP
xwGIf4wcVG7dZprDyXngkYJyO8d2Iwf3xwn/awU4D0D8Z+yg8SjZW0Sc80Dj
EaHtbyRNHC5ry2hfAPIh/jVxcGo/8O4XkA8ATS7fMA==
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
  AxesOrigin->{-0.7648987441725961, -3.427394636017752},
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
splitting)\\n\\!\\(\\*SubscriptBox[\\(J\\), \\(xy\\)]\\)=1/2, \
\\!\\(\\*SubscriptBox[\\(J\\), \\(z\\)]\\)=5/7, h=1, L=5, t=15, \
\[CapitalDelta]t=0.25\"", TraditionalForm],
  PlotRange->{{-0.4332169878499659, 20.79441541679836}, {-3.3592091363375904`,
    0.8682918438323783}},
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
        AbsoluteThickness[0.1]}}}, {{-2.3025850929940455`, 
       FormBox["0.1`", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-1.6094379124341003`, 
       FormBox[
        TagBox[
         InterpretationBox["\"0.2\"", 0.2, AutoDelete -> True], NumberForm[#, {
           DirectedInfinity[1], 1.}]& ], TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {0., 
       FormBox["1", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {0.6931471805599453, 
       FormBox["2", TraditionalForm], {0.01, 0.}, {
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
        RowBox[{
         FractionBox["1", "2"], ",", 
         RowBox[{"-", 
          FractionBox["1", "2"]}]}], "}"}]}], ",", 
      RowBox[{"Jxy", "=", 
       RowBox[{"1", "/", "2"}]}], ",", 
      RowBox[{"Jz", "=", 
       RowBox[{"5", "/", "7"}]}], ",", 
      RowBox[{"h", "=", "1"}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"t", "=", "15"}], ",", 
      RowBox[{"tol", "=", 
       SuperscriptBox["10", 
        RowBox[{"-", "12"}]]}], ",", "expHref"}], "}"}], ",", 
    RowBox[{
     RowBox[{"expHref", "=", 
      RowBox[{"MatrixExp", "[", 
       RowBox[{
        RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", 
        RowBox[{"N", "[", 
         RowBox[{"HHeisenberg", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"Jxy", ",", "Jxy", ",", "Jz"}], "}"}], ",", "h", ",", 
           "L"}], "]"}], "]"}]}], "]"}]}], ";", 
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
                    RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], 
                    "]"}], ",", "qd", ",", 
                   RowBox[{"\[ImaginaryI]", " ", "t"}], ",", "nsteps", ",", 
                   "tol"}], "]"}]}], "]"}], "-", "expHref"}], "]"}]}], "}"}], 
           ",", 
           RowBox[{"{", 
            RowBox[{"nsteps", ",", "8", ",", "160", ",", "8"}], "}"}]}], 
          "]"}], ",", 
         RowBox[{"AxesLabel", "\[Rule]", 
          RowBox[{"{", 
           RowBox[{"\"\<1/\[CapitalDelta]t\>\"", ",", "\"\<err\>\""}], 
           "}"}]}], ",", 
         RowBox[{"PlotLabel", "\[Rule]", 
          RowBox[{
          "\"\<\!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[ImaginaryI]\)\
\\\ t\\\ H\)]\) MPO approximation error (\!\(\*SubsuperscriptBox[\(SRKN\), \
\(6\), \(b\)]\))\\nh=\>\"", "<>", 
           RowBox[{"ToString", "[", "h", "]"}], "<>", "\"\<, L=\>\"", "<>", 
           RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, t=\>\"", "<>", 
           RowBox[{"ToString", "[", "t", "]"}], "<>", 
           "\"\<, tol=\!\(\*SuperscriptBox[\(10\), \(-12\)]\)\>\""}]}], ",", 
         RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
       RowBox[{"LogLogPlot", "[", 
        RowBox[{
         RowBox[{"0.00045", 
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
1:eJwBUQGu/iFib1JlAgAAABQAAAACAAAAr3JG6I8d5L+cDim+hd0UwAY6nrWY
hbA/d7ZiixgGIMDPJicaihTeP/YDNQL8RiPAMAGuFfY+6D+2lk0LD5UlwLin
lAf0Yu8/viPYpXpeJ8Cr5gYGRJzyP8yhdbsa1CjAACEPuqoT9T/9u9LT8Q8q
wJAdVIqcNvc/qcG3qIYhK8C+zDYBDRn5P67rBgeCEizA1HBHg5vI+j9ULCjP
cOoswEA123r/Tvw/xuanCPutLcCjA4SFZbP9P6q4Hv1dZS7AS98/YkD7/j/n
OcAlfQIvwPwexhxmFQBA/kJRTGytL8Bzqzs/sqIAQNO8pIEwITDARJ3oBN8m
AUC3rtkZ+CUwwM7i6McHowFA2RvZwBZGMMDb9FlAFxgCQBDWHtV0AS/AgRbz
C9KGAkBmDaYL4m4vwOZGYoHe7wJANpTWwB2SL8BAyJhb
       "]]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwt1Pk/1HkcwPGZj5t1Vor1GI1z5PrWo2Lroc9nUStHYli0jmqZCCWPJHKU
O4VMtfVID+toU3K0jtbWtp+3bEWLHCNJaphcJVc0NrHH47E/vB7P/+DF3X/Y
MwSxWCy3f/vPXTprqn8ORyBR/qBRq7GAo7KoVVsogtlUK7W8v6Q4XyqoGgtB
sPA5TCV8SIpFPfWV+nsRrJgSyxnWSfEeIb8ixwvB193tn4Q+UixQybsZZoeg
uKD8TXThR5y8JHeNq44gzGJ/wwaLeXx78MPl/Bo2TLt1BtV8M4t1r+gbvx5n
QYpBYIqd7Bj+LF90NM6KBWSwZe6Pgue4vi2/9NT7ZXq7M6BQyeUKTolMLXkX
uETXmrBiqx17KT7G4U29XaSGbWW5W+1HqUqQ32ybzye6zyG0sOT9DO20HO6V
b12gLopfKVK9BZoZouvYt0dKo82CfWIGl6hr4tRcxpN5aj2s4BykiQAtR1q0
e83RJolyf8dnWagJtks+PDJLg7UjNuX2KcCRWxXaE74zdDgrR/7inDKQO9lh
sq1TNMPM/0noC1W437NoNVo2QeXSY5BDsgZYNaqZJwnHqZt6RJpUSQtOJh3d
6FQzQq8xvyZrxa+A6UWdx83nJfTdEcFmT6VVQFy0DiSUi6mD80HBQqI2BNZf
WNsm10/P2rd7NGmuAeMIJ7GSSERfeA1yNxbqgF+OQ4yfTju1XXYOV9H4EsT2
87vi8htp1uOVUQrFelDyd3PsxbgyOmK6aTJsNQcmXU2Gjh24jl1KZD2iM/Rh
JES+fIfKA7ybc+UX9+y1oDFjI5CUtWEZm4BUHUcuiO3ql7s4PbgqqKMiRtUA
3N8pD7i49mP/VQXNRt0GkBwfsLs6U4yF2prczDOGYEvneSllEgymNr0n+Eag
uWHrHFc4go+lKT4xVDOG+eevslQPjWPrQ+urOQ+N4R61v2CfNYHFB5Rnb50x
gWIRX+gYOYV1K3OPTDiaQt0FoYyT0wx2RU27qCoPeM88bLzoLJYvLQnd3sKD
4vXgLm89hx909B3lnDIDlcpcw4H78zhWrfHVaad1kE5ro3Q3SHHdJX76DWQO
0zO2cQkPF/Bb5ofTfq3msG9bpCDN4xM28GFOBggtYIi70Dr7YBFLmmNqV7pY
At9YMpnOX8IFzuGOgSusQESNspNblvHL1V9ofdduBZZ3ldPV9VhEP1q2qzzd
GkKNaktmhljE8tCz2B0mDJi/kF/KuMomajtZxpqpDPD0n5Y1/cgmOeHB8dVp
DBgFX/JklbKJSm7zU7cMBjiTpjfibrKJYve5+OzTDGignfyIO2zCDuB2yJxj
YM7szE2PDjb5EGV/4uNVBn6LU/9WTxaR3stpnf13GGj4vZflp4CI970xk/gG
Buplim5dVEZENOCasOYuA1U5DFtdE5EOg1Wm3vcZKCr2qGBzEGmp+CmhvYmB
9JbzaNQGkXvwyLSxg4EUNf9Kw62IbJGsSwzqYiCJb+S7dxsiDXJ5XUvdDBwf
qKvsc0Sk3tkncUsvAwdnenxbPRCpEo121Q4wINhcKKPkjYiF1IXn+ZqB708I
qrb7IlKucztxWsyAv5xUhgYiUhZ4nGf5hgFfZ1q1uA8R41MvE/8cZsA7L9PP
NgSR0lLSHTbKgKfIXTYmFBGDR9d4iuMM/P8vUjSmmHT9LQP/ACh9UTE=
      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/\[CapitalDelta]t\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{-0.738803238495161, -17.076341846745798`},
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
(\\!\\(\\*SubsuperscriptBox[\\(SRKN\\), \\(6\\), \\(b\\)]\\))\\nh=1, L=5, \
t=15, tol=\\!\\(\\*SuperscriptBox[\\(10\\), \\(-12\\)]\\)\"", TraditionalForm],
  PlotRange->{{-0.691019748454749, 
   2.367123614131617}, {-16.88808769839819, -5.216330500846791}},
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
        AbsoluteThickness[0.1]}}, {-4.605170185988091, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "2"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
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
       RowBox[{
        FractionBox["1", "2"], ",", 
        RowBox[{"-", 
         FractionBox["1", "2"]}]}], "}"}]}], ",", 
     RowBox[{"Jxy", "=", 
      RowBox[{"1", "/", "2"}]}], ",", 
     RowBox[{"Jz", "=", 
      RowBox[{"5", "/", "7"}]}], ",", 
     RowBox[{"h", "=", "1"}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"t", "=", "15"}], ",", 
     RowBox[{"\[CapitalDelta]t", "=", 
      RowBox[{"1", "/", "2"}]}], ",", 
     RowBox[{"nsteps", "=", "12"}], ",", "tol", ",", "expHref"}], "}"}], ",", 
   RowBox[{
    RowBox[{"expHref", "=", 
     RowBox[{"MatrixExp", "[", 
      RowBox[{
       RowBox[{"-", "\[ImaginaryI]"}], " ", "t", " ", 
       RowBox[{"N", "[", 
        RowBox[{"HHeisenberg", "[", 
         RowBox[{
          RowBox[{"{", 
           RowBox[{"Jxy", ",", "Jxy", ",", "Jz"}], "}"}], ",", "h", ",", 
          "L"}], "]"}], "]"}]}], "]"}]}], ";", 
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
                    RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], 
                    "]"}], ",", "qd", ",", 
                   RowBox[{"\[ImaginaryI]", " ", "t"}], ",", 
                   RowBox[{"t", "/", "\[CapitalDelta]t"}], ",", "tol"}], 
                  "]"}]}], "]"}], "-", "expHref"}], "]"}]}], "}"}]}], ",", 
          RowBox[{"{", 
           RowBox[{"i", ",", "1", ",", "40"}], "}"}]}], "]"}], ",", 
        RowBox[{"AxesLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{"\"\<1/tol\>\"", ",", "\"\<err\>\""}], "}"}]}], ",", 
        RowBox[{"PlotLabel", "\[Rule]", 
         RowBox[{
         "\"\<\!\(\*SuperscriptBox[\(\[ExponentialE]\), \
\(\(-\[ImaginaryI]\)\\\ t\\\ H\)]\) MPO approximation error \
(\!\(\*SubsuperscriptBox[\(SRKN\), \(6\), \
\(b\)]\))\\n\!\(\*SubscriptBox[\(J\), \(xy\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "Jxy", "]"}], "]"}], "<>", 
          "\"\<, \!\(\*SubscriptBox[\(J\), \(z\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "Jz", "]"}], "]"}], "<>", "\"\<, h=\>\"",
           "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "h", "]"}], "]"}], "<>", "\"\<, L=\>\"", 
          "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, t=\>\"", "<>", 
          RowBox[{"ToString", "[", "t", "]"}], "<>", 
          "\"\<, \[CapitalDelta]t=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"N", "[", "\[CapitalDelta]t", "]"}], "]"}]}]}]}], "]"}], 
      ",", 
      RowBox[{"LogLogPlot", "[", 
       RowBox[{
        RowBox[{"3600", 
         SuperscriptBox["invtol", 
          RowBox[{"-", "1"}]]}], ",", 
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
1:eJxTTMoPSmViYGDQAGIQ/d7y1z8nvWf27O0dv09K37KH8L/B+cWrre03LWJw
QJVng/OzT+zYd3kntwOqegE4f+MnqflVGcJo+sUcbrLNPLA0+pG9buPNOO4v
Eg4quxMZvxs/g5on7SAkPuG07p9X9iv5Z8jNqZdz+Cg9+07PhIdQ8xUcyt/H
r2I7ecxeyF87fxqrksOxVWtKC+Ou74fYp+ygP6nmwXP7j/sDpnGdjzut4rDO
a9v5HVf+74fYr+aQVxi8I3QDy4G+uy/11CeqO3AnCPo25HEfgLhHw+Evv6T2
WXOBA2dUTva9D9NyCOZ2cec2Ez4AcZ+2w6lzUm0risUOcOWseLddRtdBwPdU
486TEgcg7tVziJ8nMVu4X+qAx+Z2v4ZH+g6VtQUzukpkDkDcb+BwPTP+w4ks
+QPOtcbhKiGGDhFP5j/+ya90AOIfI4fP8iLnjhYpHXikoNzOsd3IQYqZs1nr
rvIBiP+MHTJj9LKalFQPNB4R2v5G0sRhq6qNkKyc6gGIf00cBHZE51qIqR5Q
yGB6fqHG1GGpMH/AfwHVAxD/mzmYf1/NPhXI38/9SWzrfTOHLypLEvYD+ZDw
MHcIfamisQ/Ij1v/0G2mk4XDC7/PMjuBfEj4IPh/gy6W1S61hPMh4WUF58/5
dmBZIoc1nA8JPwQfAHv1Ka0=
       "]]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwVxX0803kcAHArpKtVHrYhD2setsyO7TdKP+yjTXqQ0b0OJ+eQnBvH0Gxd
VCTloRabpgetpEa9SI6sLnxV7OqOzkOnJ5VXEaqrRkI5d/3xfr1XxKZs2T7P
wMBg8/++vE5603zX5wpfWVPC7RPRVHji3WwjF2XzvOefWu0XSYUwks7hJ1Ex
jyDs1QyHUUFJCKSHis7wCoZ98thCKtRLl1QHii7zTpLM+TofKrTVvx0NELXx
UHrzdb01FTYERxf4i7p5ZtGO0YoL9kBUl0UIRIM8jxAp663CDjSzum23nPS8
mu331R2rbECUfY3pNznDu37r0c+a+dZwcZbp79NJAL94LvnYQwr4hBr6W2cZ
w5TX+qMXckhw2qrs0IvHX0FA+L+p7VvMQS1rdE45vhR0VSlOBhPLIGKl0ug1
1Qx2SpPiVUCEzk1MG1WgBSg4vl5+oyZA9F6wlaYhg/mWvN9cuIZwZRB8Kx9Y
Qg7ReWzzqTnemMApgERYDvV7lR35Bh95ryVBsvgwW/h259P5BUGveGGR9zbX
7reH6cLgS0e1vbyAg385Jb6ngqRJxBq16mlltBU2ZVjT4I/RhPqa8letLX2S
E1luDlBqun+KKJ1sxYU5iomtjpA1NKJtfzjXmlTZPBC/wwn26WKMXIWGKDd6
ufeGSmd43nR/d+OShShmVxDrbBcdwhzO8W21RKQX14mnXjCgM/Mo46qJKRJ1
cn9vNnOBFg91Pz/OHKkMR1J3uzKBUmnEbFeRUP5xce0VcIVPd8mVHoiCYlXL
56KSWFBzO8k/j2KN3iZ/ODMv92vQyaiFnets0Laa9+HkX93g0gfL6YlKOxR0
LqY7ONkdTC2jOowyqUgwGGNvMe0Os/Ko2KLiFag2OF0ql7OhOznbbF8LDaWx
TspMbDjwHaPXQtLvgI5ddeM3n+OABmaqn4w5ImxnH8UFx+BRK/8bLckZ0c8f
KVV2YHDT6nrQIVc6khtH2TZ9zwXFw9ConggGCulbG9Q/xgVKBhWZSVYiSUjJ
ekziAT+IWxvu5Lsg4rzxwIBFniDv3tusb2SiOfvEmXCVJ6QTUy3JXa5oe+rE
ZZrbKuDV7TtQPctCrLQRDuPWKrh7OTG/ge6GhM/GI5nC1bAwoC15wM4dDWUv
Kx4eWg3qkYGKskZ3dO+IIFmd5gXyj6Z7Q9ayEV343EL52QsGG+uc1/3JRm9A
0Q4la0Cjie7Xx3AQ8XSE/StbHHTGDHb5Gw7S2te3RVBxSMvb07v4HQfFqRfG
3aHhYGfcL8nUc9C1U9qqajoOO4zyrm39yEEJ5WROAhsHmuELvjUBQzeO9wiG
BDhkEk6HqiwwJC3dKHqaiAP7MyWzGMcQjVSxWJiMw+NdKXYEXwx1KadrW8Q4
HPzUgcSAIUdl1Xi5BIcnMxKjYH8M9ZQYZ0XuwaFouvfwEiGGXI/ckD8owWF4
Un6mMBZD/UutORtKcSjOeMn/FIehHHlqn1aFg/ek77DoRww9OEy1KjuJg+LD
G5eNSRjKO7S7IvQ8DjCxqcEkA0Mc4t+CjiocXqefDZXJMDRQxHrpcREH1fjM
1MtfMMQteswk1eHwj77aR7cHQ08Xcbty63E4lkZ45pmDoYLCQvFEAw4CfXjO
+VwMeS56bhbXhMO71DpH8gEMDRasaey9isOJ9wt0+/Mx9B/qXzAn
      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/tol\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{-1.0198649922301277`, -11.395596099618485`},
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
\\(b\\)]\\))\\n\\!\\(\\*SubscriptBox[\\(J\\), \\(xy\\)]\\)=1/2, \
\\!\\(\\*SubscriptBox[\\(J\\), \\(z\\)]\\)=5/7, h=1, L=5, t=15, \
\[CapitalDelta]t=0.5\"", TraditionalForm],
  PlotRange->{{-0.5776226504666211, 
   27.725887222397812`}, {-11.201328168583467`, 0.843283555587478}},
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
        RowBox[{"{", 
         RowBox[{
          FractionBox["1", "2"], ",", 
          RowBox[{"-", 
           FractionBox["1", "2"]}]}], "}"}]}], ",", 
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
            RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "1", ",", "0", ",", 
            RowBox[{"-", "1"}], ",", "0", ",", "0"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{"0", ",", "2", ",", "2", ",", 
            RowBox[{"-", "1"}], ",", "0", ",", "1", ",", 
            RowBox[{"-", "2"}]}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"-", "1"}], ",", "0", ",", "2", ",", 
            RowBox[{"-", "2"}], ",", 
            RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "1"}], "}"}], ",", 
          RowBox[{"{", 
           RowBox[{
            RowBox[{"-", "1"}], ",", "1", ",", 
            RowBox[{"-", "1"}], ",", "0", ",", "1", ",", "0", ",", "0"}], 
           "}"}], ",", 
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
    RowBox[{"2", ",", "2", ",", "1", ",", "8"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "8", ",", "7"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "7", ",", "8"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "8", ",", "7"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "2", ",", "7", ",", "1"}], "}"}]}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Block", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"qd", "=", 
      RowBox[{"{", 
       RowBox[{
        FractionBox["1", "2"], ",", 
        RowBox[{"-", 
         FractionBox["1", "2"]}]}], "}"}]}], ",", 
     RowBox[{"Jxy", "=", 
      RowBox[{"1", "/", "2"}]}], ",", 
     RowBox[{"Jz", "=", 
      RowBox[{"5", "/", "7"}]}], ",", 
     RowBox[{"h", "=", "1"}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"t", "=", "15"}], ",", 
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
         RowBox[{"HHeisenberg", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"Jxy", ",", "Jxy", ",", "Jz"}], "}"}], ",", "h", ",", 
           "L"}], "]"}], "]"}]}], "]"}], ".", 
      RowBox[{"MPOMergeFull", "[", 
       RowBox[{"First", "/@", 
        SubscriptBox["A", "rnd"]}], "]"}], ".", 
      RowBox[{"MatrixExp", "[", 
       RowBox[{"\[ImaginaryI]", " ", "t", " ", 
        RowBox[{"N", "[", 
         RowBox[{"HHeisenberg", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{"Jxy", ",", "Jxy", ",", "Jz"}], "}"}], ",", "h", ",", 
           "L"}], "]"}], "]"}]}], "]"}]}]}], ";", 
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
                    RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], 
                   "]"}], ",", "qd", ",", 
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
approximation error (Strang splitting)\\n\!\(\*SubscriptBox[\(J\), \(xy\)]\)=\
\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "Jxy", "]"}], "]"}], "<>", 
          "\"\<, \!\(\*SubscriptBox[\(J\), \(z\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "Jz", "]"}], "]"}], "<>", "\"\<, h=\>\"",
           "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "h", "]"}], "]"}], "<>", "\"\<, L=\>\"", 
          "<>", 
          RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, t=\>\"", "<>", 
          RowBox[{"ToString", "[", "t", "]"}], "<>", 
          "\"\<, tol=\!\(\*SuperscriptBox[\(10\), \(-8\)]\)\>\""}]}], ",", 
        RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
      RowBox[{"LogLogPlot", "[", 
       RowBox[{
        RowBox[{"0.11", 
         SuperscriptBox["inv\[CapitalDelta]t", 
          RowBox[{"-", "2"}]]}], ",", 
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
  "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, {{}, 
     {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
      0.019444444444444445`], AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJwBUQGu/iFib1JlAgAAABQAAAACAAAABjqetZiFsD9uraFnMfECwDABrhX2
Pug/koj8Q7ylDcCr5gYGRJzyP5Se6GyZChLAkB1Uipw29z9v0nSAcVUUwNRw
R4ObyPo/zZlgvAEdFsCjA4SFZbP9P5+c2XdokhfA/B7GHGYVAEC9xuYS5c0Y
wESd6ATfJgFANbcKZNvfGcDb9FlAFxgCQKtq4QhjzxrA5kZigd7vAkC+pXkD
OaYbwBwpLH0QswNAGa/KjFtpHMBNkICCQ2UEQJEJR9TeFh3AIX7e8DAJBUAy
MN1fx7odwHithNz2oAVAzVP234lSHsDvOfr+Qi4GQHz8zJ3T3x7AvyunxG+y
BkAOjGu6/mMfwEpxp4eYLgdA+MUrXCbgH8BXgxgAqKMHQPofb4uaKiDA/aSx
y2ISCEAp7im392EgwGHVIEFvewhAyIY9032WIMDiVZeU
       "]]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwB4QQe+yFib1JlAgAAAE0AAAACAAAAB5SVrLFrAsAvtT+Z4y4DQMbe0tU5
aALArUq66/MnA0CEKRD/wWQCwCngND4EIQNAAL+KUdJdAsAhCyrjJBMDQPjp
f/byTwLAEWEULWb3AkDqP2pANDQCwPUM6cDovwJAzes+1Lb8AcC7ZJLo7VAC
QJND6Pu7jQHARhTlN/hyAUCMvLnCGp0AwHEMEItrI/8/IBP0fdd4/7+BQBF8
r6D7P9X4XA1KwP2/7AvjmpQv+D9jccOLZeL7vwf9r5fLc/Q/CJIHdWUk+r9S
Pjhqy/fwP4dFSU0OQfi/nkp3NTpi6j+yRHO8h2b2v0xHH/If+OI/9Ot6luWr
9L+oyHu0LhvYPxAmgF/sy/K/BTNL+ck2wj9CCGOT1wvxv5xTDZEFlbO/Q2xc
vCap7r/t5ekNY5/Sv7Xt7S/w7+q/FfDRnx7C4L9Uvzp5gnbnv9RMOA36tOe/
praCoGay478wXqi+MT3vv6SKNuvX/9+/bKA7ihNR879XSN5AdBrZv5PBZ1/F
w/a/b1F8UrSf0b8HvZhWJYH6v8T1IR8MScW/TWgOeLz+/b/Yfd9E3J+ov/F2
xN2A4wDA4rLfijJlsT8Nbpno0r4CwKNRKkUGjsY/FL2QiEB6BMCEGXzmFcrS
P0F5ijkFWwbA3Gns/pbN2T9XjaZ/5RsIwMDF3d3qVuA/v1XaLvXTCcDfMEpe
uBHkP0+LEO9bsQvA0Uv7CL2M5z/IGGlE3m4NwBBBsdVvUus/aBPEqrdRD8D1
npZ0gQbvPy1hGz3glRDAVlbgHmU98T+b5GVv8nIRwFnKd5TgHPM/nJ4xKrBi
EsBFljGfd9z0P5KEjq97QhPAhBYDEz6T9j+yRHfp3h0UwOoD15dbb/g/ZTvh
q+0LFcA5Sc2xlCv6Pwxe3DgK6hXAr/vF3CQN/D9Ht1hO0toWwA4G4ZzQzv0/
dzxmLqi7F8DAxBPGq4f/P9Cb/8IVmBjATHgkAO+yAEC8MRrgLocZwC060OcV
kgFAnfPFx1VmGsChMv1X6IMCQBDs8jcoWBvAPwW2fFJxA0CvvqtckkUcwNID
AGzKTgRAQr31SwojHcD4OMvj7T4FQGjywMMtEx7AEponJh8fBkCCUx0GX/Me
wFbVDx3o+gZAxo4F/SfPH8AtR3mcXOkHQE6ANz7OXiDA+eRz5t7HCEA0zzRj
D84gwJZMfXLAywhAA4M5KQDQIMAytIb+oc8IQNE2Pu/w0SDAbIOZFmXXCEBu
nkd70tUgwN4hv0br5ghAp21ak5XdIMDEXgqn9wUJQBoMgMMb7SDAjtigZxBE
CUD/SMsjKAwhwCtAqvPxRwlAzfzP6RgOIcDIp7N/00sJQJyw1K8JECHAAXfG
l5ZTCUA4GN476xMhwHQV7MccYwlAcufwU64bIcBZUjcoKYIJQOSFFoQ0KyHA
9rlAtAqGCUCzORtKJS0hwJIhSkDsiQlAge0fEBYvIcDM8FxYr5EJQB5VKZz3
MiHAPo+CiDWhCUBXJDy0ujohwNv2ixQXpQlAJdhAeqs8IcB4XpWg+KgJQPSL
RUCcPiHAsS2ouLuwCUCQ807MfUIhwE6VsUSdtAlAX6dTkm5EIcDq/LrQfrgJ
QC1bWFhfRiHAh2TEXGC8CUD7Dl0eUEghwCTMzehBwAlAysJh5EBKIcCOsleZ

      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/\[CapitalDelta]t\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{-0.04565605793521561, -8.724053142002022},
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
error (Strang splitting)\\n\\!\\(\\*SubscriptBox[\\(J\\), \\(xy\\)]\\)=1/2, \
\\!\\(\\*SubscriptBox[\\(J\\), \\(z\\)]\\)=5/7, h=1, L=5, t=15, \
tol=\\!\\(\\*SuperscriptBox[\\(10\\), \\(-8\\)]\\)\"", TraditionalForm],
  PlotRange->{{0.002127432105196358, 
   3.060270794691562}, {-8.623159759009102, -2.3677700134482427`}},
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
        AbsoluteThickness[0.1]}}, {0.6931471805599453, 
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
        AbsoluteThickness[0.1]}}}, {{-6.907755278982137, 
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
        AbsoluteThickness[0.1]}}, {-9.210340371976182, 
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
        RowBox[{
         FractionBox["1", "2"], ",", 
         RowBox[{"-", 
          FractionBox["1", "2"]}]}], "}"}]}], ",", 
      RowBox[{"Jxy", "=", 
       RowBox[{"1", "/", "2"}]}], ",", 
      RowBox[{"Jz", "=", 
       RowBox[{"5", "/", "7"}]}], ",", 
      RowBox[{"h", "=", "1"}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"t", "=", "15"}], ",", 
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
          RowBox[{"HHeisenberg", "[", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"Jxy", ",", "Jxy", ",", "Jz"}], "}"}], ",", "h", ",", 
            "L"}], "]"}], "]"}]}], "]"}], ".", 
       RowBox[{"MPOMergeFull", "[", 
        RowBox[{"First", "/@", 
         SubscriptBox["A", "rnd"]}], "]"}], ".", 
       RowBox[{"MatrixExp", "[", 
        RowBox[{"\[ImaginaryI]", " ", "t", " ", 
         RowBox[{"N", "[", 
          RowBox[{"HHeisenberg", "[", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"Jxy", ",", "Jxy", ",", "Jz"}], "}"}], ",", "h", ",", 
            "L"}], "]"}], "]"}]}], "]"}]}]}], ";", 
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
                    RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], 
                    "]"}], ",", "qd", ",", 
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
\(6\), \(b\)]\))\\n\!\(\*SubscriptBox[\(J\), \(xy\)]\)=\>\"", "<>", 
           RowBox[{"ToString", "[", 
            RowBox[{"InputForm", "[", "Jxy", "]"}], "]"}], "<>", 
           "\"\<, \!\(\*SubscriptBox[\(J\), \(z\)]\)=\>\"", "<>", 
           RowBox[{"ToString", "[", 
            RowBox[{"InputForm", "[", "Jz", "]"}], "]"}], "<>", 
           "\"\<, h=\>\"", "<>", 
           RowBox[{"ToString", "[", 
            RowBox[{"InputForm", "[", "h", "]"}], "]"}], "<>", "\"\<, L=\>\"",
            "<>", 
           RowBox[{"ToString", "[", "L", "]"}], "<>", "\"\<, t=\>\"", "<>", 
           RowBox[{"ToString", "[", "t", "]"}], "<>", 
           "\"\<, tol=\!\(\*SuperscriptBox[\(10\), \(-12\)]\)\>\""}]}], ",", 
         RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}], ",", 
       RowBox[{"LogLogPlot", "[", 
        RowBox[{
         RowBox[{"0.00009", 
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
            "Dashed"}], "}"}]}], ",", 
         RowBox[{"PlotRange", "\[Rule]", "All"}]}], "]"}]}], "]"}]}]}], 
   "]"}]}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, {{}, 
     {RGBColor[0.368417, 0.506779, 0.709798], PointSize[
      0.019444444444444445`], AbsoluteThickness[1.6], 
      PointBox[{{-0.6286086594223742, -6.713739538440086}, {
       0.06453852113757116, -9.512751674972321}, {
       0.47000362924573563`, -11.139993618497435`}, {
       0.7576857016975165, -12.292648883350191`}, {
       0.9808292530117262, -13.18612292609148}, {
       1.1631508098056809`, -13.915900090705385`}, {
       1.3173014896329391`, -14.532799550512879`}, {
       1.4508328822574619`, -15.067118038904873`}, {
       1.5686159179138452`, -15.538382582125662`}, {
       1.6739764335716716`, -15.959919394503263`}, {
       1.7692866133759964`, -16.34123031237133}, {
       1.8562979903656263`, -16.68932921321768}, {
       1.9363406980391626`, -17.009541561371872`}, {
       2.0104486701928845`, -17.30600653839413}, {
       2.0794415416798357`, -17.582004664773113`}}]}, {}}, {}}, {{}, {}, 
    {RGBColor[0.922526, 0.385626, 0.209179], AbsoluteThickness[1.6], Opacity[
     1.], Dashing[{Small, Small}], LineBox[CompressedData["
1:eJwt1Ps/1XccwPFzPsc1c8u0NOG4RXE430eL1vL9JgfpouOonJKoHN2OtG5O
nThIPJLk0orUlLXjnkJbF33eWItGqp3DzEPZOU2KndM5HTuWHbY9Hvvh9Xj+
By/m9v1RiYhGo639t/9c5zD3xs29CGbcq/arJu/ilFzM6tmFwK7k3SXW3vu4
UC9oGE1E0MhY2pk81Ipl8pZ653gEDM3Oc/p4wJuLeHX50QjyeydGj3I6sMCi
oHr3cgRFZz4pS7XqwukG42+Y1gi8s3ynv1j/HDf+9v5i4S06mBtS4oMUQ3he
mbPHyzc0eKUXC0PFY/hvk4pDIhYNlB/fu7u+9D1u6SmszPhjGo/bH3pmv+kv
nCnMujYWZ8D3vqqXCwtnMHnEyUv9dgor7lS8vNGIwGIbX9uz6QOOGF24Wttn
DM98f+836Z7EOMJOIlGZQU7ivJCBzXrMG6ySDj61gDUn1LpTjydwV+00R6Kx
AjQt9HkSrcMsuWQsVWUDt3YuT98/osXpyTcv9sfOhgO1dXPGYzQYLwimb3lr
B9Tt07uNutXYJtVbGbLVHlrlU6zX0nEcNZoi4annAKvNalFa0Rtc+mUSMjs2
FyRphxaH3xrBmuJmg+tbB3g35fCos1iJA+UJzdtFnwK1enaSuGYYn6tPfGWm
coS4lhKXHuNBPHC9q/fnDCfw2Bc+bC6TYbtYVaSrqQvw81ce5js8wR3+lTpL
cIHh4Il1osI2vMfeTJ+Xy4RrM51Hz4ukuIwzd0nrSldQrfFUHEn6luxGkqQV
U64wkmhSE2rRTup7L/y5qd0NbDQBAqW0h6we3dzOFLvD8PKW6edOcjLa9snY
CY4HRI7NGlq9ZpBEjy6a+lp4Qvqxretv5AyTgZ1W8QUdnhCIJ7wypUpSMLB4
zsm8BWBLLNMxi0bI+UtMzH1CvWDilxe5lslvyD5nP5WnwQvu4eCS4NxxMsfB
jN3c4Q1XZbyiEKGahLgzjTrxQmguKWKEh2tIbRPkP+IsAq8+bkA01pJ10RXS
tXQfuMqGSBM/Hbk7s7/J844PWNSfdRtqnSCd4MH8IokvZOOmlHmEntyyivtD
4+cseKcJFIkfTpLnFMWdCUZ+kBAkFJzkfiA7zVg48bEfKJiT3dr2KZLTulR0
doU/8DyUqmyegWSmNa9ouu4PMux+Or1rmmx7dbKKzWCD791Z2daONEppm5E7
EMeGXe5N1zQKGkUL23Ahop0Ni341MZwqp1MKZnqIvTMBXs690o6v6VR8iLK0
yYUA950XomiVdOqFIEzNdSXASbWgSlRNpwZrrcvOehBgg1bx9t2mU7LPKtSm
PgTovPOquU/p1I+r2so+BBJwX2S90dEIUTUHGJqXUQR8/6CfxjdFlFdJUmha
NAEtjIra87MQJb390yXHjQQ05PvTrW0RVTlVHMrnE1BxlVtHd0JUebZ7+fNt
BGR3FaPXAYgqKOWEPdxHQKZVbL3bMkRZ3q8u35FMQBrPPSY+CFF5Lyy19BQC
Uoea6wdCEJXr1lcedJCAPRp5TDcXURn1Au13IgIES64wzDcgaqb3cdjG4wTs
OC5o4MQgKk3LuqwTExBrrGfgOEQdC9CHsSUExETghqkERE3yt1zuzSBgQ0EO
PzARUUfFWCvMIiBKFml0eBeiJq64hX+UTcD//6IOtuVcrjlFwD8sUmM5
      "]]}}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{
    FormBox["\"1/\[CapitalDelta]t\"", TraditionalForm], 
    FormBox["\"err\"", TraditionalForm]},
  AxesOrigin->{-0.7282211830957304, -18.370830359426318`},
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
\\(b\\)]\\))\\n\\!\\(\\*SubscriptBox[\\(J\\), \\(xy\\)]\\)=1/2, \
\\!\\(\\*SubscriptBox[\\(J\\), \\(z\\)]\\)=5/7, h=1, L=5, t=15, \
tol=\\!\\(\\*SuperscriptBox[\\(10\\), \\(-12\\)]\\)\"", TraditionalForm],
  PlotRange->{{-0.6850263719453369, 
   2.0794415416798357`}, {-18.185797171791613`, -6.713739538440086}},
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
        AbsoluteThickness[0.1]}}, {0.6931471805599453, 
       FormBox["2", TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {1.6094379124341003`, 
       FormBox["5", TraditionalForm], {0.01, 0.}, {
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
        AbsoluteThickness[0.1]}}, {2.302585092994046, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}}, {{-18.420680743952367`, 
       FormBox[
        TemplateBox[{"10", 
          RowBox[{"-", "8"}]}, "Superscript", SyntaxForm -> SuperscriptBox], 
        TraditionalForm], {0.01, 0.}, {
        AbsoluteThickness[0.1]}}, {-16.11809565095832, 
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
        AbsoluteThickness[0.1]}}, {-20.72326583694641, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-20.030118656386467`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-19.624653548278303`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-19.33697147582652, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-19.11382792451231, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-18.931506367718356`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-18.7773556878911, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-18.643824295266576`, 
       FormBox[
        InterpretationBox[
         StyleBox[
          
          GraphicsBox[{}, ImageSize -> {0., 0.}, BaselinePosition -> 
           Baseline], "CacheGraphics" -> False], 
         Spacer[{0., 0.}]], TraditionalForm], {0.005, 0.}, {
        AbsoluteThickness[0.1]}}, {-18.526041259610192`, 
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
      RowBox[{"Jxy", "=", 
       RowBox[{"1", "/", "2"}]}], ",", 
      RowBox[{"Jz", "=", 
       RowBox[{"5", "/", "7"}]}], ",", 
      RowBox[{"h", "=", "1"}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", 
      RowBox[{"t", "=", "7"}]}], "}"}], ",", 
    RowBox[{"\[Chi]A", "[", 
     RowBox[{
      RowBox[{"N", "[", 
       RowBox[{"SzOp", "[", 
        RowBox[{"0", ",", "L"}], "]"}], "]"}], ",", 
      RowBox[{"N", "[", 
       RowBox[{"SzOp", "[", 
        RowBox[{"2", ",", "L"}], "]"}], "]"}], ",", 
      RowBox[{"N", "[", 
       RowBox[{"HHeisenberg", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{"Jxy", ",", "Jxy", ",", "Jz"}], "}"}], ",", "h", ",", "L"}],
         "]"}], "]"}], ",", "\[Beta]", ",", "t"}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"0.07168933292167175`", "\[VeryThinSpace]", "-", 
  RowBox[{"0.0008517788501126445`", " ", "\[ImaginaryI]"}]}]], "Output"]
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
        RowBox[{
         FractionBox["1", "2"], ",", 
         RowBox[{"-", 
          FractionBox["1", "2"]}]}], "}"}]}], ",", 
      RowBox[{"Sz", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"ArrayReshape", "[", 
          RowBox[{
           RowBox[{
            FractionBox["1", "2"], 
            RowBox[{"{", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{"1", ",", "0"}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{"0", ",", 
                RowBox[{"-", "1"}]}], "}"}]}], "}"}]}], ",", 
           RowBox[{"{", 
            RowBox[{"2", ",", "2", ",", "1", ",", "1"}], "}"}]}], "]"}], ",", 
         RowBox[{"{", "0", "}"}], ",", 
         RowBox[{"{", "0", "}"}]}], "}"}]}], ",", 
      RowBox[{"Jxy", "=", 
       RowBox[{"1", "/", "2"}]}], ",", 
      RowBox[{"Jz", "=", 
       RowBox[{"5", "/", "7"}]}], ",", 
      RowBox[{"h", "=", "1"}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", 
      RowBox[{"\[CapitalDelta]\[Beta]", "=", 
       RowBox[{
        SubscriptBox["\[Beta]", "val"], "/", "14"}]}], ",", "\[Rho]\[Beta]", 
      ",", 
      RowBox[{"t", "=", "7"}], ",", 
      RowBox[{"\[CapitalDelta]t", "=", 
       RowBox[{"7", "/", "16"}]}], ",", "\[Rho]\[Beta]A", ",", 
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
          RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], "]"}], ",", 
        "qd", ",", 
        RowBox[{
         FractionBox["1", "2"], "\[Beta]"}], ",", 
        RowBox[{"\[Beta]", "/", "\[CapitalDelta]\[Beta]"}], ",", "tol"}], 
       "]"}]}], ";", 
     RowBox[{"\[Rho]\[Beta]A", "=", 
      RowBox[{"MPOSRKNb6Evolution", "[", 
       RowBox[{
        RowBox[{"MPOSingleSiteTopUpdate", "[", 
         RowBox[{"\[Rho]\[Beta]", ",", "3", ",", "Sz"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"h2", "[", 
          RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], "]"}], ",", 
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
            RowBox[{"IdMPO", "[", "L", "]"}], ",", "5", ",", "Sz"}], "]"}], 
          ",", 
          RowBox[{"N", "[", 
           RowBox[{"h2", "[", 
            RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], "]"}], ",",
           "qd", ",", 
          RowBox[{
           RowBox[{"-", "\[ImaginaryI]"}], " ", "t"}], ",", 
          RowBox[{"t", "/", "\[CapitalDelta]t"}], ",", "tol"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"h2", "[", 
          RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], "]"}], ",", 
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
          RowBox[{"SzOp", "[", 
           RowBox[{"0", ",", "L"}], "]"}], "]"}], ",", 
         RowBox[{"N", "[", 
          RowBox[{"SzOp", "[", 
           RowBox[{"2", ",", "L"}], "]"}], "]"}], ",", 
         RowBox[{"N", "[", 
          RowBox[{"HHeisenberg", "[", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{"Jxy", ",", "Jxy", ",", "Jz"}], "}"}], ",", "h", ",", 
            "L"}], "]"}], "]"}], ",", "\[Beta]", ",", "t"}], "]"}]}], 
      "]"}]}]}], "]"}]}]], "Input"],

Cell[BoxData["7.70277757567682`*^-8"], "Output"]
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
        RowBox[{
         FractionBox["1", "2"], ",", 
         RowBox[{"-", 
          FractionBox["1", "2"]}]}], "}"}]}], ",", 
      RowBox[{"Sz", "=", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"ArrayReshape", "[", 
          RowBox[{
           RowBox[{
            FractionBox["1", "2"], 
            RowBox[{"{", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{"1", ",", "0"}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{"0", ",", 
                RowBox[{"-", "1"}]}], "}"}]}], "}"}]}], ",", 
           RowBox[{"{", 
            RowBox[{"2", ",", "2", ",", "1", ",", "1"}], "}"}]}], "]"}], ",", 
         RowBox[{"{", "0", "}"}], ",", 
         RowBox[{"{", "0", "}"}]}], "}"}]}], ",", 
      RowBox[{"Jxy", "=", 
       RowBox[{"1", "/", "2"}]}], ",", 
      RowBox[{"Jz", "=", 
       RowBox[{"5", "/", "7"}]}], ",", 
      RowBox[{"h", "=", "1"}], ",", 
      RowBox[{"L", "=", 
       SubscriptBox["L", "val"]}], ",", 
      RowBox[{"\[Beta]", "=", 
       SubscriptBox["\[Beta]", "val"]}], ",", 
      RowBox[{"\[CapitalDelta]\[Beta]", "=", 
       RowBox[{
        SubscriptBox["\[Beta]", "val"], "/", "14"}]}], ",", "\[Rho]\[Beta]", 
      ",", 
      RowBox[{"t", "=", "7"}], ",", "tA", ",", "tB", ",", 
      RowBox[{"\[CapitalDelta]t", "=", 
       RowBox[{"7", "/", "16"}]}], ",", "\[Rho]\[Beta]A", ",", 
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
          RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], "]"}], ",", 
        "qd", ",", 
        RowBox[{
         FractionBox["1", "2"], "\[Beta]"}], ",", 
        RowBox[{"\[Beta]", "/", "\[CapitalDelta]\[Beta]"}], ",", "tol"}], 
       "]"}]}], ";", 
     RowBox[{"\[Rho]\[Beta]A", "=", 
      RowBox[{"MPOSRKNb6LiouvilleEvolution", "[", 
       RowBox[{
        RowBox[{"MPOSingleSiteTopUpdate", "[", 
         RowBox[{"\[Rho]\[Beta]", ",", "3", ",", "Sz"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"h2", "[", 
          RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], "]"}], ",", 
        "qd", ",", 
        RowBox[{"\[ImaginaryI]", " ", "tA"}], ",", 
        RowBox[{"tA", "/", "\[CapitalDelta]t"}], ",", "tol"}], "]"}]}], ";", 
     RowBox[{"\[Rho]\[Beta]B", "=", 
      RowBox[{"MPOSRKNb6LiouvilleEvolution", "[", 
       RowBox[{
        RowBox[{"MPOSingleSiteBottomUpdate", "[", 
         RowBox[{"\[Rho]\[Beta]", ",", "5", ",", "Sz"}], "]"}], ",", 
        RowBox[{"N", "[", 
         RowBox[{"h2", "[", 
          RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], "]"}], ",", 
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
            RowBox[{"SzOp", "[", 
             RowBox[{"0", ",", "L"}], "]"}], "]"}], ",", 
           RowBox[{"N", "[", 
            RowBox[{"SzOp", "[", 
             RowBox[{"2", ",", "L"}], "]"}], "]"}], ",", 
           RowBox[{"N", "[", 
            RowBox[{"HHeisenberg", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{"Jxy", ",", "Jxy", ",", "Jz"}], "}"}], ",", "h", ",", 
              "L"}], "]"}], "]"}], ",", "\[Beta]", ",", "t"}], "]"}]}], "]"}],
        ",", 
       RowBox[{"Rest", "/@", "\[Rho]\[Beta]B"}]}], "}"}]}]}], 
   "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1.162597970612988`*^-7", ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", "0", "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "1"}], "}"}]}], "}"}], 
     ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "1"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "2"}], ",", 
         RowBox[{"-", "1"}], ",", 
         RowBox[{"-", "1"}], ",", 
         RowBox[{"-", "1"}], ",", 
         RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "0", ",", "0", ",", "0",
          ",", "0", ",", "1", ",", "1", ",", "1", ",", "1", ",", "2"}], 
        "}"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "2"}], ",", 
         RowBox[{"-", "1"}], ",", 
         RowBox[{"-", "1"}], ",", 
         RowBox[{"-", "1"}], ",", 
         RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "0", ",", "0", ",", "0",
          ",", "0", ",", "1", ",", "1", ",", "1", ",", "1", ",", "2"}], "}"}],
        ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "2"}], ",", 
         RowBox[{"-", "1"}], ",", 
         RowBox[{"-", "1"}], ",", 
         RowBox[{"-", "1"}], ",", 
         RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "0", ",", "0", ",", "0",
          ",", "0", ",", "1", ",", "1", ",", "1", ",", "1", ",", "2"}], 
        "}"}]}], "}"}], ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "2"}], ",", 
         RowBox[{"-", "1"}], ",", 
         RowBox[{"-", "1"}], ",", 
         RowBox[{"-", "1"}], ",", 
         RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "0", ",", "0", ",", "0",
          ",", "0", ",", "1", ",", "1", ",", "1", ",", "1", ",", "2"}], "}"}],
        ",", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "1"}], "}"}]}], "}"}], 
     ",", 
     RowBox[{"{", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"-", "1"}], ",", "0", ",", "0", ",", "1"}], "}"}], ",", 
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
       RowBox[{
        FractionBox["1", "2"], ",", 
        RowBox[{"-", 
         FractionBox["1", "2"]}]}], "}"}]}], ",", 
     RowBox[{"Sz", "=", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"ArrayReshape", "[", 
         RowBox[{
          RowBox[{
           FractionBox["1", "2"], 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"1", ",", "0"}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"0", ",", 
               RowBox[{"-", "1"}]}], "}"}]}], "}"}]}], ",", 
          RowBox[{"{", 
           RowBox[{"2", ",", "2", ",", "1", ",", "1"}], "}"}]}], "]"}], ",", 
        RowBox[{"{", "0", "}"}], ",", 
        RowBox[{"{", "0", "}"}]}], "}"}]}], ",", 
     RowBox[{"Jxy", "=", 
      RowBox[{"1", "/", "2"}]}], ",", 
     RowBox[{"Jz", "=", 
      RowBox[{"5", "/", "7"}]}], ",", 
     RowBox[{"h", "=", "1"}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"\[Beta]", "=", 
      SubscriptBox["\[Beta]", "val"]}], ",", 
     RowBox[{"\[CapitalDelta]\[Beta]", "=", 
      RowBox[{
       SubscriptBox["\[Beta]", "val"], "/", "14"}]}], ",", "\[Rho]\[Beta]", 
     ",", 
     RowBox[{"\[CapitalDelta]t", "=", 
      RowBox[{"1", "/", "2"}]}], ",", "\[Rho]\[Beta]A", ",", "\[Rho]\[Beta]B",
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
         RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], "]"}], ",", 
       "qd", ",", 
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
                RowBox[{"\[Rho]\[Beta]", ",", "3", ",", "Sz"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"h2", "[", 
                 RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], "]"}],
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
                   RowBox[{"IdMPO", "[", "L", "]"}], ",", "5", ",", "Sz"}], 
                  "]"}], ",", 
                 RowBox[{"N", "[", 
                  RowBox[{"h2", "[", 
                   RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], 
                  "]"}], ",", "qd", ",", 
                 RowBox[{
                  RowBox[{"-", "\[ImaginaryI]"}], " ", "n", " ", 
                  "\[CapitalDelta]t"}], ",", "n", ",", "tol"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"h2", "[", 
                 RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], "]"}],
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
            RowBox[{"n", ",", "0", ",", "60"}], "}"}]}], "]"}], "]"}], ",", 
        RowBox[{"AxesLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
          "\"\<t\>\"", ",", 
           "\"\<Re[\!\(\*SubscriptBox[\(\[Chi]\), \(A, \
B\)]\)[\[Beta],t]]\>\""}], "}"}]}], ",", 
        RowBox[{"PlotLabel", "\[Rule]", 
         RowBox[{"\"\<\!\(\*SubscriptBox[\(J\), \(xy\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "Jxy", "]"}], "]"}], "<>", 
          "\"\<, \!\(\*SubscriptBox[\(J\), \(z\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "Jz", "]"}], "]"}], "<>", "\"\<, h=\>\"",
           "<>", 
          RowBox[{"ToString", "[", "h", "]"}], "<>", "\"\<, L=\>\"", "<>", 
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
                RowBox[{"SzOp", "[", 
                 RowBox[{"0", ",", "L"}], "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"SzOp", "[", 
                 RowBox[{"2", ",", "L"}], "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"HHeisenberg", "[", 
                 RowBox[{
                  RowBox[{"{", 
                   RowBox[{"Jxy", ",", "Jxy", ",", "Jz"}], "}"}], ",", "h", 
                  ",", "L"}], "]"}], "]"}], ",", "\[Beta]", ",", "t"}], 
              "]"}]}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"t", ",", "0", ",", "30", ",", "0.1"}], "}"}]}], "]"}], 
         "]"}], ",", 
        RowBox[{"PlotStyle", "\[Rule]", 
         RowBox[{
          RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}]}]}], "]"}]}],
      "]"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.016666666666666666`],
      AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJw10n1IE2EcwPF1qPkGatRMczXzdDq11OncdLf7BY60tCSJofgSmqn9oVAT
Ea1dqRXUUOe7leRSm2apsz+ywYqxEo35QoUv9YfFgpIg7QU0zF7w+R0cx4fv
Pc89z90F5pedKKR4PB7z7/x/xUPW0fA1IF/PbmmJlfiNmoyn0Cusub/Lob6K
XmOn4gJv1yQ3EfNg/N2rRh9pC7ETLP6ulArs7cSu0Owe8liu6iL2hJqMvKY9
YwZib9g1sW60LfUR7wCPzD/dHuL7xDuBqn5dW8MfIuZDw8KYWeg/QrwbLBVF
Sxv+JmJ/2GQ6LD84dAAUqDXV8iz0XkjRqrvVL3G8EDTLJ8XeLuhAsN4q4scr
h4n3g/19sqxEic8PguPLHXT7tYfENMxqV8PflKCDgV9FlWsn0SGgjrWfcyrH
8SIofHHHYPTB+UMhJ4ly+B5Gh0FL6ejADIMWQ+43mdf0BI4PB/0FkeSXBueP
AMXiAtjbBokjobLfLi44M0B8ADzmEwbDg43EByGoznq+WIDvOwpC2Uu6pMae
LXNRsJEtVFaO3CU9Ghwfpix+rcRcNPCvmEt1ieR+XgwEfPRN8artJT0GtmkN
wRnMPdIlYFG4O46G9ZMuAZebVP0NV/y+saDXpVKaHrJ+LhYY56cR6XMPSI+D
01mqJ2sNZL9cHHT6Xte7zeH+pfC8TmCbfoZdCuzmp7PrZdjj4UtMr+7zduzx
kP12k17pxfllYMjNoYuyiTkZPEq2hc1FY5dDhSjtGI/GLgeVW5s4MxJ7Apg0
k6axI9gT4PJocerMReyJUHWhddU2iz0R6p039s2n4voUMJM23pX3HdenAJr6
qRwy4/dmwFOUXl6oIv8Dx8Ah777m2k78P5RgFfYJaOsw+xejFQf7
      "]]}, {}}, {{}, {{}, {}, 
     {RGBColor[0.922526, 0.385626, 0.209179], PointSize[
      0.011111111111111112`], AbsoluteThickness[1.6], LineBox[CompressedData["
1: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
LZvLbauLuf8BI3r6Ng==
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
  ImageMargins->0.,
  Method->{},
  PlotLabel->FormBox[
   "\"\\!\\(\\*SubscriptBox[\\(J\\), \\(xy\\)]\\)=1/2, \\!\\(\\*SubscriptBox[\
\\(J\\), \\(z\\)]\\)=5/7, h=1, L=5, \[Beta]=0.6 (scheme A)\"", 
    TraditionalForm],
  PlotRange->{{0, 30.}, {0, 0.07228021291052042}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
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
       RowBox[{
        FractionBox["1", "2"], ",", 
        RowBox[{"-", 
         FractionBox["1", "2"]}]}], "}"}]}], ",", 
     RowBox[{"Sz", "=", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"ArrayReshape", "[", 
         RowBox[{
          RowBox[{
           FractionBox["1", "2"], 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{"1", ",", "0"}], "}"}], ",", 
             RowBox[{"{", 
              RowBox[{"0", ",", 
               RowBox[{"-", "1"}]}], "}"}]}], "}"}]}], ",", 
          RowBox[{"{", 
           RowBox[{"2", ",", "2", ",", "1", ",", "1"}], "}"}]}], "]"}], ",", 
        RowBox[{"{", "0", "}"}], ",", 
        RowBox[{"{", "0", "}"}]}], "}"}]}], ",", 
     RowBox[{"Jxy", "=", 
      RowBox[{"1", "/", "2"}]}], ",", 
     RowBox[{"Jz", "=", 
      RowBox[{"5", "/", "7"}]}], ",", 
     RowBox[{"h", "=", "1"}], ",", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], ",", 
     RowBox[{"\[Beta]", "=", 
      SubscriptBox["\[Beta]", "val"]}], ",", 
     RowBox[{"\[CapitalDelta]\[Beta]", "=", 
      RowBox[{
       SubscriptBox["\[Beta]", "val"], "/", "14"}]}], ",", "\[Rho]\[Beta]", 
     ",", "tA", ",", "tB", ",", 
     RowBox[{"\[CapitalDelta]t", "=", 
      RowBox[{"1", "/", "2"}]}], ",", "\[Rho]\[Beta]A", ",", "\[Rho]\[Beta]B",
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
         RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], "]"}], ",", 
       "qd", ",", 
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
                  RowBox[{"\[Rho]\[Beta]", ",", "3", ",", "Sz"}], "]"}], ",", 
                 RowBox[{"N", "[", 
                  RowBox[{"h2", "[", 
                   RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], 
                  "]"}], ",", "qd", ",", 
                 RowBox[{"\[ImaginaryI]", " ", "tA"}], ",", 
                 RowBox[{"tA", "/", "\[CapitalDelta]t"}], ",", "tol"}], 
                "]"}]}], ";", 
              RowBox[{"\[Rho]\[Beta]B", "=", 
               RowBox[{"MPOSRKNb6LiouvilleEvolution", "[", 
                RowBox[{
                 RowBox[{"MPOSingleSiteBottomUpdate", "[", 
                  RowBox[{"\[Rho]\[Beta]", ",", "5", ",", "Sz"}], "]"}], ",", 
                 RowBox[{"N", "[", 
                  RowBox[{"h2", "[", 
                   RowBox[{"Jxy", ",", "Jz", ",", "h", ",", "L"}], "]"}], 
                  "]"}], ",", "qd", ",", 
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
            RowBox[{"n", ",", "0", ",", "60", ",", "2"}], "}"}]}], "]"}], 
         "]"}], ",", 
        RowBox[{"AxesLabel", "\[Rule]", 
         RowBox[{"{", 
          RowBox[{
          "\"\<t\>\"", ",", 
           "\"\<Re[\!\(\*SubscriptBox[\(\[Chi]\), \(A, \
B\)]\)[\[Beta],t]]\>\""}], "}"}]}], ",", 
        RowBox[{"PlotLabel", "\[Rule]", 
         RowBox[{"\"\<\!\(\*SubscriptBox[\(J\), \(xy\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "Jxy", "]"}], "]"}], "<>", 
          "\"\<, \!\(\*SubscriptBox[\(J\), \(z\)]\)=\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"InputForm", "[", "Jz", "]"}], "]"}], "<>", "\"\<, h=\>\"",
           "<>", 
          RowBox[{"ToString", "[", "h", "]"}], "<>", "\"\<, L=\>\"", "<>", 
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
                RowBox[{"SzOp", "[", 
                 RowBox[{"0", ",", "L"}], "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"SzOp", "[", 
                 RowBox[{"2", ",", "L"}], "]"}], "]"}], ",", 
               RowBox[{"N", "[", 
                RowBox[{"HHeisenberg", "[", 
                 RowBox[{
                  RowBox[{"{", 
                   RowBox[{"Jxy", ",", "Jxy", ",", "Jz"}], "}"}], ",", "h", 
                  ",", "L"}], "]"}], "]"}], ",", "\[Beta]", ",", "t"}], 
              "]"}]}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"t", ",", "0", ",", "30", ",", "0.1"}], "}"}]}], "]"}], 
         "]"}], ",", 
        RowBox[{"PlotStyle", "\[Rule]", 
         RowBox[{
          RowBox[{"ColorData", "[", "97", "]"}], "[", "4", "]"}]}]}], "]"}]}],
      "]"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{{}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.019444444444444445`],
      AbsoluteThickness[1.6], PointBox[CompressedData["
1:eJxTTMoPSmViYGCQB2IQDQPOOW8vyCRNsofwPtibLTkXGdkO4zM4FPUc3Slq
NhXK53BYyCJ2y851HpQv4GA7V1D4+INlUL6IQ+7H20FtYuuhfAkHU6/pu/9J
bYLyZRy8au9nWUfB+AoO1fzR7YJsG6F8JYfSZTw5WXYw/SoOa01N3K9mroPy
1RxO867dxlwKk9dwyEtbYyTuvgHK13KQ0bWUPHcSJq/jEOA0JfXc9DVQvp6D
74ozE/VVV0D5Bg7rHzwT95q4BMo3dLh1daaj/LTFUL6Rg/ujpkvCLUuhfGOH
55kruf01V0L5Jg6dC7LCSpfAzDd12HehM+LHBJh7zRzylA9qnj8A45s7BHwI
3vGKHca3cBBeJbciK2YtlG/p8NFr0msWFRjfymFHVs7jvV4wvrWDH3ejyImL
ML6NQ7F9YF7iZ5h5tg4yPjplqa6w8LBz+JUkFKp8aIM9AEbSf+A=
      "]]}, {}}, {{}, {{}, {}, 
     {RGBColor[0.922526, 0.385626, 0.209179], PointSize[
      0.011111111111111112`], AbsoluteThickness[1.6], LineBox[CompressedData["
1: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
69cdtq0p4/4HBND5Uw==
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
   "\"\\!\\(\\*SubscriptBox[\\(J\\), \\(xy\\)]\\)=1/2, \\!\\(\\*SubscriptBox[\
\\(J\\), \\(z\\)]\\)=5/7, h=1, L=5, \[Beta]=0.6 (scheme C)\"", 
    TraditionalForm],
  PlotRange->{{0, 30.}, {0, 0.07168933257297741}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1688, 961},
WindowMargins->{{162, Automatic}, {67, Automatic}},
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
Cell[1486, 35, 68, 0, 63, "Section"],
Cell[1557, 37, 123, 3, 31, "Input"],
Cell[1683, 42, 53, 1, 31, "Input"],
Cell[CellGroupData[{
Cell[1761, 47, 61, 0, 43, "Subsection"],
Cell[1825, 49, 297, 9, 31, "Input"],
Cell[2125, 60, 2732, 75, 116, "Input"],
Cell[4860, 137, 233, 7, 52, "Input"],
Cell[CellGroupData[{
Cell[5118, 148, 300, 9, 31, "Input"],
Cell[5421, 159, 75, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[5533, 166, 293, 8, 31, "Input"],
Cell[5829, 176, 1006, 22, 52, "Output"]
}, Open  ]],
Cell[6850, 201, 122, 4, 31, "Input"],
Cell[CellGroupData[{
Cell[6997, 209, 733, 22, 67, "Input"],
Cell[7733, 233, 5528, 102, 266, "Output"]
}, Open  ]],
Cell[13276, 338, 782, 25, 46, "Input"],
Cell[CellGroupData[{
Cell[14083, 367, 144, 4, 31, "Input"],
Cell[14230, 373, 75, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[14342, 380, 198, 5, 52, "Input"],
Cell[14543, 387, 1493, 41, 226, "Output"]
}, Open  ]],
Cell[16051, 431, 330, 11, 46, "Input"],
Cell[CellGroupData[{
Cell[16406, 446, 662, 20, 52, "Input"],
Cell[17071, 468, 45, 0, 31, "Output"]
}, Open  ]],
Cell[17131, 471, 231, 7, 31, "Input"],
Cell[CellGroupData[{
Cell[17387, 482, 1017, 31, 52, "Input"],
Cell[18407, 515, 51, 0, 31, "Output"]
}, Open  ]],
Cell[18473, 518, 1183, 36, 69, "Input"],
Cell[CellGroupData[{
Cell[19681, 558, 1020, 30, 52, "Input"],
Cell[20704, 590, 145, 2, 31, "Output"]
}, Open  ]],
Cell[20864, 595, 1747, 50, 69, "Input"],
Cell[CellGroupData[{
Cell[22636, 649, 1539, 44, 52, "Input"],
Cell[24178, 695, 51, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[24266, 700, 1778, 50, 52, "Input"],
Cell[26047, 752, 8046, 145, 264, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[34142, 903, 36, 0, 43, "Subsection"],
Cell[34181, 905, 3445, 99, 159, "Input"],
Cell[CellGroupData[{
Cell[37651, 1008, 1429, 37, 76, "Input"],
Cell[39083, 1047, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[39148, 1052, 414, 13, 52, "Input"],
Cell[39565, 1067, 116, 3, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[39718, 1075, 294, 8, 52, "Input"],
Cell[40015, 1085, 5215, 164, 116, "Output"]
}, Open  ]],
Cell[45245, 1252, 668, 19, 52, "Input"],
Cell[CellGroupData[{
Cell[45938, 1275, 298, 8, 72, "Input"],
Cell[46239, 1285, 2713, 92, 52, "Output"],
Cell[48955, 1379, 448, 12, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[49440, 1396, 488, 14, 54, "Input"],
Cell[49931, 1412, 28, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[49996, 1417, 225, 8, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[50246, 1429, 1455, 41, 88, "Input"],
Cell[51704, 1472, 448, 12, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[52189, 1489, 227, 6, 52, "Input"],
Cell[52419, 1497, 1416, 48, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[53872, 1550, 815, 25, 67, "Input"],
Cell[54690, 1577, 30, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[54757, 1582, 4117, 107, 197, "Input"],
Cell[58877, 1691, 18147, 439, 270, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[77061, 2135, 4164, 109, 195, "Input"],
Cell[81228, 2246, 23779, 580, 284, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[105056, 2832, 215, 7, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[105296, 2843, 3640, 94, 159, "Input"],
Cell[108939, 2939, 17666, 430, 283, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[126642, 3374, 3852, 99, 159, "Input"],
Cell[130497, 3475, 14811, 355, 287, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[145345, 3835, 3584, 92, 159, "Input"],
Cell[148932, 3929, 25839, 639, 282, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[174808, 4573, 3856, 99, 159, "Input"],
Cell[178667, 4674, 26584, 655, 283, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[205300, 5335, 335, 10, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[205660, 5349, 3003, 80, 144, "Input"],
Cell[208666, 5431, 448, 12, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[209151, 5448, 4229, 110, 179, "Input"],
Cell[213383, 5560, 20321, 498, 283, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[233741, 6063, 4579, 115, 199, "Input"],
Cell[238323, 6180, 25074, 616, 284, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[263446, 6802, 66, 0, 34, "Subsubsection"],
Cell[CellGroupData[{
Cell[263537, 6806, 1037, 30, 52, "Input"],
Cell[264577, 6838, 145, 2, 31, "Output"]
}, Open  ]],
Cell[264737, 6843, 533, 15, 31, "Input"],
Cell[265273, 6860, 537, 15, 31, "Input"],
Cell[CellGroupData[{
Cell[265835, 6879, 4694, 128, 187, "Input"],
Cell[270532, 7009, 48, 0, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[270617, 7014, 4580, 124, 207, "Input"],
Cell[275200, 7140, 2276, 66, 55, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[277513, 7211, 6596, 166, 231, "Input"],
Cell[284112, 7379, 6423, 120, 267, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[290572, 7504, 6501, 163, 279, "Input"],
Cell[297076, 7669, 5976, 112, 267, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 0xDcu2SSoNX#PA1rWip6sqSP *)
