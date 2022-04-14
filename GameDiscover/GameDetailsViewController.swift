//
//  GameDetailsViewController.swift
//  GameDiscover
//
//  Created by Jiayi on 4/12/22.
//

import UIKit
import AlamofireImage

class GameDetailsViewController: UIViewController {
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    
    var game: [String:Any]!
    var gameinfo: GameData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchGameData { GameData in}
        
    }
    
    func fetchGameData (completionHandler: @escaping (GameData) -> Void){
        let id = game["slug"] as! String
        let starturl = "https://api.rawg.io/api/games/"
        let endurl = "?key=8c575d35efc34da58900f996ea2c5d8d"
        let urlString = "\(starturl)\(id)\(endurl)"
        let url = URL(string: urlString)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else {return}
            
            do{
                let gamesData = try JSONDecoder().decode(GameData.self, from: data)
                completionHandler(gamesData)
                DispatchQueue.main.async {
                    self.titleLabel.text = gamesData.name
                    self.titleLabel.sizeToFit()
                    self.synopsisLabel.text = gamesData.description_raw
                    
                    let backdropPath = gamesData.background_image
                    let backdropUrl = URL(string: backdropPath)
                    self.backdropView.af_setImage(withURL: backdropUrl!)
                }
            }catch{
                let error = error
                print(error.localizedDescription)
            }
        }.resume()
    }
}
