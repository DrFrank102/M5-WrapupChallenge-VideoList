//
//  M5_WrapupChallenge_VideoListApp.swift
//  M5-WrapupChallenge-VideoList
//
//  Created by Ian Howard on 8/6/22.
//

import SwiftUI

@main
struct M5_WrapupChallenge_VideoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(VideoModel())
        }
    }
}
