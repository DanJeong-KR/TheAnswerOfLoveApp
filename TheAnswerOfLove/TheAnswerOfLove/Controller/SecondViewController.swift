//
//  SecondViewController.swift
//  LoveTest
//
//  Created by chang sic jung on 27/06/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let iPhoneImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "iphone")
        iv.alpha = 0
        iv.contentMode = UIImageView.ContentMode.scaleAspectFit
        return iv
    }()
    
    let handImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "hand")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let label: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: "Sunflower-Medium", size: 25)
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.alpha = 0
        lb.text =
        """
        생각을 다 하셨다면
        
        화면을 쓸어 넘겨 보세요
        """
        return lb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubviews([iPhoneImageView, handImageView, label])
        setConstraints()
        NotificationCenter.default.addObserver(self, selector: #selector(proximityStateDidChange(_:)), name: UIDevice.proximityStateDidChangeNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 1) {
            self.iPhoneImageView.alpha = 0.5
            self.label.alpha = 1
        }
        
        handImageView.transform = CGAffineTransform(translationX: -100, y: 0)
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       options: .repeat,
                       animations: {
                        self.handImageView.transform = CGAffineTransform(translationX: 100, y: 0)
        })
    }
    
    private func setConstraints() {
        iPhoneImageView.layout.top(constant: 130).bottom(constant: -350).leading(constant: 50).trailing(constant: -50)
        
        handImageView.layout.centerX().centerY(constant: -125)
        
        label.layout.top(equalTo: iPhoneImageView.bottomAnchor, constant: 100).centerX()
    }
    
    @objc func proximityStateDidChange(_ noti: Notification){
        if !currentDevice.proximityState {
            navigationController?.pushViewController(CustomSwipeDemoViewController(), animated: true    )
        }
    }

}
