//
//  UILabel+Extension.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 17.06.2024.
//

import UIKit

final class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomLabel {
    func setupLabel() {
        self.textColor = .white
        self.font = .systemFont(ofSize: 11, weight: .regular)
    }
}
