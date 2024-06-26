//
//  LaunchListViewController.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 20.06.2024.
//

import Foundation
import UIKit
import TinyConstraints

final class LaunchListViewController: CustomViewController {
    
    private let tableView = UITableView()
    private var launchList: [Launch] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupUI()
    }
    
    init(launchList: [Launch]) {
        super.init(nibName: nil, bundle: nil)
        self.launchList = launchList
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LaunchListViewController {
    
    func setupUI() {
        view.backgroundColor = .black
        tableView.backgroundColor = .black
        tableView.dataSource = self
        tableView.register(LaunchListTableViewCell.self, forCellReuseIdentifier: LaunchListTableViewCell.identifier)
        
        view.addSubview(tableView)
        
        tableView.edgesToSuperview(usingSafeArea: true)
    }
    
    func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.title = "Список запусков"
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.setTitle("Назад", for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(onBackButtonDidTap), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = barButton
    }
    
    @objc func onBackButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}

extension LaunchListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LaunchListTableViewCell.identifier, for: indexPath) as? LaunchListTableViewCell
        else { return UITableViewCell() }
        cell.configure(model: launchList[indexPath.row])
        return cell
    }
}
