//
//  MapViewController.swift
//  FootballPitch.kz
//
//  Created by mac on 11.05.2022.
//

import Foundation
import UIKit
import GoogleMaps
import GoogleMapsUtils

class MapViewController: UIViewController {

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .semiboldPoppins(24)
        label.textColor = .palette(.black900)
        label.text = "Location"
        return label
    }()
    
    private var locationManager = CLLocationManager()
    
    private lazy var mapView = GMSMapView.map(withFrame: CGRect.zero, camera: GMSCameraPosition.camera(withLatitude: 43.2220, longitude: 76.8512, zoom: 12))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUserLocation()
        setupViews()
    }
    
    private func setupMarkers() {
        let position = CLLocationCoordinate2DMake(43.22537724906514, 76.82759206742048)
        let marker = GMSMarker(position: position)
        marker.title = "Olzha Sport"
        marker.map = mapView
        
        let secondPosition =  CLLocationCoordinate2DMake(43.247388004837404, 76.88115041702986)
        let secondMarker = GMSMarker(position: secondPosition)
        secondMarker.title = "Almaty Football"
        secondMarker.map = mapView
    }
    
    private func setupUserLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
}

extension MapViewController: CodeDesignable {
    func setupViews() {
        view.backgroundColor = .clear
        mapView.delegate = self
        
        view.addSubview(mapView)
        
        setupConstraints()
        setupMarkers()
        setupNavigation()
    }
    
    func setupConstraints() {
        mapView.snp.makeConstraints { (m) in
            m.left.right.bottom.equalToSuperview()
            m.top.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    func setupNavigation() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationController?.navigationBar.backgroundColor = .white
    }
}

extension MapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
      print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last
        mapView.isMyLocationEnabled = true
        locationManager.stopUpdatingLocation()
    }
}
