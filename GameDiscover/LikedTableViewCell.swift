//
//  LikedTableViewCell.swift
//  GameDiscover
//
//  Created by Emarah Charles on 4/20/22.
//

import UIKit

class LikedTableViewCell: UITableViewCell {

    @IBOutlet weak var gamePosterView: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
