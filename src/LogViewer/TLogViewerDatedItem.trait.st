Trait {
	#name : #TLogViewerDatedItem,
	#instVars : [
		'date'
	],
	#category : #LogViewer
}

{ #category : #accessing }
TLogViewerDatedItem >> date [
	^ date
]

{ #category : #accessing }
TLogViewerDatedItem >> date: anObject [
	date := anObject
]

{ #category : #parsing }
TLogViewerDatedItem >> isDateAndTimeCharacter: next [
	^ next isDigit or: [ ' -:.' includes: next ]
]

{ #category : #parsing }
TLogViewerDatedItem >> readDateAndTimeFrom: aStream [
	^ (TLogViewerItem
		readUpToIncluding: [ :char | self isDateAndTimeCharacter: char ]
		from: aStream) asDateAndTime
]

{ #category : #parsing }
TLogViewerDatedItem >> readDateFrom: aStream [
	^ (TLogViewerItem
		readUpToIncluding: [ :char | self isDateAndTimeCharacter: char ]
		from: aStream) asDate
]
