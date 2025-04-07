//
//  OnboardingView.swift
//  SiliconMVP
//
//  Created by Егорио on 08.04.2025.
//

import UIKit
import SwiftUI

protocol OnboardingViewProtocol: BaseViewProtocol {
    func navigateToMain()
    func showLoginScreen()
}

class OnboardingView: UIViewController, OnboardingViewProtocol {
    
    typealias PresenterType = OnboardingViewPresenterProtocol
    var presenter: PresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        let contentView = OnboardingViewContent(
            onLogin: { [weak self] in
                self?.presenter?.onLoginButtonTapped()
            }
        )
        let content = UIHostingController(rootView: contentView)
        addChild(content)
        content.view.frame = view.frame
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }
    
    func navigateToMain() {
        NotificationCenter.default.post(name: .windowManager, 
                                      object: nil, 
                                      userInfo: [String.windowInfo: WindowManager.main])
    }
    
    func showLoginScreen() {
        let loginVC = Builder.createLoginView()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
    }
} 
