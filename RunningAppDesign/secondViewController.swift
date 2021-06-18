//
//  secondViewController.swift
//  VRunning
//
//  Created by Jonatan Wikström on 2021-06-16.
//

import SwiftUI
import MapKit
import CoreLocation

class secondViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    let manager = CLLocationManager()
    var timer:Timer?
    var totTime = 0, sec = 0, min = 0, hour = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            manager.stopUpdatingLocation()
            
            render(location)
        }
    }
    
    func render(_ location: CLLocation){
        
        let MyCoordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        let region = MKCoordinateRegion(center: MyCoordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = MyCoordinate
       // mapView.addAnnotation(pin)
        mapView.showsUserLocation = true
        
    }
    
    
    @IBAction func StartButtonTapped(_ sender: UIButton) {
        //let vc1 = storyboard?.instantiateViewController(identifier: "first_vc") as! firstViewController
        //present(vc1, animated: true)
        
        if startButton.title(for: .normal) == "Start training" {
            startButton.setTitle("Stop Run", for: .normal)
            startButton.setTitleColor(.red, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        }
        else{
            startButton.setTitle("Start training", for: .normal)
            startButton.setTitleColor(.green, for: .normal)
            resetTimer()
        }
        
    }
    
    @objc func onTimerFires()
    {
        totTime += 1
        sec += 1
        if (sec >= 59){
            min += 1
            sec = 0
        }
        if (min >= 59){
            hour += 1
            min = 0
        }
        
        timeLabel.text = "\(hour) : \(min) : \(sec)"

    }
    
    func resetTimer(){
        timer?.invalidate()
        totTime = 0
        sec = 0
        min = 0
        hour = 0
        timeLabel.text = "\(hour) : \(min) : \(sec)"
    }

}
