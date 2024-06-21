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
    private var pageControllRockets = [RocketInfoViewController]()
    private let pageViewContainer = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRocketInfo()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.setupUI()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageViewContainer.roundCorners(corners: [.topLeft, .topRight], radius: 25)
    }

}

extension PreviewViewController {
    
    func setupUI() {
        let startImageView = UIImageView(image: UIImage(resource: .prepareStart))
        startImageView.size(CGSize(width: view.frame.width, height: view.frame.height))
        startImageView.contentMode = .scaleToFill
        
        let pageVC = PageViewController(rockets: pageControllRockets, transitionStyle: .scroll, navigationOrientation: .horizontal)
        addChild(pageVC)
        
        view.insertSubview(startImageView, at: 0)
        view.addSubview(pageViewContainer)
        pageViewContainer.addSubview(pageVC.view)
        
        pageViewContainer.edgesToSuperview(insets: .top(view.frame.height * 0.4))
        pageVC.view.edgesToSuperview()
        pageVC.didMove(toParent: self)
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
                        self?.pageControllRockets.append(RocketInfoViewController(rocket: rocket))
                    }
                } catch let error {
                    print("Error decoding rockets info JSON: \(error)")
                }
            }
        }
        .resume()
    }
}


