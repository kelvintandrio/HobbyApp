//
//  MovieFavoriteView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI
import Category
import Core

struct MovieFavoriteView: View {
    @ObservedObject var presenterMovieFavorite: MovieFavoritePresenter<MovieModel, FavoriteInteractor<[MovieModel], MovieLocaleRepository>>

    var body: some View {
        ZStack {
            if self.presenterMovieFavorite.movie.isEmpty {
                VStack {
                    Text("No Movie Favorite")
                }
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(self.presenterMovieFavorite.movie, id: \.id) { movie in
                        ZStack {
                            self.presenterMovieFavorite.linkBuilder(for: movie) {
                                MovieRowsView(dataMovies: movie)
                            }.buttonStyle(PlainButtonStyle())
                        }.padding(8)
                    }
                }
            }
        }.navigationBarTitle(Text("Movie Favorite"), displayMode: .inline)
        .onAppear {
            self.presenterMovieFavorite.getLocaleMovies()
        }
    }
}
