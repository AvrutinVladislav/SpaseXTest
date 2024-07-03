//
//  LaunchListRouter.swift
//  Super easy dev
//
//  Created by Vladislav Avrutin on 03.07.2024
//

protocol LaunchListRouterProtocol {
    func backButtondidTap()
}

class LaunchListRouter: LaunchListRouterProtocol {
    weak var viewController: LaunchListViewController?
    
    func backButtondidTap() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
