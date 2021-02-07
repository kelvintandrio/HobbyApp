//
//  SportView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/26/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI

struct SportView: View {
    @ObservedObject var presenterSport: SportsPresenter

    var body: some View {
        ZStack {
            if presenterSport.loadingState {
                    LoadingViewUI()
                } else {
                    NavigationView {
                        ScrollView(.vertical, showsIndicators: false) {
                            ForEach(self.presenterSport.sports, id: \.id) { category in
                                ZStack {
                                    self.presenterSport.linkBuilder(for: category) {
                                        SportRowsView(dataSports: category)
                                    }.buttonStyle(PlainButtonStyle())
                                }.padding(8)
                            }
                        }.navigationBarTitle(Text("Sport"), displayMode: .inline)
                    }
                }
            }.onAppear {
                if self.presenterSport.sports.count == 0 {
                    self.presenterSport.getSports()
                }
            }
    }
}
