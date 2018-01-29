//
//  DriverVC.swift
//  udrive
//
//  Created by 王資猛 on 2018/1/20.
//  Copyright © 2018年 王資猛. All rights reserved.
//

import UIKit
import MapKit

class DriverVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {
    
    @IBOutlet weak var myMap: MKMapView!
    
    private var locationManager = CLLocationManager();
    private var userLocation: CLLocationCoordinate2D?;
//    private var riderLocation: CLLocationCoordinate2D?;
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeLocationManager()

        // Do any additional setup after loading the view.
    }
    
    private func initializeLocationManager() {
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization();
        locationManager.startUpdatingLocation();
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        // if we have the cordinate from the manager
        if let location = locationManager.location?.coordinate{
            
            userLocation = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            
            let region = MKCoordinateRegion(center: userLocation!, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01));
            
            myMap.setRegion(region, animated: true);
            
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidDisappear(_ animated: Bool) {
        //因為ＧＰＳ功能很耗電,所以被敬執行時關閉定位功能
        locationManager.stopUpdatingLocation();
    }
    
    
    @IBAction func cancelUber(_ sender: Any) {
    }
    
    @IBAction func logout(_ sender: Any) {
        if AuthProvider.Instance.logOut(){
            dismiss(animated: true, completion: nil);
        } else {
            //problem with loging out
            alertTheUser(title: "Could not Logout", message: "We could not Logout at the moment, please try again later")
        }

    }
    
    
    
    
    
    
    private func alertTheUser(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil);
        alert.addAction(ok);
        present(alert, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
