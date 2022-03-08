Class {
	#name : #JbIfElseNode,
	#superclass : #JbIfNode,
	#instVars : [
		'falseStatements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbIfElseNode >> executeIn: environment [ 
	 
	| cond |
	cond := self condition evaluateIn: environment.
		cond
			ifTrue: [ self trueStatements do: [ :each | each executeIn: environment ] ]
			ifFalse: [ self falseStatements do: [ :each | each executeIn: environment ] ]
]

{ #category : #accessing }
JbIfElseNode >> falseStatements [
	^ falseStatements
]

{ #category : #accessing }
JbIfElseNode >> falseStatements: anObject [
	falseStatements := anObject
]
