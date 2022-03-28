//
//  GenreMovieUseCase.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation

class GenreMovieUseCase {
    
    // MARK: - Private Attributes

    private let network: NetworkOperationProtocol

    // MARK: - Setup

    init(
        network: NetworkOperationProtocol
    ) {
        self.network = network
    }
}

// MARK: - Extensions

extension GenreMovieUseCase: GenreMovieUseCaseProtocol {
    func getGenreMovie(completion: @escaping (Result<GenreMovieResponse, NetworkOperationError>) -> Void) {
        network.fetchNetwork(request: ListRequests.getGenreMovie, completion: completion)
    }
}
