//
//  SceneDelegate.swift
//  Homework
//
//  Created by Darius Miskinis on 2024-03-02.
//

import UIKit
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        guard let viewController: HomeViewController = Injection.shared.resolve(type: HomeViewControllable.self) as? HomeViewController else {
            preconditionFailure("Could not resolve \(HomeViewController.self)")
        }

        let navigationController = UINavigationController(rootViewController: viewController)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

