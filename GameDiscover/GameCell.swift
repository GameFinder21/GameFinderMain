//
//  GameCell.swift
//  GameDiscover
//
//  Created by Jiao Jiao Ding on 4/6/22.
//
import Parse
import AlamofireImage
import UIKit

class GameCell: UITableViewCell {
    var favorited:Bool = false
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            faveButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            faveButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }//stopped here... minute 17:38 of video

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!

    @IBOutlet weak var platformLabel: UILabel!
    
    @IBOutlet weak var storeLabel: UILabel!
    
    @IBOutlet weak var releasedDateLabel: UILabel!
    
    @IBOutlet weak var posterView: UIImageView!
    
    @IBOutlet weak var faveButton: UIButton!
    
    @IBAction func favoriteGame(_ sender: Any) {
        let favorites =  PFObject(className: "Favorites")
        let toBeFavorited = !favorited
        
        if(toBeFavorited){
            self.setFavorite(true)
            favorites["author"] = PFUser.current()!
            favorites["gameName"] = nameLabel.text!
            //favorites["gamePoster"] = posterView.image!
            
            let imageData = posterView.image!.pngData()
            let file = PFFileObject(name: "image.png", data: imageData!)
            favorites["gamePoster"] = file
            
            
        
             
           //cell.posterView.af.setImage(withURL: posterURL)

//        }, failure: { (error) in
//            print("Favorite did not succceed: \(error)")
    }
            else{
                self.setFavorite(false)
            }
        
        
        
        favorites.saveInBackground { (success, error) in
            if success {
                print("saved")
            }else {
                print("error!")

                }
            }
        
       
    
        
        //let imageData = imageView.image!.pngData()
        //let file = PFFileObject(name: "image.png", data: imageData!)
        //favorites["image"] = file
        
        
    
    }
    
    
//        lOGIC I'm thinking about adding
//    - if game is liked, add it to parse(Store name, and photo)
//        return this in profile
//
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
