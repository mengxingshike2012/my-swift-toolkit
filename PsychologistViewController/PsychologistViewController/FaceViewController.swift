//
//  FaceViewController.swift
//  SmileFaceApplication
//
//  Created by windfantasy on 15/12/19.
//  Copyright © 2015年 windfantasy. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController, FaceViewDataSource {
    
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale1:"))
            //faceView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "changeHappiness:"))
        }
    }
    var happiness: Int = 75 {
        didSet {
            happiness = min(max(happiness,0),100)
            print("happiness = \(happiness)")
            updateUI()
        }
    }
    private  struct Constants {
        static let HappinesGestureScale: CGFloat = 4
    }
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinesGestureScale)
            if happiness != 0 {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
    }
    
    private func updateUI() {
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness - 50) / 50
    }

}
