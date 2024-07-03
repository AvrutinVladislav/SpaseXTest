//
//  SettingsPresenter.swift
//  Super easy dev
//
//  Created by Vladislav Avrutin on 03.07.2024
//

protocol SettingsPresenterProtocol: AnyObject {
}

class SettingsPresenter {
    weak var view: SettingsViewControllerDelegate?
    var router: SettingsRouterProtocol
    var interactor: SettingsInteractorProtocol

    init(interactor: SettingsInteractorProtocol, router: SettingsRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension SettingsPresenter: SettingsPresenterProtocol {
}
