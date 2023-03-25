//
//  MapView.swift
//  shrdded-rowdyhacks
//
//  Created by Aiden Seibel on 3/25/23.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI


struct MapTab: View {
    @State private var viewModel = MapModel()
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .onAppear{
                    viewModel.checkIfLocationServicesIsEnabled()
                }
                .alert("You have denied location access to Shrdded.", isPresented: $viewModel.locationDeniedByUser) {
                    Button("Go to Settings", role: .cancel){}
                }
        }
    }
}



final class MapModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 29.4252, longitude: -98.4946), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    @Published var locationDeniedByUser = false

    var locationManager: CLLocationManager?

    func checkIfLocationServicesIsEnabled(){
//        DispatchQueue.main.async {
        if CLLocationManager.locationServicesEnabled(){
            self.locationManager = CLLocationManager()
            locationManager!.delegate = self
        }else{
            print("show alert")
        }
//    }
    }

    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else {return}

        switch locationManager.authorizationStatus{

        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            locationDeniedByUser = true
            print("ERROR: your location is restricted likely due to parental controls")
        case .denied:
            locationDeniedByUser = true
            print("ERROR: you denied your location access")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.10, longitudeDelta: 0.10))
        @unknown default:
            break
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapTab()
    }
}
