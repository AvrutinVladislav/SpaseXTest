//
//  PageViewController.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 17.06.2024.
//

import UIKit

final class PageViewController: UIPageViewController {
    
    private var arrayRockets: [RocketInfoViewController] = []
    
    init(rockets: [RocketInfoViewController], transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        self.arrayRockets = rockets
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        if let firstPage = arrayRockets.first {
            setViewControllers([firstPage], direction: .forward, animated: true)
        }
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? RocketInfoViewController else { return nil }
        if let index = arrayRockets.firstIndex(of: vc) {
            if index > 0 {
                return arrayRockets[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? RocketInfoViewController else { return nil }
        if let index = arrayRockets.firstIndex(of: vc) {
            if index < arrayRockets.count - 1 {
                return arrayRockets[index + 1]
            }
        }
        return nil
    }
    
}
