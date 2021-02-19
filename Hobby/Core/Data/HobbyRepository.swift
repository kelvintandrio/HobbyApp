//
//  HobbyRepository.swift
//  Hobby
//
//  Created by Kelvin HT on 2/19/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Common
import Combine
import Core
import Alamofire

protocol HobbyRepositoryProtocol {
    func getGameDescription(id: String) -> AnyPublisher<String, Common.URLError>
}

final class HobbyRepository: NSObject {
    typealias HobbyInstance = (RemoteDataSource) -> HobbyRepository

    fileprivate let remote: RemoteDataSource

    private init(remote: RemoteDataSource) {
      self.remote = remote
    }

    static let sharedInstance: HobbyInstance = {remoteRepo in
        return HobbyRepository(remote: remoteRepo)
    }
}

extension HobbyRepository: HobbyRepositoryProtocol {
    func getGameDescription(id: String) -> AnyPublisher<String, Common.URLError> {
        return Future<String, Common.URLError> { completion in
            if let url = URL(string: (GameEndpoints.Gets.detail.url)+(id)) {
                AF.request(url).validate().responseDecodable(of: Game.self) { response in
                    switch response.result {
                    case .success(let value):
                        completion(.success(value.description_raw))
                    case .failure:
                        completion(.failure(.invalidResponse))
                    }
                }
            }
        }.eraseToAnyPublisher()
    }
}
