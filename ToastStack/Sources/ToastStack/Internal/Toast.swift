//
//  Toast.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/8/26.
//

import Foundation
import SwiftUI

internal struct Toast: Identifiable {
    var id = UUID()
    var message: String
    var style: ToastStyle
    var alignment: VerticalAlignment
}
