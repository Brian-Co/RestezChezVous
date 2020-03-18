//
//  MotiveView.swift
//  RestezChezVous
//
//  Created by Brian Corrieri on 18/03/2020.
//  Copyright © 2020 FairTrip. All rights reserved.
//

import Foundation
import UIKit


class MotiveView: UIView {
    
    typealias Block = (MotiveView) -> ()?
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var motiveLabel: UILabel!
    
    var motive: Motive!
    var segue: Block?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        
        Bundle.main.loadNibNamed("MotiveView", owner: self, options: nil)
        contentView.frame = bounds
        contentView.makeCardView()
        addSubview(contentView)
    }
    
    func configure(motive: Motive, segueBlock: Block?) {
        
        self.motive = motive
        self.segue = segueBlock
        
        motiveLabel.text = motive.title
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(segue(_:)) )
        contentView.addGestureRecognizer(gesture)
    }
    
    
    @IBAction func displayMotiveDetails(_ sender: Any) {
                
        let alert = UIAlertController(title: motive.title, message: motive.description, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        
        if let sceneDelegate = self.window?.windowScene?.delegate as? SceneDelegate {
            sceneDelegate.window!.rootViewController!.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func segue(_ sender: Any) {
        
        self.segue?(self)
    }
        
}


