//
//  BackgroundImagesCollrctionViewCell.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 27.06.2024.
//

import Foundation
import UIKit
import TinyConstraints

final class BackgroundImageViewController: UIViewController {
    
    private var imageData: Data?
    private let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    init(imageData: Data?) {
        super.init(nibName: nil, bundle: nil)
        self.imageData = imageData
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BackgroundImageViewController {
    func setupUI() {
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        backgroundImageView.clipsToBounds = true
        if let imageData {
            backgroundImageView.image = UIImage(data: imageData)
        }
        view.addSubview(backgroundImageView)
        
        backgroundImageView.edgesToSuperview()
    }
    
}
