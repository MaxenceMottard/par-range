//
//  LocationManager.swift
//  ParRange
//
//  Created by Maxence Mottard on 07/05/2021.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    private let locationManager: CLLocationManager
    
    @Published var status: CLAuthorizationStatus
    @Published var coordinate: CLLocationCoordinate2D?
    
    override init() {
        locationManager = CLLocationManager()
        status = locationManager.authorizationStatus
        
        super.init()
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
    func requestLocationAuthorization() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        status = manager.authorizationStatus
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else { return }

        self.coordinate = coordinate
    }
}
