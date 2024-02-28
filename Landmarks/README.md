#  Landmarks App

A demo project writing in SwiftUI



## problems:

- there is a big padding at the top of the List/NavigationSplitView when navigationTitle is set.
- the screen flickers when navigating from list view to detail view when navigationTitle is set in the list view.

> Turned out that after I added a TabView into the content view wrapping all sub views, the problem gone.
> What if I don't need a TabView, the problem is still not resolved.

And after I searched a lot, with many problems beside above's,I start to realize that only a few of the answers are valuable. It means there is not as many senior apple developers as I thought.


```swift
@Environment(\.editMode) var editMode
editMode?.wrappedValue = .inactive
```
