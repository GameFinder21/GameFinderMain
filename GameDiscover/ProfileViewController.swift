//
//  ProfileViewController.swift
//  GameDiscover
//
//  Created by Emarah Charles on 4/19/22.
//

import Parse
import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var GamesHearted: UILabel!
    
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

//        let query = PFQuery(className:"Favorites")
//        query.includeKeys(["author", "gameNames"])
//        query.limit = 20
//
//        query.findObjectsInBackground {(gameNames, error) in
//            if gameNames != nil {
//                self.GamesHearted.text! = gameNames
//
//            }
//        }
        
        var currentUser = PFUser.current()
        
        if currentUser != nil {
            usernameLabel.text = currentUser?.username
           // GamesHearted.text =
        } else {
          // Show the signup or login screen???
        }
        // Do any additional setup after loading the view.
       
     // print(Favorites)
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
