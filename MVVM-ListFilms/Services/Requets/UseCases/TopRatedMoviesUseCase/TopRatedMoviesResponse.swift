//
//  TopRatedMoviesResponse.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation

struct TopRatedMoviesResponse: Codable {
    public let page: Int
    public let totalResults: Int
    public let totalPages: Int
    public let results: [TopRatedListResults]

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results = "results"
    }
}

struct TopRatedListResults: Codable {
    public let popularity: Double
    public let voteCount: Int
    public let posterPath: String
    public let genreIds: [Int]
    public let title: String
    public let overview: String
    public let releaseDate: String

    enum CodingKeys: String, CodingKey {
        case popularity = "popularity"
        case voteCount = "vote_count"
        case posterPath = "poster_path"
        case genreIds = "genre_ids"
        case title = "title"
        case overview = "overview"
        case releaseDate = "release_date"
    }
}
