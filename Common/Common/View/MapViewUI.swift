//
//  MapViewUI.swift
//  Common
//
//  Created by Kelvin HT on 2/9/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI
import MapKit

public struct MapViewUI: UIViewRepresentable {
    var latitude: Double = 0.0
    var longitude: Double = 0.0

    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }

    public func makeUIView(context: Context) -> MKMapView {
         MKMapView(frame: .zero)
    }
    public func updateUIView(_ view: MKMapView, context: Context) {
            let coordinate = CLLocationCoordinate2D(
                latitude: latitude, longitude: longitude)
            let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            view.setRegion(region, animated: true)
    }
}
