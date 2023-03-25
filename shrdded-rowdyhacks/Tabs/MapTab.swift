//
//  MapView.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import SwiftUI
import MapKit

struct MapTab: View {
//    @State var span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.334_900, longitude: -122.009_020), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

    var body: some View {
        NavigationView {
            Map(coordinateRegion: $region)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapTab()
    }
}
