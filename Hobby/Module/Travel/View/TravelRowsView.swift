//
//  TravelRowsView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/12/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Core

struct TravelRowsView: View {

    var dataTravels: Core.TravelModel

    var body: some View {
        VStack {
            WebImage(url: URL(string: dataTravels.image))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 250)
                .cornerRadius(5)
                .padding(.top)

            VStack(alignment: .leading, spacing: 5) {
                Text(dataTravels.name)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .bold()

                Text(dataTravels.address)
                    .font(.system(size: 12))
                    .foregroundColor(Color.white)
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
        }.frame(width: UIScreen.main.bounds.width - 32, height: 250)
            .background(Color(red: .random(in: 0...0.5), green: .random(in: 0...0.5), blue: .random(in: 0...0.5)))
        .cornerRadius(10)
    }
}
