//
//  AdvantageTableViewCell.swift
//  ForeverSingle
//
//  Created by Swasidhant Chowdhury on 10/02/18.
//  Copyright © 2018 Swasidhant Chowdhury. All rights reserved.
//

import UIKit

class AdvantageTableViewCell: UITableViewCell {

    @IBOutlet weak var lblAdvantage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func assignAdvantage(adv: String) {
        self.lblAdvantage.text = adv
    }

}
