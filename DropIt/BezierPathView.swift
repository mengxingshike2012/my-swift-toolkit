//
//  BezierPathView.swift
//  DropIt
//
//  Created by windfantasy on 16/2/27.
//  Copyright © 2016年 windfantasy. All rights reserved.
//

import UIKit

class BezierPathView: UIView {

    private var bezierPaths = [String:UIBezierPath]()
    
    func setPath(path: UIBezierPath?, named name: String) {
        bezierPaths[name] = path
        setNeedsDisplay()
    }
    override func drawRect(rect: CGRect) {
        for (_, path) in bezierPaths {
            path.stroke()
        }
    }
}
