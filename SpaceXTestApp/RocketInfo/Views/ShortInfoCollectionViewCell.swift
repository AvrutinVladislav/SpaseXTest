//
//  ShortInfoCollectionViewCell.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 26.05.2024.
//

import UIKit
import TinyConstraints

final class ShortInfoCollectionViewCell: UICollectionViewCell {
    
    private let titleLabel = UILabel()
    private let valueLabel = UILabel()
    
    static let identifier = "infoCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(_ model: ShortInfoCollectionViewCellModel) {
        titleLabel.text = model.title.title
        valueLabel.text = model.value
    }
}

private extension ShortInfoCollectionViewCell {
    
    func setupUI() {
        addSubview(titleLabel)
        addSubview(valueLabel)
        
        for label in [titleLabel, valueLabel] {
            label.font = .systemFont(ofSize: 14, weight: .regular)
            label.textColor = .white
        }
        
        titleLabel.edgesToSuperview(excluding: .trailing, insets: .horizontal(16))
        valueLabel.edgesToSuperview(excluding: .leading, insets: .horizontal(16))
    }
}
