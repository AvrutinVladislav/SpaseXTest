//
//  PageViewController.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 17.06.2024.
//

import UIKit

final class PageViewController: UIPageViewController {
    
    private lazy var rocketsPageController: [RocketInfoViewController] = {
        var vc = [RocketInfoViewController]()
        return vc
    }()
}

extension PreviewViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? RocketInfoViewController else { return nil }
        if let index = pageControllRockets.firstIndex(of: vc) {
            if index > 0 {
                return pageControllRockets[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? RocketInfoViewController else { return nil }
        if let index = pageControllRockets.firstIndex(of: vc) {
            if index < pageControllRockets.count - 1 {
                return pageControllRockets[index + 1]
            }
        }
        return nil
    }
    
}

extension PageViewController: UIPageViewControllerDelegate {
    
}
