//
//  LocationManager.swift
//  CoachApp-SwiftUI
//
//  Created by Rishabh Sharma on 07/04/23.
//

import CoreLocation
class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager ()
    @Published var userLocation: CLLocation?
    static let shared = LocationManager ()
    @Published var movenext : Bool = false
    override init() {
        super.init ()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func requestLocation () {
        manager.requestWhenInUseAuthorization()
    }
}

extension LocationManager : CLLocationManagerDelegate {
    func locationManager (_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("DEBUG: Not determined" )
        case .restricted:
            print ("DEBUG: Restricted")
        case .denied:
            print("DEBUG: Denied" )
            movenext = true
        case .authorizedAlways:
            print("DEBUG: Auth always")
        case .authorizedWhenInUse:
            print ("DEBUG: Auth when in use")
            movenext = true
        @unknown default:
            movenext = true
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.userLocation = location
    }
}
