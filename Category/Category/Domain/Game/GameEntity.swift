//
//  GameEntity.swift
//  Category
//
//  Created by Kelvin HT on 2/20/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import RealmSwift

public class GameEntity: Object {
    @objc public dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var image: String = ""

    @objc dynamic var released: String = ""
    @objc dynamic var rating: Float = 0.0

    public override static func primaryKey() -> String? {
        return "id"
    }
}
