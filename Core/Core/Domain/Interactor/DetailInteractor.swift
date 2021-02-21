//
//  DetailInteractor.swift
//  Core
//
//  Created by Kelvin HT on 2/21/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine

public class DetailInteractor<DataEntity, U: LocaleRepository>: DetailProtocol
where U.DataEntity == DataEntity {

    private let repositoryLocale: U
    private let repository: HobbyRepositoryProtocol

    public required init(
        repository: HobbyRepositoryProtocol,
        repositoryLocale: U
    ) {
        self.repository = repository
        self.repositoryLocale = repositoryLocale
    }

    public func addDataFavorite(data: DataEntity) -> AnyPublisher<Bool, Error> {
        return repositoryLocale.addLocaleData(from: data)
    }

    public func deleteDataFavorite(data: DataEntity) {
        repositoryLocale.deleteLocaleData(from: data) { _ in
            print("Delete Movie Favorite")
        }
    }

    public func checkFavoriteData(data: DataEntity) -> Bool {
        return repositoryLocale.checkLocaleData(from: data)
    }
}
