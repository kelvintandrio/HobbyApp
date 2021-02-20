//
//  TravelFavoritePresenter.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/17/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Category
import Core

class TravelFavoritePresenter<DataModel, U: FavoriteProtocol>: ObservableObject
where U.Response == [DataModel] {

    private var cancellables: Set<AnyCancellable> = []
    private let travelRouter = TravelRouter()
    private let travelFavoriteUseCase: U

    @Published var travel: [DataModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(travelFavoriteUseCase: U) {
        self.travelFavoriteUseCase = travelFavoriteUseCase
    }

    func getLocaleTravels() {
        loadingState = true
        travelFavoriteUseCase.getDataFavorite()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.loadingState = false
                case .failure:
                    self.errorMessage = String(describing: completion)
                }
            }, receiveValue: { travels in
                self.travel = travels
        }).store(in: &cancellables)
    }

    func linkBuilder<Content: View>(
        for category: TravelModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: travelRouter.goToTravelDetailView(for: category)) { content() }
    }
}
