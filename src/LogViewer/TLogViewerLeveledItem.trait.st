Trait {
	#name : #TLogViewerLeveledItem,
	#instVars : [
		'level'
	],
	#category : #LogViewer
}

{ #category : #'as yet unclassified' }
TLogViewerLeveledItem >> isLevelCharacter: aCharacter [
	^ aCharacter isAlphaNumeric 
]

{ #category : #accessing }
TLogViewerLeveledItem >> level [
	^ level
]

{ #category : #accessing }
TLogViewerLeveledItem >> level: anObject [
	level := anObject
]

{ #category : #'as yet unclassified' }
TLogViewerLeveledItem >> readLevelFrom: aStream [
	^ TLogViewerItem
		readUpToIncluding: [ :char | self isLevelCharacter: char ]
		from: aStream
]
