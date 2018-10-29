//
//  TwitterFeedCell.swift
//  MeTOO APP
//
//  Created by Ajinkya Sonar on 29/10/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit

class TwitterFeedCell: UITableViewCell {
    
    @IBOutlet weak var innerContextView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var feedTextLable: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        innerContextView.clipsToBounds = true
        innerContextView.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
