//
//  TopRatedMovies.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation

struct TopRatedMovies {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [TopRatedMovieList]
}

struct TopRatedMovieList {
    let popularity: Double
    let voteCount: Int
    let posterPath: String
    let genreIds: [Int]
    let title: String
    let overview: String
    let releaseDate: String
}
