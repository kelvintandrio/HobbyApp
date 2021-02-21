//
//  MovieDetailView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/12/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI
import Common
import Category
import Core

struct MovieDetailView: View {

    @ObservedObject var presenter: MovieDetailPresenter<MovieModel, MovieEntity, DetailInteractor<MovieEntity, MovieLocaleRepository>>
    @State var onLove = false

    var body: some View {
        ZStack {
            if presenter.loadingState {
                LoadingViewUI()
            } else {
                ScrollView(.vertical) {
                    VStack {
                        SubHeadLineUI(
                            image: (API.baseUrlImage)+(self.presenter.category.image),
                            title: self.presenter.category.name,
                            subtitle: self.presenter.category.released
                        ).padding(.top)

                        DescriptionViewUI(description: self.presenter.category.descript)
                            .padding()

                        Spacer()
                    }
                }
            }
        }.navigationBarTitle(Text(self.presenter.category.name), displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: {
                if self.onLove == false {
                    self.onLove = true
                    self.presenter.addFavorite(movie: DataLocaleMapper.mapMovieToEntity(input: self.presenter.category))
                } else {
                    self.onLove = false
                    self.presenter
                        .deleteFavorite(movie: DataLocaleMapper.mapMovieToEntity(input: self.presenter.category))
                }
            }, label: {
                Image(onLove ? "ic-love-on" : "ic-love-off").imageScale(.large)
            })
        )
        .onAppear {
            self.checkDataMovieFavorite()
        }
    }

    func checkDataMovieFavorite() {
        onLove = self.presenter.checkFavorite(movie: DataLocaleMapper.mapMovieToEntity(input: self.presenter.category))
    }
}
