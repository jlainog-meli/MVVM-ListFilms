//
//  GenreMovieUseCaseProtocol.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation

protocol GenreMovieUseCaseProtocol {
    func getGenreMovie(completion: @escaping (Result<GenreMovieResponse, NetworkOperationError>) -> Void)
}
