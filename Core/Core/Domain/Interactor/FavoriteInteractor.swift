//
//  FavoriteInteractor.swift
//  Core
//
//  Created by Kelvin HT on 2/21/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine

public class FavoriteInteractor<DataModel, U: LocaleRepository>: FavoriteProtocol
where U.DataModel == DataModel {
    
    private let localeRepository: U

    public required init(repository: U) {
      self.localeRepository = repository
    }

    public func getDataFavorite() -> AnyPublisher<DataModel, Error> {
        return localeRepository.getLocaleData()
    }
}
