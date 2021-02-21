//
//  DetailProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/21/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine
import Common

public protocol DetailProtocol {
    associatedtype DataEntity

    func getGameDescription(id: String) -> AnyPublisher<String, Common.URLError>
    func addDataFavorite(data: DataEntity) -> AnyPublisher<Bool, Error>
    func checkFavoriteData(data: DataEntity) -> Bool
    func deleteDataFavorite(data: DataEntity)
}
