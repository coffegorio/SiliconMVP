//
//  SceneDelegate.swift
//  SiliconMVP
//
//  Created by Егорио on 01.04.2025.
//

import UIKit

enum WindowManager {
    case greetings, onboarding, main
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        NotificationCenter.default.addObserver(self, selector: #selector(windowManager), name: .windowManager, object: nil)
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = PreviewView()
        self.window?.makeKeyAndVisible()
        
    }
    
    @objc func windowManager(notification: Notification) {
        
        guard let userInfo = notification.userInfo as? [String: WindowManager] else { return }
        guard let window = userInfo[.windowInfo] else { return }
                
        let viewController: UIViewController
        switch window {
        case .greetings:
            viewController = Builder.createGreetingsView()
        case .onboarding:
            viewController = Builder.createOnboardingView()
        case .main:
            viewController = Builder.createMainView()
        }
        
        UIView.transition(with: self.window!,
                         duration: 0.3,
                         options: .transitionCrossDissolve,
                         animations: {
            self.window?.rootViewController = viewController
        })
    }
}

