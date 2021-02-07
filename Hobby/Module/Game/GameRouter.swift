//
//  GameRouter.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/11/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI

class GameRouter {
    func goToGameDetailView (for category: GameModel) -> some View {
        let detailUseCase = Injection.init().provideGameDetail(category: category)
        let presenter = GameDetailPresenter(detailUseCase: detailUseCase)
        return GameDetailView(presenter: presenter)
    }
}
