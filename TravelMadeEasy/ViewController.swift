//
//  ViewController.swift
//  TravelMadeEasy
//
//  Created by Gaurav Patil on 2/1/22.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var destinationAddress: UITextField!
    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var getDirections: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    @IBAction func getDirectionsTapped(_ sender: Any) {
        
        getAddress()
    }
    
    func getAddress() {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(destinationAddress.text!) { placemarks, Error in
            
            guard let placemarks = placemarks, let location = placemarks.first?.location
            else {
                print("No Location found")
                return
            }
            
            print(location)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }

}

