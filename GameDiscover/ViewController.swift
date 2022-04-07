//
//  ViewController.swift
//  GameDiscover
//
//  Created by Emarah Charles on 4/2/22.
//

import UIKit

class ViewController: UIViewController {

    var games = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
                 
                 print(dataDictionary)
             }
        }
        task.resume()
    }


}

