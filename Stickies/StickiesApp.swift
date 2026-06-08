//
//  StickiesApp.swift
//  Stickies
//
//  Created by Bee Wijaya on 07/06/26.
//

import SwiftUI

@main
struct StickiesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainScreen()
            }
        }
        .windowResizability(.contentSize)
    }
}
