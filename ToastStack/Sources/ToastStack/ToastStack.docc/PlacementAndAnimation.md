# Placement and Animation

The host's `toastPlacement` parameter controls where the toast stack appears. The optional alignment passed to a toast method controls its entrance edge. The edge values `.top`, `.bottom`, `.leading`, and `.trailing` select their matching entrance edge; other alignments use the top edge. To make a toast enter from the edge where the stack is displayed, use the same edge alignment for both values.

```swift
struct UploadView: View {
    var body: some View {
        Button("Upload") {
            ToastStack.success(message: "Upload complete.", .bottom)
        }
        .toastHost(toastPlacement: .bottom)
    }
}
```

The host also accepts an `animationStyle` to customize changes to the toast stack:

```swift
ContentView()
    .toastHost(toastPlacement: .topTrailing, animationStyle: .snappy)
```

Both parameters are optional. The host defaults to `.top` placement and `.spring` animation, and a toast defaults to `.top` for its entrance edge.
