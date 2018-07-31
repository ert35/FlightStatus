//
//  LoginViewController.swift
//  FlightStatus
//
//  Created by Elaina Teramoto on 7/29/18.
//  Copyright © 2018 Elaina Teramoto. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        print("This is the login view controller")
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        print("login button tapped")
        
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        // 2
        authUI.delegate = self
        
        // 3
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        // 1
        guard let user = authDataResult?.user
            else { return }
        
        // 2
        let userRef = Database.database().reference().child("users").child(user.uid)
        
        // 3
//        //self.performSegue(withIdentifier: "toCreateUsername", sender: self)
//        userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
//            if let user = User(snapshot: snapshot) {
//                print("Welcome back, \(user.username).")
//            } else {
//                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
//            }
//        })
        
       
        
        userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
            if let user = User(snapshot: snapshot) {
                User.setCurrent(user)
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                
                if let initialViewController = storyboard.instantiateInitialViewController() {
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()
                }
            } else {
                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
            }
        })
        print("handle user signup / login")
        
    }
    
    
    
    
}
