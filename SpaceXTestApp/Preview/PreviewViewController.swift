//
//  PreviewViewController.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 26.05.2024.
//

import UIKit
import TinyConstraints

protocol PreviewViewProtocol: AnyObject {
    func prepareRocketData(data: [Rocket]?) -> [RocketInfoViewController]
    func showRocketInfo(data: [RocketInfoViewController])
}

final class PreviewViewController: UIViewController {
    
    //MARK: - Public properties
    
    var presenter: PreviewPresenterProtocol?
    
    //MARK: - Private properties
    
    private var rockets: [Rocket] = []
    
    //MARK: - LifeCycler
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

}

extension PreviewViewController: PreviewViewProtocol {
    
    func prepareRocketData(data: [Rocket]?) -> [RocketInfoViewController] {
        var rocketsInfo = [RocketInfoViewController]()
        guard let data else { return [] }
        data.forEach { rocket in
            rocketsInfo.append(RocketInfoModuleBuilder.build(rockets: rocket))
        }
        return rocketsInfo
    }
    
    func showRocketInfo(data: [RocketInfoViewController]) {
        let shortInfoPageViewContainer = UIView()
        let rocketInfoPageVC = RocketInfoPageViewController(rockets: data,
                                                            transitionStyle: .scroll,
                                                            navigationOrientation: .horizontal)
        self.addChild(rocketInfoPageVC)
        
        self.view.addSubview(shortInfoPageViewContainer)
        shortInfoPageViewContainer.addSubview(rocketInfoPageVC.view)
        shortInfoPageViewContainer.edgesToSuperview()
        rocketInfoPageVC.view.edgesToSuperview()
        rocketInfoPageVC.didMove(toParent: self)
    }
    
}


