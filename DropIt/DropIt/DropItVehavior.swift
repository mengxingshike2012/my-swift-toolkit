//
//  DropItVehavior.swift
//  DropIt
//
//  Created by windfantasy on 16/2/27.
//  Copyright © 2016年 windfantasy. All rights reserved.
//

import UIKit

class DropItBehavior: UIDynamicBehavior {

    let gravity = UIGravityBehavior()
    lazy var collider: UICollisionBehavior = {
        let lazilyCreatedCollider = UICollisionBehavior()
        lazilyCreatedCollider.translatesReferenceBoundsIntoBoundary = true
        return lazilyCreatedCollider;
        }()
    
    lazy var dropBehavior: UIDynamicItemBehavior = {
        let lazyCreatedDropBehavior = UIDynamicItemBehavior()
        lazyCreatedDropBehavior.allowsRotation = true
        lazyCreatedDropBehavior.elasticity = 0.75
        return lazyCreatedDropBehavior
    }()
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(dropBehavior)
    }
    
    func addDrop(drop: UIView) {
        dynamicAnimator?.referenceView?.addSubview(drop)
        gravity.addItem(drop)
        collider.addItem(drop)
        dropBehavior.addItem(drop)
    }
    
    func removeDrop(drop: UIView) {
        gravity.removeItem(drop)
        collider.removeItem(drop)
        dropBehavior.removeItem(drop)
        drop.removeFromSuperview()
    }
    
    func addBarrier(path: UIBezierPath, named name: String) {
        collider.removeBoundaryWithIdentifier(name)
        collider.addBoundaryWithIdentifier(name, forPath: path)
    }
}
