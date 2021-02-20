//
//  DataTravel.swift
//  Category
//
//  Created by Kelvin HT on 2/20/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation

public struct DataTravels: Decodable {
    public let places: [Travels]
}

public struct Travels: Decodable {
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

    public let id: Int
    public let name: String
    public let image: String
    public let latitude: Double
    public let longitude: Double
    public let descript: String?
    public let address: String
    public let like: Int
}
