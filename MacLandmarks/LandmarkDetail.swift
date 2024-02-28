//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by Darian Mitchell on 2024/2/28.
//

import MapKit
import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark

    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {
            $0.id == landmark.id
        })!
    }

    var body: some View {
        @Bindable var modelData = modelData

        ScrollView(showsIndicators: false) {
            VStack {
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300)
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    CircleImage(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)
                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name).font(.title)
                            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }
                        VStack(alignment: .leading) {
                            Text(landmark.park)
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                }
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            .offset(y: -50)
            .frame(maxWidth: 700)
        }
        .navigationTitle(landmark.name)
    }
}

#Preview {
    LandmarkDetail(landmark: ModelData().landmarks[0]).environment(ModelData())
        .frame(width: 750, height: 700)
}
