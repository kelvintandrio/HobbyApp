//
//  MovieProtocol.swift
//  Core
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Common
import Combine

public protocol MovieProtocol {
    associatedtype Response

    func getMovie() -> AnyPublisher<Response, Common.URLError>
}
