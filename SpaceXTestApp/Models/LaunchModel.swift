//
//  LaunchModel.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 26.05.2024.
//

import Foundation

struct Launch: Codable {
    let rocket: String
    let failures: [Failure]
    let name: String
    let dateLocal: String

    enum CodingKeys: String, CodingKey {
        case rocket
        case failures
        case name
        case dateLocal = "date_local"
    }
}

struct Failure: Codable {
    let time: Int
    let altitude: Int?
    let reason: String
}
