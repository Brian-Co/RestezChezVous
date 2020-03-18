//
//  SignatureVC.swift
//  RestezChezVous
//
//  Created by Brian Corrieri on 18/03/2020.
//  Copyright © 2020 FairTrip. All rights reserved.
//

import Foundation
import UIKit


class SignatureVC: UIViewController {
    
    @IBOutlet weak var signatureView: Canva!
    @IBOutlet weak var nextButton: UIButton!
    
    var motive: Motive?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.makeCardView()
        nextButton.layer.cornerRadius = 10
        nextButton.layer.shadowOpacity = 0.4
    }
    
    
    @IBAction func done(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CertificateVC") as! CertificateVC
        vc.signatureImage = signatureView.image()
        vc.chosenMotive = motive
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @IBAction func clear(_ sender: Any) {
        signatureView.clear()
    }
    
}

