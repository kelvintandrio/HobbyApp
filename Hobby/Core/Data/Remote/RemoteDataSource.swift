//
//  RemoteDataSource.swift
//  Hobby
//
//  Created by Kelvin HT on 2/19/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation

final class RemoteDataSource: NSObject {
    private override init() { }
    static let sharedInstance: RemoteDataSource =  RemoteDataSource()
}
