//
//  ConstantVal.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 11/27/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation
import RealmSwift

struct ConstantVal {
    struct ProfileUser {
        static let aboutMe = """
            My name is Kelvin Herwanda Tandrio. \
            I graduated from the Department of Informatics at Universitas Sebelas Maret, Surakarta.
            """
    }
    struct TabBarImage {
        static let movieTabBar = "baseline_movie_black_36pt"
        static let sportTabBar = "baseline_sports_soccer_black_36pt"
        static let gameTabBar = "baseline_sports_esports_black_36pt"
        static let travelTabBar = "baseline_card_travel_black_36pt"
        static let profileTabBar = "baseline_account_box_white_36pt"
    }

    struct TabBarText {
        static let movieTabBar = "Movie"
        static let sportTabBar = "Sport"
        static let gameTabBar = "Game"
        static let travelTabBar = "Travel"
        static let profileTabBar = "Profile"
    }
}
extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
}
