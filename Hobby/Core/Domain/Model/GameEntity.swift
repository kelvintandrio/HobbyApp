//
//  GameEntity.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/10/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation
import RealmSwift

struct DataGame: Decodable {
    let results: [Games]
}
struct Game: Decodable {
    let description_raw: String
}

struct Games: Decodable {
    private enum CodingKeys: String, CodingKey {
        case idGame = "id"
        case nameGame = "name"
        case backgroundImageGame = "background_image"
        case releasedGame = "released"
        case ratingGame = "rating"
        case descriptionGame = "description_raw"
    }

    let idGame: Int?
    let nameGame: String?
    let backgroundImageGame: String?
    let releasedGame: String?
    let ratingGame: Float?
    let descriptionGame: String?
}

struct GameModel: Equatable, Identifiable, GeneralAttribute {
    let id: Int
    let name: String
    let image: String

    let released: String
    let rating: Float
    let description: String
}

class GameEntity: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var image: String = ""

    @objc dynamic var released: String = ""
    @objc dynamic var rating: Float = 0.0

    override static func primaryKey() -> String? {
        return "id"
    }
}
