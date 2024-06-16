//
//  RocketInfoModel.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 26.05.2024.
//

import Foundation

struct Rocket: Codable, Identifiable {
    let id: String?
    let height: Dimension?
    let diameter: Dimension?
    let mass: Mass?
    let firstStage: FirstStage?
    let secondStage: SecondStage?
    let engines: Engines?
    let landingLegs: LandingLegs?
    let payloadWeights: [PayloadWeight]?
    let flickrImages: [String]?
    let name: String?
    let type: String?
    let active: Bool?
    let stages: Int?
    let boosters: Int?
    let costPerLaunch: Int?
    let successRatePct: Int?
    let firstFlight: String?
    let country: String?
    let company: String?
    let wikipedia: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case id, height, diameter, mass
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case engines
        case landingLegs = "landing_legs"
        case payloadWeights = "payload_weights"
        case flickrImages = "flickr_images"
        case name, type, active, stages, boosters
        case costPerLaunch = "cost_per_launch"
        case successRatePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case country, company, wikipedia, description
    }
}

struct Dimension: Codable {
    let meters: Double?
    let feet: Double?
}

struct Mass: Codable {
    let kg: Int?
    let lb: Int?
}

struct Thrust: Codable {
    let kN: Int?
    let lbf: Int?
}

struct FirstStage: Codable {
    let thrustSeaLevel: Thrust?
    let thrustVacuum: Thrust?
    let reusable: Bool?
    let engines: Int?
    let fuelAmountTons: Double?
    let burnTimeSec: Int?
    
    enum CodingKeys: String, CodingKey {
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSec = "burn_time_sec"
    }
}

struct SecondStage: Codable {
    let thrust: Thrust?
    let payloads: Payloads?
    let reusable: Bool?
    let engines: Int?
    let fuelAmountTons: Double?
    let burnTimeSec: Int?
    
    enum CodingKeys: String, CodingKey {
        case thrust, payloads, reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSec = "burn_time_sec"
    }
}

struct CompositeFairing: Codable {
    let height: Dimension?
    let diameter: Dimension?
}

struct Payloads: Codable {
    let compositeFairing: CompositeFairing?
    let option1: String?
    
    enum CodingKeys: String, CodingKey {
        case compositeFairing = "composite_fairing"
        case option1 = "option_1"
    }
}

struct Engines: Codable {
    let isp: ISP?
    let thrustSeaLevel: Thrust?
    let thrustVacuum: Thrust?
    let number: Int?
    let type: String?
    let version: String?
    let layout: String?
    let engineLossMax: Int?
    let propellant1: String?
    let propellant2: String?
    let thrustToWeight: Double?
    
    enum CodingKeys: String, CodingKey {
        case isp
        case thrustSeaLevel = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case number, type, version, layout
        case engineLossMax = "engine_loss_max"
        case propellant1 = "propellant_1"
        case propellant2 = "propellant_2"
        case thrustToWeight = "thrust_to_weight"
    }
}

struct ISP: Codable {
    let seaLevel: Int?
    let vacuum: Int?
    
    enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum
    }
}

struct LandingLegs: Codable {
    let number: Int?
    let material: String?
}

struct PayloadWeight: Codable {
    let id: String?
    let name: String?
    let kg: Int?
    let lb: Int?
}
