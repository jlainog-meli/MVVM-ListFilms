//
//  ListAssembly.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 27/03/22.
//

import Swinject

class ListAssembly: Assembly {
    func assemble(container: Container) {
        
        // MARK: - TopRatedMoviesUseCaseProtocol
        
        container.register(TopRatedMoviesUseCaseProtocol.self) { resolver in
            let networkManager = resolver.resolve(NetworkOperationProtocol.self)!
            return TopRatedMoviesUseCase(network: networkManager)
        }
        
        // MARK: - GenreMovieUseCaseProtocol

        container.register(GenreMovieUseCaseProtocol.self) { resolver in
            let networkManager = resolver.resolve(NetworkOperationProtocol.self)!
            return GenreMovieUseCase(network: networkManager)
        }
        
        // MARK: - List
        
        container.register(ListViewProtocol.self) { resolver in
            return ListView()
        }
        
        container.register(ListViewController.self) { resolver in
            let view = resolver.resolve(ListViewProtocol.self)!
            return ListViewController(
                viewProtocol: view)
        }
        
        container.register(ListViewModelProtocol.self) { resolver in
            let viewController = resolver.resolve(ListViewController.self)!
            let topRatedMoviesUseCase = resolver.resolve(TopRatedMoviesUseCaseProtocol.self)!
            let viewModel = ListViewModel(
                viewController: viewController,
                topRatedMoviesUseCase: topRatedMoviesUseCase
            )
            viewController.viewModelProtocol = viewModel
            return viewModel
        }

    }
}
