//
//  APITravel.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/23/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation
import Common

enum TravelEndpoints {
    enum Gets: Endpoint {
        case travel

        public var url: String {
            switch self {
            case .travel:
                return "\(API.baseUrlTravel)list"
            }
        }
    }
}
