//
//  StickiesApp.swift
//  Stickies
//
//  Created by Bee Wijaya on 07/06/26.
//

import SwiftUI

private struct WindowConfiguration: NSViewRepresentable {
    func updateNSView(_ nsView: NSViewType, context: Context) {}
    
    func makeNSView(context: Context) -> some NSView {
        let view = NSView()
        
        Task {
            view.window?.collectionBehavior = [.canJoinAllSpaces]
        }
        
        return view
    }
}

@main
struct StickiesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainScreen()
                    .background(WindowConfiguration())
            }
        }
        .windowResizability(.contentSize)
        .windowLevel(.floating)
    }
}
