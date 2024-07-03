//
//  PreviewPresenter.swift
//  Super easy dev
//
//  Created by Vladislav Avrutin on 02.07.2024
//
import Foundation

protocol PreviewPresenterProtocol: AnyObject {
    func viewDidLoad()
    func rocketsInfoDidLoad(rockets: [Rocket])
}

class PreviewPresenter {
    //MARK: - Public properties
    
    weak var view: PreviewViewProtocol?
    var router: PreviewRouterProtocol
    var interactor: PreviewInteractorProtocol
    
    //MARK: - Private properties
    
    private var rockets: [Rocket]?

    init(interactor: PreviewInteractorProtocol, router: PreviewRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension PreviewPresenter: PreviewPresenterProtocol {
    func viewDidLoad() {
        interactor.loadRocketInfo()
    }
    
    func rocketsInfoDidLoad(rockets: [Rocket]) {
        DispatchQueue.main.async { [weak self] in
            guard let self, let data = view?.prepareRocketData(data: rockets) else { return }
            view?.showRocketInfo(data: data)
        }
    }
}
