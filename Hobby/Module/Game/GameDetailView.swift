//
//  GameDetailView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/12/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI
import Common

struct GameDetailView: View {
    @ObservedObject var presenter: GameDetailPresenter

    @State var onLove = false

    var body: some View {
        ZStack {
            if presenter.loadingState {
                LoadingViewUI()
            } else {
                ScrollView(.vertical) {
                    VStack {
                        SubHeadLineUI(
                            image: self.presenter.category.image,
                            title: self.presenter.category.name,
                            subtitle: self.presenter.category.released
                        ).padding(.top)

                        Text(self.presenter.detailGame)
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
                    self.presenter.addFavorite(game: DataLocaleMapper.mapGameToEntity(input: self.presenter.category))
                } else {
                    self.onLove = false
                    self.presenter
                        .deleteFavorite(game: DataLocaleMapper.mapGameToEntity(input: self.presenter.category))
                }
            }, label: {
                Image(onLove ? "ic-love-on" : "ic-love-off").imageScale(.large)
            })
        )
        .onAppear {
            self.checkDataGameFavorite()
            self.presenter.getGameDescription(id: String(self.presenter.category.id))
        }
    }

    func checkDataGameFavorite() {
        onLove = self.presenter.checkFavorite(game: DataLocaleMapper.mapGameToEntity(input: self.presenter.category))
    }
}
