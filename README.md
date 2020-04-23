# Pharo-LogViewer

Very basic viewer of log files, utilizing GT Inspector and Roassal for inspecting and visualizing log entries. 

There isn't any support for any particular log files, as the format varies greatly from project to project. Instead, there's a basic framework for quickly putting something together that parses log entries. This is done via several traits, each specializing in a particular part of an entry - like dates and times, source location, etc. See `XCGLogItem` for example.
