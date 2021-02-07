//
//  MovieEntity.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/15/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation
import RealmSwift

struct DataMovies: Decodable {
    let results: [Movies]
}

struct Movies: Decodable {
    private enum CodingKeys: String, CodingKey {
        case idMovie = "id"
        case nameMovie = "original_title"
        case backgroundImageMovie = "poster_path"
        case descriptionMovie = "overview"
        case releasedMovie = "release_date"
        case ratingMovie = "vote_average"
    }

    let idMovie: Int?
    let nameMovie: String?
    let backgroundImageMovie: String?
    let descriptionMovie: String?
    let releasedMovie: String?
    let ratingMovie: Float?
}

struct MovieModel: Equatable, Identifiable, GeneralAttribute {
    let id: Int
    let name: String
    let image: String

    let descript: String
    let released: String
    let rating: Float
}

class MovieEntity: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var image: String = ""

    @objc dynamic var descript: String = ""
    @objc dynamic var released: String = ""
    @objc dynamic var rating: Float = 0.0

    override static func primaryKey() -> String? {
        return "id"
    }
}
