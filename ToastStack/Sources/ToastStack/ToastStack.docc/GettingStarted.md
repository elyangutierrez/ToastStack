# Getting Started

Add a host to the SwiftUI view that should display toasts. Then call a presentation method from an action such as a button handler.

```swift
import SwiftUI
import ToastStack

@main
struct ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .toastHost()
        }
    }
}
```

Present a built-in toast from an action:

```swift
Button("Save") {
    ToastStack.success(message: "Changes saved.")
}
```

ToastStack supports iOS 26 and macOS 26 or later. The host defaults to top placement and a spring animation. Each toast defaults to automatic dismissal after five seconds.

## Topics

### Next steps

- <doc:BuiltInStyles>
- <doc:PlacementAndAnimation>
- <doc:CustomContent>
