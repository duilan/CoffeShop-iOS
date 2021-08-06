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
    
    // MARK: -  Properties
    let mapView = MKMapView()
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 10000
    let shopModel = ShopModel()
    let shopInfoView = CSShopInfoView()
    
    // MARK: -  Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupMapView()
        checkLocationServices()
        showCoffeShopsOnMap()
        setupShopInfoView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        checkLocationServices()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: -  Private Methods
    private func setup() {
        title = "Shops"
        view.backgroundColor = CustomColors.backgroundColor
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupMapView(){
        view.addSubview(mapView)
        mapView.delegate = self
        mapView.isRotateEnabled = false
        mapView.showsCompass = false
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
    }
    
    private func setupShopInfoView() {
        view.addSubview(shopInfoView)
        shopInfoView.layer.opacity = 0
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToProductList))
        shopInfoView.addGestureRecognizer(tapGesture)
        shopInfoView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        shopInfoView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        shopInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        shopInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
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
    
    private func showCoffeShopsOnMap() {
        let coffeShops = shopModel.shops
        let annotations = coffeShops.map { shop -> ShopAnnotationPoint in
            let annotation = ShopAnnotationPoint()
            annotation.configure(with: shop)
            return annotation
        }
        mapView.addAnnotations(annotations)
    }
    
}

// MARK: -  MKMapViewDelegate
extension ShopsVC: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let  annotation = view.annotation as? ShopAnnotationPoint else { return }
        
        if let shop = shopModel.getShopBy(id: annotation.identifier) {
            shopInfoView.setInfo(shop: shop)
            centerMapOn(location: annotation.coordinate)
            shopInfoView.slideInBottomAnimation()
        }
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        shopInfoView.slideOutBottomAnimation()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKind(of: MKUserLocation.self) { return nil }
        
        let shopView = mapView.dequeueReusableAnnotationView(withIdentifier: ShopAnnotationView.annotationID, for: annotation)
        return shopView
    }
}

// MARK: -  CLLocationManagerDelegate
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
