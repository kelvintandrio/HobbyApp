//
//  TravelDetailView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/12/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI
import Common

struct TravelDetailView: View {
    @ObservedObject var presenter: TravelDetailPresenter

    @State var onLove = false

    var body: some View {
        ZStack {
            if presenter.loadingState {
                LoadingViewUI()
            } else {
                ScrollView(.vertical) {
                    VStack {
                        MapViewUI(
                            latitude: self.presenter.category.latitude,
                            longitude: self.presenter.category.longitude
                        ).edgesIgnoringSafeArea(. top)
                        .frame(height: 300)

                        SubHeadLineUI(
                            image: self.presenter.category.image,
                            title: self.presenter.category.name,
                            subtitle: self.presenter.category.address
                        )

                        DescriptionViewUI(description: self.presenter.category.descript)
                            .padding()

                        Spacer()
                    }
                }
            }
        }.navigationBarTitle(Text(self.presenter.category.name))
        .navigationBarItems(trailing:
            Button(action: {
                if self.onLove == false {
                    self.onLove = true
                    self.presenter.addFavorite(
                        travel: DataLocaleMapper.mapTravelToEntity(input: self.presenter.category))
                } else {
                    self.onLove = false
                    self.presenter
                        .deleteFavorite(travel: DataLocaleMapper.mapTravelToEntity(input: self.presenter.category))
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
            travel: DataLocaleMapper.mapTravelToEntity(input: self.presenter.category))
    }
}
