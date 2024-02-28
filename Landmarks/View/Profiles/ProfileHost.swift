//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Darian Mitchell on 2024/2/28.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        print("cancel")
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            }else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear{
                        draftProfile = modelData.profile
                    }
                    .onDisappear{
                        print("on disappear")
                        modelData.profile = draftProfile
                    }
                
            }
            Spacer()
        }
        .padding()
    }
    
}

#Preview {
    ProfileHost().environment(ModelData())
        
}
