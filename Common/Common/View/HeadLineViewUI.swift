//
//  HeadLineViewUI.swift
//  Common
//
//  Created by Kelvin HT on 2/9/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI

struct HeadLineViewUI: View {

    @State var title: String = ""
    @State var subtitle: String = ""

    var body: some View {
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
