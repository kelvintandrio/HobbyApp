//
//  GameView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 11/27/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import SwiftUI

struct GameView: View {

    @ObservedObject var presenterGame: GamePresenter

    var body: some View {
        ZStack {
            if presenterGame.loadingState {
                VStack {
                    Text("Loading...")
                    ActivityIndicator()
                }
            } else {
                NavigationView {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(self.presenterGame.games, id: \.id) { game in
                            ZStack {
                                self.presenterGame.linkBuilder(for: game) {
                                    GameRowsView(dataGames: game)
                                }.buttonStyle(PlainButtonStyle())
                            }.padding(8)
                        }
                    }
                }.navigationBarTitle(Text("Game"), displayMode: .automatic)
            }
        }.onAppear {
            if self.presenterGame.games.count == 0 {
                self.presenterGame.getGames()
            }
        }
    }
}
