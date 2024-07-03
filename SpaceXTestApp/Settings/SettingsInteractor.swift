//
//  SettingsInteractor.swift
//  Super easy dev
//
//  Created by Vladislav Avrutin on 03.07.2024
//

protocol SettingsInteractorProtocol: AnyObject {
}

class SettingsInteractor: SettingsInteractorProtocol {
    weak var presenter: SettingsPresenterProtocol?
}
