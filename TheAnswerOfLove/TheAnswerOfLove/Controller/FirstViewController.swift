//
//  FirstViewController.swift
//  LoveTest
//
//  Created by chang sic jung on 26/06/2019.
//  Copyright © 2019 chang sic jung. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let helpLabel: UILabel = {
       let lb = UILabel()
        //lb.backgroundColor = .red
        //lb.font = UIFont.boldSystemFont(ofSize: 30)
        lb.font = UIFont(name: "Sunflower-Medium", size: 20)
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.text = """
        이 곳에 손을 대고
        고민을 이야기 한 후
        손을 떼세요.
"""
        return lb
    }()
    
    let testButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.titleLabel?.text = "test"
        bt.backgroundColor = .red
        bt.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside)
        return bt
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "palm")
        iv.alpha = 0.3
        iv.contentMode = UIImageView.ContentMode.scaleAspectFit
        return iv
    }()
    
    let currentDevice: UIDevice = {
        let dv = UIDevice.current
        dv.isProximityMonitoringEnabled = true
        return dv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews([helpLabel, testButton, imageView])
        setConstraints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(proximityStateDidChange(_:)), name: UIDevice.proximityStateDidChangeNotification, object: nil)
    }
    
    @objc func proximityStateDidChange(_ noti: Notification){
        if !currentDevice.proximityState {
            present(CustomSwipeDemoViewController(), animated: true)
        }
    }
    
    private func setConstraints(){
        helpLabel.layout.centerX().centerY(constant: -100)
        
        testButton.layout.centerX().centerY(constant: -200)
        
        imageView.layout.top().leading().trailing().bottom(constant: -200)
    }
    
    @objc private func buttonDidTapped(_ sender: Any) {
        present(CustomSwipeDemoViewController(), animated: true)
    }

}
