//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Sivaranjani Venkatesh on 16/5/21.
//  Copyright © 2021 Sivaranjani Venkatesh. All rights reserved.
//


import FirebaseDatabase

public class DatabaseManager{
    static let shared = DatabaseManager()
    /// check if username and email available
    /// - username and email is available
    /// -  parameters
    /// - email: string representing email
    private let database = Database.database().reference()
    
    
    public func canCreateNewUser(with email:String, username: String, completion: (Bool) -> Void ) {
        completion(true)
        
    }
    /// insert data to data base
    /// - username and email is available
    /// -  parameters
    /// - email: string representing email
    public func insertNewUser(with email: String, username:String, completion:@escaping(Bool) -> Void) {
        let key = email.safeDataBaseKey()
        print(key)
        
        
        database.child(key).setValue(["Username": username] ){ error, _ in
            if error == nil{
                // succeed
                completion(true)
                return
            }
            else {
                //failed
                completion(false)
                return
            }
        }
    }
}
