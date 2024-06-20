//
//  RocketInfoViewController.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 25.05.2024.
//

import UIKit
import TinyConstraints

final class RocketInfoViewController: UIViewController {
    
    private let containerView = UIView()
    private let scrollView = UIScrollView()
    private let contentTitleLabel = UILabel()
    private let settingsButton = UIButton()
//    private let rocketInfoCollectionView = UICollectionView()
    private let firstStartValueLabel = CustomLabel()
    private let firstStartCountryValueLabel = CustomLabel()
    private let startCostValueLabel = CustomLabel()
    private let firstStageNumberOfEnginesValueLabel = CustomLabel()
    private let firstStageAmountOfFuelValueLabel = CustomLabel()
    private let firstStageCombustionTimeValueLabel = CustomLabel()
    private let secondStageNumberOfEnginesValueLabel = CustomLabel()
    private let secondStageAmountOfFuelValueLabel = CustomLabel()
    private let secondStageCombustionTimeValueLabel = CustomLabel()
    private let viewStartsListButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    init(rocket: Rocket) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(model: Rocket?) {
        guard let model = model else { return }
        contentTitleLabel.text = model.name
        firstStartValueLabel.text = model.firstFlight
        firstStartCountryValueLabel.text = model.country
        startCostValueLabel.text = "\(model.firstStage?.engines ?? 0)"
        firstStageNumberOfEnginesValueLabel.text = "\(model.firstStage?.engines ?? 0)"
        firstStageAmountOfFuelValueLabel.text = "\(model.firstStage?.fuelAmountTons ?? 0)" + " ton"
        firstStageCombustionTimeValueLabel.text = "\( model.firstStage?.burnTimeSec ?? 0)" + " sec"
        secondStageNumberOfEnginesValueLabel.text = String(describing: model.secondStage?.engines)
        secondStageAmountOfFuelValueLabel.text = "\(model.secondStage?.fuelAmountTons ?? 0)" + " ton"
        secondStageCombustionTimeValueLabel.text = "\(model.secondStage?.burnTimeSec ?? 0)" + " sec"
    }
}

private extension RocketInfoViewController {
    
    func setupUI() {
        let firstStartLabel = CustomLabel()
        let firstStartCountryLabel = CustomLabel()
        let startCostLabel = CustomLabel()
        let firstStageTitleLabel = UILabel()
        let secondStageTitleLabel = UILabel()
        let firstStageNumberOfEnginesLabel = CustomLabel()
        let secondStageNumberOfEnginesLabel = CustomLabel()
        let firstStageAmountOfFuelLabel = CustomLabel()
        let secondStageAmountOfFuelLabel = CustomLabel()
        let firstStageCombustionTimeLabel = CustomLabel()
        let secondStageCombustionTimeLabel = CustomLabel()
        let scrollContainer = UIView()
        
        containerView.backgroundColor = .black
        
        contentTitleLabel.text = "Falcon Heavy"
        contentTitleLabel.textColor = .white
        contentTitleLabel.font = .systemFont(ofSize: 25, weight: .medium)
        contentTitleLabel.height(35)
        
        settingsButton.setImage(UIImage(systemName: "gearshape"), for: .normal)
        settingsButton.tintColor = .white
        settingsButton.size(CGSize(width: 35, height: 35))
        
        firstStartLabel.text = "Превый запуск"
        firstStartCountryLabel.text = "Страна"
        startCostLabel.text = "Стоимость запуска"
        firstStageTitleLabel.text = "ПЕРВАЯ СТУПЕНЬ"
        secondStageTitleLabel.text = "ВТОРАЯ СТУПЕНЬ"
        for label in [firstStageNumberOfEnginesLabel, secondStageNumberOfEnginesLabel] {
            label.text = "Колличество двигателей"
        }
        for label in [firstStageAmountOfFuelLabel, secondStageAmountOfFuelLabel] {
            label.text = "Колличество топлива"
        }
        for label in [firstStageCombustionTimeLabel, secondStageCombustionTimeLabel] {
            label.text = "Время сгорания"
        }
        for label in [firstStageTitleLabel, secondStageTitleLabel] {
            label.textColor = .white
            label.font = .systemFont(ofSize: 20, weight: .medium)
        }
        
        viewStartsListButton.setTitle("View starts list", for: .normal)
        viewStartsListButton.setTitleColor(.black, for: .normal)
        viewStartsListButton.backgroundColor = .white
        viewStartsListButton.layer.cornerRadius = 10
        
//        rocketInfoCollectionView.dataSource = self
//        rocketInfoCollectionView.register(ShortInfoCollectionViewCell.self,
//                                          forCellWithReuseIdentifier: ShortInfoCollectionViewCell.identifier)
        
        view.addSubview(containerView)
        containerView.addSubview(contentTitleLabel)
        containerView.addSubview(settingsButton)
//        containerView.addSubview(rocketInfoCollectionView)
        containerView.addSubview(scrollView)
        scrollView.addSubview(scrollContainer)
        scrollContainer.addSubview(firstStartLabel)
        scrollContainer.addSubview(firstStartValueLabel)
        scrollContainer.addSubview(firstStartCountryLabel)
        scrollContainer.addSubview(firstStartCountryValueLabel)
        scrollContainer.addSubview(startCostLabel)
        scrollContainer.addSubview(startCostValueLabel)
        scrollContainer.addSubview(firstStageTitleLabel)
        scrollContainer.addSubview(firstStageNumberOfEnginesLabel)
        scrollContainer.addSubview(firstStageNumberOfEnginesValueLabel)
        scrollContainer.addSubview(firstStageAmountOfFuelLabel)
        scrollContainer.addSubview(firstStageAmountOfFuelValueLabel)
        scrollContainer.addSubview(firstStageCombustionTimeLabel)
        scrollContainer.addSubview(firstStageCombustionTimeValueLabel)
        scrollContainer.addSubview(secondStageTitleLabel)
        scrollContainer.addSubview(secondStageNumberOfEnginesLabel)
        scrollContainer.addSubview(secondStageNumberOfEnginesValueLabel)
        scrollContainer.addSubview(secondStageAmountOfFuelLabel)
        scrollContainer.addSubview(secondStageAmountOfFuelValueLabel)
        scrollContainer.addSubview(secondStageCombustionTimeLabel)
        scrollContainer.addSubview(secondStageCombustionTimeValueLabel)
        scrollContainer.addSubview(viewStartsListButton)
        
        containerView.edgesToSuperview()
        contentTitleLabel.topToSuperview(offset: 50)
        contentTitleLabel.leadingToSuperview(offset: 30)
        settingsButton.topToSuperview(offset: 50)
        settingsButton.trailingToSuperview(offset: 30)
        scrollView.topToBottom(of: contentTitleLabel, offset: 20)
        scrollView.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 30, bottom: 10, right: 30))
        scrollView.height(to: scrollContainer)
        scrollView.width(to: scrollContainer)
        scrollContainer.edgesToSuperview()
        firstStartLabel.topToSuperview(offset: 10)
        firstStartLabel.leadingToSuperview()
        firstStartValueLabel.topToSuperview(offset: 10)
        firstStartValueLabel.trailingToSuperview()
        firstStartCountryLabel.topToBottom(of: firstStartLabel, offset: 10)
        firstStartCountryLabel.leadingToSuperview()
        firstStartCountryValueLabel.topToBottom(of: firstStartValueLabel, offset: 10)
        firstStartCountryValueLabel.trailingToSuperview()
        
        startCostLabel.topToBottom(of: firstStartCountryLabel, offset: 10)
        startCostLabel.leadingToSuperview()
        startCostValueLabel.topToBottom(of: firstStartCountryValueLabel, offset: 10)
        startCostValueLabel.trailingToSuperview()
        
        firstStageTitleLabel.topToBottom(of: startCostLabel, offset: 35)
        firstStageTitleLabel.leadingToSuperview()
        
        firstStageNumberOfEnginesLabel.topToBottom(of: firstStageTitleLabel, offset: 10)
        firstStageNumberOfEnginesLabel.leadingToSuperview()
        firstStageNumberOfEnginesValueLabel.topToBottom(of: firstStageTitleLabel, offset: 10)
        firstStageNumberOfEnginesValueLabel.trailingToSuperview()
        
        firstStageAmountOfFuelLabel.topToBottom(of: firstStageNumberOfEnginesLabel, offset: 10)
        firstStageAmountOfFuelLabel.leadingToSuperview()
        firstStageAmountOfFuelValueLabel.topToBottom(of: firstStageNumberOfEnginesValueLabel, offset: 10)
        firstStageAmountOfFuelValueLabel.trailingToSuperview()
        
        firstStageCombustionTimeLabel.topToBottom(of: firstStageAmountOfFuelLabel, offset: 10)
        firstStageCombustionTimeLabel.leadingToSuperview()
        firstStageCombustionTimeValueLabel.topToBottom(of: firstStageAmountOfFuelValueLabel, offset: 10)
        firstStageCombustionTimeValueLabel.trailingToSuperview()
        
        secondStageTitleLabel.topToBottom(of: firstStageCombustionTimeLabel, offset: 35)
        secondStageTitleLabel.leadingToSuperview()
        
        secondStageNumberOfEnginesLabel.topToBottom(of: secondStageTitleLabel, offset: 10)
        secondStageNumberOfEnginesLabel.leadingToSuperview()
        secondStageNumberOfEnginesValueLabel.topToBottom(of: secondStageTitleLabel, offset: 10)
        secondStageNumberOfEnginesValueLabel.trailingToSuperview()
        
        secondStageAmountOfFuelLabel.topToBottom(of: secondStageNumberOfEnginesLabel, offset: 10)
        secondStageAmountOfFuelLabel.leadingToSuperview()
        secondStageAmountOfFuelValueLabel.topToBottom(of: secondStageNumberOfEnginesValueLabel, offset: 10)
        secondStageAmountOfFuelValueLabel.trailingToSuperview()
        
        secondStageCombustionTimeLabel.topToBottom(of: secondStageAmountOfFuelLabel, offset: 10)
        secondStageCombustionTimeLabel.leadingToSuperview()
        secondStageCombustionTimeValueLabel.topToBottom(of: secondStageAmountOfFuelValueLabel, offset: 10)
        secondStageCombustionTimeValueLabel.trailingToSuperview()
        
        viewStartsListButton.topToBottom(of: secondStageCombustionTimeLabel, offset: 35)
        viewStartsListButton.horizontalToSuperview()
        viewStartsListButton.centerXToSuperview()

    }
    
}

extension RocketInfoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShortInfoCollectionViewCell.identifier,
                                                            for: indexPath) as? ShortInfoCollectionViewCell
        else { return UICollectionViewCell()}
        
        
        return cell
    }
}
