//
//  CustomSwipeDemoViewController.swift
//  ZLSwipeableViewSwiftDemo
//
//  Created by Zhixuan Lai on 5/25/15.
//  Copyright (c) 2015 Zhixuan Lai. All rights reserved.
//

import UIKit

class CustomSwipeDemoViewController: ZLSwipeableViewController {
    
    let label: UILabel = {
        let lb = UILabel()
        lb.font = UIFont(name: "Dokdo-Regular", size: 23)
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.alpha = 0
        return lb
    }()
    
    let reloadButton: UIButton = {
        let bt = UIButton(type: .custom)
        bt.setImage(UIImage(named: "reload2"), for: .normal)
        bt.alpha = 0
        bt.layer.cornerRadius = 30
        bt.layer.masksToBounds = true
        bt.addTarget(self, action: #selector(resetButtonDidTapped(_:)), for: .touchUpInside)
        return bt
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUIObjects()

//        leftBarButtonItem.action = #selector(leftBarButtonAction)
//        upBarButtonItem.action = #selector(upBarButtonAction)
        
        // change how ZLSwipeableViewDirection gets interpreted to location and direction
        swipeableView.interpretDirection = {(topView: UIView, direction: ZLSwipeableViewDirection, views: [UIView], swipeableView: ZLSwipeableView) in
            let programmaticSwipeVelocity = CGFloat(500)
            let location = CGPoint(x: topView.center.x-30, y: topView.center.y*0.1)
            var directionVector: CGVector?
            switch direction {
            case ZLSwipeableViewDirection.Left:
                directionVector = CGVector(dx: -programmaticSwipeVelocity, dy: 0)
            case ZLSwipeableViewDirection.Right:
                directionVector = CGVector(dx: programmaticSwipeVelocity, dy: 0)
            case ZLSwipeableViewDirection.Up:
                directionVector = CGVector(dx: 0, dy: -programmaticSwipeVelocity)
            case ZLSwipeableViewDirection.Down:
                directionVector = CGVector(dx: 0, dy: programmaticSwipeVelocity)
            default:
                directionVector = CGVector(dx: 0, dy: 0)
            }
            return (location, directionVector!)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let reloadButtonCenterY = (swipeableView.frame.maxY + view.frame.maxY) / 2
        reloadButton.layout.centerX().centerYAnchor.constraint(equalTo: view.topAnchor, constant: reloadButtonCenterY).isActive = true
    }
    
    private func configureUIObjects() {
        view.addSubview(label)
        view.addSubview(reloadButton)
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        reloadButton.layout.centerX().centerY()
        reloadButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        reloadButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc private func resetButtonDidTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        label.text = answerData[(0..<answerData.count).randomElement()!]
        
        
        currentDevice.isProximityMonitoringEnabled = false
        
        animation(withDelay: 0) {
            self.animation(withDelay: 0.3) {
                self.animation(withDelay: 0.3) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        
                        UIView.animate(withDuration: 1, animations: {
                            self.label.alpha = 1
                            self.reloadButton.alpha = 1
                        })
                        UIView.animate(withDuration: 1,
                                       delay: 0,
                                       options: [.repeat, .allowUserInteraction],
                                       animations: {
                                        self.reloadButton.transform = CGAffineTransform(rotationAngle: .pi / 2)
                        })
                    }
                }
            }
        }

    }
    
    // MARK: - Make Card Animation func with Completion
    private func animation(withDelay delay : Double, After completion: @escaping () -> Void) {
        UIView.animateKeyframes(withDuration: 0.7,
                                delay: delay,
                                options: .allowUserInteraction,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.25,
                                                       animations: {
                                                        self.swipeableView.swipeTopView(inDirection: .Left)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.25,
                                                       relativeDuration: 0.25,
                                                       animations: {
                                                        self.swipeableView.swipeTopView(inDirection: .Right)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.5,
                                                       relativeDuration: 0.25,
                                                       animations: {
                                                        self.swipeableView.swipeTopView(inDirection: .Up)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.75,
                                                       relativeDuration: 0.25,
                                                       animations: {
                                                        self.swipeableView.swipeTopView(inDirection: .Down)
                                    })
        },
                                completion: {
                                    param in
                                    completion()
        })
    }
    
    // MARK: - Actions
    
    private func animation(delay: Double, completion: () -> Void = {}) {
        UIView.animateKeyframes(withDuration: 1,
                                delay: delay,
                                options: .allowUserInteraction,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.25,
                                                       animations: {
                                                        self.swipeableView.swipeTopView(inDirection: .Left)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.25,
                                                       relativeDuration: 0.25,
                                                       animations: {
                                                        self.swipeableView.swipeTopView(inDirection: .Right)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.5,
                                                       relativeDuration: 0.25,
                                                       animations: {
                                                        self.swipeableView.swipeTopView(inDirection: .Up)
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.75,
                                                       relativeDuration: 0.25,
                                                       animations: {
                                                        self.swipeableView.swipeTopView(inDirection: .Down)
                                    })
        })
        //completion()
    }
//    @objc func leftBarButtonAction() {
//        self.swipeableView.swipeTopView(fromPoint: CGPoint(x: 10, y: 300), inDirection: CGVector(dx: -700, dy: -300))
//    }
    
//    @objc func upBarButtonAction() {
//        self.swipeableView.swipeTopView(fromPoint: CGPoint(x: 100, y: 30), inDirection: CGVector(dx: 100, dy: -800))
//    }

}
