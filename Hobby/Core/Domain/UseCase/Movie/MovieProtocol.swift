//
//  MovieProtocol.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/15/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Combine

protocol MovieProtocol {
  func getMovie() -> AnyPublisher<[MovieModel], URLError>
}
