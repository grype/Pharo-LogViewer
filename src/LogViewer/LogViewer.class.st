"
I am a general purpose viewer of log file entries.

I accumulate an ==OrderedCollection== of items. An item is any object that uses ==TLogViewerItem==. See comments on that trait for more info.

Example:

viewer := LogViewer new.
items := ('/path/to/file.log' asFileReference contents splitOn: Character lf) collect: [:each | XCGLogItem fromString: each].
viewer items addAll: items.
viewer inspect.

"
Class {
	#name : #LogViewer,
	#superclass : #Object,
	#instVars : [
		'items'
	],
	#category : #LogViewer
}

{ #category : #'gt-inspector-extension' }
LogViewer >> gtInspectorCallGraphIn: composite [
	<gtInspectorPresentationOrder: 2>
	| frames |
	composite roassal2
		title: ['Call Graph' translated];
		initializeView: [ RTMondrian new ];
		painting: [ :view | 
			frames := self items.
			view shape label
				text:
					[ :each | each gtDisplayString , ' *' , (frames select: [:other | each = other ]) size asString ];
				color: [ Smalltalk ui theme textColor ].
			view nodes: frames.
			frames
				overlappingPairsDo: [ :a :b | view edges connectFrom: [ :x | b ] to: [ :x | a ] ].
			view layout tree ]
]

{ #category : #'gt-inspector-extension' }
LogViewer >> gtInspectorStackIn: composite [
	<gtInspectorPresentationOrder: 1>
	composite fastTable
		title: 'Stack' translated;
		display: [ self items ];
		column: '#' translated
			evaluated: [ :val | self items indexOf: val ];
		column: 'Description' evaluated: [ :val | val gtDisplayString ]
]

{ #category : #initialization }
LogViewer >> initialize [
	super initialize.
	items := OrderedCollection new
]

{ #category : #accessing }
LogViewer >> items [
	^ items
]

{ #category : #accessing }
LogViewer >> items: anObject [
	items := anObject
]
