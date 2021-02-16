//
//  TravelLocaleDataSourceProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Common
import Combine

public protocol TravelLocaleDataSourceProtocol: class {
    func getTravelLocale() -> AnyPublisher<[TravelEntity], Error>
    func addTravelLocale(from categories: TravelEntity) -> AnyPublisher<Bool, Error>
    func deleteTravelLocale(from categories: TravelEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void)
    func checkTravelLocale(from categories: TravelEntity) -> Bool
}
