//
//  APISport.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/6/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation

enum SportEndpoints {
    enum Gets: Endpoint {
        case sport

        public var url: String {
            switch self {
            case .sport:
                return "\(API.baseUrlSport)all_sports.php"
            }
        }
    }
}
