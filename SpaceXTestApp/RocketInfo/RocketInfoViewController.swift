//
//  RocketInfoViewController.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 25.05.2024.
//

import UIKit
import TinyConstraints

final class RocketInfoViewController: UIViewController {
    
    private let topImageView = UIImageView()
    private let containerView = UIView()
    private let containerScrollView = UIScrollView()
    private let contentTitleLabel = UILabel()
    private let settingsButton = UIButton()
    private let rocketInfoCollectionView = UICollectionView()
    private let firstStartLabel = UILabel()
    private let firstStartValueLabel = UILabel()
    private let firstStartCountryLabel = UILabel()
    private let firstStartCountryValueLabel = UILabel()
    private let startCostLabel = UILabel()
    private let startCostValueLabel = UILabel()
    private let firstStageTitleLabel = UILabel()
    private let firstStageNumberOfEnginesLabel = UILabel()
    private let firstStageNumberOfEnginesValueLabel = UILabel()
    private let firstStageAmountOfFuelLabel = UILabel()
    private let firstStageAmountOfFuelValueLabel = UILabel()
    private let firstStageCombustionTimeLabel = UILabel()
    private let firstStageCombustionTimeValueLabel = UILabel()
    private let secondStageTitleLabel = UILabel()
    private let secondStageNumberOfEnginesLabel = UILabel()
    private let secondStageNumberOfEnginesValueLabel = UILabel()
    private let secondStageAmountOfFuelLabel = UILabel()
    private let secondStageAmountOfFuelValueLabel = UILabel()
    private let secondStageCombustionTimeLabel = UILabel()
    private let secondStageCombustionTimeValueLabel = UILabel()
    private let viewStartsListButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

private extension RocketInfoViewController {
    
    func setupUI() {
        containerView.backgroundColor = .black
        
        configureView()
    }
    
    func configureView() {
        view.addSubview(topImageView)
        view.addSubview(containerView)
        containerView.addSubview(contentTitleLabel)
        containerView.addSubview(containerScrollView)
        containerView.addSubview(settingsButton)
        containerScrollView.addSubview(rocketInfoCollectionView)
        containerScrollView.addSubview(firstStartLabel)
        containerScrollView.addSubview(firstStartCountryLabel)
        containerScrollView.addSubview(startCostLabel)
        containerScrollView.addSubview(firstStageTitleLabel)
        containerScrollView.addSubview(firstStageNumberOfEnginesLabel)
        containerScrollView.addSubview(firstStageNumberOfEnginesValueLabel)
        containerScrollView.addSubview(firstStageAmountOfFuelLabel)
        containerScrollView.addSubview(firstStageAmountOfFuelValueLabel)
        containerScrollView.addSubview(firstStageCombustionTimeLabel)
        containerScrollView.addSubview(firstStageCombustionTimeValueLabel)
        containerScrollView.addSubview(secondStageTitleLabel)
        containerScrollView.addSubview(secondStageNumberOfEnginesLabel)
        containerScrollView.addSubview(secondStageNumberOfEnginesValueLabel)
        containerScrollView.addSubview(secondStageAmountOfFuelLabel)
        containerScrollView.addSubview(secondStageAmountOfFuelValueLabel)
        containerScrollView.addSubview(secondStageCombustionTimeLabel)
        containerScrollView.addSubview(secondStageCombustionTimeValueLabel)
        containerScrollView.addSubview(viewStartsListButton)
        
        topImageView.edgesToSuperview(excluding: .bottom)
        containerView.edgesToSuperview(excluding: .top, insets: .top(view.frame.height * 0.65))
        containerScrollView.edgesToSuperview(excluding: .top)
        containerScrollView.topToBottom(of: contentTitleLabel, offset: 15)
        
        
    }
    
}
