//
//  API.swift
//  Common
//
//  Created by Kelvin HT on 2/9/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

struct API {
    static let baseUrlGame = "https://api.rawg.io/api/"

    static let baseUrlMovie = "https://api.themoviedb.org/3/movie/"
    static let baseUrlImage = "https://image.tmdb.org/t/p/w780/"

    static let baseUrlTravel = "https://tourism-api.dicoding.dev/"
    static let baseUrlSport = "https://www.thesportsdb.com/api/v1/json/1/"
}
struct APIKey {
    static let apiKeyMovie = "d5264dcf7abdc1371e3cdd46e26f9130"
}

protocol Endpoint {
    var url: String { get }
}

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