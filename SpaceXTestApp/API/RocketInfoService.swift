//
//  RocketInfoService.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 02.07.2024.
//

import Foundation

class RocketInfoService {
    private let rocketsURL = "https://api.spacexdata.com/v4/rockets"
    private let launchesURL = "https://api.spacexdata.com/v4/launches"
    
    func getRocketInfo(complition: @escaping([Rocket]) -> Void) {
        var rockets: [Rocket] = []
        guard let url = URL(string: rocketsURL) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data,
                  let decodeRockets = try? JSONDecoder().decode([Rocket].self, from: data)
            else {
                print("Error: failure data from rockets info response")
                return
            }
            rockets = decodeRockets
        }
        task.resume()
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 0.5) {
            complition(rockets)
        }
    }
    
    func loadLaunchList(complition: @escaping([Launch]) -> Void) {
        var launchList: [Launch] = []
        guard let url = URL(string: launchesURL) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                print("Error: failure data launch info response")
                return
            }
            DispatchQueue.main.async {
                do {
                    launchList = try JSONDecoder().decode([Launch].self, from: data)
                } catch let error {
                    print("Error decoding launch info JSON: \(error)")
                }
            }
        }
        .resume()
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 0.5) {
            complition(launchList)
        }
    }
    
    func downloadImage(rocket: Rocket, complition: @escaping ([BackgroundImageViewController]) -> Void) {
        var result: [BackgroundImageViewController] = []
        rocket.flickrImages?.forEach { imageURL in
            if let url = URL(string: imageURL) {
                let task = URLSession.shared.dataTask(with: url) {data, response, error in
                    if let data, error == nil {
                        DispatchQueue.main.async {
                            result.append(BackgroundImageViewController(imageData: data))
                        }
                    }
                }
                task.resume()
                DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 0.5) {
                    complition(result)
                }
            }
        }
    }
    
}
