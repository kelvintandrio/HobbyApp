//
//  GameDetailPresenter.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/12/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Combine
import Category
import Core

class GameDetailPresenter<DataModel, DataEntity, U: DetailProtocol>: ObservableObject
where U.DataEntity == DataEntity {

    private var cancellables: Set<AnyCancellable> = []
    private let detailUseCase: U

    @Published var category: DataModel
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    @Published var detailGame: String = ""

    init(detailUseCase: U, category: DataModel) {
        self.detailUseCase = detailUseCase
        self.category = category
    }

    func getGameDescription(id: String) {
        detailUseCase.getGameDescription(id: id)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.loadingState = false
                case .failure:
                    self.errorMessage = String(describing: completion)
                }
            }, receiveValue: { detail in
                self.detailGame = detail
                print("detail : \(detail)")
        }).store(in: &cancellables)
    }

    func addFavorite(game: DataEntity) {
        let statusAddFavorite = detailUseCase.addDataFavorite(data: game)
        print("Status Add Favorite = \(statusAddFavorite.description)")
    }

    func checkFavorite(game: DataEntity) -> Bool {
        return detailUseCase.checkFavoriteData(data: game)
    }

    func deleteFavorite(game: DataEntity) {
        detailUseCase.deleteDataFavorite(data: game)
    }
}
