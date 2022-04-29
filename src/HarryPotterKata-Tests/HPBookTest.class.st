Class {
	#name : #HPBookTest,
	#superclass : #TestCase,
	#category : #'HarryPotterKata-Tests'
}

{ #category : #tests }
HPBookTest >> testTitle [

	| title book |
	title := 'Harry Potter and the Sorcerer''s Stone'.
	book := HPBook title: title.
	self assert: book title equals: title.
]
