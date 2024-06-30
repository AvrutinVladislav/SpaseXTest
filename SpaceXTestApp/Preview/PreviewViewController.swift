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
    private var backgroundImages = [BackgroundImageViewController]()
    private let shortInfoPageViewContainer = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRocketInfo()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.setupUI()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        shortInfoPageViewContainer.roundCorners(corners: [.topLeft, .topRight], radius: 25)
    }

}

extension PreviewViewController {
    
    func setupUI() {
        let backgroundImagePageViewContainer = UIView()
        
        let rocketInfoPageVC = RocketInfoPageViewController(rockets: rocketsInfo,
                                                            transitionStyle: .scroll,
                                                            navigationOrientation: .horizontal)
        addChild(rocketInfoPageVC)
        
        let backgroundImagePageVC = BackgroundImagePageViewController(images: backgroundImages.reversed(),
                                                                      transitionStyle: .scroll,
                                                                      navigationOrientation: .horizontal)
        addChild(backgroundImagePageVC)
        
        view.addSubview(backgroundImagePageViewContainer)
        view.addSubview(shortInfoPageViewContainer)
        shortInfoPageViewContainer.addSubview(rocketInfoPageVC.view)
        backgroundImagePageViewContainer.addSubview(backgroundImagePageVC.view)
        
        backgroundImagePageViewContainer.edgesToSuperview(insets: .bottom(view.frame.height * 0.55))
        shortInfoPageViewContainer.edgesToSuperview(insets: .top(view.frame.height * 0.4))
        rocketInfoPageVC.view.edgesToSuperview()
        rocketInfoPageVC.didMove(toParent: self)
        backgroundImagePageVC.view.edgesToSuperview()
        backgroundImagePageVC.didMove(toParent: self)
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
                    let jsonData = try JSONDecoder().decode([Rocket].self, from: data)
                    self?.rockets = jsonData
                    self?.rockets.forEach { rocket in
                        self?.rocketsInfo.append(RocketInfoViewController(rocket: rocket))
                        rocket.flickrImages?.forEach { imageURL in
                            self?.downloadImage(from: imageURL)
                        }
                    }
                } catch let error {
                    print("Error decoding rockets info JSON: \(error)")
                }
            }
        }
        .resume()
    }
    
    func downloadImage(from url: String) {
        if let url = URL(string: url) {
            let task = URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
                DispatchQueue.main.async {
                    self?.backgroundImages.append(BackgroundImageViewController(imageData: data))
                }
            }
            task.resume()
        }
    }
    
}


