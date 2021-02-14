//
//  GameModel.swift
//  Core
//
//  Created by Kelvin HT on 2/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation

public struct GameModel: Equatable, Identifiable {
    public let id: Int
    let name: String
    let image: String

    let released: String
    let rating: Float
    let description: String
}
