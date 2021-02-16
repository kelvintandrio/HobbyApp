//
//  TravelLocaleRepositoryProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Common
import Combine

public protocol TravelLocaleRepositoryProtocol {
    func getLocaleTravel() -> AnyPublisher<[TravelModel], Error>
    func addLocaleTravel(from categories: TravelEntity) -> AnyPublisher<Bool, Error>
    func deleteLocaleTravel(from categories: TravelEntity, result: @escaping (Result<Bool, DatabaseError>) -> Void)
    func checkLocaleTravel(from categories: TravelEntity) -> Bool
}
