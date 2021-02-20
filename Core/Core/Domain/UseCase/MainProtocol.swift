//
//  MainProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/20/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Combine
import Common

public protocol MainProtocol {
    associatedtype Response
    func getData() -> AnyPublisher<Response, Common.URLError>
}
