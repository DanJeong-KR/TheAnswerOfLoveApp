//
//  SecondViewController.swift
//  LoveTest
//
//  Created by chang sic jung on 27/06/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "motion2")
        iv.alpha = 1
        iv.contentMode = UIImageView.ContentMode.scaleAspectFit
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        view.addSubview(imageView)
        
        imageView.layout.top().leading().trailing().bottom(constant: -200)
        
        NotificationCenter.default.addObserver(self, selector: #selector(proximityStateDidChange(_:)), name: UIDevice.proximityStateDidChangeNotification, object: nil)
    }
    
    @objc func proximityStateDidChange(_ noti: Notification){
        if !currentDevice.proximityState {
            show(CustomSwipeDemoViewController(), sender: nil)
        }
    }

}
