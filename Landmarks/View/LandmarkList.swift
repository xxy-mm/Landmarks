//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Darian Mitchell on 2024/2/26.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationSplitView {   
            List(landmarks){ landmark in
                NavigationLink{
                    LandmarkDetail(landmark: landmark)
                }label: {
                   LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a landmark")
        }
        
    }
}

#Preview {
    LandmarkList()
}