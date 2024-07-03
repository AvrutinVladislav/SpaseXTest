//
//  LaunchListInteractor.swift
//  Super easy dev
//
//  Created by Vladislav Avrutin on 03.07.2024
//

protocol LaunchListInteractorProtocol: AnyObject {
}

class LaunchListInteractor: LaunchListInteractorProtocol {
    weak var presenter: LaunchListPresenterProtocol?
}
