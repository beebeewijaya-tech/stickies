//
//  AppEditorStyle.swift
//  Stickies
//
//  Created by Bee Wijaya on 08/06/26.
//

import SwiftUI

struct AppEditorStyleButton: View {
    var label: String
    var isActive: Bool
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Text(label)
                    .font(.caption)
                    .bold()
                    .foregroundStyle(isActive ? Color("Hover") : Color("White"))
            }
            .padding(4)
            .frame(width: 20, height: 20)
            .background(isActive ? Color("White") : Color("Hover"))
            .clipShape(RoundedRectangle(cornerRadius: 2))
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(lineWidth: 2)
                    .fill(Color("White"))
            )
        }
        .keyboardShortcut(KeyEquivalent(label.first ?? "b"), modifiers: .command)
    }
}


