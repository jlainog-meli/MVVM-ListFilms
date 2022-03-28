//
//  TopRatedMoviesUseCase.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation

class TopRatedMoviesUseCase {
    
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

extension TopRatedMoviesUseCase: TopRatedMoviesUseCaseProtocol {
    func getTopRatedMovies(completion: @escaping (Result<TopRatedMoviesResponse, NetworkOperationError>) -> Void) {
        network.fetchNetwork(request: ListRequests.getTopRatedMovies, completion: completion)
    }
}
