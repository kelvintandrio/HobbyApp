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
import Category

class GamePresenter<DataModel, U: MainProtocol>: ObservableObject
where U.Response == [DataModel] {

    private var cancellables: Set<AnyCancellable> = []
    private let gameRouter = GameRouter()
    private let gameUseCase: U

    @Published var games: [DataModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(gameUseCase: U) {
        self.gameUseCase = gameUseCase
    }

    func getGames() {
        loadingState = true
        gameUseCase.getData()
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
