//
//  LocaleDataSource.swift
//  Core
//
//  Created by Kelvin HT on 2/20/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Common

public protocol LocaleDataSource: class {
    associatedtype DataEntity

    func getDataLocale() -> AnyPublisher<[DataEntity], Error>
    func addDataLocale(from categories: DataEntity) -> AnyPublisher<Bool, Error>
    func deleteDataLocale(from categories: DataEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void)
    func checkDataLocale(from categories: DataEntity) -> Bool
}
