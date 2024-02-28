//
//  Profile.swift
//  Landmarks
//
//  Created by Darian Mitchell on 2024/2/28.
//

import Foundation


struct Profile {
    var username: String
    var perfersNotifications = false
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌹"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String {
            rawValue
        }
    }
}
