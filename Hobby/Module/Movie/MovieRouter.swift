//
//  MovieRouter.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/12/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI
import Core

class MovieRouter {
    func goToMovieDetailView (for category: MovieModel) -> some View {
        let detailUseCase = Injection.init().provideMovieDetail(category: category)
        let presenter = MovieDetailPresenter(detailUseCase: detailUseCase)
        return MovieDetailView(presenter: presenter)
    }
}
