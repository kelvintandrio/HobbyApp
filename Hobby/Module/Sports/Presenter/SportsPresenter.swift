//
//  SportsProtocol.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/22/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import SwiftUI
import Combine
import Core

class SportsPresenter: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    private let sportRouter = SportRouter()
    private let sportUseCase: SportsProtocol

    @Published var sports: [SportModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(sportUseCase: SportsProtocol) {
        self.sportUseCase = sportUseCase
    }

    func getSports() {
        loadingState = true
        sportUseCase.getSport()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.loadingState = false
                case .failure:
                    self.errorMessage = String(describing: completion)
                }
            }, receiveValue: { sports in
                self.sports = sports
        }).store(in: &cancellables)
    }

    func linkBuilder<Content: View>(
        for category: SportModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: sportRouter.goToSportDetailView(for: category)) { content() }
    }
}
