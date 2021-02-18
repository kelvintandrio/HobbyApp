//
//  SportDataSource.swift
//  Category
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Common
import Combine
import Core
import Alamofire

public final class SportDataSource: NSObject {
    override init() { }

    public static let sharedInstance: SportDataSource =  SportDataSource()
}

extension SportDataSource: DataSource {
    public typealias Response = [Sports]

    public func getData() -> AnyPublisher<[Sports], Common.URLError> {
        return Future<[Sports], Common.URLError> { completion in
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
