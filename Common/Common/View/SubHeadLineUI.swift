//
//  SubHeadLineUI.swift
//  Common
//
//  Created by Kelvin HT on 2/9/21.
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
