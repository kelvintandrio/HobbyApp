//
//  TravelPresenter.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/22/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import SwiftUI
import Combine

class TravelPresenter: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []
    private let travelRouter = TravelRouter()
    private let travelUseCase: TravelProtocol

    @Published var travels: [TravelModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(travelUseCase: TravelProtocol) {
        self.travelUseCase = travelUseCase
    }

    func getTravels() {
        loadingState = true
        travelUseCase.getTravel()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.loadingState = false
                case .failure:
                    self.errorMessage = String(describing: completion)
                }
            }, receiveValue: { travels in
                self.travels = travels
        }).store(in: &cancellables)
    }

    func linkBuilder<Content: View>(
        for category: TravelModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: travelRouter.goToTravelDetailView(for: category)) { content() }
    }
}
