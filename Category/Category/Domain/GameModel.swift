//
//  GameModel.swift
//  Category
//
//  Created by Kelvin HT on 2/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation

struct GameModel: Equatable, Identifiable {
    let id: Int
    let name: String
    let image: String

    let released: String
    let rating: Float
    let description: String
}
