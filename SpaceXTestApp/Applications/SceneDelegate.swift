//
//  SceneDelegate.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 25.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let vc = PreviewModuleBuilder.build()
        let navigationVC = UINavigationController(rootViewController: vc)
        window.rootViewController = navigationVC
        self.window = window
        self.window?.makeKeyAndVisible()
    }

}

