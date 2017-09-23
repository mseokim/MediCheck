//
//  ThirdCheckViewController.swift
//  Medi Check
//
//  Created by 김민서 on 2017. 9. 23..
//  Copyright © 2017년 김민서. All rights reserved.
//

import UIKit
import Alamofire
import MapKit

class ThirdCheckViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        self.title = "길 찾기"
        // Do any additional setup after loading the view.
    }

    func setUI() {
        let myMap = MKMapView(frame: CGRect(x: 15, y: view.frame.height * 0.1, width: view.frame.width - 30, height: view.frame.height * 0.7))
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
        
        func goLocation(latitude latitudeValue: CLLocationDegrees, longitude longitudeValue : CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D {
            let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
            let spanValue = MKCoordinateSpanMake(span, span)
            let pRegion = MKCoordinateRegionMake(pLocation, spanValue)
            myMap.setRegion(pRegion, animated: true)
            return pLocation
        }
        
        
        func setAnnotation(latitude latitudeValue: CLLocationDegrees, longitude longitudeValue : CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubtitle:String) {
            let annotation = MKPointAnnotation()
            annotation.coordinate = goLocation(latitude: latitudeValue, longitude: longitudeValue, delta: span)
            annotation.title = strTitle
            annotation.subtitle = strSubtitle
            myMap.addAnnotation(annotation)
        }
        view.addSubview(myMap)
        
        let nextButton = UIButton(frame: CGRect(x: 50, y: view.frame.height * 0.75, width: view.frame.width - 100, height: view.frame.height * 0.08))
        nextButton.setTitle("다음", for: .normal)
        nextButton.backgroundColor = UIColor.logoColor
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "NanumSquareB", size: nextButton.frame.height * 0.3)
        nextButton.layer.cornerRadius = nextButton.frame.height * 0.5
        nextButton.addTarget(self, action: #selector(moveToNext), for: .touchUpInside)
        view.addSubview(nextButton)
        
        
        
    }
    
    @objc func moveToNext() {
        self.navigationController?.pushViewController(LastCheckViewController(), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
