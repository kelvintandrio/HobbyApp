//
//  LocaleRepository.swift
//  Core
//
//  Created by Kelvin HT on 2/20/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Common
import Combine

public protocol LocaleRepository {
    associatedtype DataModel
    associatedtype DataEntity

    func getLocaleData() -> AnyPublisher<DataModel, Error>
    func addLocaleData(from categories: DataEntity) -> AnyPublisher<Bool, Error>
    func deleteLocaleData(from categories: DataEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void)
    func checkLocaleData(from categories: DataEntity) -> Bool
}
