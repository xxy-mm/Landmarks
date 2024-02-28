//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Darian Mitchell on 2024/2/26.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}
