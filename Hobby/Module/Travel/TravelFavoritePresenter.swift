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
import Core

class TravelFavoritePresenter: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    private let travelRouter = TravelRouter()
    private let travelFavoriteUseCase: TravelFavoriteProtocol

    @Published var travel: [TravelModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(travelFavoriteUseCase: TravelFavoriteProtocol) {
        self.travelFavoriteUseCase = travelFavoriteUseCase
    }

    func getLocaleTravels() {
        loadingState = true
        travelFavoriteUseCase.getTravelFavorite()
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
        for category: Core.TravelModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: travelRouter.goToTravelDetailView(for: category)) { content() }
    }
}
