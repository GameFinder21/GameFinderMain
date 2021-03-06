//
//  ViewController.swift
//  GameDiscover
//
//  Created by Emarah Charles on 4/2/22.
//

import Parse
import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        let main = UIStoryboard (name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(identifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let
        delegate = windowScene.delegate as? SceneDelegate else { return }
        delegate.window? .rootViewController = loginViewController
    }
    
    @IBOutlet weak var tableView: UITableView!
    
   // var games = [[String:Any]]()
    var games = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let url = URL(string: "https://api.rawg.io/api/games?key=8c575d35efc34da58900f996ea2c5d8d&dates=2022-01-01,2022-04-21")! // switched this 
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any] // not sure if i should keep this as string?? does it matter
                 
                 self.games = dataDictionary["results"] as! [NSDictionary] // changed to NSDictionary, might need to change back
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
       // let platformLabel = game["platforms"]?["platform"]["name"] as! String
        let name = game["name"] as! String
        let rating = game["rating"] as! Double
        let releasedDate = game["released"] as! String
        
        cell.nameLabel.text = name
        cell.ratingLabel.text = String(rating) + "/5"
        //cell.platformLabel.text = platform
        cell.releasedDateLabel.text = releasedDate
     //   cell.storeLabel.text = store
        
    
       let image = game["background_image"] as! String
       let posterURL = URL(string: image)!
        
      cell.posterView.af.setImage(withURL: posterURL)

        //let platform = game[["platforms"]?["name"]] as! String // option 1
        //let platformName = platform["name"] as!String
        // let store = game["stores"] as! String
        return cell
    }
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("Loading up the details screen")
        
        // Find the selected movie
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let game = games[indexPath.row]
        
        // Pass the selected movie to the details view controller
        let detailsViewController = segue.destination as! GameDetailsViewController
        detailsViewController.game = game as! [String : Any]
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

