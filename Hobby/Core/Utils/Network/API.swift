//
//  API.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/11/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation

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
