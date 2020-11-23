//
//  ViewController.swift
//  selecionarImagem
//
//  Created by user182008 on 23/11/20.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    var localizacao : CLLocation!
    
    @IBOutlet weak var ivImage: UIImageView!
    
    @IBOutlet weak var lbLat: UILabel!
    
    @IBOutlet weak var lbLgt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.requestWhenInUseAuthorization()
    }
    
    @IBAction func selecionarImagem(_ sender: Any) {
        file().selecionaImagem(self) {
            ivImage in self.ivImage.image = ivImage
        }
    }
    @IBAction func selecionadorCoordenadas(_ sender: Any) {
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse) || (CLLocationManager.authorizationStatus() == .authorizedAlways) {
            localizacao = locationManager.location
            lbLat.text = "Lat : \(localizacao.coordinate.latitude)"
            lbLgt.text = "Lgt : \(localizacao.coordinate.longitude)"
        }
    }
}

