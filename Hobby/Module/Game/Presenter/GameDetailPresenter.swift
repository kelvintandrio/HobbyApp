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

class GameDetailPresenter: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    private let detailUseCase: GameDetailProtocol

    @Published var category: GameModel
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    @Published var detailGame: String = ""

    init(detailUseCase: GameDetailProtocol) {
        self.detailUseCase = detailUseCase
        category = detailUseCase.getDetailGame()
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

    func addFavorite(game: GameEntity) {
        let statusAddFavorite = detailUseCase.addGameFavorite(game: game)
        print("Status Add Favorite = \(statusAddFavorite.description)")
    }

    func checkFavorite(game: GameEntity) -> Bool {
        return detailUseCase.checkFavoriteGame(game: game)
    }

    func deleteFavorite(game: GameEntity) {
        detailUseCase.deleteGameFavorite(game: game)
    }
}
