//
//  TravelEntity.swift
//  Hobby
//
//  Created by Kelvin HT on 2/17/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import RealmSwift

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
