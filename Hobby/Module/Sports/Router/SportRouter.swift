//
//  SportRouter.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/8/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI
import Category

class SportRouter {
    func goToSportDetailView(for category: SportModel) -> some View {
        let detailUseCase = Injection.init().provideSportDetail(category: category)
        let presenter = SportsDetailPresenter(detailUseCase: detailUseCase)
        return SportDetailView(presenter: presenter)
    }
}
