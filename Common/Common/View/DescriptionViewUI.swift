//
//  DescriptionViewUI.swift
//  Common
//
//  Created by Kelvin HT on 2/9/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI

struct DescriptionViewUI: View {
    @State var description: String = ""

    var body: some View {
        Text(description)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.red, lineWidth: 2)
        )
    }
}
