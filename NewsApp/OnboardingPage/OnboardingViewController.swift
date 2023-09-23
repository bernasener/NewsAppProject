//
//  OnboardingViewController.swift
//  NewsApp
//
//  Created by Berna Şener on 18.09.2023.
//

import UIKit
import FirebaseAuth

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Login(_ sender: Any) {
        let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            if let email = Email.text, let password = Password.text{
                
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
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
