//
//  SportRepository.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/22/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation
import Combine

protocol SportRepositoryProtocol {
    func getSport() -> AnyPublisher<[SportModel], URLError>
}

final class SportRepository: NSObject {
    typealias SportInstance = (SportDataSource) -> SportRepository

    fileprivate let remote: SportDataSource

    private init(remote: SportDataSource) {
        self.remote = remote
    }

    static let sharedInstance: SportInstance = { remoteRepo in
        return SportRepository(remote: remoteRepo)
    }
}

extension SportRepository: SportRepositoryProtocol {
    func getSport() -> AnyPublisher<[SportModel], URLError> {
        return self.remote.getSport()
            .map { DataMapper.mapSportResponsesToDomains(input: $0) }
            .eraseToAnyPublisher()
    }
}
