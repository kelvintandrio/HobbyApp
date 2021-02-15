//
//  GameRowsView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/9/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Core

struct GameRowsView: View {

    var dataGames: Core.GameModel

    var body: some View {
        HStack {
            WebImage(url: URL(string: dataGames.image))
                .resizable()
                .indicator(.activity)
                .scaledToFit()
                .frame(width: 200)
                .cornerRadius(5)

            VStack(alignment: .leading, spacing: 5) {
                Text(dataGames.name)
                    .font(.system(size: 14))
                    .foregroundColor(Color.white)
                    .bold()

                Text(dataGames.released)
                    .font(.system(size: 12))
                    .foregroundColor(Color.white)
                    .lineLimit(2)
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 16))
        }.frame(width: UIScreen.main.bounds.width - 32, height: 150)
            .background(Color(red: .random(in: 0...0.5), green: .random(in: 0...0.5), blue: .random(in: 0...0.5)))
        .cornerRadius(10)
    }
}
