//
//  SceneDelegate.swift
//  Rides
//
//  Created by Dorota Belanová on 2023-01-26.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        if let windowScene = scene as? UIWindowScene {
            window = UIWindow(windowScene: windowScene)
            let vehicleListViewController = UIHostingController(
                rootView: VehicleListView(viewModel: VehicleListViewModel())
            )
            window?.rootViewController = vehicleListViewController
            window?.makeKeyAndVisible()
        }
    }
}
