//
//  UserViewController.swift
//  Practica6-WebServices
//
//  Created by JAVIER CLAUSTRO on 25/09/18.
//  Copyright © 2018 JAVIER CLAUSTRO. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblLat: UILabel!
    @IBOutlet weak var lblLon: UILabel!
    
    var usuario: Usuario?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblName.text = usuario?.name
        lblEmail.text = usuario?.email
        lblPhone.text = usuario?.phone
        lblLat.text = usuario?.lat.description
        lblLon.text = usuario?.lng.description
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
