//
//  ShortInfoCollectionViewCell.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 26.05.2024.
//

import UIKit
import TinyConstraints

final class ShortInfoCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel = CustomLabel()
    private let valueLabel = CustomLabel()
    
    static let identifier = "infoCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(title: String, value: String) {
        titleLabel.text = title
        valueLabel.text = value
    }
}

private extension ShortInfoCollectionViewCell {
    
    func setupUI() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        
        contentView.backgroundColor = .launchListBackground
        contentView.layer.cornerRadius = 15
        
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(valueLabel)
    
        stackView.centerInSuperview()
        
    }
}
