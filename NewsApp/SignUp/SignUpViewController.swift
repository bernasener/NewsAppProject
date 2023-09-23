//
//  SignUpViewController.swift
//  NewsApp
//
//  Created by Berna Şener on 18.09.2023.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Email: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func SignUp(_ sender: Any) {
        let storyboard = UIStoryboard(name: "OnboardingViewController", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(identifier: "OnboardingViewController") as? OnboardingViewController{
            if let email = Email.text, let Password = Password.text {
                
                //            UserDefaults.standard.set(username, forKey: "username")
                //            UserDefaults.standard.set(email, forKey: "email")
                
                Auth.auth().createUser(withEmail: email, password: Password) { authResult, error in
                    if let e = error {
                        print(e)
                    } else {
                        let navBar = UINavigationController(rootViewController: vc)
                                                    navBar.modalPresentationStyle = .fullScreen
                                                    self.present(navBar, animated: true)
                        
                        }
                    
                    
                }
                
            }
        }
        
        
    }
    
    
}
