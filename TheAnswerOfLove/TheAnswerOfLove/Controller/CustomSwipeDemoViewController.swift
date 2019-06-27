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
        lb.text = "뜨거운 것을 원하게 될 것이다"
        lb.font = UIFont(name: "Dokdo-Regular", size: 23)
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.alpha = 0
        return lb
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        leftBarButtonItem.action = #selector(leftBarButtonAction)
        upBarButtonItem.action = #selector(upBarButtonAction)
        
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
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animateKeyframes(withDuration: 0.7,
                                delay: 0,
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
        },completion: {
           param in
            UIView.animateKeyframes(withDuration: 0.7,
                                    delay: 0.3,
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
            },completion: {
                param in
                UIView.animateKeyframes(withDuration: 0.7,
                                        delay: 0.3,
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
                },completion: { param in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        UIView.animate(withDuration: 1,
                                       animations: {
                                        self.label.alpha = 1
                        })
                    }
                })
            })
        })
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
        }
        
//        UIView.animate(withDuration: 1,
//                       animations: {
//                        self.label.alpha = 1
//        })
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
    @objc func leftBarButtonAction() {
        self.swipeableView.swipeTopView(fromPoint: CGPoint(x: 10, y: 300), inDirection: CGVector(dx: -700, dy: -300))
    }
    
    @objc func upBarButtonAction() {
        self.swipeableView.swipeTopView(fromPoint: CGPoint(x: 100, y: 30), inDirection: CGVector(dx: 100, dy: -800))
    }

}
