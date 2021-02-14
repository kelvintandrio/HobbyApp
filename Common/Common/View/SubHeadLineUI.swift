//
//  SubHeadLineUI.swift
//  Common
//
//  Created by Kelvin HT on 2/9/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI

public struct SubHeadLineUI: View {
    var image: String = ""
    var title: String = ""
    var subtitle: String = ""

    public init(image: String, title: String, subtitle: String) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
    }

    public var body: some View {
        VStack {
            ImageViewUI(image: image)
            HeadLineViewUI(title: title, subtitle: subtitle)
        }
    }
}
