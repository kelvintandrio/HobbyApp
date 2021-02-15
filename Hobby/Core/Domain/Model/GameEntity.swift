//
//  GameEntity.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/10/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation
import RealmSwift

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
