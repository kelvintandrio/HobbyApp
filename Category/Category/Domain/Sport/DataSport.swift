//
//  DataSport.swift
//  Category
//
//  Created by Kelvin HT on 2/20/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation

public struct DataSports: Decodable {
    public let sports: [Sports]
}

public struct Sports: Decodable {
    private enum CodingKeys: String, CodingKey {
        case idSport = "idSport"
        case nameSport = "strSport"
        case backgroundImageSport = "strSportThumb"
        case descriptionSport = "strSportDescription"
    }

    public let idSport: String?
    public let nameSport: String?
    public let backgroundImageSport: String?
    public let descriptionSport: String?
}
