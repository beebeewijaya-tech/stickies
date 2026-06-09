//
//  RichTextViewModel.swift
//  Stickies
//
//  Created by Bee Wijaya on 09/06/26.
//


import SwiftUI


@Observable
@MainActor
final class RichTextViewModel {
    var note = NSAttributedString(
        string: "Type here...",
    )
    
    var isBold = false
    var isItalic = false
    var isUnderline = false
    var isStrikeThrough = false

    var textEditorView: NSTextView?

    
   
}
