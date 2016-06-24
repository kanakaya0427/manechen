//
//  bunsekiTableViewCell.swift
//  manechen
//
//  Created by NakayaKana on 2016/06/24.
//  Copyright © 2016年 NakayaKana. All rights reserved.
//

import UIKit

class bunsekiTableViewCell: UITableViewCell {
    
    @IBOutlet var dateLabel : UILabel!
    @IBOutlet var kategoriLabel : UILabel!
    @IBOutlet var shiyouLabel : UILabel!
    @IBOutlet var typeLabel : UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
