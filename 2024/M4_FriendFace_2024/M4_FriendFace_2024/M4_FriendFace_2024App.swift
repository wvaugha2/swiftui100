//
//  M4_FriendFace_2024App.swift
//  M4_FriendFace_2024
//
//  Created by  Ty Vaughan on 3/18/24.
//

import SwiftData
import SwiftUI

@main
struct M4_FriendFace_2024App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [
            User.self,
            Friend.self
        ], isAutosaveEnabled: false)
    }
}
