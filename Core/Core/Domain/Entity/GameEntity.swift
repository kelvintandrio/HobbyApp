//
//  GameEntity.swift
//  Core
//
//  Created by Kelvin HT on 2/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import RealmSwift

public class GameEntity: Object {
    @objc public dynamic var id: Int = 0
    @objc public dynamic var name: String = ""
    @objc public dynamic var image: String = ""

    @objc public dynamic var released: String = ""
    @objc public dynamic var rating: Float = 0.0

    public override static func primaryKey() -> String? {
        return "id"
    }
}
