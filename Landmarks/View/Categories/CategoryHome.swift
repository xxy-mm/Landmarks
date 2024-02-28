//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Darian Mitchell on 2024/2/27.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData: ModelData
    @State private var showingProfile = false

    var body: some View {
        NavigationSplitView {
            GeometryReader { geometry in
                List {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(modelData.featured) { landmark in
                                NavigationLink {
                                    LandmarkDetail(landmark: landmark)
                                } label: {
                                    landmark.image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: geometry.size.width, height: 200)
                                        .cornerRadius(5.0)
                                        .clipped()
                                }
                            }
                        }
                    }.listRowInsets(EdgeInsets())

                    ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    }
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(.inset)
                .navigationTitle("Featured")
                .toolbar {
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
                .sheet(isPresented: $showingProfile) {
                    ProfileHost().environment(modelData)
                }
            }
        } detail: {
            Text("Category Home")
        }
    }
}

#Preview {
    CategoryHome().environment(ModelData())
}
