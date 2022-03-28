//
//  TopRatedMovies.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation

struct TopRatedMovies {
    public let page: Int
    public let totalResults: Int
    public let totalPages: Int
    public let results: [TopRatedMovieList]
}

struct TopRatedMovieList {
    public let popularity: Double
    public let voteCount: Int
    public let posterPath: String
    public let genreIds: [Int]
    public let title: String
    public let overview: String
    public let releaseDate: String
}
