//
//  AuthErrorCodeExtention.swift
//  NetologyDiplom
//
//  Created by Роман Беспалов on 18.03.2023.
//

import Foundation
import FirebaseAuth
import UIKit

extension AuthErrorCode.Code {
    var errorMessage: String {
        switch self {
        case .emailAlreadyInUse:
            return "Пользователь с указанной почтой уже зарегестрирован"
        case .userNotFound:
            return "Пользователь не найден"
        case .userDisabled:
            return "Ваш аккаунт заблокирован"
        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
            return "Пожалуйта введите корректный адрес почты"
        case .networkError:
            return "Ошибка соединения, повторите попытку"
        case .weakPassword:
            return "Пароль должен содержать минимум 6 символов"
        case .wrongPassword:
            return "Неверный пароль"
        default:
            return "Проверьте корректность ввода всех полей"
        }
    }
}
