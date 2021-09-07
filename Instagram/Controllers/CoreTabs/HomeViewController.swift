//
//  ViewController.swift
//  Instagram
//
//  Created by Sivaranjani Venkatesh on 11/5/21.
//  Copyright © 2021 Sivaranjani Venkatesh. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
        
        do {
           try  Auth.auth().signOut()
            
        }
        catch {
            print("Failed to sign out")
        }
        
    }
    private func handleNotAuthenticated(){
        // check Auth Status
        if Auth.auth().currentUser == nil {
            // show login
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC,animated: false)
            
            
        }
    }
}

