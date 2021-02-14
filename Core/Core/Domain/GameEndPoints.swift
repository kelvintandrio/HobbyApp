//
//  GameEndPoints.swift
//  Core
//
//  Created by Kelvin HT on 2/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
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
public struct API {
    public static let baseUrlGame = "https://api.rawg.io/api/"
}
protocol Endpoint {
    var url: String { get }
}
