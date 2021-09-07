//
//  RegistrationViewController.swift
//  Instagram
//
//  Created by Sivaranjani Venkatesh on 11/5/21.
//  Copyright © 2021 Sivaranjani Venkatesh. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    struct Constants{
        static let cornerRadius:CGFloat = 8.0
        
    }
    
    private let userNameField:UITextField = {
        let field = UITextField()
        field.placeholder = "UserName ..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.borderWidth = 1.0
        field.layer.backgroundColor = UIColor.white.cgColor
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = UIColor(red: 28.0, green: 28.0, blue: 30.0, alpha: 1.0)
        return field
    }()
    
    private let emailField:UITextField = {
        let field = UITextField()
        field.placeholder = " Email Address ..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.borderWidth = 1.0
        field.layer.backgroundColor = UIColor.white.cgColor
        field.layer.cornerRadius = Constants.cornerRadius
        field.layer.shadowColor = UIColor.black.cgColor
        field.backgroundColor = UIColor(red: 28.0, green: 28.0, blue: 30.0, alpha: 1.0)
        return field
    }()
    
    private let passwordField:UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.layer.borderWidth = 1.0
        field.layer.backgroundColor = UIColor.white.cgColor
        field.backgroundColor = UIColor(red: 28.0,green: 28.0, blue: 30.0, alpha: 1.0)
        return field
    }()
    private let registerButton:UIButton = {
        let button = UIButton()
        button.setTitle("Sig Up", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor =  #colorLiteral(red: 0.4253749251, green: 0.9072312713, blue: 0.4338074327, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        return button
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
        userNameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        view.backgroundColor  = .white
        view.addSubview(userNameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(registerButton)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userNameField.frame = CGRect(x: 20, y: view.safeAreaInsets.top+100, width: view.width-40, height: 52)
        emailField.frame = CGRect(x: 20, y: userNameField.bottom+10, width: view.width-40, height: 52)
        passwordField.frame = CGRect(x: 20, y:  emailField.bottom+10, width: view.width-40, height: 52)
        registerButton.frame = CGRect(x: 20, y:  passwordField.bottom+10, width: view.width-40, height: 52)

    }
    @objc func didTapRegisterButton(){
        userNameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let userName = userNameField.text, !userName.isEmpty,
          let email = emailField.text, !email.isEmpty,
            let password = passwordField.text, !password.isEmpty else {
        return
            
    }
        AuthManager.shared.registerNewUser(userName: userName, email: email, password: password){ registered in
            if registered {
                //good to go
                
            }
            else{
                //failed
            }
            
        }
    }
}
    extension RegistrationViewController: UITextFieldDelegate {
        func textFieldShouldReturn( _ textField: UITextField) -> Bool{
            if textField == userNameField {
                userNameField.becomeFirstResponder()
            }
            else if textField == passwordField {
                passwordField.becomeFirstResponder()
                
            }
            else {
                didTapRegisterButton()
            }
            return true
            }
        
    }


