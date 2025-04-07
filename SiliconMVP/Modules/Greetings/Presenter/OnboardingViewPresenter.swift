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
    
    init(view: any OnboardingViewProtocol) {
        self.view = view
    }
    
    func onStartButtonTapped() {
        view?.navigateToMain()
    }
    
    func onLoginButtonTapped() {
        view?.showLoginScreen()
    }
} 
