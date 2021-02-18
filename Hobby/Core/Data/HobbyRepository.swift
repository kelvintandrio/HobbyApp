//
//  HobbyRepository.swift
//  Hobby
//
//  Created by Kelvin HT on 2/19/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation

protocol HobbyRepositoryProtocol { }

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

extension HobbyRepository: HobbyRepositoryProtocol { }
