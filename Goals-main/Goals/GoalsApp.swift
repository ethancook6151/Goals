//
//  GoalsApp.swift
//  Goals
//
//  Created by Kody Deda on 7/20/21.
//

import SwiftUI

@main
struct GoalsApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(store: Root.defaultStore)
        }
    }
}
