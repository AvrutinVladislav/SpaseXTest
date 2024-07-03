//
//  RocketInfoInteractor.swift
//  Super easy dev
//
//  Created by Vladislav Avrutin on 03.07.2024
//

protocol RocketInfoInteractorProtocol: AnyObject {
    var launchList: [Launch] { get }
    func loadLunchList() 
}

class RocketInfoInteractor: RocketInfoInteractorProtocol {
    weak var presenter: RocketInfoPresenterProtocol?
    
    private let rocketInfoService = RocketInfoService()
    var launchList: [Launch] = []
    
    func loadLunchList() {
        rocketInfoService.loadLaunchList { [weak self] launchList in
            self?.launchList = launchList
        }
    }
}
