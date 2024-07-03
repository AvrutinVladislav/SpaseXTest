//
//  LaunchListPresenter.swift
//  Super easy dev
//
//  Created by Vladislav Avrutin on 03.07.2024
//

protocol LaunchListPresenterProtocol: AnyObject {
    func backButtonDidTap()
}

class LaunchListPresenter {
    weak var view: LaunchListViewProtocol?
    var router: LaunchListRouterProtocol
    var interactor: LaunchListInteractorProtocol

    init(interactor: LaunchListInteractorProtocol, router: LaunchListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension LaunchListPresenter: LaunchListPresenterProtocol {
    func backButtonDidTap() {
        router.backButtondidTap()
    }
}
