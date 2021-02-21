//
//  GameRouter.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/11/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI
import Category
import Core

class GameRouter {
    func goToGameDetailView (for category: GameModel) -> some View {
        let detailUseCase: DetailInteractor<GameEntity, GameLocaleRepository> = Injection.init().provideGameDetail(category: category)
        let presenter = GameDetailPresenter(detailUseCase: detailUseCase, category: category)
        return GameDetailView(presenter: presenter)
    }
}
