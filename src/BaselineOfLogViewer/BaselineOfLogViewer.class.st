Class {
	#name : #BaselineOfLogViewer,
	#superclass : #BaselineOf,
	#category : #BaselineOfLogViewer
}

{ #category : #baselines }
BaselineOfLogViewer >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self deps: spec.
			spec package: 'LogViewer' with: [ spec requires: #('Roassal2') ].
			spec group: 'default' with: #('LogViewer') ]
]

{ #category : #baselines }
BaselineOfLogViewer >> deps: spec [
	spec
		baseline: 'Roassal2'
		with: [ spec repository: 'github://ObjectProfile/Roassal2/src' ]
]
