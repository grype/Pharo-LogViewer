Trait {
	#name : #TLogViewerFunctionCallItem,
	#instVars : [
		'functionName'
	],
	#category : #LogViewer
}

{ #category : #accessing }
TLogViewerFunctionCallItem >> functionName [
	^ functionName
]

{ #category : #accessing }
TLogViewerFunctionCallItem >> functionName: anObject [
	functionName := anObject
]

{ #category : #'as yet unclassified' }
TLogViewerFunctionCallItem >> isFunctionNameChar: char [
	^ char ~= Character space
]

{ #category : #'as yet unclassified' }
TLogViewerFunctionCallItem >> readFunctionNameFrom: aStream [
	^ TLogViewerItem
		readUpToIncluding: [ :char | self isFunctionNameChar: char ]
		from: aStream
]
