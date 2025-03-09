//
//  movyApp.swift
//  movy
//
//  Created by Maximiliano Ferraiuolo on 21/02/2025.
//

import SwiftUI



@main
struct movyApp: App {
    @StateObject private var entryCoordinator = AppEntryCoordinator()
    
    var body: some Scene {
        WindowGroup {
            if AuthManager.shared.isAuthenticated {
                MovyTabView()
            } else {
                entryCoordinator.build()
                    .sheet(item: $entryCoordinator.sheet) { sheet in
                        entryCoordinator.buildSheet(sheet: sheet)
                    }
                    .fullScreenCover(item: $entryCoordinator.fullScreenCover) { item in
                        entryCoordinator.buildCover(cover: item)
                    }
            }
        }
    }
}
