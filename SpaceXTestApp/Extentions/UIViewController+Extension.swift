//
//  UIViewController+Extension.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 24.06.2024.
//

import UIKit

class CustomViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
