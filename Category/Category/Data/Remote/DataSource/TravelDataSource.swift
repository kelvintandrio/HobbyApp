//
//  TravelDataSource.swift
//  Category
//
//  Created by Kelvin HT on 2/16/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Core
import Common
import Combine
import Alamofire

public final class TravelDataSource: NSObject {
    override init() { }

    public static let sharedInstance: TravelDataSource =  TravelDataSource()
}

extension TravelDataSource: TravelDataSourceProtocol {
    public func getTravel() -> AnyPublisher<[Travels], Common.URLError> {
        return Future<[Travels], Common.URLError> { completion in
            if let url = URL(string: TravelEndpoints.Gets.travel.url) {
                AF.request(url).validate().responseDecodable(of: DataTravels.self) { response in
                    switch response.result {
                    case .success(let value):
                        completion(.success(value.places))
                    case .failure:
                        completion(.failure(.invalidResponse))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
}
