//
//  APIMovie.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/15/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation

enum MovieEndpoints {
    enum Gets: Endpoint {
        case nowPlaying

        public var url: String {
            switch self {
            case .nowPlaying:
                return "\(API.baseUrlMovie)now_playing?api_key=\(APIKey.apiKeyMovie)"
            }
        }
    }
}
