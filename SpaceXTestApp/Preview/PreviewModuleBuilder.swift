//
//  PreviewModuleBuilder.swift
//  Super easy dev
//
//  Created by Vladislav Avrutin on 02.07.2024
//

import UIKit

class PreviewModuleBuilder {
    static func build() -> PreviewViewController {
        let interactor = PreviewInteractor()
        let router = PreviewRouter()
        let presenter = PreviewPresenter(interactor: interactor, router: router)
        let viewController = PreviewViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
