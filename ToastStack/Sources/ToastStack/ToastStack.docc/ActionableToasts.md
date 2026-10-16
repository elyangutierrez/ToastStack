# Actionable Toasts

Use an actionable toast to offer a single follow-up action, such as undoing a change. Create a ``ToastAction`` with the toast title, button label, and handler, then pass it to ``ToastStack/actionable(_:_:action:dismissalTimeDeadline:)``.

```swift
import SwiftUI
import ToastStack

struct DraftView: View {
    @State private var draftExists = true

    var body: some View {
        Group {
            if draftExists {
                Button("Delete draft") {
                    draftExists = false
                    ToastStack.actionable(
                        "The draft was deleted.",
                        .top,
                        action: ToastAction(
                            toastIcon: "trash",
                            toastTitle: "Draft deleted",
                            buttonTitle: "Undo",
                            dismissOnTrigger: true,
                            handler: {
                                draftExists = true
                            }
                        )
                    )
                }
            } else {
                Text("Draft deleted")
            }
        }
    }
}
```

`toastIcon` and `buttonImage` are optional SF Symbol names. The icon appears beside the toast title. The button shows `buttonImage` when set and displays `buttonTitle` otherwise.

The handler runs when the button is tapped. The button briefly changes to a checkmark as feedback. Set `dismissOnTrigger` to `true` to dismiss the toast after that feedback; set it to `false` to keep the toast visible until its automatic dismissal deadline.

The alignment argument controls the toast's entrance edge. Actionable toasts default to automatic dismissal after 60 seconds; pass `dismissalTimeDeadline` to choose a different duration:

```swift
ToastStack.actionable(
    "The draft was deleted.",
    .top,
    action: undoAction,
    dismissalTimeDeadline: 15
)
```

## Topics

### Related APIs

- ``ToastAction``
- ``ToastStack/actionable(_:_:action:dismissalTimeDeadline:)``
