//
//  LoginValidation.swift
//  SiliconMVP
//
//  Created by AI Assistant.
//

import Foundation

enum ValidationError: Error {
    case emptyField
    case invalidEmail
    case passwordTooShort
    
    var message: String {
        switch self {
        case .emptyField:
            return "Поле не может быть пустым"
        case .invalidEmail:
            return "Неверный формат email"
        case .passwordTooShort:
            return "Пароль должен содержать минимум 6 символов"
        }
    }
}

protocol LoginValidatorProtocol {
    func validateEmail(_ email: String) -> Result<String, ValidationError>
    func validatePassword(_ password: String) -> Result<String, ValidationError>
}

class LoginValidator: LoginValidatorProtocol {
    
    func validateEmail(_ email: String) -> Result<String, ValidationError> {
        if email.isEmpty {
            return .failure(.emptyField)
        }
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        if !emailPredicate.evaluate(with: email) {
            return .failure(.invalidEmail)
        }
        
        return .success(email)
    }
    
    func validatePassword(_ password: String) -> Result<String, ValidationError> {
        if password.isEmpty {
            return .failure(.emptyField)
        }
        
        if password.count < 6 {
            return .failure(.passwordTooShort)
        }
        
        return .success(password)
    }
} 