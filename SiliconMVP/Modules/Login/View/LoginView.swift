//
//  LoginView.swift
//  SiliconMVP
//
//  Created by AI Assistant.
//

import UIKit
import SwiftUI

protocol LoginViewProtocol: BaseViewProtocol {
    func showEmailError(_ message: String)
    func showPasswordError(_ message: String)
    func showGeneralError(_ message: String)
    func clearErrors()
    func showLoading(_ isLoading: Bool)
    func navigateToMain()
    func dismissView()
}

class LoginView: UIViewController, LoginViewProtocol {
    
    typealias PresenterType = LoginPresenterProtocol
    var presenter: PresenterType?
    
    // UI-состояния
    private var emailError: String?
    private var passwordError: String?
    private var isLoading: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        let contentView = LoginViewContent(
            emailError: emailError,
            passwordError: passwordError,
            isLoading: isLoading,
            onLoginTapped: { [weak self] email, password in
                self?.presenter?.validateAndLogin(email: email, password: password)
            },
            onBackTapped: { [weak self] in
                self?.presenter?.onBackButtonTapped()
            }
        )
        
        let content = UIHostingController(rootView: contentView)
        addChild(content)
        content.view.frame = view.frame
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }
    
    private func updateUI() {
        // Обновляем UI при изменении состояния
        let contentView = LoginViewContent(
            emailError: emailError,
            passwordError: passwordError,
            isLoading: isLoading,
            onLoginTapped: { [weak self] email, password in
                self?.presenter?.validateAndLogin(email: email, password: password)
            },
            onBackTapped: { [weak self] in
                self?.presenter?.onBackButtonTapped()
            }
        )
        
        if let contentController = children.first as? UIHostingController<LoginViewContent> {
            contentController.rootView = contentView
        }
    }
    
    // MARK: - LoginViewProtocol
    
    func showEmailError(_ message: String) {
        emailError = message
        updateUI()
    }
    
    func showPasswordError(_ message: String) {
        passwordError = message
        updateUI()
    }
    
    func showGeneralError(_ message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    func clearErrors() {
        emailError = nil
        passwordError = nil
        updateUI()
    }
    
    func showLoading(_ isLoading: Bool) {
        self.isLoading = isLoading
        updateUI()
    }
    
    func navigateToMain() {
        NotificationCenter.default.post(name: .windowManager, 
                                      object: nil, 
                                      userInfo: [String.windowInfo: WindowManager.main])
    }
    
    func dismissView() {
        dismiss(animated: true)
    }
} 