//
//  LoadingViewUI.swift
//  Common
//
//  Created by Kelvin HT on 2/9/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI

public struct LoadingViewUI: View {
    public var body: some View {
        VStack {
            Text("Loading...")
            ActivityIndicator()
        }
    }
}
