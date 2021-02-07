//
//  TabFavoriteViewUI.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/14/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI

struct TabFavoriteViewUI: View {
    @State var title: String = ""
    @State var image: String = ""

    var body: some View {
        VStack {
            HStack {
                Image(image)
                Text(title)
                    .font(.system(size: 12))
                    .bold()
            }
        }.cornerRadius(10.0)
        .padding(EdgeInsets(top: 10, leading: 150, bottom: 10, trailing: 150))
        .background(Color(red: 251.0/255, green: 162.0/255, blue: 134.0/255, opacity: 1.0))
    }
}

struct TabFavoriteViewUI_Previews: PreviewProvider {
    static var previews: some View {
        TabFavoriteViewUI()
    }
}
