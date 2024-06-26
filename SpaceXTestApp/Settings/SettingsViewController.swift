//
//  SettingsViewController.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 24.06.2024.
//

import Foundation
import UIKit
import TinyConstraints

protocol SettingsViewControllerDelegate: AnyObject {
    func isMetricSystem(_ isMetricSystem: Bool, _ title: String)
}

final class SettingsViewController: CustomViewController {
    
    weak var delegate: SettingsViewControllerDelegate?
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
    }
}

extension SettingsViewController {
    func setupUI() {
        view.backgroundColor = .black
        tableView.backgroundColor = .black
        
        tableView.register(SettingMenuTableViewCell.self, forCellReuseIdentifier: SettingMenuTableViewCell.identifier)
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.edgesToSuperview(insets: .init(top: 25, left: 10, bottom: 10, right: 10), usingSafeArea: true)

    }
    
    func setupNavigationBar() {
        self.title = "Настройки"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.backgroundColor = .black
        navigationItem.setHidesBackButton(true, animated: false)
        
        let button = UIButton()
        button.setTitle("Закрыть", for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(closeButtonDidTap), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func closeButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Titles.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let title = Titles.getTitle(at: indexPath.row),
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingMenuTableViewCell.identifier, for: indexPath) as? SettingMenuTableViewCell
        else { return UITableViewCell()}
        switch title {
        case .height:
            cell.configure(title: title.title, firstButtonTitle: " м", secondButtonTitle: " ft")
            cell.delegate = self
            return cell
        case .diameter:
            cell.configure(title: title.title, firstButtonTitle: " м", secondButtonTitle: " ft")
            cell.delegate = self
            return cell
        case .mass:
            cell.configure(title: title.title, firstButtonTitle: " кг", secondButtonTitle: " lb")
            cell.delegate = self
            return cell
        case .payloadWeights:
            cell.configure(title: title.title, firstButtonTitle: " кг", secondButtonTitle: " lb")
            cell.delegate = self
            return cell
        }
    }
}

extension SettingsViewController: SettingMenuTableViewCellDelegate {
    func isInFeets(_ isMetricSystem: Bool, _ title: String) {
        delegate?.isMetricSystem(isMetricSystem, title)
    }
}
