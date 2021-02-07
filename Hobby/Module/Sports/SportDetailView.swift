//
//  SportDetailView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/8/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct SportDetailView: View {
    @ObservedObject var presenter: SportsDetailPresenter
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
                            subtitle: ""
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
                    self.presenter.addFavorite(
                        sport: DataLocaleMapper.mapSportToEntity(input: self.presenter.category))
                } else {
                    self.onLove = false
                    self.presenter
                        .deleteFavorite(sport: DataLocaleMapper.mapSportToEntity(input: self.presenter.category))
                }
            }, label: {
                Image(onLove ? "ic-love-on" : "ic-love-off").imageScale(.large)
            })
        )
        .onAppear {
            self.checkDataTravelFavorite()
        }
    }

    func checkDataTravelFavorite() {
        onLove = self.presenter.checkFavorite(
            sport: DataLocaleMapper.mapSportToEntity(input: self.presenter.category))
    }
}
