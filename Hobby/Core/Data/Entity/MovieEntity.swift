//
//  MovieEntity.swift
//  Hobby
//
//  Created by Kelvin HT on 2/17/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import RealmSwift

class MovieEntity: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var image: String = ""

    @objc dynamic var descript: String = ""
    @objc dynamic var released: String = ""
    @objc dynamic var rating: Float = 0.0

    override static func primaryKey() -> String? {
        return "id"
    }
}
