//
//  TopRatedMoviesResponse.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation

struct TopRatedMoviesResponse: Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [TopRatedListResults]

//    enum CodingKeys: String, CodingKey {
//        case page = "page"
//        case totalResults = "total_results"
//        case totalPages = "total_pages"
//        case results = "results"
//    }
}

struct TopRatedListResults: Codable {
    let popularity: Double
    let voteCount: Int
    let posterPath: String
    let genreIds: [Int]
    let title: String
    let overview: String
    let releaseDate: String

//    enum CodingKeys: String, CodingKey {
//        case popularity = "popularity"
//        case voteCount = "vote_count"
//        case posterPath = "poster_path"
//        case genreIds = "genre_ids"
//        case title = "title"
//        case overview = "overview"
//        case releaseDate = "release_date"
//    }
}
