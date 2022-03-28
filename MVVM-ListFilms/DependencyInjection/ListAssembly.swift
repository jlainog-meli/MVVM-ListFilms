//
//  ListAssembly.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 27/03/22.
//

import Swinject

final class ListAssembly: Assembly {
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
            ListView()
        }
        
        container.register(ListViewModelProtocol.self) { resolver in
            let topRatedMoviesUseCase = resolver.resolve(TopRatedMoviesUseCaseProtocol.self)!
            return ListViewModel(
                topRatedMoviesUseCase: topRatedMoviesUseCase
            )
        }
        
        container.register(ListViewController.self) { resolver in
            let view = resolver.resolve(ListViewProtocol.self)!
            var viewModel = resolver.resolve(ListViewModelProtocol.self)!
            let viewController = ListViewController(
                viewProtocol: view,
                viewModelProtocol: viewModel)
            
            viewModel.viewController = viewController
            return viewController
        }
        
        // MARK: - Detail

        container.register(DetailViewProtocol.self) { resolver in
            return DetailView()
        }
        
        container.register(DetailViewModelProtocol.self) { (resolver: Resolver, data: TopRatedMovieList) in
            return DetailViewModel(data: data)
        }
        
        container.register(DetailViewController.self) { (resolver: Resolver, data: TopRatedMovieList) in
            let view = resolver.resolve(DetailViewProtocol.self)!
            var viewModel = resolver.resolve(DetailViewModelProtocol.self, argument: data)!
            let viewController = DetailViewController(
                viewProtocol: view,
                viewModelProtocol: viewModel)
            
            viewModel.viewController = viewController
            return viewController
        }
    }
}
