//
//  CertificateVC.swift
//  RestezChezVous
//
//  Created by Brian Corrieri on 18/03/2020.
//  Copyright © 2020 FairTrip. All rights reserved.
//

import Foundation
import UIKit


class CertificateVC: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var birthdate: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var motive: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var signature: UIImageView!
    
    var chosenMotive: Motive?
    var signatureImage: UIImage?
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayInfos()
        saveCertificateData()
    }
    
    func displayInfos() {
        signature.image = signatureImage
        motive.text = chosenMotive?.description
        
        guard let userInfos = defaults.value(forKey: "userInfos") as? Dictionary<String, String> else { return }
        name.text = userInfos["name"]
        birthdate.text = userInfos["birthdate"]
        let address = userInfos["address"] ?? ""
        let city = userInfos["city"] ?? ""
        self.address.text = address + "\n" + city
        
        displayDate(with: city)
    }
    
    func displayDate(with city: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d/MM/YYYY"
        let date = dateFormatter.string(from: Date())
        self.date.text = "Fait à " + city + ", le " + date
    }
        
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true)
        if let navigation = presentingViewController as? UINavigationController {
            navigation.popToRootViewController(animated: true)
        }
        deleteCertificateData()
    }
    
    func saveCertificateData() {
        defaults.set(chosenMotive?.rawValue, forKey: "motive")
        defaults.set(signatureImage?.pngData(), forKey: "signatureImage")
    }
    
    func deleteCertificateData() {
        defaults.removeObject(forKey: "motive")
        defaults.removeObject(forKey: "signatureImage")
    }
    
}

