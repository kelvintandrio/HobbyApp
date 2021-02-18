//
//  DataSource.swift
//  Core
//
//  Created by Kelvin HT on 2/18/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine
import Common

public protocol DataSource: class {
    associatedtype Response
    func getData() -> AnyPublisher<Response, Common.URLError>
}
