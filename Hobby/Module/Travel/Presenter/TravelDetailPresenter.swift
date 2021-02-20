//
//  TravelDetailPresenter.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/12/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Category

class TravelDetailPresenter: ObservableObject {
    private let detailUseCase: TravelDetailProtocol

    @Published var category: TravelModel
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(detailUseCase: TravelDetailProtocol) {
        self.detailUseCase = detailUseCase
        category = detailUseCase.getDetailTravel()
    }

    func addFavorite(travel: TravelEntity) {
        let statusAddFavorite = detailUseCase.addTravelFavorite(travel: travel)
        print("Status Add Favorite = \(statusAddFavorite.description)")
    }

    func checkFavorite(travel: TravelEntity) -> Bool {
        return detailUseCase.checkFavoriteTravel(travel: travel)
    }

    func deleteFavorite(travel: TravelEntity) {
        detailUseCase.deleteTravelFavorite(travel: travel)
    }
}
