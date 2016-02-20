//
//  ViewController.swift
//  Cassini
//
//  Created by windfantasy on 16/1/17.
//  Copyright © 2016年 windfantasy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let ivc = segue.destinationViewController as? ImageViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "acfun":
                        ivc.imageURL = DemoURL.pixiv
                        ivc.title = "AcFun"
                    case "bilibili":
                        ivc.imageURL = DemoURL.Bilibili
                        ivc.title = "BiliBili"
                    case "scathach":
                        ivc.imageURL = DemoURL.scathach
                        ivc.title = "Scathach"
                default:
                    break 
                }
            }
        }
    }
    
       
}

