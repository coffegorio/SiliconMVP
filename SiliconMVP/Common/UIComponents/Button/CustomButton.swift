//
//  CustomButton.swift
//  SiliconMVP
//
//  Created by Егорио on 07.04.2025.
//

import UIKit

class CustomButton: UIButton {
    
    var title: String
    var isFill: Bool
    
    init(title: String, isFill: Bool) {
        self.title = title
        self.isFill = isFill
        super.init(frame: .zero)
        setupUI()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if !isFill {
            self.layer.borderColor = UIColor(named: "TextColor")?.cgColor
        }
    }
    
    func setupUI() {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.manropeMedium(size: 16)
        self.setTitleColor(isFill ? UIColor(named: "BackgroundColor") : UIColor(named: "TextColor"), for: .normal)
        self.backgroundColor = isFill ? UIColor(named: "TextColor") : .clear
        
        // Устанавливаем границу
        self.layer.borderWidth = isFill ? 0 : 1
//        self.layer.borderColor = isFill ? nil : UIColor(named: "VividIndigo")?.cgColor
        
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
    
    func setupActions() {
        self.addTarget(self, action: #selector(buttonTapped), for: .touchDown)
        self.addTarget(self, action: #selector(buttonTapped), for: .touchDragEnter)
        self.addTarget(self, action: #selector(buttonReleased), for: .touchUpInside)
        self.addTarget(self, action: #selector(buttonReleased), for: .touchDragExit)
        self.addTarget(self, action: #selector(buttonReleased), for: .touchCancel)
    }
    
    @objc private func buttonTapped() {
        UIView.animate(withDuration: 0.2, animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        })
    }
    
    @objc private func buttonReleased() {
        UIView.animate(withDuration: 0.2, animations: {
            self.transform = .identity
        })
    }
}
