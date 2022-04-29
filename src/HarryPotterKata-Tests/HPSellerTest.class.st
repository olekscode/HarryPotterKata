Class {
	#name : #HPSellerTest,
	#superclass : #TestCase,
	#category : #'HarryPotterKata-Tests'
}

{ #category : #tests }
HPSellerTest >> testAllSetsOfBooks [

	| books seller expectedGroups sellerGroups |
	
	books := { 
		HPBook title: 'Harry Potter and the Order of Phoenix' .
		HPBook title: 'Harry Potter and the Sorcerer''s Stone' .
		HPBook title: 'Harry Potter and the Chamber of Secrets' .
		HPBook title: 'Harry Potter and the Chamber of Secrets' .
		HPBook title: 'Harry Potter and the Order of Phoenix' .
		HPBook title: 'Harry Potter and the Chamber of Secrets' .
	}.
	
	expectedGroups := { 
		Set withAll: {
			'Harry Potter and the Order of Phoenix' .
			'Harry Potter and the Sorcerer''s Stone' .
			'Harry Potter and the Chamber of Secrets' 
		} .
		Set withAll: { 
			'Harry Potter and the Chamber of Secrets' .
			'Harry Potter and the Order of Phoenix'
		} .
		Set withAll: { 
			'Harry Potter and the Chamber of Secrets'
		}
	} asOrderedCollection.
	
	seller := HPSeller new.
	sellerGroups := seller allSetsOfBooks: books.
	
	self assert: sellerGroups equals: expectedGroups.
]

{ #category : #tests }
HPSellerTest >> testPriceOf [

	| book seller books expectedPrice sellerPrice |
	
	book := HPBook title: 'Harry Potter and the Chamber of Secrets'.
	seller := HPSeller new.
	
	books := { book }.
	
	expectedPrice := 8.
	sellerPrice := seller priceOf: books.
	
	self assert: sellerPrice equals: expectedPrice.
]

{ #category : #tests }
HPSellerTest >> testPriceOfTwoBooks [

	| book1 book2 seller books expectedPrice sellerPrice |
	
	book1 := HPBook title: 'Harry Potter and the Chamber of Secrets'.
	book2 := HPBook title: 'Harry Potter and the Prizoner of Azkaban'.
	
	seller := HPSeller new.
	books := { book1 . book2 }.
	
	expectedPrice := (8 + 8) * 0.95.
	sellerPrice := seller priceOf: books.
	
	self assert: sellerPrice equals: expectedPrice.
]

{ #category : #tests }
HPSellerTest >> testPriceOfTwoSameBooks [

	| book1 book2 seller books expectedPrice sellerPrice |
	
	book1 := HPBook title: 'Harry Potter and the Chamber of Secrets'.
	book2 := HPBook title: 'Harry Potter and the Chamber of Secrets'.
	
	seller := HPSeller new.
	books := { book1 . book2 }.
	
	expectedPrice := 8 + 8.
	sellerPrice := seller priceOf: books.
	
	self assert: sellerPrice equals: expectedPrice.
]
