//
//  PreviewViewController.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 26.05.2024.
//

import UIKit
import TinyConstraints

final class PreviewViewController: UIViewController {
    
    private var rocketsURL = "https://api.spacexdata.com/v4/rockets"
    
    private var rockets: [Rocket] = []
    private var rocketsInfo = [RocketInfoViewController]()
    private let shortInfoPageViewContainer = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRocketInfo()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.setupUI()
        }
    }

}

extension PreviewViewController {
    
    func setupUI() {
        
        let rocketInfoPageVC = RocketInfoPageViewController(rockets: rocketsInfo,
                                                            transitionStyle: .scroll,
                                                            navigationOrientation: .horizontal)
        addChild(rocketInfoPageVC)
        
        view.addSubview(shortInfoPageViewContainer)
        shortInfoPageViewContainer.addSubview(rocketInfoPageVC.view)
        shortInfoPageViewContainer.edgesToSuperview()
        rocketInfoPageVC.view.edgesToSuperview()
        rocketInfoPageVC.didMove(toParent: self)
    }
    
    func loadRocketInfo() {
        guard let url = URL(string: rocketsURL) else { return }
        URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            guard let data else {
                print("Error: failure data from rockets info response")
                return
            }
            DispatchQueue.main.async {
                do {
                    self?.rockets = try JSONDecoder().decode([Rocket].self, from: data)
                    self?.rockets.forEach { rocket in
                        self?.rocketsInfo.append(RocketInfoViewController(rocket: rocket))
                    }
                } catch let error {
                    print("Error decoding rockets info JSON: \(error)")
                }
            }
        }
        .resume()
    }
    
}


