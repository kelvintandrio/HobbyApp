//
//  DetailProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/21/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine

public protocol DetailProtocol {
    associatedtype DataEntity

    func addDataFavorite(data: DataEntity) -> AnyPublisher<Bool, Error>
    func checkFavoriteData(data: DataEntity) -> Bool
    func deleteDataFavorite(data: DataEntity)
}
