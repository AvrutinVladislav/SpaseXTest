//
//  RocketInfoRouter.swift
//  Super easy dev
//
//  Created by Vladislav Avrutin on 03.07.2024
//

import UIKit

protocol RocketInfoRouterProtocol {
    func openLaunchList(for launchList: [Launch])
    func settingsButtonDidTap()
}

class RocketInfoRouter: RocketInfoRouterProtocol {
    weak var viewController: RocketInfoViewController?
    
    func openLaunchList(for launchList: [Launch]) {
        let vc = LaunchListModuleBuilder.build(launchList: launchList)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func settingsButtonDidTap() {
        let vc = SettingsModuleBuilder.build()
        vc.delegate = viewController.self
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
