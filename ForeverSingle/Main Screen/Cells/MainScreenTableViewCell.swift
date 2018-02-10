//
//  MainScreenTableViewCell.swift
//  ForeverSingle
//
//  Created by Swasidhant Chowdhury on 09/02/18.
//  Copyright © 2018 Swasidhant Chowdhury. All rights reserved.
//

import UIKit

class MainScreenTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func assignCell (text: String) {
        self.lblName.text = text
    }
    
}
