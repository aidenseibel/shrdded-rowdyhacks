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
    @State var searchText: String = ""
    @State var textFieldIsFocused: Bool = false
    
    let annotations: [gym] = [
        gym(name: gymNames.randomElement() ?? "Gold's Gym", coordinate: CLLocationCoordinate2D(latitude: 29.4252, longitude: -98.4946 + 0.01 * Double.random(in: -5..<5))),
        gym(name: gymNames.randomElement() ?? "Gold's Gym", coordinate: CLLocationCoordinate2D(latitude: 29.4252 + 0.01 * Double.random(in: -5..<5), longitude: -98.4946 + 0.01 * Double.random(in: -5..<5))),
        gym(name: gymNames.randomElement() ?? "Gold's Gym", coordinate: CLLocationCoordinate2D(latitude: 29.4252 + 0.01 * Double.random(in: -5..<5), longitude: -98.4946 + 0.01 * Double.random(in: -5..<5))),
        gym(name: gymNames.randomElement() ?? "Gold's Gym", coordinate: CLLocationCoordinate2D(latitude: 29.4252 + 0.01 * Double.random(in: -5..<5), longitude: -98.4946 + 0.01 * Double.random(in: -5..<5))),
        gym(name: gymNames.randomElement() ?? "Gold's Gym", coordinate: CLLocationCoordinate2D(latitude: 29.4252 + 0.01 * Double.random(in: -5..<5), longitude: -98.4946 + 0.01 * Double.random(in: -5..<5)))
]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top){
                if textFieldIsFocused{
                    ShowSearchResults()
                }else{
                    Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: annotations){
                        MapMarker(coordinate: $0.coordinate)
                    }
                        .onAppear{
                            viewModel.checkIfLocationServicesIsEnabled()
                        }
                        .alert("You have denied location access to Shrdded.", isPresented: $viewModel.locationDeniedByUser) {
                            Button("Go to Settings", role: .cancel){}
                        }
                }
                HStack{
                    if !textFieldIsFocused{
                        Button {
                            textFieldIsFocused = true
                        } label: {
                            HStack{
                                Text("Search for friends, gyms, etc...")
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            .padding()
                            .background(.white)
                            .cornerRadius(15)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                            .padding()

                        }
                    }
                    if textFieldIsFocused{
                        TextField("Search for friends, gyms, etc...", text: $searchText)
                            .foregroundColor(.black)
                            .padding()
                            .background(.white)
                            .cornerRadius(15)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                            .padding()

                        Button {
                            textFieldIsFocused = false
                        } label: {
                            Text("dismiss")
                                .padding()
                                .background(Color("darkgreen"))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }

                    }
                }
                    
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


struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}


extension CLLocationCoordinate2D: Identifiable {
    public var id: String {
        "\(latitude)-\(longitude)"
    }
}

