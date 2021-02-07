//
//  ImageViewUI.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/14/21.
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

struct ImageViewUI_Previews: PreviewProvider {
    static var previews: some View {
        ImageViewUI()
    }
}
