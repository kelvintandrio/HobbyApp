//
//  TravelDataSource.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/22/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Alamofire

protocol TravelDataSourceProtocol: class {
    func getTravel() -> AnyPublisher<[Travels], URLError>
}

final class TravelDataSource: NSObject {
    private override init() { }

    static let sharedInstance: TravelDataSource =  TravelDataSource()
}

extension TravelDataSource: TravelDataSourceProtocol {
    func getTravel() -> AnyPublisher<[Travels], URLError> {
        return Future<[Travels], URLError> { completion in
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
