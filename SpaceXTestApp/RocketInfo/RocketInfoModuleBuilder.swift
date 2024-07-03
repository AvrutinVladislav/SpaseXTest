//
//  RocketInfoModuleBuilder.swift
//  Super easy dev
//
//  Created by Vladislav Avrutin on 03.07.2024
//

import UIKit

class RocketInfoModuleBuilder {
    static func build(rockets: Rocket) -> RocketInfoViewController {
        let interactor = RocketInfoInteractor()
        let router = RocketInfoRouter()
        let presenter = RocketInfoPresenter(interactor: interactor, router: router)
        let viewController = RocketInfoViewController(rocket: rockets)
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
