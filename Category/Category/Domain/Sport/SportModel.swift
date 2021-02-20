//
//  SportModel.swift
//  Category
//
//  Created by Kelvin HT on 2/20/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation

public struct SportModel: Equatable, Identifiable {
    public let id: Int
    public let name: String
    public let image: String

    public let descript: String

    public init(id: Int, name: String, image: String, description: String) {
        self.id = id
        self.name = name
        self.image = image
        self.descript = description
    }
}
