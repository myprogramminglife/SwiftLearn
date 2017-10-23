//
//  ContactsCell.swift
//  FirstDemo
//
//  Created by 姜开棋 on 2017/10/23.
//  Copyright © 2017年 得一. All rights reserved.
//

import UIKit

class ContactsCell: UITableViewCell {

    @IBOutlet weak var img_icon: UIImageView!
    @IBOutlet weak var lab_name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.img_icon.layer.cornerRadius = 25
        self.img_icon.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
