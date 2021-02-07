//
//  HeadLineViewUI.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/14/21.
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

struct HeadLineViewUI_Previews: PreviewProvider {
    static var previews: some View {
        HeadLineViewUI()
    }
}
