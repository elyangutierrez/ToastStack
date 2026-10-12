# Custom Toast Content

Use ``ToastStack/custom(_:content:dismissalTime:)`` to show a SwiftUI view instead of a built-in style. The `content` parameter takes an `AnyView`, so wrap the custom view in `AnyView` when calling the method.

```swift
struct UploadToast: View {
    var body: some View {
        Label("Upload complete", systemImage: "checkmark.circle.fill")
            .padding()
            .background(.regularMaterial, in: .capsule)
    }
}

Button("Upload") {
    ToastStack.custom(
        .bottom,
        content: AnyView(UploadToast()),
        dismissalTime: 8
    )
}
```

Custom content is displayed as supplied and does not get the built-in close button. It is removed automatically after five seconds by default; pass `dismissalTime` in seconds to change that period.
