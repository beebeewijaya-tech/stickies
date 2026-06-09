//
//  ColorViewModel.swift
//  Stickies
//
//  Created by Bee Wijaya on 09/06/26.
//

import SwiftUI


@Observable
@MainActor
final class ColorViewModel {
    var colorState: ColorState = .yellow
    var colors: [ColorState] = [.yellow, .red, .purple, .green, .orange]

    func setColor(id: Int) {
        colorState = colors[id]
    }
    
    func getBackgroundColor() -> Color {
        return colorState.backgroundColor
    }
    
    func checkColorMatch(currentColor: ColorState) -> Bool {
        return currentColor == colorState
    }
    
    func updateTextEditorColor(t: Any) {
        guard let textView = t as? NSTextView else { return }
        textView.backgroundColor = NSColor(getBackgroundColor())
    }
}
