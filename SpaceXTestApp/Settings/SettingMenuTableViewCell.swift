//
//  SettingMenuTableViewCell.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 24.06.2024.
//

import Foundation
import UIKit
import TinyConstraints

protocol SettingMenuTableViewCellDelegate: AnyObject {
    func isInFeets(_ isMetricSystem: Bool, _ title: String)
}

final class SettingMenuTableViewCell: UITableViewCell {
    
    static let identifier = "settingsCell"
    
    weak var delegate: SettingMenuTableViewCellDelegate?
    
    private let firstStageButton = UIButton()
    private let secondStageButton = UIButton()
    private let titleLabel = CustomLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        firstStageButtonDidTap()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, firstButtonTitle: String, secondButtonTitle: String) {
        firstStageButton.setTitle(firstButtonTitle, for: .normal)
        secondStageButton.setTitle(secondButtonTitle, for: .normal)
        titleLabel.text = title
    }
}

extension SettingMenuTableViewCell {
    func setupUI() {
        
        contentView.backgroundColor = .black
        
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        firstStageButton.addTarget(self, action: #selector(firstStageButtonDidTap), for: .touchUpInside)
        firstStageButton.configuration = buttonConfig
        firstStageButton.size(CGSize(width: 50, height: 50))
        firstStageButton.tintColor = .white
        firstStageButton.setTitleColor(.black, for: .normal)

        secondStageButton.addTarget(self, action: #selector(secondStageButtonDidTap), for: .touchUpInside)
        secondStageButton.configuration = buttonConfig
        secondStageButton.size(CGSize(width: 50, height: 50))
        secondStageButton.tintColor = .launchListBackground
        secondStageButton.setTitleColor(.white, for: .normal)
        
        addSubview(titleLabel)
        addSubview(firstStageButton)
        addSubview(secondStageButton)
        
        titleLabel.edgesToSuperview(excluding: .trailing, insets: .init(top: 10, left: 10, bottom: -10, right: 0), usingSafeArea: true)
        firstStageButton.verticalToSuperview(insets: .vertical(10))
        firstStageButton.trailingToLeading(of: secondStageButton)
        secondStageButton.verticalToSuperview(insets: .vertical(10))
        secondStageButton.trailingToSuperview()
    }
    
    @objc func firstStageButtonDidTap() {
        firstStageButton.tintColor = .white
        firstStageButton.setTitleColor(.black, for: .normal)
        secondStageButton.tintColor = .launchListBackground
        secondStageButton.setTitleColor(.white, for: .normal)
        delegate?.isInFeets(true, titleLabel.text ?? "")
    }
    
    @objc func secondStageButtonDidTap() {
        secondStageButton.tintColor = .white
        secondStageButton.setTitleColor(.black, for: .normal)
        firstStageButton.tintColor = .launchListBackground
        firstStageButton.setTitleColor(.white, for: .normal)
        delegate?.isInFeets(false, titleLabel.text ?? "")
    }
    
}
