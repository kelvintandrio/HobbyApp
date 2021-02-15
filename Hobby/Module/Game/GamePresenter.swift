//
//  GamePresenter.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/10/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import SwiftUI
import Combine
import Core

class GamePresenter: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    private let gameRouter = GameRouter()
    private let gameUseCase: GameProtocol

    @Published var games: [Core.GameModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(gameUseCase: GameProtocol) {
        self.gameUseCase = gameUseCase
    }

    func getGames() {
        loadingState = true
        gameUseCase.getGame()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.loadingState = false
                case .failure:
                    self.errorMessage = String(describing: completion)
                }
            }, receiveValue: { games in
                self.games = games
            }).store(in: &cancellables)
    }

    func linkBuilder<Content: View>(
        for category: GameModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: gameRouter.goToGameDetailView(for: category)) { content() }
    }
}
