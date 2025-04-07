//
//  GreetingsView.swift
//  SiliconMVP
//
//  Created by Егорио on 05.04.2025.
//

import UIKit
import SwiftUI

protocol GreetingsViewProtocol: BaseViewProtocol {
    func navigateToNextScreen()
}

class GreetingsView: UIViewController, GreetingsViewProtocol {
    
    typealias PresenterType = GreetingsViewPresenterProtocol
    var presenter: PresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        let contentView = GreetingsViewContent(onNext: { [weak self] in
            self?.presenter?.onNextButtonTapped()
        })
        let content = UIHostingController(rootView: contentView)
        addChild(content)
        content.view.frame = view.frame
        view.addSubview(content.view)
        content.didMove(toParent: self)
    }
    
    func navigateToNextScreen() {
        let onboardingView = Builder.createOnboardingView()
        navigationController?.pushViewController(onboardingView, animated: true)
    }
}
