//
//  UserInfosVC.swift
//  RestezChezVous
//
//  Created by Brian Corrieri on 18/03/2020.
//  Copyright © 2020 FairTrip. All rights reserved.
//

import Foundation
import UIKit

class UserInfosVC: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var birthdate: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    var infos = ["name":"", "birthdate":"", "address":"", "city":""]
    var motive: Motive?
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.delegate = self
        birthdate.delegate = self
        address.delegate = self
        city.delegate = self
        
        doneButton.makeCardView()
        
        if let userInfos = defaults.value(forKey: "userInfos") as? Dictionary<String, String> {
            self.infos = userInfos
            name.text = infos["name"]
            birthdate.text = infos["birthdate"]
            address.text = infos["address"]
            city.text = infos["city"]
        }
    }
    
    
    @IBAction func save(_ sender: Any) {
        
        infos["name"] = name.text
        infos["birthdate"] = birthdate.text
        infos["address"] = address.text
        infos["city"] = city.text
        
        defaults.set(infos, forKey: "userInfos")
        
        if motive == nil {
            navigationController?.popViewController(animated: true)
        } else {
            self.performSegue(withIdentifier: "userInfosToSignature", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SignatureVC {
            vc.motive = motive
        }
    }
    
}

extension UserInfosVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "\n" {
            textField.resignFirstResponder()
            return false
        }
        return true
    }
    
}
