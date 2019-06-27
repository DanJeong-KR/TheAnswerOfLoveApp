//
//  ViewController.swift
//  ZLSwipeableViewSwiftDemo
//
//  Created by Zhixuan Lai on 4/27/15.
//  Copyright (c) 2015 Zhixuan Lai. All rights reserved.
//

import UIKit
//import UIColor_FlatColors
//import Cartography

class ZLSwipeableViewController: UIViewController {

    var swipeableView: ZLSwipeableView!
    
    
    
    var colors = ["Turquoise", "Green Sea", "Emerald", "Nephritis", "Peter River", "Wisteria", "Sun Flower", "Orange", "Carrot", "Pumpkin", "Clouds", "Silver", "Concrete", "Asbestos"]
    // #colorLiteral(red: 0.9215686275, green: 0.1843137255, blue: 0.02352941176, alpha: 0.6006679687)
    var heajiColors:[UIColor] = [#colorLiteral(red: 1, green: 0.8, blue: 0.8, alpha: 0.6962221747), #colorLiteral(red: 0.5058823529, green: 0.9254901961, blue: 0.9254901961, alpha: 0.6962221747), #colorLiteral(red: 0.7464812398, green: 0.7100023627, blue: 0.9085438848, alpha: 0.6962221747), #colorLiteral(red: 1, green: 0.9176470588, blue: 0.6549019608, alpha: 0.7976206122), #colorLiteral(red: 0.5962104779, green: 0.9254901961, blue: 0.9254901961, alpha: 0.8036523438), #colorLiteral(red: 0.7803921569, green: 0.9254901961, blue: 0.9333333333, alpha: 0.8036523438), #colorLiteral(red: 1, green: 0.4745098039, blue: 0.4745098039, alpha: 0.6958710938), #colorLiteral(red: 0.768627451, green: 0.8980392157, blue: 0.2196078431, alpha: 0.6958710938) ]
    var colorIndex = 0
    var loadCardsFromXib = false
    
    var reloadBarButtonItem: UIBarButtonItem!
    // var reloadBarButtonItem = UIBarButtonItem(barButtonSystemItem: "Reload", target: .Plain) { item in }
    var leftBarButtonItem: UIBarButtonItem!
    // var leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: "←", target: .Plain) { item in }
    var upBarButtonItem: UIBarButtonItem!
    // var upBarButtonItem = UIBarButtonItem(barButtonSystemItem: "↑", target: .Plain) { item in }
    var rightBarButtonItem: UIBarButtonItem!
    // var rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: "→", target: .Plain) { item in }
    var downBarButtonItem:UIBarButtonItem!
    // var downBarButtonItem = UIBarButtonItem(barButtonSystemItem: "↓", target: .Plain) { item in }
    
    // MARK: - viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        swipeableView.nextView = {
            return self.nextCardView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.setToolbarHidden(false, animated: false)
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        
        // MARK: - 탭바 버튼들
        reloadBarButtonItem = UIBarButtonItem(title: "Reload", style: .plain, target: self, action: #selector(reloadButtonAction))
        leftBarButtonItem = UIBarButtonItem(title: "←", style: .plain, target: self, action: #selector(leftButtonAction))
        upBarButtonItem = UIBarButtonItem(title: "↑", style: .plain, target: self, action: #selector(upButtonAction))
        rightBarButtonItem = UIBarButtonItem(title: "→", style: .plain, target: self, action: #selector(rightButtonAction))
        downBarButtonItem = UIBarButtonItem(title: "↓", style: .plain, target: self, action: #selector(downButtonAction))
        
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let items = [fixedSpace, reloadBarButtonItem!, flexibleSpace, leftBarButtonItem!, flexibleSpace, upBarButtonItem!, flexibleSpace, rightBarButtonItem!, flexibleSpace, downBarButtonItem!, fixedSpace]
        toolbarItems = items

        swipeableView = ZLSwipeableView()
        view.addSubview(swipeableView)
        
        // MARK: - View 이동중이라고 콘솔에 알려주는 애들
        /*
        swipeableView.didStart = {view, location in
            //print("Did start swiping view at location: \(location)")
        }
        swipeableView.swiping = {view, location, translation in
            //print("Swiping at view location: \(location) translation: \(translation)")
        }
        swipeableView.didEnd = {view, location in
            //print("Did end swiping view at location: \(location)")
        }
        swipeableView.didSwipe = {view, direction, vector in
            //print("Did swipe view in direction: \(direction), vector: \(vector)")
        }
        swipeableView.didCancel = {view in
            //print("Did cancel swiping view")
        }
        swipeableView.didTap = {view, location in
            //print("Did tap at location \(location)")
        }
        swipeableView.didDisappear = { view in
            //print("Did disappear swiping view")
        }
 */

        // MARK: - Cartography 부분 (cocoapod 하던지 하자)
        constrain(swipeableView, view) { view1, view2 in
            view1.left == view2.left+50
            view1.right == view2.right-50
            view1.top == view2.top + 120
            view1.bottom == view2.bottom - 100
        }
    }
    
    // MARK: - Actions
    
    @objc func reloadButtonAction() {
        let alertController = UIAlertController(title: nil, message: "Load Cards:", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let ProgrammaticallyAction = UIAlertAction(title: "Programmatically", style: .default) { (action) in
            self.loadCardsFromXib = false
            self.colorIndex = 0
            self.swipeableView.discardViews()
            self.swipeableView.loadViews()
        }
        alertController.addAction(ProgrammaticallyAction)
        
        let XibAction = UIAlertAction(title: "From Xib", style: .default) { (action) in
            self.loadCardsFromXib = true
            self.colorIndex = 0
            self.swipeableView.discardViews()
            self.swipeableView.loadViews()
        }
        alertController.addAction(XibAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func leftButtonAction() {
        self.swipeableView.swipeTopView(inDirection: .Left)
    }
    
    @objc func upButtonAction() {
        self.swipeableView.swipeTopView(inDirection: .Up)
    }
    
    @objc func rightButtonAction() {
        self.swipeableView.swipeTopView(inDirection: .Right)
    }
    
    @objc func downButtonAction() {
        self.swipeableView.swipeTopView(inDirection: .Down)
    }
    
    // MARK: ()
    func nextCardView() -> UIView? {
        if colorIndex >= heajiColors.count {
            colorIndex = 0
        }
        let cardView = CardView(frame: swipeableView.bounds)
        // rgb(196, 229, 56)
        cardView.backgroundColor = heajiColors[(0..<heajiColors.count).randomElement()!]
        colorIndex += 1

        if loadCardsFromXib {
            let contentView = Bundle.main.loadNibNamed("CardContentView", owner: self, options: nil)?.first! as! UIView
            contentView.translatesAutoresizingMaskIntoConstraints = false
            contentView.backgroundColor = cardView.backgroundColor
            cardView.addSubview(contentView)

            // This is important:
            // https://github.com/zhxnlai/ZLSwipeableView/issues/9
            /*// Alternative:
            let metrics = ["width":cardView.bounds.width, "height": cardView.bounds.height]
            let views = ["contentView": contentView, "cardView": cardView]
            cardView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[contentView(width)]", options: .AlignAllLeft, metrics: metrics, views: views))
            cardView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[contentView(height)]", options: .AlignAllLeft, metrics: metrics, views: views))
            */
            constrain(contentView, cardView) { view1, view2 in
                view1.left == view2.left
                view1.top == view2.top
                view1.width == cardView.bounds.width
                view1.height == cardView.bounds.height
            }
        }
        return cardView
    }

    func colorForName(_ name: String) -> UIColor {
        let sanitizedName = name.replacingOccurrences(of: " ", with: "")
        let selector = "flat\(sanitizedName)Color"
        return UIColor.perform(Selector(selector)).takeUnretainedValue() as! UIColor
    }
}

