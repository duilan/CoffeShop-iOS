//
//  ShopsVC.swift
//  CoffeShop-iOS
//
//  Created by Duilan on 25/06/21.
//

import UIKit
import MapKit
import CoreLocation

class ShopsVC: UIViewController {
    
    let mapView = MKMapView()
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 10000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupMapView()
        // simulateStoreTappedInmap()
        checkLocationServices()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkLocationServices()
    }
    
    private func setup() {
        title = "Shops"
        view.backgroundColor = CustomColors.backgroundColor
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupMapView(){
        view.addSubview(mapView)
        mapView.delegate = self
        mapView.register(ShopAnnotationView.self, forAnnotationViewWithReuseIdentifier: ShopAnnotationView.annotationID)
        mapView.anchor(top: view.topAnchor, left: view.leadingAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
    }
    
    private func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        }else {
            print("activa la localizacion")
        }
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways:
            //mapView.showsUserLocation = true
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerMapViewOnUserLocation()
        @unknown default:
            fatalError()
        }
    }
    
    private func centerMapViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            centerMapOn(location: location, zoom: regionInMeters)
        }
        fetchCoffeShops()
    }
    
    private func simulateStoreTappedInmap() {
        #warning("THIS IS TEMPORAL just simulate a jump to ProductListVC of a store in map")
        let btn = CSButtonFilled("Store Tapped!")
        view.addSubview(btn)
        btn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        btn.addTarget(self, action: #selector(goToProductList), for: .touchUpInside)
    }
    
    @objc private func goToProductList() {
        #warning("THIS IS TEMPORAL just simulate a jump to ProductListVC of a store in map")
        navigationController?.pushViewController(ProductListVC(), animated: true)
    }
    
    private func centerMapOn(location: CLLocationCoordinate2D , zoom: Double? = nil ) {
        if let zoom = zoom  {
            let region  = MKCoordinateRegion(center: location, latitudinalMeters: zoom, longitudinalMeters: zoom)
            mapView.setRegion(region, animated: true)
        } else {
            mapView.setCenter(location, animated: true)
        }
        
    }
    
    private func fetchCoffeShops() {
        
        struct Location {
            let title: String
            let latitude: Double
            let longitude: Double
        }
        
        let locations = [
            Location(title: "Calle Santo Tomás, Cuauhtémoc, 06060 Ciudad de México, México",    latitude: 19.427271821196612, longitude: -99.12627266528202),
            Location(title: "Viaducto Presidente Miguel Alemán, Piedad Narvarte, 03000 Ciudad de México, México", latitude: 19.4038828686858, longitude: -99.15681399541693),
            Location(title: "Calle Sur 109, Aeronáutica militar, 15970 Ciudad de México, México",     latitude: 19.42111096383475, longitude: -99.11528777258876)
        ]
        
        let annotations = locations.map { location -> MKAnnotation in
            let annotation = MKPointAnnotation()
            annotation.title = location.title            
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            
            return annotation
        }
        
        mapView.addAnnotations(annotations)
    }
    
}

extension ShopsVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        view.isSelected = true
        if let annotation = view.annotation {
            centerMapOn(location: annotation.coordinate)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation.isKind(of: MKUserLocation.self) { return nil }
        
        let shopView = mapView.dequeueReusableAnnotationView(withIdentifier: ShopAnnotationView.annotationID, for: annotation)
        return shopView
    }
}

extension ShopsVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
        print(location)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}
