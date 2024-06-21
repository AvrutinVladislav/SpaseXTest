//
//  LaunchListTableViewCell.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 20.06.2024.
//

import Foundation
import UIKit
import TinyConstraints

final class LaunchListTableViewCell: UITableViewCell {
    
    static var identifier = "launchListCell"
    
    private let title = UILabel()
    private let launchDateLabel = UILabel()
//    private let iconImageView = UIImageView()
    private let successLaunch = UILabel()
    private let containerView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        containerView.clipsToBounds = true
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Launch) {
        title.text = model.name
        self.launchDateLabel.text = model.dateLocal
        if model.failures.isEmpty {
            successLaunch.text = "success"
        } else {
            successLaunch.text = "failer"
        }
    }
    
}

extension LaunchListTableViewCell {
    
    func setupUI() {
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .black
        
        containerView.backgroundColor = .launchListBackground
        containerView.layer.cornerRadius = 10
        
        for label in [title, launchDateLabel, successLaunch] {
            label.font = .systemFont(ofSize: 13, weight: .regular)
            label.textColor = .white
        }
        
        contentView.addSubview(containerView)
        containerView.addSubview(title)
        containerView.addSubview(launchDateLabel)
        containerView.addSubview(successLaunch)
        
        containerView.edgesToSuperview(usingSafeArea: true)
        
        title.topToSuperview(offset: 15)
        title.leadingToSuperview(offset: 10)
        
        launchDateLabel.topToBottom(of: title, offset: 5)
        launchDateLabel.leadingToSuperview(offset: 10)
        launchDateLabel.bottomToSuperview(offset: -15)
        
        successLaunch.trailingToSuperview(offset: 10)
        successLaunch.centerYToSuperview()
    }
    
}
