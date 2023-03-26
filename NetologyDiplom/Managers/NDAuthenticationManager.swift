//
//  NDAuthenticationManager.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 15.02.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

enum AuthResult {
    case success
    case failure(Error)
}

final class NDAuthenticationManager {
    static let shared = NDAuthenticationManager()
    
    let manager = Auth.auth()
    
    private init() {}
    
    func createUser(
        userLogin: String,
        userPassword: String,
        completion: @escaping (_ result: AuthResult) -> Void
    ) {

        Auth.auth().createUser(withEmail: userLogin, password: userPassword) { result, error in
                        
            if let error = error {
                completion(.failure(error))
            } else {
                guard let userId = result?.user.uid else { return }
                UserDefaults.standard.set(userId, forKey: "currentUserId")
                completion(.success)
            }
        }
    }
    
    func singInUser(
        userLogin: String,
        userPassword: String,
        completion: @escaping (_ result: AuthResult) -> Void
    ) {
        
        Auth.auth().signIn(withEmail: userLogin, password: userPassword) { result, error in
            
            if let error = error {
                completion(.failure(error))
            } else {
                guard let userId = result?.user.uid else { return }
                UserDefaults.standard.set(userId, forKey: "currentUserId")
                print(userId)
                completion(.success)
            }
        }
    }
}
