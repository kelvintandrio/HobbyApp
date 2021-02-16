//
//  GameFavoriteView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI

struct GameFavoriteView: View {
    @ObservedObject var presenterGameFavorite: GameFavoritePresenter

    var body: some View {
        ZStack {
            if self.presenterGameFavorite.game.isEmpty {
                VStack {
                    Text("No Game Favorite")
                }
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(self.presenterGameFavorite.game, id: \.id) { game in
                        ZStack {
                            self.presenterGameFavorite.linkBuilder(for: game) {
                                GameRowsView(dataGames: game)
                            }.buttonStyle(PlainButtonStyle())
                        }.padding(8)
                    }
                }
            }
        }.navigationBarTitle(Text("Game Favorite"), displayMode: .inline)
        .onAppear {
            self.presenterGameFavorite.getLocaleGames()
        }
    }
}
