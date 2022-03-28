//
//  GenreMovieResponse.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation

struct GenreMovieResponse: Codable {
    public let genres: [GenreMovieListResults]
}

struct GenreMovieListResults: Codable {
    public let id: Int
    public let name: String
}
