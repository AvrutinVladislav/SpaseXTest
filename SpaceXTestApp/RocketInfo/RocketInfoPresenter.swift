//
//  RocketInfoPresenter.swift
//  Super easy dev
//
//  Created by Vladislav Avrutin on 03.07.2024
//

protocol RocketInfoPresenterProtocol: AnyObject {
    func viewDidLoad()
    func viewLaunchList(rocketId: String)
    func settingsButtonDidTap()
    func showBackgroundImages(data: [BackgroundImageViewController])
}

class RocketInfoPresenter {
    weak var view: RocketInfoViewProtocol?
    var router: RocketInfoRouterProtocol
    var interactor: RocketInfoInteractorProtocol

    init(interactor: RocketInfoInteractorProtocol, router: RocketInfoRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension RocketInfoPresenter: RocketInfoPresenterProtocol {
    func viewDidLoad() {
        interactor.loadLunchList()
        interactor.loadBackgroundImages(rocket: view?.rocketInfo)
    }
    
    func viewLaunchList(rocketId: String) {
        let launches = interactor.launchList.filter({$0.rocket == rocketId})
        router.openLaunchList(for: launches)
    }
    
    func settingsButtonDidTap() {
        router.settingsButtonDidTap()
    }
    
    func showBackgroundImages(data: [BackgroundImageViewController]) {
        view?.showBackgroundImages(data: data)
    }
}
