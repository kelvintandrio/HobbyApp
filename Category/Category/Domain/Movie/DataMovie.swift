//
//  DataMovie.swift
//  Category
//
//  Created by Kelvin HT on 2/20/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation

public struct DataMovies: Decodable {
    public let results: [Movies]
}

public struct Movies: Decodable {
    private enum CodingKeys: String, CodingKey {
        case idMovie = "id"
        case nameMovie = "original_title"
        case backgroundImageMovie = "poster_path"
        case descriptionMovie = "overview"
        case releasedMovie = "release_date"
        case ratingMovie = "vote_average"
    }

    public let idMovie: Int?
    public let nameMovie: String?
    public let backgroundImageMovie: String?
    public let descriptionMovie: String?
    public let releasedMovie: String?
    public let ratingMovie: Float?
}
