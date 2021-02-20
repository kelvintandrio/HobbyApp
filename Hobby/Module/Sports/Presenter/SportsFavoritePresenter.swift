//
//  SportsFavoritePresenter.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/17/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Core
import Category

class SportFavoritePresenter<DataModel, U: FavoriteProtocol>: ObservableObject
where U.Response == [DataModel] {

    private var cancellables: Set<AnyCancellable> = []
    private let sportRouter = SportRouter()
    private let sportFavoriteUseCase: U

    @Published var sport: [DataModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(sportFavoriteUseCase: U) {
        self.sportFavoriteUseCase = sportFavoriteUseCase
    }

    func getLocaleSports() {
        loadingState = true
        sportFavoriteUseCase.getDataFavorite()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.loadingState = false
                case .failure:
                    self.errorMessage = String(describing: completion)
                }
            }, receiveValue: { sports in
                self.sport = sports
        }).store(in: &cancellables)
    }

    func linkBuilder<Content: View>(
        for category: SportModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: sportRouter.goToSportDetailView(for: category)) { content() }
    }
}
