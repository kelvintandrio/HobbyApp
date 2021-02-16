//
//  TravelEntiity.swift
//  Core
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import RealmSwift

public class TravelEntity: Object {
    @objc public dynamic var id: Int = 0
    @objc public dynamic var name: String = ""
    @objc public dynamic var image: String = ""

    @objc public dynamic var latitude: Double = 0.0
    @objc public dynamic var longitude: Double = 0.0
    @objc public dynamic var descript: String = ""
    @objc public dynamic var address: String = ""
    @objc public dynamic var like: Int = 0

    public override static func primaryKey() -> String? {
        return "id"
    }
}
