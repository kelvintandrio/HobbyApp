//
//  MapViewUI.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/14/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import SwiftUI
import MapKit

struct MapViewUI: UIViewRepresentable {
    @State var latitude: Double = 0.0
    @State var longitude: Double = 0.0

    func makeUIView(context: Context) -> MKMapView {
         MKMapView(frame: .zero)
    }
    func updateUIView(_ view: MKMapView, context: Context) {
            let coordinate = CLLocationCoordinate2D(
                latitude: latitude, longitude: longitude)
            let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            view.setRegion(region, animated: true)
    }
}
