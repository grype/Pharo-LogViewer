"
I represent a log entry of this format:

""2020-04-21 17:10:37.046 [Debug] [File.swift:123] function(_:) Some message""
"
Class {
	#name : #XCGLogItem,
	#superclass : #Object,
	#traits : 'TLogViewerItem + TLogViewerDatedItem + TLogViewerFileSourcedItem + TLogViewerFunctionCallItem + TLogViewerLeveledItem + TLogViewerMessageItem',
	#classTraits : 'TLogViewerItem classTrait + TLogViewerDatedItem classTrait + TLogViewerFileSourcedItem classTrait + TLogViewerFunctionCallItem classTrait + TLogViewerLeveledItem classTrait + TLogViewerMessageItem classTrait',
	#instVars : [
		'date',
		'fileName',
		'lineNumber',
		'functionName',
		'level',
		'message'
	],
	#category : #LogViewer
}

{ #category : #'instance creation' }
XCGLogItem class >> fromString: aString [
	^ self new
		parseFromString: aString;
		yourself
]

{ #category : #comparing }
XCGLogItem >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ fileName = anObject fileName
		and: [ lineNumber = anObject lineNumber ]
]

{ #category : #comparing }
XCGLogItem >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ fileName hash bitXor: lineNumber hash
]

{ #category : #parsing }
XCGLogItem >> parseFromString: aString [
	"2020-04-21 17:10:37.046 [Debug] [File.swift:123] function(_:) Some message"

	| stream |

	stream := aString readStream.
	self date: (self readDateAndTimeFrom: stream).
	self level: (self readLevelFrom: stream).
	self fileName: (self readFileNameFrom: stream).
	self lineNumber: (self readLineNumberFrom: stream).
	TLogViewerItem skipTo: Character space on: stream.
	stream atEnd ifFalse: [ stream next ].
	self functionName: (self readFunctionNameFrom: stream).
	self message: (self readMessageFrom: stream)
]

{ #category : #printing }
XCGLogItem >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	aStream
		nextPutAll: fileName;
		nextPut: $:;
		nextPutAll: lineNumber asString;
		nextPut: Character space;
		nextPutAll: functionName asString
]
