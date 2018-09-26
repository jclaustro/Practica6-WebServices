//
//  ViewController.swift
//  Practica6-WebServices
//
//  Created by JAVIER CLAUSTRO on 25/09/18.
//  Copyright © 2018 JAVIER CLAUSTRO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    

    
    
    //Outlets

    
    @IBOutlet weak var tableView: UITableView!
    
    var usuarios = [Usuario]()
    var usuario: Usuario?
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        
        //String de URL
        let urlString = "https://jsonplaceholder.typicode.com/users"
        // Objeto de la URL
        let url = URL(string: urlString)
        
        //Tarea de peticion
        let peticion = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            // Verificar si existe error en la peticion
            if(error != nil){
                print("Error: \(String(describing: error))")
            }else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [[String: AnyObject]]
                    print(json)
                    //Llenado del contenedor local (usuarios)
                    for user in json{
                        let name = user["name"] as! String
                        let email = user["email"] as! String
                        let phone = user["phone"] as! String
                        let address = user["address"] as! [String:AnyObject]
                        let geo = address["geo"] as! [String:AnyObject]
                        let lat = Double(geo["lat"] as! String)
                        let lng = Double(geo["lng"] as! String)
                        
                        
                        //Agregar info al arreglo
                        self.usuarios.append(Usuario(name: name, email: email, phone: phone, lat: lat!, lng: lng!))
                    }
                    //Refrescar la tabla
                    OperationQueue.main.addOperation ({
                        self.tableView.reloadData()
                    })
                    
                }catch let error as NSError{
                    print(error)
                }
            }
            
        }
        peticion.resume()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usuario")
        
        cell?.textLabel?.text = usuarios[indexPath.row].name
        cell?.detailTextLabel?.text = usuarios[indexPath.row].email
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        usuario = usuarios[indexPath.row]
        performSegue(withIdentifier: "detail", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! UserViewController
        destination.usuario = self.usuario
    }

}


class Usuario{
    var name: String
    var email: String
    var phone: String
    var lat: Double
    var lng: Double
    
    init(name: String, email: String, phone:String, lat:Double, lng:Double){
        self.name = name
        self.email = email
        self.phone = phone
        self.lat = lat
        self.lng = lng
    }
}
