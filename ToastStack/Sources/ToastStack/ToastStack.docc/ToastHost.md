# Adding a Toast Host

Use the `View.toastHost(toastPlacement:animationStyle:)` modifier to display ToastStack messages over a SwiftUI view. Attach it to the part of the view hierarchy where toasts should appear.

```swift
ContentView()
    .toastHost(toastPlacement: .topTrailing, animationStyle: .snappy)
```

The modifier overlays the toast stack and leaves the view's content in place.

## Parameters

- `toastPlacement`: The alignment where the stack appears. Defaults to `.top`.
- `animationStyle`: The animation used when the toast stack changes. Defaults to `.spring`.

The alignment passed to a toast method controls its entrance edge. `.top`, `.bottom`, `.leading`, and `.trailing` select their matching edge; other values use the top edge. Use the same edge alignment for `toastPlacement` and the toast method when the toast should enter from where the stack appears.

## Topics

### Configure the host

- <doc:PlacementAndAnimation>

### Present messages

- <doc:BuiltInStyles>
- <doc:CustomContent>
