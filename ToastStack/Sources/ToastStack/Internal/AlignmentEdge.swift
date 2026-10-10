//
//  AlignmentEdge.swift
//  ToastStack
//
//  Created by Elyan Gutierrez on 10/9/26.
//

import Foundation
import SwiftUI

internal struct AlignmentEdge {
    static func convert(alignment: Alignment) -> Edge {
        if alignment == .top {
            return .top
        } else if alignment == .bottom {
            return .bottom
        } else if alignment == .leading {
            return .leading
        } else if alignment == .trailing {
            return .trailing
        }
        
        return .top
    }
}
