//
//  SceneDelegate.swift
//  KagiiKYCIntegration
//
//  Copyright © 2020 Sedicii Innovations Limited. All rights reserved.
//

import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = ViewController()
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}
