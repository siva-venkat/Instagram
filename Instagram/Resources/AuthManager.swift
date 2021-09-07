//
//  AuthManager.swift
//  Instagram
//
//  Created by Sivaranjani Venkatesh on 16/5/21.
//  Copyright © 2021 Sivaranjani Venkatesh. All rights reserved.
//

import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    //Register new user
    public func registerNewUser(userName: String, email: String, password: String, co completion: @escaping (Bool) -> Void){
        /*
        - check if username available
        - check if email available
 */
        DatabaseManager.shared.canCreateNewUser(with: email, username: userName){ canCreate in
            if canCreate {
         /*
         - create account
         - insert account to database
         */
        Auth.auth().createUser(withEmail: email, password: password){ result,error in
            if error == nil, result != nil {
                // firebase auth can not create account
                completion(false)
                return
            }
            DatabaseManager.shared.insertNewUser(with: email, username: userName){ inserted in
                if inserted {
                    completion(true)
                    return
                }
                else{
                    completion(false)
                    return
                }
            }
              // insert in to database
            
            }
                
            }
            else {
            // if username and email does not exist
                completion(false)
            }
        }
        
    }
    public func loginUser(userName: String?, email: String?, password: String, completion:@escaping ( (Bool) -> Void )){
        if let email = email{
            Auth.auth().signIn(withEmail: email, password: password){authResult, error in
        guard  authResult != nil , error == nil else {
            completion(false)
            return
        }
            completion(true)
       }
    }
        

        else if let userName = userName{ 
            // user login
            print(userName)
            
        }
    }
}
