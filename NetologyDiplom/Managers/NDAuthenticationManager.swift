//
//  NDAuthenticationManager.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 15.02.2023.
//

import Foundation
import FirebaseAuth

enum AuthResult {
    case success
    case failure(Error)
}

enum AuthError {
    case notFilled
    case invalidEmail
    case unknownError
    case serverError
    //    case photoNotExist
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Не верный формат почты", comment: "")
        case .unknownError:
            /// we will use server_error key to display user internal error
            return NSLocalizedString("server_error", comment: "")
        case .serverError:
            return NSLocalizedString("server_error", comment: "")
            //        case .photoNotExist:
            //            return NSLocalizedString("Пользователь не выбрал фотографию", comment: "")
        }
    }
}

final class NDAuthenticationManager {
    static let shared = NDAuthenticationManager()
    private init() {}
    
    public func createUser(
        userLogin: String,
        userPassword: String,
        completion: @escaping (
            _ result: AuthResult) -> Void
    ) {
        guard !userLogin.isEmpty, !userPassword.isEmpty, userLogin != "", userPassword != "" else {
            completion(.failure(AuthError.notFilled))
            return
        }
        
        Auth.auth().createUser(withEmail: userLogin, password: userPassword) { result, error in
            
            //DO ERROR
            
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            
            completion(.success)
        }
    }
    
    public func singInUser(
        userLogin: String,
        userPassword: String,
        completion: @escaping (_ result: AuthResult) -> Void
    ) {
        
        guard !userLogin.isEmpty, !userPassword.isEmpty, userLogin != "", userPassword != "" else {
            completion(.failure(AuthError.notFilled))
            return
        }
        
        Auth.auth().signIn(withEmail: userLogin, password: userPassword) { result, error in
            
            // DO ERROR
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            
            completion(.success)
            
        }
    }
}
