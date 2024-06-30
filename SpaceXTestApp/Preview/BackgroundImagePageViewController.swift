//
//  BackgroundImagePageViewController.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 30.06.2024.
//

import UIKit

final class BackgroundImagePageViewController: UIPageViewController {
    
    private var imagesArray: [BackgroundImageViewController] = []
    
    init(images: [BackgroundImageViewController], transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        self.imagesArray = images
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        if let firstPage = imagesArray.first {
            setViewControllers([firstPage], direction: .forward, animated: true)
        }
    }
}

extension BackgroundImagePageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? BackgroundImageViewController else { return nil }
        if let index = imagesArray.firstIndex(of: vc) {
            if index > 0 {
                return imagesArray[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? BackgroundImageViewController else { return nil }
        if let index = imagesArray.firstIndex(of: vc) {
            if index < imagesArray.count - 1 {
                return imagesArray[index + 1]
            }
        }
        return nil
    }
    
}
