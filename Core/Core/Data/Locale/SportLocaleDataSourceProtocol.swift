//
//  SportLocaleDataSourceProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Common
import Combine

public protocol SportLocaleDataSourceProtocol: class {
    func getSportLocale() -> AnyPublisher<[SportEntity], Error>
    func addSportLocale(from categories: SportEntity) -> AnyPublisher<Bool, Error>
    func deleteSportLocale(from categories: SportEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void)
    func checkSportLocale(from categories: SportEntity) -> Bool
}
