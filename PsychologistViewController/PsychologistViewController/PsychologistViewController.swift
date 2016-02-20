//
//  ViewController.swift
//  PsychologistViewController
//
//  Created by windfantasy on 15/12/26.
//  Copyright © 2015年 windfantasy. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        if let hvc = destination as? FaceViewController {
            if let identifier = segue.identifier {
                switch (identifier) {
                    case "showSad": hvc.happiness = 0
                    case "showHappy": hvc.happiness = 100
                    case "nothing": hvc.happiness = 25
                    default: hvc.happiness = 50
                }
            }
        }
    }

    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)
    }

}

