//
//  ColorState.swift
//  Stickies
//
//  Created by Bee Wijaya on 07/06/26.
//

import SwiftUI

enum ColorState {
    case yellow, red, purple, green, orange
    
    var backgroundColor: Color {
        switch self {
        case .yellow: return Color("Yellow")
        case .red: return Color("Red")
        case .purple: return Color("Purple")
        case .green: return Color("Green")
        case .orange: return Color("Orange")
        }
    }
}
