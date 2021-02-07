//
//  APIGame.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/11/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation

enum GameEndpoints {
    enum Gets: Endpoint {
        case games
        case detail

        public var url: String {
            switch self {
            case .games:
                return "\(API.baseUrlGame)games"
            case .detail:
                return "\(API.baseUrlGame)games/"
            }
        }
    }
}
