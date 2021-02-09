//
//  ActivityIndicator.swift
//  Common
//
//  Created by Kelvin HT on 2/9/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
      return UIActivityIndicatorView(style: .large)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
      uiView.startAnimating()
    }
}
