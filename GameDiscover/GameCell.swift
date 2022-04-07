//
//  GameCell.swift
//  GameDiscover
//
//  Created by Jiao Jiao Ding on 4/6/22.
//

import UIKit

class GameCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!

    @IBOutlet weak var platformLabel: UILabel!
    
    @IBOutlet weak var storeLabel: UILabel!
    
    @IBOutlet weak var releasedDateLabel: UILabel!
    
    @IBOutlet weak var posterView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
