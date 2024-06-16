//
//  InfoDisplayTemplate.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 26.05.2024.
//

import UIKit
import TinyConstraints

final class InfoDisplayTemplateCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let valueLabel = UILabel()
    
    static let identifier = "infoCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension InfoDisplayTemplateCell {
    
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
