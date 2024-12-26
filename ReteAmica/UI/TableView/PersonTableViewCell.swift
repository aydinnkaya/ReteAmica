//
//  PersonTableViewCell.swift
//  ReteAmica
//
//  Created by AydınKaya on 26.12.2024.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
