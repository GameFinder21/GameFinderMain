//
//  ViewController.swift
//  GameDiscover
//
//  Created by Emarah Charles on 4/2/22.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    

    @IBOutlet weak var tableView: UITableView!
    
    var games = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let url = URL(string: "https://api.rawg.io/api/games?key=8c575d35efc34da58900f996ea2c5d8d&dates=2021-09-01,2021-09-01&platforms=18,1,7")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 
                 self.games = dataDictionary["results"] as! [[String:Any]]
                 
                 self.tableView.reloadData()
                 
                 print(dataDictionary)
             }
        }
        task.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell") as! GameCell
    
        let game = games[indexPath.row]
        let name = game["name"] as! String
        let rating = game["rating"] as! String
        let platform = game["platforms"] as! String
        let releasedDate = game["released"] as! String
        let store = game["stores"] as! String
        
        cell.nameLabel.text = name
        cell.ratingLabel.text = rating
        cell.platformLabel.text = platform
        cell.releasedDateLabel.text = releasedDate
        cell.storeLabel.text = store
        
    
        let image = game["image_background"] as! String
        let posterURL = URL(string: image)!
        
        cell.posterView.af.setImage(withURL: posterURL)
        
        return cell
    }
}

