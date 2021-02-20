//
//  TravelView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 11/27/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import SwiftUI
import Common
import Category
import Core

struct TravelView: View {
    @ObservedObject var presenterTravel: TravelPresenter<TravelModel, MainInteractor<[TravelModel], TravelRepository>>

    var body: some View {
        ZStack {
            if presenterTravel.loadingState {
                LoadingViewUI()
            } else {
                NavigationView {
                    ScrollView(.vertical, showsIndicators: false) {
                        ForEach(self.presenterTravel.travels, id: \.id) { travel in
                            ZStack {
                                self.presenterTravel.linkBuilder(for: travel) {
                                    TravelRowsView(dataTravels: travel)
                                }.buttonStyle(PlainButtonStyle())
                            }.padding(8)
                        }
                    }.navigationBarTitle(Text("Travel"), displayMode: .inline)
                }
            }
        }.onAppear {
            if self.presenterTravel.travels.count == 0 {
                self.presenterTravel.getTravels()
            }
        }
    }
}
