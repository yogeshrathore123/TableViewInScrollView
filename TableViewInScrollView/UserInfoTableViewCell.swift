//
//  UserInfoTableViewCell.swift
//  TableViewInScrollView
//
//  Created by Yogesh Rathore on 10/01/24.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var userInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
