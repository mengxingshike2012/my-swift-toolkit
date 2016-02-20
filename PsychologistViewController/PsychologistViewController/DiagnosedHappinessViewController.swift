//
//  DiagnosedHappinessViewController.swift
//  PsychologistViewController
//
//  Created by windfantasy on 15/12/26.
//  Copyright © 2015年 windfantasy. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController : FaceViewController, UIPopoverPresentationControllerDelegate {
    
    override var happiness: Int {
        didSet {
            diagnosticHistory += [happiness]
        }
    }
    
    var diagnosticHistory :[Int]{
        get {return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? []}
        set {
            defaults.setObject(newValue, forKey: History.DefaultsKey)
        }
    }
    
    private  let defaults = NSUserDefaults.standardUserDefaults()
    
    private struct History {
        static let SegueIdentifer = "Show Diagnostic History"
        static let DefaultsKey = "DiagnosedHappinessViewController.History"
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifer = segue.identifier {
            switch identifer {
            case History.SegueIdentifer:
                if let tvc = segue.destinationViewController as? TextViewController {
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                    tvc.text = "\(diagnosticHistory)"
                }
            default: break
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}
