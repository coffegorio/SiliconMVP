//
//  LoginPresenter.swift
//  SiliconMVP
//
//  Created by AI Assistant.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    func validateAndLogin(email: String, password: String)
    func onBackButtonTapped()
}

class LoginPresenter: LoginPresenterProtocol {
    
    weak var view: (any LoginViewProtocol)?
    private let validator: LoginValidatorProtocol
    private let userService: UserServiceProtocol
    
    init(view: any LoginViewProtocol, 
         validator: LoginValidatorProtocol = LoginValidator(),
         userService: UserServiceProtocol = UserService.shared) {
        self.view = view
        self.validator = validator
        self.userService = userService
    }
    
    func validateAndLogin(email: String, password: String) {
        // Сбрасываем ошибки перед валидацией
        view?.clearErrors()
        
        // Валидируем email
        let emailResult = validator.validateEmail(email)
        switch emailResult {
        case .failure(let error):
            view?.showEmailError(error.message)
            return
        case .success:
            break
        }
        
        // Валидируем пароль
        let passwordResult = validator.validatePassword(password)
        switch passwordResult {
        case .failure(let error):
            view?.showPasswordError(error.message)
            return
        case .success:
            break
        }
        
        // Если валидация прошла успешно, выполняем вход
        view?.showLoading(true)
        
        userService.loginUser(email: email, password: password) { [weak self] result in
            self?.view?.showLoading(false)
            
            switch result {
            case .success(let user):
                self?.view?.navigateToMain()
            case .failure(let error):
                self?.view?.showGeneralError(error.localizedDescription)
            }
        }
    }
    
    func onBackButtonTapped() {
        view?.dismissView()
    }
} 