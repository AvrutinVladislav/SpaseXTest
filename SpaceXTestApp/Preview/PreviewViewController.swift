//
//  PreviewViewController.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 26.05.2024.
//

import UIKit
import TinyConstraints

class PreviewViewController: UIViewController {
    
    static var launchesURL = "https://api.spacexdata.com/v4/launches"
    static var rocketsURL = "https://api.spacexdata.com/v4/rockets"
    
    private let scrollView = UIScrollView()
    private let pageControll = UIPageControl(frame: CGRectMake(50, 300, 200, 20))

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


}

extension PreviewViewController {
    
    func setupUI() {
        scrollView.delegate = self
        pageControll.currentPage = 0
        pageControll.numberOfPages = 5 /* здезь поставить колличество страниц исходя из колличесва ракет из полученного массива */
        pageControll.currentPageIndicatorTintColor = .white
        pageControll.pageIndicatorTintColor = .lightGray
        
        view.addSubview(scrollView)
        view.addSubview(pageControll)
        
        scrollView.edgesToSuperview()
        pageControll.edgesToSuperview(excluding: .top, insets: .bottom(50))
    }
}

extension PreviewViewController: UIScrollViewDelegate {
    
}
