//
//  MainScreen.swift
//  Stickies
//
//  Created by Bee Wijaya on 07/06/26.
//

import SwiftUI
import RichTextKit

struct MainScreen: View {
    @State private var colorState: ColorState = .yellow
    @State private var note = NSAttributedString(
        string: "Type here...",
    )
    @StateObject private var context = RichTextContext()
    private var colors: [ColorState] = [.yellow, .red, .purple, .green, .orange]
    
    @State private var isBold = false
    @State private var isItalic = false

    
    func updateTextEditorColor(t: Any) {
        guard let textView = t as? NSTextView else { return }
        textView.backgroundColor = NSColor(colorState.backgroundColor)
    }
    
    var body: some View {
        VStack {
            HStack {
                AppEditorStyleButton(label: "B", isActive: isBold) {
                    isBold.toggle()
                    context.toggleStyle(.bold)
                }

                AppEditorStyleButton(label: "I", isActive: isItalic) {
                    isItalic.toggle()
                    context.toggleStyle(.bold)
                }
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .frame(width: 100)
            .background(Color("Dark").opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            
            RichTextEditor(text: $note, context: context) { t in
                updateTextEditorColor(t: t)
            }
                .focusedValue(\.richTextContext, context)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(colorState.backgroundColor))
        .toolbarBackground(colorState.backgroundColor, for: .windowToolbar)
        .toolbarColorScheme(.dark, for: .windowToolbar)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                HStack {
                    ForEach(colors.indices, id: \.self) { id in
                        Button {
                            colorState = colors[id]
                        } label: {
                            Circle()
                                .fill(colors[id].backgroundColor)
                                .frame(width: 12, height: 12)
                                .overlay(
                                    Circle()
                                        .stroke(style: StrokeStyle(lineWidth: colorState == colors[id] ? 2 : 0))
                                        .fill(.white)
                                )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 12)
            }
        }
        .navigationTitle("")
        .frame(width: 400, height: 300)
        .onChange(of: colorState) { oldValue, newValue in
            
        }
    }
}


#Preview {
    MainScreen()
        .frame(width: 400, height: 300)
}
