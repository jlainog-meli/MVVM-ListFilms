//
//  GenreMovieResponse.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation

struct GenreMovieResponse: Codable {
    let genres: [GenreMovieListResults]
}

struct GenreMovieListResults: Codable {
    let id: Int
    let name: String
}
