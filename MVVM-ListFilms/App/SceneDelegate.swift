//
//  SceneDelegate.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 27/03/22.
//

import UIKit
import Swinject

import App
import FilmsModels

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Internal Attributes

    var window: UIWindow?

    // MARK: - Private Attributes

    private let assembler = Assembler(DependencyGraph.build())

    // MARK: - Internal Functions

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        applyNavigationAppearances()
        presentStartFlow(windowScene: windowScene)
    }
    
    // MARK: - Private Functions
    private func presentStartFlow(windowScene: UIWindowScene) {
//        let navigationController = UINavigationController()
//        let flowController = assembler.resolver.resolve(FlowController.self, argument: navigationController)
//        flowController?.start()

        App.setEnvironment(.live)
        let navigationController = App.buildInitialViewController(
            state: .hasData(data: .mock),
            route: .detail(.deadpool)
        )

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

extension App.Environment {
    static let live: Self = {
        let networkOperation = NetworkOperation()
        return Self(
            mainQueue: .main,
            getTopRatedMovies: { callback in
                networkOperation.fetchNetwork(request: ListRequests.getTopRatedMovies) { (result: Result<MoviesList, NetworkOperationError>) in
                    callback(result.mapError(MovieError.init))
                }
            },
            genre: { ids, callback in
                GenreMovieUseCase(network: networkOperation).getGenreMovie {
                    let result = $0.map { list in
                        list.genres.map { genre in
                            Genre.init(id: genre.id, name: genre.name)
                        }
                        .filter { ids.contains($0.id) } 
                    }
                    .mapError(MovieError.init)
                    callback(result)
                }
            }
        )
    }()
    
    static let delayedFail = Self(
        mainQueue: .immediate,
        getTopRatedMovies: { callback in
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                callback(.failure(.init(NetworkOperationError.noURL)))
            }
        },
        genre: { _, _ in }
    )
}
