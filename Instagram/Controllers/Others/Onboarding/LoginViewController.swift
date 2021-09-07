//
//  LoginViewController.swift
//  Instagram
//
//  Created by Sivaranjani Venkatesh on 11/5/21.
//  Copyright © 2021 Sivaranjani Venkatesh. All rights reserved.
//
import SafariServices
import UIKit

class LoginViewController: UIViewController {

    struct Constants{
        static let cornerRadius:CGFloat = 8.0
        
    }
    private let userNameTextField:UITextField = {
        let field = UITextField()
        field.placeholder = "UserName or Email ..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.borderWidth = 1.0
        field.layer.backgroundColor = UIColor.black.cgColor
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = UIColor(red: 28.0, green: 28.0, blue: 30.0, alpha: 1.0)
        return field
    }()
    
    private let passwordTextField:UITextField = {
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
        field.layer.backgroundColor = UIColor.black.cgColor
        field.backgroundColor = UIColor(red: 28.0,green: 28.0, blue: 30.0, alpha: 1.0)
        return field
    }()
    private let loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = #colorLiteral(red: 0.2026806693, green: 0.5183646001, blue: 0.9466211929, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        return button
        
    }()
    private let termsButton:UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        return button
    }()
     private let privacyButton:UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        return button
    }()
    private let createAccountButton:UIButton = {
        let button = UIButton()
        button.setTitle("New User? Create an Account", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
        
    }()
    private let headerView:UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView  = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        termsButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        addSubViews()
        view.backgroundColor = .white
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //set frames
        
        headerView.frame = CGRect(x: 0, y: 0.0
            , width: view.width, height: view.height/3.0)
        userNameTextField.frame = CGRect(x: 25, y: headerView.bottom+10
            , width: view.width-50, height: 52.0)
        passwordTextField.frame = CGRect(x: 25, y: userNameTextField.bottom+10
            , width: view.width-50, height: 52.0)
        loginButton.frame = CGRect(x: 25, y: passwordTextField.bottom+10
            , width: view.width-50, height: 52.0)
        createAccountButton.frame = CGRect(x: 25, y: loginButton.bottom+10
            , width: view.width-50, height: 52.0)
        termsButton.frame = CGRect(x: 10, y: view.height-view.safeAreaInsets.bottom-100, width: view.width-20 , height: 50)
        privacyButton.frame = CGRect(x: 10, y: view.height - view.safeAreaInsets.bottom-50, width: view.width-20, height: 50)
        configuredHeaderView()
    
    }
    private func configuredHeaderView(){
        guard headerView.subviews.count == 1 else{
            return
        }
        guard let backgroundView = headerView.subviews.first  else {
            return
        }
        backgroundView.frame  =  headerView.bounds
        
        // set logo
        let imageView = UIImageView(image:UIImage(named: "logo"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4.0, y: view.safeAreaInsets.top, width: headerView.width/2.0, height: headerView.height - view.safeAreaInsets.top)
    }
    private func addSubViews(){
        view.addSubview(userNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(createAccountButton)
        view.addSubview(privacyButton)
        view.addSubview(headerView)


        
    }
    @objc private func didTapLoginButton(){
        
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        guard let userNameEmail = userNameTextField.text, !userNameEmail.isEmpty,
        let passWord = passwordTextField.text, !passWord.isEmpty, passWord.count >= 8 else {
            return
        }
        
        // login functionality
        var email:String?
        var userName: String?
        if userNameEmail.contains("@"), userNameEmail.contains(".") {
            //email
            email = userNameEmail
        }
        else
        {
            //username
            userName = userNameEmail
        }
        
        AuthManager.shared.loginUser(userName: userName,email: email,password: passWord) { success in
            DispatchQueue.main.async {
                if success {
                    // user logged in
                   self.dismiss(animated: true, completion: nil)
                }
                else {
                    // error occured
                    
                    let alert = UIAlertController(title: "Login error", message: "We are unable to log you in", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    self.present(alert, animated:true)
                }
            }
            }
            
    }
    @objc private func didTapTermsButton(){
        
        guard  let url = URL(string: "https://www.instagram.com/about/legal/terms/before-january-19-2013/") else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    @objc private func didTapPrivacyButton(){
        guard  let url = URL(string: "https://help.instagram.com/519522125107875") else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
    @objc private func didTapCreateAccountButton(){
        let vc = RegistrationViewController()
        vc.title = "Create Account"
        present(UINavigationController(rootViewController: vc) , animated:true)
        
    }
}
    extension LoginViewController: UITextFieldDelegate {
        func textFieldShouldReturn( _ textField:UITextField ) -> Bool {
            
            if textField == userNameTextField {
             passwordTextField.becomeFirstResponder()
            }
            else if textField == passwordTextField {
              didTapLoginButton()
            }
                
            return true
            
        }
        
        
    }


