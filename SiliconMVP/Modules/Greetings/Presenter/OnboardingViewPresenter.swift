//
//  OnboardingViewPresenter.swift
//  SiliconMVP
//
//  Created by Егорио on 08.04.2025.
//

import Foundation

protocol OnboardingViewPresenterProtocol: AnyObject {
    func onStartButtonTapped()
    func onLoginButtonTapped()
}

class OnboardingViewPresenter: OnboardingViewPresenterProtocol {
    
    weak var view: (any OnboardingViewProtocol)?
    private let userService: UserServiceProtocol
    
    init(view: any OnboardingViewProtocol, userService: UserServiceProtocol = UserService.shared) {
        self.view = view
        self.userService = userService
    }
    
    func onStartButtonTapped() {
        // Создаем анонимного пользователя перед навигацией
        let _ = userService.createAnonymousUser()
        view?.navigateToMain()
    }
    
    func onLoginButtonTapped() {
        // Здесь будет логика показа экрана логина
        // Сейчас это заглушка с выводом в консоль
        view?.showLoginScreen()
    }
} 