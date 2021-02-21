//
//  TravelRouter.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/12/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI
import Category
import Core

class TravelRouter {
    func goToTravelDetailView (for category: TravelModel) -> some View {
        let detailUseCase: DetailInteractor<TravelEntity, TravelLocaleRepository> = Injection.init().provideTravelDetail(category: category)
        let presenter = TravelDetailPresenter(detailUseCase: detailUseCase, category: category)
        return TravelDetailView(presenter: presenter)
    }
}
