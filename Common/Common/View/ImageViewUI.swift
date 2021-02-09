//
//  ImageViewUI.swift
//  Common
//
//  Created by Kelvin HT on 2/9/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageViewUI: View {

    @State var image: String = ""

    var body: some View {
        WebImage(url: URL(string: image))
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .scaledToFit()
            .frame(width: 300.0)
            .cornerRadius(10.0)
    }
}
