//
//  SubHeadLineUI.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/14/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI

struct SubHeadLineUI: View {
    @State var image: String = ""
    @State var title: String = ""
    @State var subtitle: String = ""

    var body: some View {
        VStack {
            ImageViewUI(image: image)
            HeadLineViewUI(title: title, subtitle: subtitle)
        }
    }
}

struct SubHeadLineUI_Previews: PreviewProvider {
    static var previews: some View {
        SubHeadLineUI()
    }
}
