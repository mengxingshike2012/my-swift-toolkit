//
//  TweetTableViewCell.swift
//  Smashtag
//
//  Created by windfantasy on 16/2/20.
//  Copyright © 2016年 windfantasy. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    var tweet: Tweet? {
        didSet {
            updateUI();
        }
    }

    @IBOutlet weak var tweetImageView: UIImageView!
    
    @IBOutlet weak var tweetScreenNameLabel: UILabel!
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    func updateUI() {
        
    }
}
