//
//  LaunchListModuleBuilder.swift
//  Super easy dev
//
//  Created by Vladislav Avrutin on 03.07.2024
//

import UIKit

class LaunchListModuleBuilder {
    static func build(launchList: [Launch]) -> LaunchListViewController {
        let interactor = LaunchListInteractor()
        let router = LaunchListRouter()
        let presenter = LaunchListPresenter(interactor: interactor, router: router)
        let viewController = LaunchListViewController(launchList: launchList)
        presenter.view = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
