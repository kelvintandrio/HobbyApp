//
//  TravelFavoriteView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI
import Category
import Core

struct TravelFavoriteView: View {
    @ObservedObject var presenterTravelFavorite: TravelFavoritePresenter<TravelModel, FavoriteInteractor<[TravelModel], TravelLocaleRepository>>

    var body: some View {
        ZStack {
            if self.presenterTravelFavorite.travel.isEmpty {
                VStack {
                    Text("No Travel Favorite")
                }
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(self.presenterTravelFavorite.travel, id: \.id) { travel in
                        ZStack {
                            self.presenterTravelFavorite.linkBuilder(for: travel) {
                                TravelRowsView(dataTravels: travel)
                            }.buttonStyle(PlainButtonStyle())
                        }.padding(8)
                    }
                }
            }
        }.navigationBarTitle(Text("Travel Favorite"), displayMode: .inline)
        .onAppear {
            self.presenterTravelFavorite.getLocaleTravels()
        }
    }
}
