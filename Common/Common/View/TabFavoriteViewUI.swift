//
//  TabFavoriteViewUI.swift
//  Common
//
//  Created by Kelvin HT on 2/9/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI

public struct TabFavoriteViewUI: View {
    var title: String = ""
    var image: String = ""

    public init(title: String, image: String) {
        self.title = title
        self.image = image
    }

    public var body: some View {
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
