Trait {
	#name : #TLogViewerFileSourcedItem,
	#instVars : [
		'fileName',
		'lineNumber'
	],
	#category : #LogViewer
}

{ #category : #accessing }
TLogViewerFileSourcedItem >> fileName [
	^ fileName
]

{ #category : #accessing }
TLogViewerFileSourcedItem >> fileName: anObject [
	fileName := anObject
]

{ #category : #'as yet unclassified' }
TLogViewerFileSourcedItem >> isFileNameChar: char [
	^ char isAlphaNumeric or: [ '_.-' includes: char ]
]

{ #category : #'as yet unclassified' }
TLogViewerFileSourcedItem >> isLineNumberChar: char [
	^ char isDigit
]

{ #category : #accessing }
TLogViewerFileSourcedItem >> lineNumber [
	^ lineNumber
]

{ #category : #accessing }
TLogViewerFileSourcedItem >> lineNumber: anObject [
	lineNumber := anObject
]

{ #category : #'as yet unclassified' }
TLogViewerFileSourcedItem >> readFileNameFrom: aStream [
	^ TLogViewerItem
		readUpToIncluding: [ :char | self isFileNameChar: char ]
		from: aStream
]

{ #category : #'as yet unclassified' }
TLogViewerFileSourcedItem >> readLineNumberFrom: aStream [
	^ TLogViewerItem
		readUpToIncluding: [ :char | self isLineNumberChar: char ]
		from: aStream
]
