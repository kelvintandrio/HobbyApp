//
//  SportEntity.swift
//  Core
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import RealmSwift

public class SportEntity: Object {
    @objc public dynamic var id: Int = 0
    @objc public dynamic var name: String = ""
    @objc public dynamic var image: String = ""

    @objc public dynamic var descript: String = ""

    public override static func primaryKey() -> String? {
        return "id"
    }
}
