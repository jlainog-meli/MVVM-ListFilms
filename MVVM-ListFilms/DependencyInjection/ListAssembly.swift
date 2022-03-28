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
    }
}
