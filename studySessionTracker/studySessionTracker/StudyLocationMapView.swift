//
//  StudyLocationMapView.swift
//  studySessionTracker
//
//  Created by Yeabsera Damte on 11/1/24.
//

import SwiftUI
import MapKit

struct StudyLocationMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 38.9068, longitude: -77.0719),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    //let studyLocations = [
    let studyLocations: [StudySpot] = [
        StudySpot(name: "Lauinger Library", coordinate: CLLocationCoordinate2D(latitude: 38.906430, longitude: -77.072142)),
        StudySpot(name: "HFSC", coordinate: CLLocationCoordinate2D(latitude: 38.906354, longitude: -77.074691))
    ]
    
    var body: some View {
        NavigationView{
            Map(coordinateRegion: $region, annotationItems: studyLocations) { spot in
                MapAnnotation(coordinate: spot.coordinate) {
                    VStack {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor(.blue)
                        Text(spot.name)
                            .font(.caption)
                    }
                }
            }
            
            .navigationTitle("Study Location Map")
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct StudySpot: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
