Class {
	#name : #JbFunctionNode,
	#superclass : #Object,
	#instVars : [
		'body',
		'parameters'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbFunctionNode >> body [
	^ body
]

{ #category : #accessing }
JbFunctionNode >> body: anObject [
	body := anObject
]

{ #category : #api }
JbFunctionNode >> evaluateIn: environment [ 
	
	| func |
	
	func := JbFunction new.
	func environment: environment.
	func body: self body.
	func parameters: (self parameters collect: [ :p | p identifier ]).
	^ func.
	
]

{ #category : #accessing }
JbFunctionNode >> parameters [
	^ parameters
]

{ #category : #accessing }
JbFunctionNode >> parameters: anObject [
	parameters := anObject
]
