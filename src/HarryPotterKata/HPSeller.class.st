Class {
	#name : #HPSeller,
	#superclass : #Object,
	#instVars : [
		'discountMapping'
	],
	#category : #HarryPotterKata
}

{ #category : #'as yet unclassified' }
HPSeller >> allSetsOfBooks: aCollection [

	| groups group |
	groups := OrderedCollection new.
	
	aCollection do: [ :book |
		group := groups
			detect: [ :each | (each includes: book title) not ]
			ifNone: [ groups add: Set new ].
			
		group add: book title ].
	
	^ groups
]

{ #category : #'as yet unclassified' }
HPSeller >> basePrice [
	"Price of one book without discounts"
	^ 8
]

{ #category : #'as yet unclassified' }
HPSeller >> discountForGroup: aCollection [

	^ discountMapping at: aCollection size.
]

{ #category : #initialization }
HPSeller >> initialize [
	super initialize.
	discountMapping := #(1 0.95 0.9 0.8 0.75).
]

{ #category : #'price calculation' }
HPSeller >> priceOf: aCollection [ 
	
	| groups |
	groups := self allSetsOfBooks: aCollection.
	
	^ groups inject: 0 into: [ :sum :group |
		sum + (self priceOfGroup: group) ].
]

{ #category : #'as yet unclassified' }
HPSeller >> priceOfGroup: aCollection [

	| discount |
	discount := self discountForGroup: aCollection.
	^ self basePrice * aCollection size * discount.
]
