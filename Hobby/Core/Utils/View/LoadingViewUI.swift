//
//  LoadingViewUI.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/14/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI

struct LoadingViewUI: View {
    var body: some View {
        VStack {
            Text("Loading...")
            ActivityIndicator()
        }
    }
}

struct LoadingViewUI_Previews: PreviewProvider {
    static var previews: some View {
        LoadingViewUI()
    }
}
