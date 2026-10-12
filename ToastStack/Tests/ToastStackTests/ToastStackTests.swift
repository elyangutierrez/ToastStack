import Foundation
import SwiftUI
import Testing
@testable import ToastStack

@Test func toastStylesExposeTheirTitlesAndIcons() {
    let cases: [(ToastStyle, String, String)] = [
        (.success, "Success", "checkmark.circle.fill"),
        (.error, "Error", "xmark.circle.fill"),
        (.info, "Info", "info.circle.fill"),
        (.warning, "Warning", "exclamationmark.circle.fill"),
    ]

    for (style, title, icon) in cases {
        let toast = Toast(message: "Test message", style: style, alignment: .top)

        #expect(toast.title == title)
        #expect(toast.icon == icon)
    }
}

@Test func toastIdentityUsesItsID() {
    let toast = Toast(message: "Original", style: .success, alignment: .top)
    let copy = toast
    let differentToast = Toast(message: "Original", style: .success, alignment: .top)

    #expect(toast == copy)
    #expect(toast != differentToast)
    #expect(Set([toast, copy, differentToast]).count == 2)
}

@Test func customToastStoresItsViewContent() {
    let toast = Toast(alignment: .bottom) {
        Text("Custom toast")
    }

    #expect(toast.message.isEmpty)
    #expect(toast.style == .success)
    #expect(toast.content.map { _ in true } ?? false)
}

@Test func alignmentEdgeConversionHandlesEdgesAndCorners() {
    #expect(AlignmentEdge.convert(alignment: .top) == .top)
    #expect(AlignmentEdge.convert(alignment: .bottom) == .bottom)
    #expect(AlignmentEdge.convert(alignment: .leading) == .leading)
    #expect(AlignmentEdge.convert(alignment: .trailing) == .trailing)
    #expect(AlignmentEdge.convert(alignment: .bottomLeading) == .top)
}

@Test @MainActor func publicToastMethodsUseTheirMatchingStyles() async throws {
    try await expectToastStyle(.success) { message in
        ToastStack.success(message: message, dismissalTime: 60)
    }
    try await expectToastStyle(.error) { message in
        ToastStack.error(message: message, dismissalTime: 60)
    }
    try await expectToastStyle(.warning) { message in
        ToastStack.warning(message: message, dismissalTime: 60)
    }
    try await expectToastStyle(.info) { message in
        ToastStack.info(message: message, dismissalTime: 60)
    }
}

@MainActor
private func expectToastStyle(
    _ expectedStyle: ToastStyle,
    show: @MainActor (String) -> Void
) async throws {
    let message = UUID().uuidString
    let manager = ToastManager.shared

    show(message)

    let toast = try #require(manager.tasks.keys.first(where: { $0.message == message }))
    #expect(toast.style == expectedStyle)

    let task = manager.tasks[toast]
    manager.cancelTask(for: toast)
    manager.dismiss(for: toast)
    await task?.value
}
