//
//  TravelEntity.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/22/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation
import RealmSwift

struct DataTravels: Decodable {
    let places: [Travels]
}

struct Travels: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case image = "image"
        case latitude = "latitude"
        case longitude = "longitude"
        case descript = "description"
        case address = "address"
        case like = "like"
    }

    let id: Int
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    let descript: String?
    let address: String
    let like: Int
}

struct TravelModel: Equatable, Identifiable, GeneralAttribute {
    let id: Int
    let name: String
    let image: String

    let latitude: Double
    let longitude: Double
    let descript: String
    let address: String
    let like: Int
}

class TravelEntity: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var image: String = ""

    @objc dynamic var latitude: Double = 0.0
    @objc dynamic var longitude: Double = 0.0
    @objc dynamic var descript: String = ""
    @objc dynamic var address: String = ""
    @objc dynamic var like: Int = 0

    override static func primaryKey() -> String? {
        return "id"
    }
}
