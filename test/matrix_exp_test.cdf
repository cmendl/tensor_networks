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
NotebookDataLength[     17057,        452]
NotebookOptionsPosition[     17015,        428]
NotebookOutlinePosition[     17358,        443]
CellTagsIndexPosition[     17315,        440]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Matrix exponential test", "Section"],

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

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", "dimension", " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    SubscriptBox["n", "val"], "=", "7"}], ";"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[{
 RowBox[{
  RowBox[{"SeedRandom", "[", "42", "]"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{
   SubscriptBox["A", "mat"], "=", 
   RowBox[{"Block", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"T", "=", 
       RowBox[{"RandomReal", "[", 
        RowBox[{
         RowBox[{"{", 
          RowBox[{
           RowBox[{"-", "1"}], ",", "1"}], "}"}], ",", 
         RowBox[{
          SubscriptBox["n", "val"], 
          RowBox[{"{", 
           RowBox[{"1", ",", "1"}], "}"}]}]}], "]"}]}], "}"}], ",", 
     RowBox[{
      FractionBox["1", "2"], 
      RowBox[{"(", 
       RowBox[{"T", "+", 
        RowBox[{"Transpose", "[", "T", "]"}]}], ")"}]}]}], "]"}]}], 
  ";"}], "\[IndentingNewLine]", 
 RowBox[{"Dimensions", "[", "%", "]"}]}], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"7", ",", "7"}], "}"}]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  SubscriptBox["A", "mat"], "//", "MatrixForm"}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"-", "0.14818943256807504`"}], 
      RowBox[{"-", "0.40256919566193994`"}], "0.20741815288312093`", 
      "0.06109243844885737`", 
      RowBox[{"-", "0.44245961388565247`"}], "0.13801975644333053`", 
      RowBox[{"-", "0.16847791762162267`"}]},
     {
      RowBox[{"-", "0.40256919566193994`"}], 
      RowBox[{"-", "0.34966058843392167`"}], "0.9702905332985816`", 
      "0.16159062877824226`", "0.4512018559882083`", "0.0702186172057433`", 
      RowBox[{"-", "0.08136983327244707`"}]},
     {"0.20741815288312093`", "0.9702905332985816`", "0.4784521923178975`", 
      RowBox[{"-", "0.1209528364850212`"}], 
      RowBox[{"-", "0.2563835484582695`"}], "0.09571340516620763`", 
      RowBox[{"-", "0.10888477375824102`"}]},
     {"0.06109243844885737`", "0.16159062877824226`", 
      RowBox[{"-", "0.1209528364850212`"}], "0.7715044018645734`", 
      RowBox[{"-", "0.19880222629859778`"}], 
      RowBox[{"-", "0.0735692100210259`"}], "0.36873814791699244`"},
     {
      RowBox[{"-", "0.44245961388565247`"}], "0.4512018559882083`", 
      RowBox[{"-", "0.2563835484582695`"}], 
      RowBox[{"-", "0.19880222629859778`"}], "0.954240877484517`", 
      "0.7006261907839835`", 
      RowBox[{"-", "0.1799495501625885`"}]},
     {"0.13801975644333053`", "0.0702186172057433`", "0.09571340516620763`", 
      RowBox[{"-", "0.0735692100210259`"}], "0.7006261907839835`", 
      "0.579072654042172`", "0.6335942605593832`"},
     {
      RowBox[{"-", "0.16847791762162267`"}], 
      RowBox[{"-", "0.08136983327244707`"}], 
      RowBox[{"-", "0.10888477375824102`"}], "0.36873814791699244`", 
      RowBox[{"-", "0.1799495501625885`"}], "0.6335942605593832`", 
      "0.03829917188266707`"}
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
  RowBox[{"Table", "[", 
   RowBox[{
    RowBox[{
     SubscriptBox["expA", "t"], "=", 
     RowBox[{"MatrixExp", "[", 
      RowBox[{
       RowBox[{"-", "t"}], " ", 
       SubscriptBox["A", "mat"]}], "]"}]}], ",", 
    RowBox[{"{", 
     RowBox[{"t", ",", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"1", "/", "7"}], ",", 
        RowBox[{
         RowBox[{"3", "/", "10"}], "+", 
         RowBox[{"\[ImaginaryI]", "/", "7"}]}]}], "}"}]}], "}"}]}], "]"}], 
  ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  SubscriptBox["expA", 
   RowBox[{"1", "/", "7"}]], "//", "MatrixForm"}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {"1.026059075164535`", "0.06026444212292236`", 
      RowBox[{"-", "0.031669569165024454`"}], 
      RowBox[{"-", "0.009224595337447404`"}], "0.05871228134386979`", 
      RowBox[{"-", "0.023343817620593833`"}], "0.02640988127208771`"},
     {"0.06026444212292236`", "1.065249792870553`", 
      RowBox[{"-", "0.14010966879177783`"}], 
      RowBox[{"-", "0.02514158262966701`"}], 
      RowBox[{"-", "0.06256615065232773`"}], 
      RowBox[{"-", "0.007129975041857951`"}], "0.011767586630451889`"},
     {
      RowBox[{"-", "0.031669569165024454`"}], 
      RowBox[{"-", "0.14010966879177789`"}], "0.9448551458716636`", 
      "0.017611420869789347`", "0.037650216008091375`", 
      RowBox[{"-", "0.01413013947324388`"}], "0.014519283930105655`"},
     {
      RowBox[{"-", "0.009224595337447407`"}], 
      RowBox[{"-", "0.025141582629667016`"}], "0.017611420869789347`", 
      "0.8977979740021439`", "0.024783311231309415`", "0.010618828263387198`", 
      RowBox[{"-", "0.050036878641132106`"}]},
     {"0.05871228134386973`", 
      RowBox[{"-", "0.06256615065232772`"}], "0.037650216008091375`", 
      "0.024783311231309404`", "0.8821751476155456`", 
      RowBox[{"-", "0.0916306269020549`"}], "0.02827248465153581`"},
     {
      RowBox[{"-", "0.023343817620593826`"}], 
      RowBox[{"-", "0.007129975041857953`"}], 
      RowBox[{"-", "0.014130139473243878`"}], "0.0106188282633872`", 
      RowBox[{"-", "0.09163062690205488`"}], "0.9295264934861748`", 
      RowBox[{"-", "0.08881239878368484`"}]},
     {"0.026409881272087717`", "0.011767586630451892`", 
      "0.014519283930105651`", 
      RowBox[{"-", "0.050036878641132106`"}], "0.028272484651535812`", 
      RowBox[{"-", "0.08881239878368484`"}], "1.000759447781178`"}
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
  SubscriptBox["expA", 
   RowBox[{
    RowBox[{"3", "/", "10"}], "+", 
    RowBox[{"\[ImaginaryI]", "/", "7"}]}]], "//", "MatrixForm"}]], "Input"],

Cell[BoxData[
 TagBox[
  RowBox[{"(", "\[NoBreak]", GridBox[{
     {
      RowBox[{"1.0609935875090302`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.042331207108911854`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.12993346072120793`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.072020008774731`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.06903304450821508`"}], "-", 
       RowBox[{"0.03956677603035299`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.019976272156409413`"}], "-", 
       RowBox[{"0.011797615361964713`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.11741550653621739`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.04691880294440726`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.053718169326009195`"}], "-", 
       RowBox[{"0.03398513990649202`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.058460021090178844`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.034844014447839536`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.12993346072120796`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.07202000877473103`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"1.1565199221994886`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.11754531986632503`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.2957888696906454`"}], "-", 
       RowBox[{"0.15063042445843222`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.05539555225440336`"}], "-", 
       RowBox[{"0.0321196311005676`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.12879498861970104`"}], "-", 
       RowBox[{"0.06024899486555496`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.011192847324767023`"}], "+", 
       RowBox[{"0.0006148697974513712`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.0248595933783048`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.012567654350472263`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.06903304450821508`"}], "-", 
       RowBox[{"0.039566776030353`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.2957888696906453`"}], "-", 
       RowBox[{"0.15063042445843228`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.9013168926694168`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.014077150777940754`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.03736132562533667`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.01954778371701676`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.08030901410173442`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.04190790451904892`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.030254444821660023`"}], "-", 
       RowBox[{"0.01584352951744994`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.029136608076784146`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.011674670622671326`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.019976272156409416`"}], "-", 
       RowBox[{"0.011797615361964709`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.055395552254403374`"}], "-", 
       RowBox[{"0.0321196311005676`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.03736132562533668`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.019547783717016758`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.7959075313607131`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.07920765486173159`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.04729434389977729`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.015382476744155469`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.022445479846055875`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.011500094842806443`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.10157062796826057`"}], "-", 
       RowBox[{"0.04305219154043722`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.11741550653621739`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.04691880294440726`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.12879498861970104`"}], "-", 
       RowBox[{"0.06024899486555499`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.08030901410173442`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.04190790451904892`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.04729434389977729`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.015382476744155469`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.7767362845129823`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.06766233294113236`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.1813142252525275`"}], "-", 
       RowBox[{"0.07129070671564636`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.06268189476041593`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.03612274551917053`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{
       RowBox[{"-", "0.0537181693260092`"}], "-", 
       RowBox[{"0.03398513990649202`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.011192847324767025`"}], "+", 
       RowBox[{"0.0006148697974513704`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.030254444821660006`"}], "-", 
       RowBox[{"0.015843529517449943`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.022445479846055882`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.011500094842806447`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.18131422525252747`"}], "-", 
       RowBox[{"0.07129070671564634`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.8680109304085815`", "\[VeryThinSpace]", "-", 
       RowBox[{"0.03594914552789803`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.1841932630775046`"}], "-", 
       RowBox[{"0.08584859706089817`", " ", "\[ImaginaryI]"}]}]},
     {
      RowBox[{"0.058460021090178844`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.034844014447839536`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.024859593378304807`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.012567654350472269`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.029136608076784153`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.011674670622671328`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.10157062796826055`"}], "-", 
       RowBox[{"0.043052191540437226`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"0.06268189476041593`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.03612274551917052`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{
       RowBox[{"-", "0.18419326307750464`"}], "-", 
       RowBox[{"0.08584859706089817`", " ", "\[ImaginaryI]"}]}], 
      RowBox[{"1.0097010205241048`", "\[VeryThinSpace]", "+", 
       RowBox[{"0.020253709593698377`", " ", "\[ImaginaryI]"}]}]}
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
   RowBox[{
    RowBox[{"save", " ", "'"}], 
    RowBox[{"A", "'"}], " ", "matrix", " ", "to", " ", "disk"}], " ", "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{"Export", "[", 
    RowBox[{
     RowBox[{
      SubscriptBox["fn", "base"], "<>", "\"\<_A.dat\>\""}], ",", 
     RowBox[{"Flatten", "[", 
      RowBox[{"Transpose", "[", 
       SubscriptBox["A", "mat"], "]"}], "]"}], ",", "\"\<Real64\>\""}], "]"}],
    ";"}]}]], "Input"],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", " ", 
   RowBox[{
   "save", " ", "matrix", " ", "exponentials", " ", "as", " ", "reference", 
    " ", "to", " ", "disk"}], " ", "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_exp17A.dat\>\""}], ",", 
      RowBox[{"Transpose", "[", 
       RowBox[{
        SubscriptBox["expA", 
         RowBox[{"1", "/", "7"}]], "+", 
        RowBox[{"0.", "\[ImaginaryI]"}]}], "]"}], ",", "\"\<Complex128\>\""}],
      "]"}], ";"}], "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"Export", "[", 
     RowBox[{
      RowBox[{
       SubscriptBox["fn", "base"], "<>", "\"\<_exp3i7A.dat\>\""}], ",", 
      RowBox[{"Transpose", "[", 
       SubscriptBox["expA", 
        RowBox[{
         RowBox[{"3", "/", "10"}], "+", 
         RowBox[{"\[ImaginaryI]", "/", "7"}]}]], "]"}], ",", 
      "\"\<Complex128\>\""}], "]"}], ";"}]}]}]], "Input"]
}, Open  ]]
},
WindowSize->{1654, 920},
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
Cell[1486, 35, 42, 0, 63, "Section"],
Cell[1531, 37, 123, 3, 31, "Input"],
Cell[1657, 42, 174, 5, 31, "Input"],
Cell[1834, 49, 178, 5, 52, "Input"],
Cell[CellGroupData[{
Cell[2037, 58, 777, 25, 88, "Input"],
Cell[2817, 85, 73, 2, 31, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[2927, 92, 83, 2, 31, "Input"],
Cell[3013, 96, 2271, 49, 131, "Output"]
}, Open  ]],
Cell[5299, 148, 511, 18, 31, "Input"],
Cell[CellGroupData[{
Cell[5835, 170, 108, 3, 31, "Input"],
Cell[5946, 175, 2301, 48, 131, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[8284, 228, 171, 5, 31, "Input"],
Cell[8458, 235, 7054, 142, 138, "Output"]
}, Open  ]],
Cell[15527, 380, 491, 15, 52, "Input"],
Cell[16021, 397, 978, 28, 72, "Input"]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature VxpJQXsquakDGDKc1hsRaie7 *)
