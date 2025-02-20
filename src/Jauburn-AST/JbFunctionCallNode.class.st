Class {
	#name : #JbFunctionCallNode,
	#superclass : #Object,
	#instVars : [
		'identifier',
		'arguments'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbFunctionCallNode >> arguments [
	^ arguments
]

{ #category : #accessing }
JbFunctionCallNode >> arguments: anObject [
	arguments := anObject
]

{ #category : #api }
JbFunctionCallNode >> evaluateIn: environment [
	
   		^ (environment at: self identifier) call: self arguments in: environment.
]

{ #category : #api }
JbFunctionCallNode >> executeIn: environment [
	
   		^ (environment at: self identifier) call: self arguments in: environment.
]

{ #category : #accessing }
JbFunctionCallNode >> identifier [
	^ identifier
]

{ #category : #accessing }
JbFunctionCallNode >> identifier: anObject [
	identifier := anObject
]
