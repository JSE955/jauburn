Class {
	#name : #JbUI,
	#superclass : #Object,
	#instVars : [
		'prompt'
	],
	#category : #'Jauburn-Interpreter'
}

{ #category : #accessing }
JbUI >> prompt [  

	^ prompt.
]

{ #category : #accessing }
JbUI >> prompt: aString [ 

	prompt := aString.
]

{ #category : #accessing }
JbUI >> request: aString [ 

	self prompt: aString.
]
