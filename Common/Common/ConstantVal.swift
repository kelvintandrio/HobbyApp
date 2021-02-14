//
//  ConstantVal.swift
//  Common
//
//  Created by Kelvin HT on 2/9/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation

public struct ConstantVal {
    public struct ProfileUser {
        public static let aboutMe = """
            My name is Kelvin Herwanda Tandrio. \
            I graduated from the Department of Informatics at Universitas Sebelas Maret, Surakarta.
            """
    }
    public struct TabBarImage {
        public static let movieTabBar = "baseline_movie_black_36pt"
        public static let sportTabBar = "baseline_sports_soccer_black_36pt"
        public static let gameTabBar = "baseline_sports_esports_black_36pt"
        public static let travelTabBar = "baseline_card_travel_black_36pt"
        public static let profileTabBar = "baseline_account_box_white_36pt"
    }

    public struct TabBarText {
        public static let movieTabBar = "Movie"
        public static let sportTabBar = "Sport"
        public static let gameTabBar = "Game"
        public static let travelTabBar = "Travel"
        public static let profileTabBar = "Profile"
    }
}
