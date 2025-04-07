//
//  Builder.swift
//  SiliconMVP
//
//  Created by Егорио on 04.04.2025.
//

import UIKit

protocol BaseViewProtocol: AnyObject {
    associatedtype PresenterType
    var presenter: PresenterType? { get set }
}

class Builder {
    
    static private func createView<View: UIViewController & BaseViewProtocol>(viewType: View.Type, presenter: (View) -> View.PresenterType) -> UIViewController {
        let view = View()
        let presenter = presenter(view)
        
        view.presenter = presenter
        return view
    }
    
    static func createGreetingsView() -> UIViewController {
        let view = createView(viewType: GreetingsView.self) { view in
            GreetingsViewPresenter(view: view)
        }
        let navigationController = UINavigationController(rootViewController: view)
        navigationController.navigationBar.isHidden = true
        return navigationController
    }
    
    static func createOnboardingView() -> UIViewController {
        let view = createView(viewType: OnboardingView.self) { view in
            OnboardingViewPresenter(view: view)
        }
        return view
    }
    
    static func createMainView() -> UIViewController {
        // TODO: Implement when Main module is created
        return UIViewController()
    }
}
