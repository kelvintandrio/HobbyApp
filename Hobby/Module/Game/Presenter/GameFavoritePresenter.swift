//
//  GameFavoritePresenter.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Category
import Core

class GameFavoritePresenter<DataModel, U: FavoriteProtocol>: ObservableObject
where U.Response == [DataModel] {

    private var cancellables: Set<AnyCancellable> = []
    private let gameRouter = GameRouter()
    private let gameFavoriteUseCase: U

    @Published var game: [DataModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(gameFavoriteUseCase: U) {
        self.gameFavoriteUseCase = gameFavoriteUseCase
    }

    func getLocaleGames() {
        loadingState = true
        gameFavoriteUseCase.getDataFavorite()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.loadingState = false
                case .failure:
                    self.errorMessage = String(describing: completion)
                }
            }, receiveValue: { games in
                self.game = games
        }).store(in: &cancellables)
    }

    func linkBuilder<Content: View>(
        for category: GameModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: gameRouter.goToGameDetailView(for: category)) { content() }
    }
}
