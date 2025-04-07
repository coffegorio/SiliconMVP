//
//  UserModel.swift
//  SiliconMVP
//
//  Created by AI Assistant.
//

import Foundation

struct User {
    var id: String
    var name: String?
    var email: String?
    var isAuthenticated: Bool
    
    init(id: String = UUID().uuidString, name: String? = nil, email: String? = nil, isAuthenticated: Bool = false) {
        self.id = id
        self.name = name
        self.email = email
        self.isAuthenticated = isAuthenticated
    }
}

protocol UserServiceProtocol {
    func createAnonymousUser() -> User
    func loginUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
}

class UserService: UserServiceProtocol {
    
    // Singleton для простоты использования
    static let shared = UserService()
    
    private init() {}
    
    func createAnonymousUser() -> User {
        // В реальном приложении здесь могла бы быть регистрация анонимного пользователя на сервере
        return User(isAuthenticated: false)
    }
    
    func loginUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        // В реальном приложении здесь была бы аутентификация на сервере
        // Сейчас просто эмулируем успешный вход для любых данных
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let user = User(name: "Тестовый пользователь", email: email, isAuthenticated: true)
            completion(.success(user))
        }
    }
} 