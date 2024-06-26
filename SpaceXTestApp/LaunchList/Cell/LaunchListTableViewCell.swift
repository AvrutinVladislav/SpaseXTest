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
    
    private let title = CustomLabel()
    private let launchDateLabel = CustomLabel()
//    private let iconImageView = UIImageView()
    private let successLaunch = CustomLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Launch) {
        title.text = model.name
        launchDateLabel.text = formateDate(date: model.dateLocal)
        if model.failures.isEmpty {
            successLaunch.text = "success"
        } else {
            successLaunch.text = "failer"
        }
    }
    
}

extension LaunchListTableViewCell {
    
    func setupUI() {
        let containerView = UIView()
        
        contentView.backgroundColor = .black
        
        containerView.backgroundColor = .launchListBackground
        containerView.layer.cornerRadius = 10
        containerView.height(min: 60)
        
        contentView.addSubview(containerView)
        containerView.addSubview(title)
        containerView.addSubview(launchDateLabel)
        containerView.addSubview(successLaunch)
        
        containerView.edgesToSuperview(insets: .init(top: 5, left: 5, bottom: 5, right: 5))
        title.topToSuperview(offset: 10)
        title.leadingToSuperview(offset: 10)
        launchDateLabel.topToBottom(of: title, offset: 5)
        launchDateLabel.leadingToSuperview(offset: 10)
        successLaunch.trailingToSuperview(offset: 10)
        successLaunch.centerYToSuperview()
    }
    
    func formateDate(date: String) -> String {
        let inputDateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let outputDateFormat = "d MMMM, yyyy"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputDateFormat
        guard let dateFromParseString = dateFormatter.date(from: date) else { return date}
        dateFormatter.dateFormat = outputDateFormat
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: dateFromParseString)
    }
}
