//
//  SportFavoriteView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI
import Category
import Core

struct SportFavoriteView: View {
    @ObservedObject var presenterSportFavorite: SportFavoritePresenter<SportModel, FavoriteInteractor<[SportModel], SportLocaleRepository>>

    var body: some View {
        ZStack {
            if self.presenterSportFavorite.sport.isEmpty {
                VStack {
                    Text("No Sport Favorite")
                }
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(self.presenterSportFavorite.sport, id: \.id) { sport in
                        ZStack {
                            self.presenterSportFavorite.linkBuilder(for: sport) {
                                SportRowsView(dataSports: sport)
                            }.buttonStyle(PlainButtonStyle())
                        }.padding(8)
                    }
                }
            }
        }.navigationBarTitle(Text("Sport Favorite"), displayMode: .inline)
        .onAppear {
            self.presenterSportFavorite.getLocaleSports()
        }
    }
}
