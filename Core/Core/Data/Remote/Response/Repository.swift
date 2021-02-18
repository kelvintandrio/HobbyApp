//
//  Repository.swift
//  Core
//
//  Created by Kelvin HT on 2/18/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine
import Common

public protocol Repository {
    associatedtype Response
    func getData() -> AnyPublisher<Response, Common.URLError>
}
