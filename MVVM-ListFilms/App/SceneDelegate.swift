//
//  SceneDelegate.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 27/03/22.
//

import UIKit
import Swinject

import FilmsModels
import ListFilms

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Internal Attributes

    var window: UIWindow?

    // MARK: - Private Attributes

    private let assembler = Assembler(DependencyGraph.build())

    // MARK: - Internal Functions

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        applyNavigationAppearances()
        setEnvironment()
        presentStartFlow(windowScene: windowScene)
    }
    
    // MARK: - Private Functions
    
    func setEnvironment() {
        ListFilms.setEnvironment(.live)
//        ListFilms.setEnvironment(.delayedFail)
    }
    
    private func presentStartFlow(windowScene: UIWindowScene) {
        let navigationController = UINavigationController()
        let vc = ListFilms.ListViewController(
            viewModel: ListFilms.ListViewModel(
                state: ListFilms.ListState.isLoading(isLoading: true)
            )
        )
        navigationController.setViewControllers([vc], animated: false)
        
//        let flowController = assembler.resolver.resolve(FlowController.self, argument: navigationController)
//        flowController?.start()
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private func applyNavigationAppearances() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .prussianBlue
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]

        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.standardAppearance = appearance;
        navBarAppearance.scrollEdgeAppearance = navBarAppearance.standardAppearance
        navBarAppearance.tintColor = .white
        navBarAppearance.barTintColor = .white
        navBarAppearance.isTranslucent = true

    }
}

extension ListFilms.Environment {
    static let live = Self(
        mainQueue: .main,
        getTopRatedMovies: { callback in
            NetworkOperation().fetchNetwork(request: ListRequests.getTopRatedMovies) { (result: Result<MoviesList, NetworkOperationError>) in
                callback(result.mapError(MovieError.init))
            }
        }
    )
    
    static let delayedFail = Self(
        mainQueue: .immediate,
        getTopRatedMovies: { callback in
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                callback(.failure(.init(NetworkOperationError.noURL)))
            }
        }
    )
}
