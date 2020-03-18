//
//  ViewController.swift
//  RestezChezVous
//
//  Created by Brian Corrieri on 18/03/2020.
//  Copyright © 2020 FairTrip. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var professionalView: MotiveView!
    @IBOutlet weak var groceryShoppingView: MotiveView!
    @IBOutlet weak var healthView: MotiveView!
    @IBOutlet weak var assistanceView: MotiveView!
    @IBOutlet weak var exerciseView: MotiveView!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userInfosButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(presentUserInfosVC))
        navigationItem.leftBarButtonItem = userInfosButton
        
        setupViews()
        presentCertificate()
    }
    
    func presentCertificate() {
        if let motive = defaults.value(forKey: "motive") as? String {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CertificateVC") as! CertificateVC
            if let signatureImage = defaults.value(forKey: "signatureImage") as? Data {
                vc.signatureImage = UIImage(data: signatureImage)
            }
            vc.chosenMotive = Motive(rawValue: motive)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
    }
    
    func setupViews() {
        
        let segueBlock = { [weak self] motiveView in self?.segue(sender: motiveView) }
        
        professionalView.configure(motive: .professional, segueBlock: segueBlock)
        professionalView.makeCardView()
        
        groceryShoppingView.configure(motive: .groceryShopping, segueBlock: segueBlock)
        groceryShoppingView.makeCardView()
        
        healthView.configure(motive: .health, segueBlock: segueBlock)
        healthView.makeCardView()
        
        assistanceView.configure(motive: .assistance, segueBlock: segueBlock)
        assistanceView.makeCardView()
        
        exerciseView.configure(motive: .exercise, segueBlock: segueBlock)
        exerciseView.makeCardView()
    }
    
    @objc func presentUserInfosVC() {
        self.performSegue(withIdentifier: "userInfos", sender: self)
    }
    
    func segue(sender: MotiveView) {
        
        if defaults.value(forKey: "userInfos") != nil {
            self.performSegue(withIdentifier: "signature", sender: sender)
        } else {
            self.performSegue(withIdentifier: "userInfos", sender: sender)
        }
//        defaults.removeObject(forKey: "userInfos")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SignatureVC, let sender = sender as? MotiveView {
            vc.motive = sender.motive
        }
        if let vc = segue.destination as? UserInfosVC, let sender = sender as? MotiveView {
            vc.motive = sender.motive
        }
    }

}

