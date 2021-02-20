//
//  MoviePresenter.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/15/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import SwiftUI
import Combine
import Core
import Category

class MoviePresenter<DataModel, U: MainProtocol>: ObservableObject
where U.Response == [DataModel] {

    private var cancellables: Set<AnyCancellable> = []
    private let movieRouter = MovieRouter()
    private let movieUseCase: U

    @Published var movies: [DataModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(movieUseCase: U) {
        self.movieUseCase = movieUseCase
    }

    func getMovies() {
        loadingState = true
        movieUseCase.getData()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.loadingState = false
                case .failure:
                    self.errorMessage = String(describing: completion)
                }
            }, receiveValue: { movies in
                self.movies = movies
        }).store(in: &cancellables)
    }

    func linkBuilder<Content: View>(
        for category: MovieModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: movieRouter.goToMovieDetailView(for: category)) { content() }
    }
}
