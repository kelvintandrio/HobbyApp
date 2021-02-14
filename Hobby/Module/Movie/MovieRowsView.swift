//
//  MovieRowsView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/12/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI
import Common

struct MovieRowsView: View {

    var dataMovies: MovieModel

    var body: some View {
        HStack {
            WebImage(url: URL(string: (API.baseUrlImage)+(dataMovies.image)))
                .resizable()
                .indicator(.activity)
                .scaledToFit()
                .frame(width: 200)
                .cornerRadius(5)

            VStack(alignment: .leading, spacing: 5) {
                Text(dataMovies.name)
                    .font(.system(size: 14))
                    .foregroundColor(Color.white)
                    .bold()

                Text(dataMovies.released)
                    .font(.system(size: 12))
                    .foregroundColor(Color.white)
                    .lineLimit(2)
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 16))
        }.frame(width: UIScreen.main.bounds.width - 32, height: 150)
            .background(Color(red: .random(in: 0...0.5), green: .random(in: 0...0.5), blue: .random(in: 0...0.5)))
        .cornerRadius(10)
    }
}
