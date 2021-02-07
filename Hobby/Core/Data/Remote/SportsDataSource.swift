//
//  SportsDataSource.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/22/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Alamofire

protocol SportDataSourceProtocol: class {
  func getSport() -> AnyPublisher<[Sports], URLError>
}

final class SportDataSource: NSObject {
    private override init() { }

    static let sharedInstance: SportDataSource =  SportDataSource()
}

extension SportDataSource: SportDataSourceProtocol {
    func getSport() -> AnyPublisher<[Sports], URLError> {
        return Future<[Sports], URLError> { completion in
            if let url = URL(string: SportEndpoints.Gets.sport.url) {
                AF.request(url).validate().responseDecodable(of: DataSports.self) { response in
                    switch response.result {
                    case .success(let value):
                        completion(.success(value.sports))
                    case .failure:
                        completion(.failure(.invalidResponse))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
}
