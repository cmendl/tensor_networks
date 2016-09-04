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
NotebookDataLength[     45281,       1321]
NotebookOptionsPosition[     42669,       1206]
NotebookOutlinePosition[     43012,       1221]
CellTagsIndexPosition[     42969,       1218]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Matrix Product States (MPS)", "Section"],

Cell[TextData[{
 "Reference:\n\tF. Verstraete, V. Murg, J. I. Cirac\n\tMatrix product states, \
projected entangled pair states, and variational renormalization group \
methods for quantum spin systems\n\tAdvances in Physics 57, 143-224 ",
 ButtonBox["DOI",
  BaseStyle->"Hyperlink",
  ButtonData->{
    URL["http://dx.doi.org/10.1080/14789940801912366"], None},
  ButtonNote->"http://dx.doi.org/10.1080/14789940801912366"]
}], "Text"],

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

Cell["Generate a random MPS", "Subsection"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"number", " ", "of", " ", "lattice", " ", "sites"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["L", "val"], "=", "7"}], ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"physical", " ", "dimension"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["d", "val"], "=", "2"}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "42", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["A", "list"], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"d", "=", 
        SubscriptBox["d", "val"]}], ",", 
       RowBox[{"D", "=", "5"}], ",", "zmax"}], "}"}], ",", 
     RowBox[{
      RowBox[{"zmax", "=", 
       RowBox[{
        RowBox[{"(", 
         RowBox[{"1", "+", "\[ImaginaryI]"}], ")"}], "/", 
        RowBox[{"Sqrt", "[", "D", "]"}]}]}], ";", 
      RowBox[{"Table", "[", 
       RowBox[{
        RowBox[{"If", "[", 
         RowBox[{
          RowBox[{"i", "\[Equal]", "1"}], ",", 
          RowBox[{"RandomComplex", "[", 
           RowBox[{
            RowBox[{"{", 
             RowBox[{
              RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
            RowBox[{"{", 
             RowBox[{"1", ",", "D"}], "}"}]}], "]"}], ",", 
          RowBox[{"If", "[", 
           RowBox[{
            RowBox[{"i", "\[Equal]", "L"}], ",", 
            RowBox[{"RandomComplex", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{"D", ",", "1"}], "}"}]}], "]"}], ",", 
            RowBox[{"RandomComplex", "[", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{
                RowBox[{"-", "zmax"}], ",", "zmax"}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{"D", ",", "D"}], "}"}]}], "]"}]}], "]"}]}], "]"}], ",", 
        RowBox[{"{", 
         RowBox[{"i", ",", "L"}], "}"}], ",", 
        RowBox[{"{", 
         RowBox[{"\[Sigma]", ",", "d"}], "}"}]}], "]"}]}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"7", ",", "2"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["A", "list"], "\[LeftDoubleBracket]", 
    RowBox[{"1", ",", "1"}], "\[RightDoubleBracket]"}], "//", 
   "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{
       RowBox[{"-", "0.06627232895386737`"}], "-", 
       RowBox[{"0.18857275248702088`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.09747184899779437`"}], "-", 
       RowBox[{"0.18170461667458437`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.13678532855815662`"}], "-", 
       RowBox[{"0.26259698586121005`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.04137563775326614`"}], "-", 
       RowBox[{"0.15637296895816521`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.05005513481812307`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.42335447166560725`", " ", "\[ImaginaryI]"}]}]}
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
   RowBox[{
    SubscriptBox["A", "list"], "\[LeftDoubleBracket]", 
    RowBox[{"1", ",", "2"}], "\[RightDoubleBracket]"}], "//", 
   "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{
       RowBox[{"-", "0.21573939694393873`"}], "+", 
       RowBox[{"0.44449976448645323`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.045241562343211195`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.2139703252013243`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.1943470868782713`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.4128992936424287`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.2274998820308991`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.11079523722109541`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.32230576440379743`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.18228547119030947`", " ", "\[ImaginaryI]"}]}]}
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
   RowBox[{
    SubscriptBox["A", "list"], "\[LeftDoubleBracket]", 
    RowBox[{"2", ",", "1"}], "\[RightDoubleBracket]"}], "//", 
   "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"0.025170888564360228`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.049804274568371554`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.09601837586641282`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.14195560869411872`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.3602704491339721`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.29209548958198406`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.30471578786165887`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.01712791036231831`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.3450272575019002`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.33949702711730834`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.024223817502583955`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.15777844272006725`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.05420639124115745`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.3938208482554659`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.37961370042427856`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.26143844807437433`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.44580304439677476`"}], "+", 
       RowBox[{"0.1073436552537872`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.35832564628227037`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.24090723634820432`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.11852117984502564`"}], "+", 
       RowBox[{"0.22115216335018095`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.20203793433536843`"}], "-", 
       RowBox[{"0.0006178483404983837`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.42674949379288574`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.36603023122942524`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.4120896621906447`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.3118918716958379`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.018996161979503823`"}], "-", 
       RowBox[{"0.3878396537708416`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.3120213755451213`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.14736640386268696`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.13154164633504006`"}], "+", 
       RowBox[{"0.4460071582616001`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.2678941433141573`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.17064707532721224`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.1200086931043467`"}], "-", 
       RowBox[{"0.21139263041569079`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.21456945357324475`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.09860591145045894`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.25896916366990297`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.17604560086120302`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.27460844512381377`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.09834954938972729`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.031013386070761095`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.24058978112820784`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.3002792734369055`"}], "+", 
       RowBox[{"0.08288384683807792`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.12256039089960513`"}], "+", 
       RowBox[{"0.16897178099985366`", " ", "\[ImaginaryI]"}]}]}
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
   RowBox[{
    SubscriptBox["A", "list"], "\[LeftDoubleBracket]", 
    RowBox[{
     RowBox[{"-", "1"}], ",", "1"}], "\[RightDoubleBracket]"}], "//", 
   "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"0.12664897980128909`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.32382729526100884`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.11795465865430499`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.09851005178515715`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.23844536279212414`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.354382925395904`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.398590622714578`"}], "+", 
       RowBox[{"0.07293090076408748`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.06507770988870143`"}], "-", 
       RowBox[{"0.034999608908343305`", " ", "\[ImaginaryI]"}]}]}
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
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "to", " ", "disk"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{
       RowBox[{"L", "=", 
        SubscriptBox["L", "val"]}], ",", 
       RowBox[{"d", "=", 
        SubscriptBox["d", "val"]}]}], "}"}], ",", 
     RowBox[{"Table", "[", 
      RowBox[{
       RowBox[{"Export", "[", 
        RowBox[{
         RowBox[{
          SubscriptBox["fn", "base"], "<>", "\"\<_A\>\"", "<>", 
          RowBox[{"ToString", "[", 
           RowBox[{"i", "-", "1"}], "]"}], "<>", "\"\<.dat\>\""}], ",", 
         RowBox[{
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"Re", "[", "#", "]"}], ",", 
             RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
          RowBox[{"Flatten", "[", 
           RowBox[{"Table", "[", 
            RowBox[{
             RowBox[{"Transpose", "[", 
              RowBox[{
               SubscriptBox["A", "list"], "\[LeftDoubleBracket]", 
               RowBox[{"i", ",", "\[Sigma]"}], "\[RightDoubleBracket]"}], 
              "]"}], ",", 
             RowBox[{"{", 
              RowBox[{"\[Sigma]", ",", "d"}], "}"}]}], "]"}], "]"}]}], ",", 
         "\"\<Real64\>\""}], "]"}], ",", 
       RowBox[{"{", 
        RowBox[{"i", ",", "L"}], "}"}]}], "]"}]}], "]"}], ";"}]}]], "Input"]
}, Open  ]],

Cell[CellGroupData[{

Cell["Norm", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["e", "list"], "=", 
   RowBox[{
    RowBox[{
     RowBox[{"Total", "[", 
      RowBox[{
       RowBox[{
        RowBox[{"KroneckerProduct", "[", 
         RowBox[{"#", ",", 
          RowBox[{"Conjugate", "[", "#", "]"}]}], "]"}], "&"}], "/@", "#"}], 
      "]"}], "&"}], "/@", 
    SubscriptBox["A", "list"]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", "7", "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["e", "list"], "\[LeftDoubleBracket]", "1", 
   "\[RightDoubleBracket]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "25"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["e", "list"], "\[LeftDoubleBracket]", "1", 
    "\[RightDoubleBracket]"}], "//", "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"0.2840752325877476`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.1260735979288014`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.07261023945620765`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.1668782433926993`"}], "+", 
       RowBox[{"0.00569966181378893`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.06609940315829181`"}], "+", 
       RowBox[{"0.07465986337984166`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.23371028861759405`"}], "+", 
       RowBox[{"0.12255633100542662`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.1260735979288014`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.07261023945620765`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.09034742809792162`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.018507826742696028`"}], "+", 
       RowBox[{"0.05952343045529265`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.01903220745510234`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.045966955353480075`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.1062264937502431`"}], "+", 
       RowBox[{"0.10938064278286935`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.1668782433926993`"}], "-", 
       RowBox[{"0.00569966181378893`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.018507826742696028`"}], "-", 
       RowBox[{"0.05952343045529265`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.2959240199606423`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.13668386504835778`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.08292621917485127`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.019886312419335223`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.052888819179912054`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.06609940315829181`"}], "-", 
       RowBox[{"0.07465986337984166`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.01903220745510234`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.045966955353480075`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.13668386504835778`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.08292621917485127`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.09019622973523261`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.02524862662024016`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.015449270784647438`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.23371028861759405`"}], "-", 
       RowBox[{"0.12255633100542662`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.1062264937502431`"}], "-", 
       RowBox[{"0.10938064278286935`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.019886312419335223`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.052888819179912054`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.02524862662024016`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.015449270784647438`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.31884352397591526`", "\[VeryThinSpace]", "+", 
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

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["e", "list"], "\[LeftDoubleBracket]", "2", 
   "\[RightDoubleBracket]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"25", ",", "25"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["e", "list"], "\[LeftDoubleBracket]", 
   RowBox[{"-", "1"}], "\[RightDoubleBracket]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"25", ",", "1"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"the", " ", "norm", " ", "is", " ", "equal", " ", "to", " ", 
    RowBox[{
     SubscriptBox["e", "1"], ".", 
     SubscriptBox["e", "2"]}], 
    SubscriptBox["\[Ellipsis]e", "L"]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Dot", "@@", 
   SubscriptBox["e", "list"]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{"0.9872785797299465`", "\[VeryThinSpace]", "-", 
    RowBox[{"3.797134466992885`*^-17", " ", "\[ImaginaryI]"}]}], "}"}], 
  "}"}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Single-site operator average", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "7", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  SubscriptBox["op", "val"], "=", 
  RowBox[{"RandomComplex", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "1"}], "-", "\[ImaginaryI]"}], ",", 
      RowBox[{"1", "+", "\[ImaginaryI]"}]}], "}"}], ",", 
    RowBox[{
     SubscriptBox["d", "val"], 
     RowBox[{"{", 
      RowBox[{"1", ",", "1"}], "}"}]}]}], "]"}]}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{"0.6598105246918942`", "\[VeryThinSpace]", "+", 
      RowBox[{"0.8310625234269278`", " ", "\[ImaginaryI]"}]}], ",", 
     RowBox[{"0.40057329040045175`", "\[VeryThinSpace]", "+", 
      RowBox[{"0.4388705411692255`", " ", "\[ImaginaryI]"}]}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"0.24056544756310272`", "\[VeryThinSpace]", "+", 
      RowBox[{"0.750607417144808`", " ", "\[ImaginaryI]"}]}], ",", 
     RowBox[{"0.2978879442106801`", "\[VeryThinSpace]", "+", 
      RowBox[{"0.9930935902583613`", " ", "\[ImaginaryI]"}]}]}], "}"}]}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "operator", " ", "to", " ", "disk"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "base"], "<>", "\"\<_op.dat\>\""}], ",", 
     RowBox[{
      RowBox[{
       RowBox[{"{", 
        RowBox[{
         RowBox[{"Re", "[", "#", "]"}], ",", 
         RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
      RowBox[{"Flatten", "[", 
       RowBox[{"Transpose", "[", 
        SubscriptBox["op", "val"], "]"}], "]"}]}], ",", "\"\<Real64\>\""}], 
    "]"}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{
   SubscriptBox["op", "list"], "=", 
   RowBox[{
    RowBox[{
     RowBox[{"Sum", "[", 
      RowBox[{
       RowBox[{
        RowBox[{
         SubscriptBox["op", "val"], "\[LeftDoubleBracket]", 
         RowBox[{"\[Alpha]", ",", "\[Beta]"}], "\[RightDoubleBracket]"}], 
        RowBox[{"KroneckerProduct", "[", 
         RowBox[{
          RowBox[{
          "#", "\[LeftDoubleBracket]", "\[Beta]", "\[RightDoubleBracket]"}], 
          ",", 
          RowBox[{"Conjugate", "[", 
           RowBox[{
           "#", "\[LeftDoubleBracket]", "\[Alpha]", "\[RightDoubleBracket]"}],
            "]"}]}], "]"}]}], ",", 
       RowBox[{"{", 
        RowBox[{"\[Alpha]", ",", 
         SubscriptBox["d", "val"]}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"\[Beta]", ",", 
         SubscriptBox["d", "val"]}], "}"}]}], "]"}], "&"}], "/@", 
    SubscriptBox["A", "list"]}]}], ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", "7", "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["op", "list"], "\[LeftDoubleBracket]", "1", 
   "\[RightDoubleBracket]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "25"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["op", "list"], "\[LeftDoubleBracket]", "1", 
    "\[RightDoubleBracket]"}], "//", "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"0.03264271428070584`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.18172076185197494`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.02116612776912207`"}], "+", 
       RowBox[{"0.05207437901629732`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.04748276545425929`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.22243127025601253`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.044863028832095406`"}], "-", 
       RowBox[{"0.10474103234343833`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.1393818443997797`"}], "-", 
       RowBox[{"0.05978941308211473`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.032175376594413094`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.04840637199754649`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.010608078431130099`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.02932102817304679`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.010200758876345823`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.021230074162501958`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.004217323522409356`"}], "-", 
       RowBox[{"0.005753021599681983`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.06605866594200423`"}], "-", 
       RowBox[{"0.027726797179961644`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.13541302610396055`"}], "-", 
       RowBox[{"0.16300111125318034`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.03706094411283489`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.03349180249344465`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.20586919704577006`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.3942279996808597`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.19581240739540434`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.12394512601894067`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.08519632133113886`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.09788659805334504`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.006887680714347037`"}], "-", 
       RowBox[{"0.10243291041770995`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.030779379408910228`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.0033578447440585427`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.0074694390119047355`"}], "+", 
       RowBox[{"0.21680144306733995`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.05392989658790169`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.10117126600322776`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.04665554777303306`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.014697401186240633`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.12014621482149482`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.12115273896008913`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.025344991017167966`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.033413811425540715`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.2601220079928355`"}], "-", 
       RowBox[{"0.015165494304800714`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.1077687442700781`"}], "+", 
       RowBox[{"0.05573837448984355`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.07623868855022663`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.19129812819604683`", " ", "\[ImaginaryI]"}]}]}
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
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["op", "list"], "\[LeftDoubleBracket]", "2", 
   "\[RightDoubleBracket]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"25", ",", "25"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{
    "average", " ", "with", " ", "respect", " ", "to", " ", "single"}], "-", 
    RowBox[{"site", " ", "operator"}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], "}"}], ",", 
    RowBox[{"Sum", "[", 
     RowBox[{
      RowBox[{"Dot", "@@", 
       RowBox[{"Catenate", "[", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{
           SubscriptBox["e", "list"], "\[LeftDoubleBracket]", 
           RowBox[{"1", ";;", 
            RowBox[{"i", "-", "1"}]}], "\[RightDoubleBracket]"}], ",", 
          RowBox[{"{", 
           RowBox[{
            SubscriptBox["op", "list"], "\[LeftDoubleBracket]", "i", 
            "\[RightDoubleBracket]"}], "}"}], ",", 
          RowBox[{
           SubscriptBox["e", "list"], "\[LeftDoubleBracket]", 
           RowBox[{
            RowBox[{"i", "+", "1"}], ";;", "L"}], "\[RightDoubleBracket]"}]}],
          "}"}], "]"}]}], ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", "L"}], "}"}]}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{"3.5064467501058125`", "\[VeryThinSpace]", "+", 
    RowBox[{"6.2666073957732165`", " ", "\[ImaginaryI]"}]}], "}"}], 
  "}"}]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Two-site operator average", "Subsection"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "21", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  SubscriptBox["op1", "val"], "=", 
  RowBox[{"RandomComplex", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "1"}], "-", "\[ImaginaryI]"}], ",", 
      RowBox[{"1", "+", "\[ImaginaryI]"}]}], "}"}], ",", 
    RowBox[{
     SubscriptBox["d", "val"], 
     RowBox[{"{", 
      RowBox[{"1", ",", "1"}], "}"}]}]}], "]"}]}], "\[IndentingNewLine]", 
 RowBox[{
  SubscriptBox["op2", "val"], "=", 
  RowBox[{"RandomComplex", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{
      RowBox[{
       RowBox[{"-", "1"}], "-", "\[ImaginaryI]"}], ",", 
      RowBox[{"1", "+", "\[ImaginaryI]"}]}], "}"}], ",", 
    RowBox[{
     SubscriptBox["d", "val"], 
     RowBox[{"{", 
      RowBox[{"1", ",", "1"}], "}"}]}]}], "]"}]}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{"-", "0.46868593921912316`"}], "-", 
      RowBox[{"0.46539444707503685`", " ", "\[ImaginaryI]"}]}], ",", 
     RowBox[{
      RowBox[{"-", "0.007555848322640557`"}], "+", 
      RowBox[{"0.25391441798356373`", " ", "\[ImaginaryI]"}]}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"0.08936410460530242`", "\[VeryThinSpace]", "+", 
      RowBox[{"0.7528793537400142`", " ", "\[ImaginaryI]"}]}], ",", 
     RowBox[{
      RowBox[{"-", "0.2125265753772858`"}], "-", 
      RowBox[{"0.9869312847723108`", " ", "\[ImaginaryI]"}]}]}], "}"}]}], 
  "}"}]], "Output"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{"-", "0.005012981542169115`"}], "+", 
      RowBox[{"0.8530689612036753`", " ", "\[ImaginaryI]"}]}], ",", 
     RowBox[{
      RowBox[{"-", "0.8675385815421075`"}], "-", 
      RowBox[{"0.39459082452559935`", " ", "\[ImaginaryI]"}]}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{"-", "0.830124868498415`"}], "-", 
      RowBox[{"0.33572420510535883`", " ", "\[ImaginaryI]"}]}], ",", 
     RowBox[{
      RowBox[{"-", "0.00682861846086924`"}], "-", 
      RowBox[{"0.35060676106640676`", " ", "\[ImaginaryI]"}]}]}], "}"}]}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{"save", " ", "operators", " ", "to", " ", "disk"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_op1.dat\>\""}], ",", 
      RowBox[{
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Re", "[", "#", "]"}], ",", 
          RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
       RowBox[{"Flatten", "[", 
        RowBox[{"Transpose", "[", 
         SubscriptBox["op1", "val"], "]"}], "]"}]}], ",", "\"\<Real64\>\""}], 
     "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_op2.dat\>\""}], ",", 
      RowBox[{
       RowBox[{
        RowBox[{"{", 
         RowBox[{
          RowBox[{"Re", "[", "#", "]"}], ",", 
          RowBox[{"Im", "[", "#", "]"}]}], "}"}], "&"}], "/@", 
       RowBox[{"Flatten", "[", 
        RowBox[{"Transpose", "[", 
         SubscriptBox["op2", "val"], "]"}], "]"}]}], ",", "\"\<Real64\>\""}], 
     "]"}], ";"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"tensor", " ", "product", " ", 
     RowBox[{"op1", "\[CircleTimes]", "op2"}], " ", "acting", " ", "on", " ", 
     "sites", " ", "i", " ", "and", " ", "i"}], "+", "1"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     SubscriptBox["op12", "list"], "=", 
     RowBox[{"Block", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{"L", "=", 
         SubscriptBox["L", "val"]}], "}"}], ",", 
       RowBox[{"Table", "[", 
        RowBox[{
         RowBox[{"Sum", "[", 
          RowBox[{
           RowBox[{
            RowBox[{
             SubscriptBox["op1", "val"], "\[LeftDoubleBracket]", 
             RowBox[{"\[Alpha]1", ",", "\[Beta]1"}], 
             "\[RightDoubleBracket]"}], 
            RowBox[{
             SubscriptBox["op2", "val"], "\[LeftDoubleBracket]", 
             RowBox[{"\[Alpha]2", ",", "\[Beta]2"}], 
             "\[RightDoubleBracket]"}], 
            RowBox[{
             RowBox[{"KroneckerProduct", "[", 
              RowBox[{
               RowBox[{
                SubscriptBox["A", "list"], "\[LeftDoubleBracket]", 
                RowBox[{"i", ",", "\[Beta]1"}], "\[RightDoubleBracket]"}], 
               ",", 
               RowBox[{"Conjugate", "[", 
                RowBox[{
                 SubscriptBox["A", "list"], "\[LeftDoubleBracket]", 
                 RowBox[{"i", ",", "\[Alpha]1"}], "\[RightDoubleBracket]"}], 
                "]"}]}], "]"}], ".", 
             RowBox[{"KroneckerProduct", "[", 
              RowBox[{
               RowBox[{
                SubscriptBox["A", "list"], "\[LeftDoubleBracket]", 
                RowBox[{
                 RowBox[{"i", "+", "1"}], ",", "\[Beta]2"}], 
                "\[RightDoubleBracket]"}], ",", 
               RowBox[{"Conjugate", "[", 
                RowBox[{
                 SubscriptBox["A", "list"], "\[LeftDoubleBracket]", 
                 RowBox[{
                  RowBox[{"i", "+", "1"}], ",", "\[Alpha]2"}], 
                 "\[RightDoubleBracket]"}], "]"}]}], "]"}]}]}], ",", 
           RowBox[{"{", 
            RowBox[{"\[Alpha]1", ",", 
             SubscriptBox["d", "val"]}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"\[Beta]1", ",", 
             SubscriptBox["d", "val"]}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"\[Alpha]2", ",", 
             SubscriptBox["d", "val"]}], "}"}], ",", 
           RowBox[{"{", 
            RowBox[{"\[Beta]2", ",", 
             SubscriptBox["d", "val"]}], "}"}]}], "]"}], ",", 
         RowBox[{"{", 
          RowBox[{"i", ",", 
           RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}], "]"}]}], ";"}], 
   "\[IndentingNewLine]", 
   RowBox[{"Dimensions", "[", "%", "]"}]}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", "6", "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["op12", "list"], "\[LeftDoubleBracket]", "1", 
   "\[RightDoubleBracket]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"1", ",", "25"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "example", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["op12", "list"], "\[LeftDoubleBracket]", "1", 
    "\[RightDoubleBracket]"}], "//", "MatrixForm"}]}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{
       RowBox[{"-", "0.06612195322053929`"}], "-", 
       RowBox[{"0.011205244864024242`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.042373781004003436`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.027202214546042727`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.04518788434882117`"}], "+", 
       RowBox[{"0.18982472937060874`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.019461763747336346`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.10176233974286136`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.09858778476689845`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.0431734965821662`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.07038529013867084`"}], "-", 
       RowBox[{"0.01924636261650621`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.020804454377446976`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.027416532329754592`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.0818129497010538`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.10509967546694968`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.014013505104256266`"}], "+", 
       RowBox[{"0.10876310127588856`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.0011844842385301396`"}], "-", 
       RowBox[{"0.06898711272555874`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.07949530829394039`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.1776338185040237`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.012516923844051026`"}], "-", 
       RowBox[{"0.1282292948533813`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.15479710137827812`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.24767908022335774`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.19451357520788182`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.031168406197372614`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.3662311327239589`"}], "+", 
       RowBox[{"0.0442712126072159`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.12164148255553667`"}], "-", 
       RowBox[{"0.13373390249732206`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.05051585317113258`"}], "+", 
       RowBox[{"0.16858734203256753`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.1107346166923743`"}], "+", 
       RowBox[{"0.024574549572042578`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.1465811356870119`"}], "+", 
       RowBox[{"0.14569748308680588`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.07248077700412847`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.028727577517828645`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.2714060342116987`"}], "+", 
       RowBox[{"0.13860858807983867`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.25106020987000444`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.07603738962841868`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.26259312662736667`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.19593577375710008`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.06827233922132553`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.27784669133724404`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.02602591987069893`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.4131139073439239`", " ", "\[ImaginaryI]"}]}]}
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
 RowBox[{"Dimensions", "[", 
  RowBox[{
   SubscriptBox["op12", "list"], "\[LeftDoubleBracket]", "2", 
   "\[RightDoubleBracket]"}], "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"25", ",", "25"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
    RowBox[{"average", " ", "with", " ", "respect", " ", "to", " ", "two"}], 
    "-", 
    RowBox[{"site", " ", "operators"}]}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{"Block", "[", 
   RowBox[{
    RowBox[{"{", 
     RowBox[{"L", "=", 
      SubscriptBox["L", "val"]}], "}"}], ",", 
    RowBox[{"Sum", "[", 
     RowBox[{
      RowBox[{"Dot", "@@", 
       RowBox[{"Catenate", "[", 
        RowBox[{"{", 
         RowBox[{
          RowBox[{
           SubscriptBox["e", "list"], "\[LeftDoubleBracket]", 
           RowBox[{"1", ";;", 
            RowBox[{"i", "-", "1"}]}], "\[RightDoubleBracket]"}], ",", 
          RowBox[{"{", 
           RowBox[{
            SubscriptBox["op12", "list"], "\[LeftDoubleBracket]", "i", 
            "\[RightDoubleBracket]"}], "}"}], ",", 
          RowBox[{
           SubscriptBox["e", "list"], "\[LeftDoubleBracket]", 
           RowBox[{
            RowBox[{"i", "+", "2"}], ";;", "L"}], "\[RightDoubleBracket]"}]}],
          "}"}], "]"}]}], ",", 
      RowBox[{"{", 
       RowBox[{"i", ",", 
        RowBox[{"L", "-", "1"}]}], "}"}]}], "]"}]}], "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{"1.4404951113888615`", "\[VeryThinSpace]", "-", 
    RowBox[{"0.6011221276170966`", " ", "\[ImaginaryI]"}]}], "}"}], 
  "}"}]], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{1654, 920},
WindowMargins->{{Automatic, 209}, {Automatic, 54}},
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
Cell[1486, 35, 46, 0, 63, "Section"],
Cell[1535, 37, 435, 9, 87, "Text"],
Cell[1973, 48, 123, 3, 31, "Input"],
Cell[2099, 53, 242, 7, 31, "Input"],
Cell[CellGroupData[{
Cell[2366, 64, 43, 0, 43, "Subsection"],
Cell[2412, 66, 233, 7, 52, "Input"],
Cell[2648, 75, 209, 6, 52, "Input"],
Cell[CellGroupData[{
Cell[2882, 85, 1924, 55, 92, "Input"],
Cell[4809, 142, 73, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[4919, 149, 265, 7, 52, "Input"],
Cell[5187, 158, 1220, 30, 45, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[6444, 193, 265, 7, 52, "Input"],
Cell[6712, 202, 1208, 27, 45, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[7957, 234, 265, 7, 52, "Input"],
Cell[8225, 243, 3855, 78, 106, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[12117, 326, 286, 8, 52, "Input"],
Cell[12406, 336, 1239, 32, 106, "Output"]
}, Open  ]],
Cell[13660, 371, 1408, 40, 52, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15105, 416, 26, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[15156, 420, 447, 14, 52, "Input"],
Cell[15606, 436, 50, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15693, 442, 160, 4, 31, "Input"],
Cell[15856, 448, 74, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[15967, 455, 241, 6, 52, "Input"],
Cell[16211, 463, 3755, 76, 45, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20003, 544, 160, 4, 31, "Input"],
Cell[20166, 550, 75, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20278, 557, 175, 4, 31, "Input"],
Cell[20456, 563, 74, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[20567, 570, 344, 9, 52, "Input"],
Cell[20914, 581, 197, 5, 33, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[21160, 592, 50, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[21235, 596, 474, 15, 52, "Input"],
Cell[21712, 613, 659, 15, 31, "Output"]
}, Open  ]],
Cell[22386, 631, 627, 19, 52, "Input"],
Cell[CellGroupData[{
Cell[23038, 654, 995, 28, 52, "Input"],
Cell[24036, 684, 50, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[24123, 690, 161, 4, 31, "Input"],
Cell[24287, 696, 74, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[24398, 703, 242, 6, 52, "Input"],
Cell[24643, 711, 3852, 76, 45, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[28532, 792, 161, 4, 31, "Input"],
Cell[28696, 798, 75, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[28808, 805, 1145, 32, 52, "Input"],
Cell[29956, 839, 193, 5, 31, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[30198, 850, 47, 0, 43, "Subsection"],
Cell[CellGroupData[{
Cell[30270, 854, 868, 28, 72, "Input"],
Cell[31141, 884, 670, 18, 31, "Output"],
Cell[31814, 904, 671, 19, 31, "Output"]
}, Open  ]],
Cell[32500, 926, 1167, 35, 72, "Input"],
Cell[CellGroupData[{
Cell[33692, 965, 2791, 71, 112, "Input"],
Cell[36486, 1038, 50, 1, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[36573, 1044, 163, 4, 31, "Input"],
Cell[36739, 1050, 74, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[36850, 1057, 244, 6, 52, "Input"],
Cell[37097, 1065, 3847, 78, 45, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[40981, 1148, 163, 4, 31, "Input"],
Cell[41147, 1154, 75, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[41259, 1161, 1174, 33, 52, "Input"],
Cell[42436, 1196, 193, 5, 31, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 4upPCBv8fXeigCKxn@CTtinf *)
