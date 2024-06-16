//
//  LaunchModel.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 26.05.2024.
//

import Foundation

struct Launch: Codable {
    let fairings: Fairings
    let links: Links
    let staticFireDateUTC: String
    let staticFireDateUnix: Int
    let net: Bool
    let window: Int
    let rocket: String
    let success: Bool
    let failures: [Failure]
    let crew, ships, capsules: [String]
    let payloads: [Payload]
    let launchpad: String
    let flightNumber: Int
    let name: String
    let dateUTC: String
    let dateUnix: Int
    let dateLocal: String
    let datePrecision: String
    let upcoming: Bool
    let cores: [Core]
    let autoUpdate, tbd: Bool
    let launchLibraryID: String?
    let id: String

    enum CodingKeys: String, CodingKey {
        case fairings, links
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
        case net, window, rocket, success, failures, crew, ships, capsules, payloads, launchpad
        case flightNumber = "flight_number"
        case name
        case dateUTC = "date_utc"
        case dateUnix = "date_unix"
        case dateLocal = "date_local"
        case datePrecision = "date_precision"
        case upcoming, cores
        case autoUpdate = "auto_update"
        case tbd
        case launchLibraryID = "launch_library_id"
        case id
    }
}

struct Fairings: Codable {
    let reused, recoveryAttempt, recovered: Bool
    let ships: [String]

    enum CodingKeys: String, CodingKey {
        case reused, recoveryAttempt = "recovery_attempt", recovered, ships
    }
}

struct Links: Codable {
    let patch: Patch
    let reddit: Reddit
    let flickr: Flickr
    let presskit: String?
    let webcast: String
    let youtubeID, article, wikipedia: String

    enum CodingKeys: String, CodingKey {
        case patch, reddit, flickr, presskit, webcast
        case youtubeID = "youtube_id"
        case article, wikipedia
    }
}

struct Flickr: Codable {
    let small, original: [String]
}

struct Patch: Codable {
    let small, large: String
}

struct Reddit: Codable {
    let campaign, launch, media, recovery: String?
}

struct Failure: Codable {
    let time: Int
    let altitude: Int?
    let reason, details: String
}

struct Payload: Codable {
    let id: String
}

struct Core: Codable {
    let core: String
    let flight: Int
    let gridfins, legs, reused, landingAttempt: Bool
    let landingSuccess, landingType, landpad: String?

    enum CodingKeys: String, CodingKey {
        case core, flight, gridfins, legs, reused
        case landingAttempt = "landing_attempt"
        case landingSuccess = "landing_success"
        case landingType = "landing_type"
        case landpad
    }
}
