//
//  PreviewViewController.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 26.05.2024.
//

import UIKit
import TinyConstraints

final class PreviewViewController: UIViewController {
    
    private var launchesURL = "https://api.spacexdata.com/v4/launches"
    private var rocketsURL = "https://api.spacexdata.com/v4/rockets"
    
    private var rockets: [Rocket] = []
    private var launchModel: Launch?
    private var pageControllRockets = [RocketInfoViewController]()
    
    private let pageControll = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let pageViewContainer = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRocketInfo()
        setupUI()
    }

}

extension PreviewViewController {
    
    func setupUI() {
        let startImageView = UIImageView(image: UIImage(resource: .prepareStart))
        startImageView.size(CGSize(width: view.frame.width, height: view.frame.height))
        startImageView.contentMode = .scaleToFill        
        
        view.insertSubview(startImageView, at: 0)
        view.addSubview(pageViewContainer)
        pageViewContainer.addSubview(pageControll.view)
        
        pageViewContainer.edgesToSuperview(insets: .top(view.frame.height * 0.4))
        pageControll.view.edgesToSuperview()
    }
    
    func loadRocketInfo() {
        guard let url = URL(string: rocketsURL) else { return }
        URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            guard let data else {
                print("Error: failure data from hourly response")
                return
            }
            DispatchQueue.main.async {
                do {
                    let jsonData = try JSONDecoder().decode([Rocket].self, from: data)
                    self?.rockets = jsonData
                    self?.rockets.forEach { rocket in
                        self?.pageControllRockets.append(RocketInfoViewController(rocket: rocket))
                    }
                } catch let error {
                    print("Error decoding hourly weather JSON: \(error)")
                }
            }
        }
        .resume()
    }
}


