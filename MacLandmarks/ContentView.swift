//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Darian Mitchell on 2024/2/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
