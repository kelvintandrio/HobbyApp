//
//  HeadLineViewUI.swift
//  Common
//
//  Created by Kelvin HT on 2/9/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI

public struct HeadLineViewUI: View {

    var title: String = ""
    var subtitle: String = ""

    public init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }
    public var body: some View {
        VStack(alignment: .center) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
            Text(subtitle)
                .font(.system(size: 12))
        }
    }
}
