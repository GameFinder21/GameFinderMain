//
//  ProfileViewController.swift
//  GameDiscover
//
//  Created by Emarah Charles on 4/19/22.
//

import Parse
import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var LikedtableView: UITableView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var GamesHearted: UILabel!
    var faves = [PFObject]()  // this is an array of faves  - think i want this saved under users
    
    
    @IBAction func onLogOutButton(_ sender: Any) {
        PFUser.logOut()
        let main = UIStoryboard (name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(identifier: "LoginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let
        delegate = windowScene.delegate as? SceneDelegate else { return }
        delegate.window? .rootViewController = loginViewController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LikedtableView.delegate = self
        LikedtableView.dataSource = self
        
        //This is for the username label on profile page
        var currentUser = PFUser.current()
        if currentUser != nil {
            usernameLabel.text = "Hey, " + (currentUser?.username)!
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className:"Favorites")
        query.includeKeys(["author","gameName", "gameName.author"]) // asking Parse to send me the game names
        query.limit = 20
        
        query.findObjectsInBackground { (faves,error) in
            if faves != nil {
                self.faves = faves!
                self.LikedtableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
       return 1// this is causing problems
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faves.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fave = faves[indexPath.row]
        //let gameName = (fave["gameName"] as? [PFObject]) ?? []
        //let gameNamePrint = fave[indexPath.section]
        
        let cell = LikedtableView.dequeueReusableCell(withIdentifier: "LikedTableViewCell") as! LikedTableViewCell
        
    //kinda sorta works??
         let currentUser = PFUser.current()!
         let user = fave["author"] as! PFUser
        
         let likeUser = user.username
         let cUser = currentUser.username
        
         if  likeUser == cUser{
            cell.gameName.text = fave["gameName"] as? String
            let imageFile = fave["gamePoster"] as! PFFileObject
            let urlString = imageFile.url!
            let url = URL(string: urlString)!
            cell.gamePosterView.af.setImage(withURL: url)
            return cell

         }else{
             return cell
         }
    
        }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
