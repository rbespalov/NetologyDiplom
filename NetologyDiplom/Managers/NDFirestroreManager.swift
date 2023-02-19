//
//  NDFirestroreManager.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 18.02.2023.
//

import Foundation
import FirebaseFirestore

enum fireStoreError: Error {
    case emptyError
    case emptyError2
}

final class NDFirestroreManager {
    
    static let shared = NDFirestroreManager()
    private init() {}
    
    private let db = Firestore.firestore()
    
    public func createUser(userLogin: String, password: String, userName: String) {
        let docRef = db.document("users/\(userLogin)")
        docRef.setData(["login" : userLogin, "password" : password, "name" : userName])
    }
    
    public func getCurrentUser(userLogin: String) {
                
        
        let docRef = db.document("users/\(userLogin)")
        docRef.getDocument { snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            guard let login = data["login"] as? String else {
                return
            }
            
            guard let name = data["name"] as? String else {
                return
            }
            
            NDUserManager.shared.currentUser = .init(nickName: name, login: login)
        }
    }
    
    public func setDataForUser (userLogin: String, dataType: String, dataValue: String) {
        let docRef = db.document("users/\(userLogin)")
        docRef.setData([dataType : dataValue], merge: true)
    }
    
    public func getUserData (userLogin: String, dataType: String, completion: @escaping (Result<String, Error>) -> Void) {
        let docRef = db.document("users/\(userLogin)")
        docRef.getDocument { snapShot, error in
            guard let data = snapShot?.data() else {
               return completion(.failure(fireStoreError.emptyError))
            }
            
            guard let value = data[dataType] as? String else {
                return completion(.failure(fireStoreError.emptyError2))
            }
            
            return completion(.success(value))
            
        }
        
        
    }
}
