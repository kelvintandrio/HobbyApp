//
//  MainInteractor.swift
//  Core
//
//  Created by Kelvin HT on 2/20/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine
import Common

public class MainInteractor<DataModel, R: Repository>: MainProtocol
where R.Response == DataModel {

    private let repository: R

    public init(repository: R) {
      self.repository = repository
    }

    public func getData() -> AnyPublisher<DataModel, Common.URLError> {
        return repository.getData()
    }
}
