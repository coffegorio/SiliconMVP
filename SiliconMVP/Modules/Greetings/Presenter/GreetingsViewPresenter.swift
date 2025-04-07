//
//  GreetingsViewPresenter.swift
//  SiliconMVP
//
//  Created by Егорио on 05.04.2025.
//

import Foundation

protocol GreetingsViewPresenterProtocol: AnyObject {
    func onNextButtonTapped()
}

class GreetingsViewPresenter: GreetingsViewPresenterProtocol {
    
    weak var view: (any GreetingsViewProtocol)?
    
    init(view: any GreetingsViewProtocol) {
        self.view = view
    }
    
    func onNextButtonTapped() {
        // Здесь может быть любая бизнес-логика перед навигацией
        // Например, сохранение состояния, аналитика, и т.д.
        view?.navigateToNextScreen()
    }
}
