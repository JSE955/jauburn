Class {
	#name : #JbInterpreterTest,
	#superclass : #TestCase,
	#instVars : [
		'interpreter',
		'parser'
	],
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #utilities }
JbInterpreterTest >> interpret: aString [

	| ast |
	ast :=  parser parse: aString.
	^interpreter interpret: ast.
	
]

{ #category : #running }
JbInterpreterTest >> setUp [ 

	parser := JbParser new.
	interpreter := JbInterpreter new
]

{ #category : #running }
JbInterpreterTest >> testAbsBinding [

	self interpret: 'var x = abs(-1000);'.
	self assert: (interpreter environment at: 'x') equals: 1000.
	
	self interpret: 'var y = abs(1000);'.
	self assert: (interpreter environment at: 'y') equals: 1000.
   
]

{ #category : #running }
JbInterpreterTest >> testAssignmentStatement [ 

	self interpret: 'var x = 10;x = 1 + 1;'.
	self assert: (interpreter environment at: 'x') equals: 2.
	
	self interpret: 'var y = 0; y = 100;'.
	self assert: (interpreter environment at: 'y') equals: 100.
]

{ #category : #running }
JbInterpreterTest >> testComparisonOperators [ 

	self interpret: 'var x = 1 == 1;'.
	self assert: (interpreter environment at: 'x') equals: true.
	
	self interpret: 'var x = 1 < 10;'.
	self assert: (interpreter environment at: 'x') equals: true.
	
	self interpret: 'var x = 1 <= 10;'.
	self assert: (interpreter environment at: 'x') equals: true.
	
	self interpret: 'var x = 10 > 1;'.
	self assert: (interpreter environment at: 'x') equals: true.
	
	self interpret: 'var x = 10 >= 1;'.
	self assert: (interpreter environment at: 'x') equals: true.
	
	self interpret: 'var x = 2 != 1;'.
	self assert: (interpreter environment at: 'x') equals: true.

]

{ #category : #running }
JbInterpreterTest >> testConcatBinding [ 

	self interpret: 'var x = concat("h","ello");'.
	self assert: (interpreter environment at: 'x') equals: 'hello'.
	
	self interpret: 'var y = concat("you are ","beautiful");'.
	self assert: (interpreter environment at: 'y') equals: 'you are beautiful'.
   
]

{ #category : #running }
JbInterpreterTest >> testDeclarationBindsVariableToExpressionValue [

	self interpret: 'var x = 3 + 2 * 8;'.
	self assert: (interpreter environment at: 'x') equals: 19.
	
	self interpret: 'var x = 6;var y = 2*x;'.
	self assert: (interpreter environment at: 'y') equals: 12
]

{ #category : #running }
JbInterpreterTest >> testDeclarationCreatesVariable [

	self interpret: 'var x = 99;'.
	self assert: (interpreter environment includesKey: 'x').
	
	self interpret: 'var y = 100 + 100;'.
	self assert: (interpreter environment at: 'y') equals: 200.
]

{ #category : #running }
JbInterpreterTest >> testFunctionCreatesFunction [ 
	 | f |
     self interpret: 'var f = function() { };'.
     f := interpreter environment at: 'f'.
     self assert: f parameters isEmpty.
     self assert: f body isEmpty.

]

{ #category : #running }
JbInterpreterTest >> testFunctionEvaluation [ 

	self interpret: 'var z = 0; var f = function (x) { z = x; }; f(2);'.
	self assert: (interpreter environment at: 'z') equals: 2.
   
]

{ #category : #running }
JbInterpreterTest >> testIfElseStatement [ 

	self interpret: 'if (2 == 1) {var x = true;} else {var x = false;}'.
	self assert: (interpreter environment at: 'x') equals: false.
	
	self interpret: 'if (300 >= 1) {var x = true;} else {var x = false;}'.
	self assert: (interpreter environment at: 'x') equals: true.
]

{ #category : #running }
JbInterpreterTest >> testIfStatement [ 

	self interpret: 'if (1 == 1) {var x = true;};'.
	self assert: (interpreter environment at: 'x') equals: true.
	
	self interpret: 'var x = false; if (2 == 1) {var x = true;};'.
	self assert: (interpreter environment at: 'x') equals: false.
]

{ #category : #running }
JbInterpreterTest >> testInputBinding [ 

	| mui |
	mui := JbUI new.
	interpreter uim: mui.
	self interpret: 'input("Enter a number:");'.
	self assert: mui prompt equals: 'Enter a number:'.
	
]

{ #category : #running }
JbInterpreterTest >> testLengthBinding [ 

	self interpret: 'var x = length("hello");'.
	self assert: (interpreter environment at: 'x') equals: 5.
	
	self interpret: 'var y = length("Greatsword");'.
	self assert: (interpreter environment at: 'y') equals: 10.
   
]

{ #category : #running }
JbInterpreterTest >> testModBinding [ 

	self interpret: 'var x = mod(5,3);'.
	self assert: (interpreter environment at: 'x') equals: 2.
	
	self interpret: 'var y = mod(13,7);'.
	self assert: (interpreter environment at: 'y') equals: 6.
   
]

{ #category : #running }
JbInterpreterTest >> testNotBinding [ 

	self interpret: 'var x = not(true);'.
	self assert: (interpreter environment at: 'x') equals: false.
	
	self interpret: 'var y = not(false);'.
	self assert: (interpreter environment at: 'y') equals: true.
   
]

{ #category : #running }
JbInterpreterTest >> testPrintBinding [ 
	
	| prnt |
	prnt := JbPrinter new.
	interpreter printer: prnt.
	self interpret: 'print("hello");'.
	self assert: prnt contents equals: 'hello'.
   
]

{ #category : #running }
JbInterpreterTest >> testPrintLnBinding [ 
	
	| prnt |
	prnt := JbPrinter new.
	interpreter printer: prnt.
	self interpret: 'println("goodbye");'.
	self assert: prnt contents equals: 'goodbye'.
   
]

{ #category : #running }
JbInterpreterTest >> testSimpleFunctionCallStatementExecutesBody [

     self interpret: 'var x = 1; var f = function() { x = 2; }; f();'.
     self assert: (interpreter environment at: 'x') equals: 2.
]

{ #category : #running }
JbInterpreterTest >> testStringToNumberBinding [ 

	self interpret: 'var x = stringToNumber("500");'.
	self assert: (interpreter environment at: 'x') equals: 500.
	
	self interpret: 'var y = stringToNumber("-1230");'.
	self assert: (interpreter environment at: 'y') equals: -1230.
   
]

{ #category : #running }
JbInterpreterTest >> testSubtractionAndDivisionExpressions [

	self interpret: 'var x = 10 - 5;'.
	self assert: (interpreter environment at: 'x') equals: 5.
	
	self interpret: 'var y = 15 / 5;'.
	self assert: (interpreter environment at: 'y') equals: 3
]

{ #category : #running }
JbInterpreterTest >> testUnaryNegation [

	self interpret: 'var x = -7;'.
	self assert: (interpreter environment at: 'x') equals: -7.
	
	self interpret: 'var x = -1000;'.
	self assert: (interpreter environment at: 'x') equals: -1000.

]
