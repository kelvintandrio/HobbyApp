//
//  TravelRepository.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/22/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation
import Combine

protocol TravelRepositoryProtocol {
    func getTravel() -> AnyPublisher<[TravelModel], URLError>
}

final class TravelRepository: NSObject {
    typealias TravelInstance = (TravelDataSource) -> TravelRepository

    fileprivate let remote: TravelDataSource

    private init(remote: TravelDataSource) {
        self.remote = remote
    }

    static let sharedInstance: TravelInstance = { remoteRepo in
        return TravelRepository(remote: remoteRepo)
    }
}

extension TravelRepository: TravelRepositoryProtocol {
    func getTravel() -> AnyPublisher<[TravelModel], URLError> {
        return self.remote.getTravel()
            .map { DataMapper.mapTravelResponsesToDomains(input: $0) }
            .eraseToAnyPublisher()
    }
}
