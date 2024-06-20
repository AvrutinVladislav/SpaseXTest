//
//  ShortRocketInfoModel.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 16.06.2024.
//

import Foundation

struct ShortRocketInfoModel: Codable, Identifiable {
    let id: String?
    let height: Dimension?
    let diameter: Dimension?
    let mass: Mass?
    let payloadWeights: [PayloadWeight]? /*for name "leo"*/
    
    enum CodingKeys: String, CodingKey {
        case id, height, diameter, mass
        case payloadWeights = "payload_weights"
    }
}

enum Titles: Codable, CaseIterable {
    case height
    case diameter
    case mass
    case payloadWeights
    
    var title: String {
        switch self {
        case .height:
            return "Высота"
        case .diameter:
            return "Диаметр"
        case .mass:
            return "Масса"
        case .payloadWeights:
            return "Полезная нагрузка"
        }
    }
}
