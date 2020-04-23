Trait {
	#name : #TLogViewerItem,
	#category : #LogViewer
}

{ #category : #'as yet unclassified' }
TLogViewerItem classSide >> readUpToIncluding: aBlock from: aStream [
	| str |

	str := '' writeStream.
	[ aStream atEnd not and: [ aBlock value: aStream peek ] ]
		whileFalse: [ aStream next ].
	[ aStream atEnd not and: [ aBlock value: aStream peek ] ]
		whileTrue: [ str nextPut: aStream next ].
	^ str contents
]

{ #category : #'as yet unclassified' }
TLogViewerItem classSide >> skipTo: aCharacter on: aStream [
	[aStream atEnd not and: [ aStream peek ~= aCharacter ]]
		whileTrue: [ aStream next ]
]
