//
//  GameDataSource.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/11/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation
import Alamofire
import Combine

protocol GameDataSourceProtocol: class {
    func getGame() -> AnyPublisher<[Games], URLError>
    func getGameDescription(id: String) -> AnyPublisher<String, URLError>
}
//
//final class GameDataSource: NSObject {
//    private override init() { }
//
//    static let sharedInstance: GameDataSource =  GameDataSource()
//}
//
//extension GameDataSource: GameDataSourceProtocol {
//    func getGame() -> AnyPublisher<[Games], URLError> {
//        return Future<[Games], URLError> { completion in
//            if let url = URL(string: GameEndpoints.Gets.games.url) {
//                AF.request(url).validate().responseDecodable(of: DataGame.self) { response in
//                    switch response.result {
//                    case .success(let value):
//                        completion(.success(value.results))
//                    case .failure:
//                        completion(.failure(.invalidResponse))
//                    }
//                }
//            }
//        }.eraseToAnyPublisher()
//    }
//    func getGameDescription(id: String) -> AnyPublisher<String, URLError> {
//        return Future<String, URLError> { completion in
//            if let url = URL(string: (GameEndpoints.Gets.detail.url)+(id)) {
//                AF.request(url).validate().responseDecodable(of: Game.self) { response in
//                    switch response.result {
//                    case .success(let value):
//                        completion(.success(value.description_raw))
//                    case .failure:
//                        completion(.failure(.invalidResponse))
//                    }
//                }
//            }
//        }.eraseToAnyPublisher()
//    }
//}
