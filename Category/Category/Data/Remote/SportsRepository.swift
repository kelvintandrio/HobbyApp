//
//  SportsRepository.swift
//  Category
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Core
import Common

public final class SportRepository: NSObject {
    public typealias SportInstance = (SportDataSource) -> SportRepository

    let remote: SportDataSource

    public init(remote: SportDataSource) {
        self.remote = remote
    }

    public static let sharedInstance: SportInstance = { remoteRepo in
        return SportRepository(remote: remoteRepo)
    }
}

extension SportRepository: SportRepositoryProtocol {
    public func getSport() -> AnyPublisher<[SportModel], Common.URLError> {
        return self.remote.getData()
            .map { DataMapper.mapSportResponsesToDomains(input: $0) }
            .eraseToAnyPublisher()
    }
}
