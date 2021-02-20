//
//  MovieView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 11/27/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import SwiftUI
import Common
import Category
import Core

struct MovieView: View {
    @ObservedObject var presenterMovie: MoviePresenter<MovieModel, MainInteractor<[MovieModel], MovieRepository>>

    var body: some View {
        ZStack {
            if presenterMovie.loadingState {
                LoadingViewUI()
            } else {
                NavigationView {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(self.presenterMovie.movies, id: \.id) { movie in
                            ZStack {
                                self.presenterMovie.linkBuilder(for: movie) {
                                    MovieRowsView(dataMovies: movie)
                                }.buttonStyle(PlainButtonStyle())
                            }.padding(8)
                        }
                    }.navigationBarTitle(Text("Movie"), displayMode: .inline)
                }
            }
        }.onAppear {
            if self.presenterMovie.movies.count == 0 {
                self.presenterMovie.getMovies()
            }
        }
        .navigationBarTitle(Text("Movie"), displayMode: .automatic)
    }
}
