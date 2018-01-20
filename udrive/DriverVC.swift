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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
