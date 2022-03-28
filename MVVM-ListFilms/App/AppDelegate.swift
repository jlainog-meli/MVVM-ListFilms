//
//  AppDelegate.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 27/03/22.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Internal Attributes

    var window: UIWindow?

    // MARK: - Private Attributes

    private let assembler = Assembler(DependencyGraph.build())

    // MARK: - Internal Functions

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        presentStartFlow()
        return true
    }
    
    // MARK: - Private Functions

    private func presentStartFlow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()
        if let navigationController = window?.rootViewController as? UINavigationController {
            let flowController = assembler.resolver.resolve(FlowController.self, argument: navigationController)
            flowController?.start()
        }
        window?.makeKeyAndVisible()
    }
}

