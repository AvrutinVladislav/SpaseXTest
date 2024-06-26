//
//  RocketInfoViewController.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 25.05.2024.
//

import UIKit
import TinyConstraints

final class RocketInfoViewController: UIViewController {
    
    private let launchesURL = "https://api.spacexdata.com/v4/launches"
    private var launchList: [Launch] = []
    private var rocket: Rocket
    private var heightInMetricSystem = true
    private var diameterInMetricSystem = true
    private var massInMetricSystem = true
    private var payloadWeightsInMetricSystem = true
    
    private let containerView = UIView()
    private let scrollView = UIScrollView()
    private let contentTitleLabel = UILabel()
    private let settingsButton = UIButton()
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
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .zero
        layout.minimumInteritemSpacing = 40
        layout.minimumLineSpacing = 12
        return layout
    }()
    private lazy var shortInfoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLaunchList()
        setupUI()
        configure(model: rocket)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    init(rocket: Rocket) {
        self.rocket = rocket
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        contentTitleLabel.textColor = .white
        contentTitleLabel.font = .systemFont(ofSize: 25, weight: .medium)
        contentTitleLabel.height(35)
        
        settingsButton.setImage(UIImage(systemName: "gearshape"), for: .normal)
        settingsButton.tintColor = .white
        settingsButton.size(CGSize(width: 35, height: 35))
        settingsButton.addTarget(self, action: #selector(settingsButtonDidTap), for: .touchUpInside)
        
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
        viewStartsListButton.addTarget(self, action: #selector(watchLaunchListButtonDidTap), for: .touchUpInside)
        
        scrollView.showsVerticalScrollIndicator = false
        
        shortInfoCollectionView.dataSource = self
        shortInfoCollectionView.delegate = self
        shortInfoCollectionView.register(ShortInfoCollectionViewCell.self,
                                          forCellWithReuseIdentifier: ShortInfoCollectionViewCell.identifier)
        shortInfoCollectionView.height(80)
        shortInfoCollectionView.backgroundColor = .black
        shortInfoCollectionView.showsHorizontalScrollIndicator = false
        
        view.addSubview(containerView)
        containerView.addSubview(contentTitleLabel)
        containerView.addSubview(settingsButton)
        containerView.addSubview(shortInfoCollectionView)
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
        
        shortInfoCollectionView.topToBottom(of: contentTitleLabel, offset: 20)
        shortInfoCollectionView.horizontalToSuperview(insets: .horizontal(30))
        
        scrollView.topToBottom(of: shortInfoCollectionView, offset: 20)
        scrollView.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 30, bottom: 10, right: 30))
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
        viewStartsListButton.bottomToSuperview(offset: -10)
    }
    
    func configure(model: Rocket) {
        contentTitleLabel.text = model.name
        firstStartValueLabel.text = model.firstFlight
        firstStartCountryValueLabel.text = model.country
        startCostValueLabel.text = "$\((model.costPerLaunch ?? 0) / 1000000) млн"
        firstStageNumberOfEnginesValueLabel.text = "\(model.firstStage?.engines ?? 0)"
        firstStageAmountOfFuelValueLabel.text = "\(model.firstStage?.fuelAmountTons ?? 0)" + " тонн"
        firstStageCombustionTimeValueLabel.text = "\( model.firstStage?.burnTimeSec ?? 0)" + " сек"
        secondStageNumberOfEnginesValueLabel.text = "\(model.secondStage?.engines ?? 0)"
        secondStageAmountOfFuelValueLabel.text = "\(model.secondStage?.fuelAmountTons ?? 0)" + " тонн"
        secondStageCombustionTimeValueLabel.text = "\(model.secondStage?.burnTimeSec ?? 0)" + " сек"
    }
    
    func loadLaunchList() {
        guard let url = URL(string: launchesURL) else { return }
        URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            guard let data else {
                print("Error: failure data launch info response")
                return
            }
            DispatchQueue.main.async {
                do {
                    self?.launchList = try JSONDecoder().decode([Launch].self, from: data)
                } catch let error {
                    print("Error decoding launch info JSON: \(error)")
                }
            }
        }
        .resume()
    }
    
    func formatString(_ string: String) -> String {
        let pattern = "(\\d)(?=(\\d{3})+(?!\\d))"
        if let regex = try? NSRegularExpression(pattern: pattern, options: []) {
            let range = NSRange(location: 0, length: string.count)
            let formattedNumber = regex.stringByReplacingMatches(in: string, options: [], range: range, withTemplate: "$1,")
            return formattedNumber
        }
        return string
    }
    
    @objc func watchLaunchListButtonDidTap() {
        guard let rocketId = rocket.id else { return }
        navigationController?.pushViewController(LaunchListViewController(launchList: launchList.filter({$0.rocket == rocketId})), animated: false)
    }
    
    @objc func settingsButtonDidTap() {
        let vc = SettingsViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension RocketInfoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Titles.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShortInfoCollectionViewCell.identifier,
                                                            for: indexPath) as? ShortInfoCollectionViewCell,
              let title = Titles.getTitle(at: indexPath.row)
        else { return UICollectionViewCell()}
        switch title {
        case .height:
            cell.fill(title: title.title,
                      value: heightInMetricSystem ? "\(rocket.height?.meters?.description ?? "") м"
                                                  : "\(rocket.height?.feet?.description ?? "") feet")
        case .diameter:
            cell.fill(title: title.title,
                      value: diameterInMetricSystem ? "\(rocket.diameter?.meters?.description ?? "") м"
                                                    : "\(rocket.diameter?.feet?.description ?? "") feet")
        case .mass:
            cell.fill(title: title.title, 
                      value: massInMetricSystem ? formatString(rocket.mass?.kg?.description ?? "") + " кг"
                                                : formatString(rocket.mass?.lb?.description ?? "") + " lb")
        case .payloadWeights:
            cell.fill(title: title.title,
                      value: payloadWeightsInMetricSystem ? formatString(rocket.payloadWeights?[0].kg?.description ?? "") + " кг"
                                                          : formatString(rocket.payloadWeights?[0].lb?.description ?? "") + " lb")
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RocketInfoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 80) // Размер ячейки
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Отступы между строками
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Отступы между элементами в строке
    }
}

extension RocketInfoViewController: SettingsViewControllerDelegate {
    func isMetricSystem(_ isMetricSystem: Bool, _ title: String) {
        Titles.allCases.forEach { titleText in
            guard titleText.title == title else { return }
            switch titleText {
            case .height:
                heightInMetricSystem = isMetricSystem
            case .diameter:
                diameterInMetricSystem = isMetricSystem
            case .mass:
                massInMetricSystem = isMetricSystem
            case .payloadWeights:
                payloadWeightsInMetricSystem = isMetricSystem
            }
        }
        shortInfoCollectionView.reloadData()
    }
}
