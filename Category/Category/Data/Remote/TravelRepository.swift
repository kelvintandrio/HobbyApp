//
//  TravelRepository.swift
//  Category
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Common
import Core

public final class TravelRepository: NSObject {
    public typealias TravelInstance = (TravelDataSource) -> TravelRepository

    let remote: TravelDataSource

    public init(remote: TravelDataSource) {
        self.remote = remote
    }

    public static let sharedInstance: TravelInstance = { remoteRepo in
        return TravelRepository(remote: remoteRepo)
    }
}

extension TravelRepository: TravelRepositoryProtocol {
    public func getTravel() -> AnyPublisher<[TravelModel], Common.URLError> {
        return self.remote.getTravel()
            .map { DataMapper.mapTravelResponsesToDomains(input: $0) }
            .eraseToAnyPublisher()
    }
}
