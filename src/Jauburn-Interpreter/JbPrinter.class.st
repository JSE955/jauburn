Class {
	#name : #JbPrinter,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : #'Jauburn-Interpreter'
}

{ #category : #accessing }
JbPrinter >> contents [ 

	^ contents
]

{ #category : #accessing }
JbPrinter >> contents: someContent [ 

	contents := someContent
]

{ #category : #accessing }
JbPrinter >> cr [ 

	^ Character cr.
]

{ #category : #accessing }
JbPrinter >> show: aValue [

	self contents: aValue.
]
