//
//  LoginViewController.swift
//  GameDiscover
//
//  Created by Emarah Charles on 4/19/22.
//

import UIKit
import Parse
class LoginViewController: UIViewController {

    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSignIn(_ sender: Any) {
       let username = userNameField.text!
       let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password){
            (user,error) in
             if user != nil {
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                 }else {
                     print("Error: \(error?.localizedDescription)")
                 }
            }
        }
    
    
    
    @IBAction func onSignUp(_ sender: Any) {
          let user = PFUser()
            user.username = userNameField.text
            user.password = passwordField.text
            
            user.signUpInBackground { (success, error) in
                if success{
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }else {
                    print("Error: \(error?.localizedDescription)")
                }
            }
     }
    
}//end of file
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


