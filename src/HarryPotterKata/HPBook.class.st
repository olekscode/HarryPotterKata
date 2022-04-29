Class {
	#name : #HPBook,
	#superclass : #Object,
	#instVars : [
		'title',
		'price'
	],
	#category : #HarryPotterKata
}

{ #category : #'instance creation' }
HPBook class >> title: aString [ 
	
	^ self new
		title: aString;
		yourself 
]

{ #category : #'instance creation' }
HPBook class >> title: aString price: anInteger [ 
	
	^ self new
		title: aString;
		price: anInteger;
		yourself.
]

{ #category : #comparing }
HPBook >> = anotherObject [

	anotherObject class = self class
		ifFalse: [ ^ false ].
		
	^ self title = anotherObject title
]

{ #category : #comparing }
HPBook >> hash [

	^ title hash
]

{ #category : #accessing }
HPBook >> price [
	^ price
]

{ #category : #accessing }
HPBook >> price: anInteger [ 
	price := anInteger
]

{ #category : #accessing }
HPBook >> title [
	^ title
]

{ #category : #accessing }
HPBook >> title: aString [ 
	title := aString
]
