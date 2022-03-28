//
//  TopRatedMoviesUseCaseProtocol.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation

protocol TopRatedMoviesUseCaseProtocol {
    func getTopRatedMovies(completion: @escaping (Result<TopRatedMoviesResponse, NetworkOperationError>) -> Void)
}
