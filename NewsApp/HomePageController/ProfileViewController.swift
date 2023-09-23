//
//  ProfileViewController.swift
//  NewsApp
//
//  Created by Berna Şener on 21.09.2023.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logout(_ sender: Any) {
  
            do {
                try Auth.auth().signOut()
                let storyboard = UIStoryboard(name: "OnboardingViewController", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "OnboardingViewController") as! OnboardingViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
                // Kullanıcı başarıyla çıkış yaptı, giriş sayfasına yönlendirme yapabilirsiniz
            } catch let signOutError as NSError {
                print("Çıkış yapma hatası: \(signOutError.localizedDescription)")
            }
        }
    }
    

