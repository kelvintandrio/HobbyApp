//
//  SportRowsView.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/9/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Category

struct SportRowsView: View {

    var dataSports: SportModel

    var body: some View {
        VStack {
            WebImage(url: URL(string: dataSports.image))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 250)
                .cornerRadius(5)
                .padding(.top)

            VStack(alignment: .leading, spacing: 5) {
                Text(dataSports.name)
                    .font(.title)
                    .foregroundColor(Color.white)
                    .bold()

                Text(dataSports.descript)
                    .font(.system(size: 12))
                    .foregroundColor(Color.white)
                    .lineLimit(2)
            }.padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
        }.frame(width: UIScreen.main.bounds.width - 32, height: 250)
            .background(Color(red: .random(in: 0...0.5), green: .random(in: 0...0.5), blue: .random(in: 0...0.5)))
        .cornerRadius(10)
    }
}
