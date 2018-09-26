//
//  MapViewController.swift
//  Practica6-WebServices
//
//  Created by JAVIER CLAUSTRO on 25/09/18.
//  Copyright © 2018 JAVIER CLAUSTRO. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    
    @IBOutlet weak var map: MKMapView!
    
    var name: String?
    var lat: Double?
    var lng: Double?

    @IBAction func showMap(_ sender: UIButton) {
        performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = name
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
