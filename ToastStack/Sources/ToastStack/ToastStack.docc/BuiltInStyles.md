# Built-in Styles

Use a ``ToastStack`` method to present one of the built-in styles. Each style displays a title, message, and close button, and is removed automatically after its dismissal time.

```swift
ToastStack.success(message: "Changes saved.")
ToastStack.error(message: "Could not save changes.")
ToastStack.warning(message: "Check your connection.")
ToastStack.info(message: "A new version is available.")
```

Pass `dismissalTime` in seconds to change the default five-second duration:

```swift
ToastStack.success(message: "Upload complete.", dismissalTime: 3)
```

The available cases are described by ``ToastStyle``. Each method also accepts an optional alignment for its entrance edge. See <doc:PlacementAndAnimation> for how to coordinate that with the host placement.
