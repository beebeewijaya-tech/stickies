//
//  MainScreen.swift
//  Stickies
//
//  Created by Bee Wijaya on 07/06/26.
//

import SwiftUI
import RichTextKit

struct MainScreen: View {
    @State private var colorViewModel = ColorViewModel()
    @State private var richTextViewModel = RichTextViewModel()
    @StateObject private var context = RichTextContext()

    var body: some View {
        VStack {
            HStack {
                AppEditorStyleButton(label: "B", isActive: richTextViewModel.isBold) {
                    richTextViewModel.isBold.toggle()
                    context.toggleStyle(.bold)
                }

                AppEditorStyleButton(label: "I", isActive: richTextViewModel.isItalic) {
                    richTextViewModel.isItalic.toggle()
                    context.toggleStyle(.italic)
                }
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .frame(width: 100)
            .background(Color("Dark").opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
                
                RichTextEditor(text: $richTextViewModel.note, context: context) { t in
                    colorViewModel.updateTextEditorColor(t: t)
                    Task {
                        richTextViewModel.textEditorView = t as? NSTextView
                    }
                }
                .focusedValue(\.richTextContext, context)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(colorViewModel.getBackgroundColor()))
        .toolbarBackground(colorViewModel.getBackgroundColor(), for: .windowToolbar)
        .toolbarColorScheme(.dark, for: .windowToolbar)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                HStack {
                    ForEach(colorViewModel.colors.indices, id: \.self) { id in
                        Button {
                            colorViewModel.setColor(id: id)
                        } label: {
                            Circle()
                                .fill(colorViewModel.colors[id].backgroundColor)
                                .frame(width: 12, height: 12)
                                .overlay(
                                    Circle()
                                        .stroke(style: StrokeStyle(lineWidth: colorViewModel.checkColorMatch(currentColor: colorViewModel.colors[id]) ? 2 : 0))
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
        .onChange(of: colorViewModel.colorState) { oldValue, newValue in
            colorViewModel.updateTextEditorColor(t: richTextViewModel.textEditorView as Any)
        }
    }
}


#Preview {
    MainScreen()
        .frame(width: 300, height: 300)
}
