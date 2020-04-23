Trait {
	#name : #TLogViewerMessageItem,
	#instVars : [
		'message'
	],
	#category : #LogViewer
}

{ #category : #'as yet unclassified' }
TLogViewerMessageItem >> isMessageChar: char [
	"We expect to be the last thing in the stream"
	^ true
]

{ #category : #accessing }
TLogViewerMessageItem >> message [
	^ message
]

{ #category : #accessing }
TLogViewerMessageItem >> message: anObject [
	message := anObject
]

{ #category : #'as yet unclassified' }
TLogViewerMessageItem >> readMessageFrom: aStream [
	^ TLogViewerItem
		readUpToIncluding: [ :char | self isMessageChar: char ]
		from: aStream
]
