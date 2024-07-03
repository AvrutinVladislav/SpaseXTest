//
//  PreviewInteractor.swift
//  Super easy dev
//
//  Created by Vladislav Avrutin on 02.07.2024
//

import Foundation

protocol PreviewInteractorProtocol: AnyObject {
    func loadRocketInfo()
}

class PreviewInteractor: PreviewInteractorProtocol {
    //MARK: - Public properties
    weak var presenter: PreviewPresenterProtocol?
    
    //MARK: - Private properties
    private let rocketInfoService = RocketInfoService()
    
    func loadRocketInfo() {
        rocketInfoService.getRocketInfo { [weak self] rockets in
            self?.presenter?.rocketsInfoDidLoad(rockets: rockets)
        }
    }
}
