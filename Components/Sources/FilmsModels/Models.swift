import Foundation

public struct MovieError: Error, LocalizedError {
    var wrapedError: Error
    var localizedDescription: String { wrapedError.localizedDescription }
    
    public init(_ error: Error) {
        self.wrapedError = error
    }
}

public struct MoviesList: Codable {
    public init(page: Int, totalResults: Int, totalPages: Int, results: [Movie]) {
        self.page = page
        self.totalResults = totalResults
        self.totalPages = totalPages
        self.results = results
    }
    
    public let page: Int
    public let totalResults: Int
    public let totalPages: Int
    public let results: [Movie]
}

extension MoviesList {
    static var mock = Self(
        page: 0,
        totalResults: 1,
        totalPages: 1,
        results: [.deadpool]
    )
}

public struct Movie: Codable {
    public init(popularity: Double, voteCount: Int, posterPath: String, genreIds: [Int], title: String, overview: String, releaseDate: String) {
        self.popularity = popularity
        self.voteCount = voteCount
        self.posterPath = posterPath
        self.genreIds = genreIds
        self.title = title
        self.overview = overview
        self.releaseDate = releaseDate
    }
    
    public let popularity: Double
    public let voteCount: Int
    public let posterPath: String
    public let genreIds: [Int]
    public let title: String
    public let overview: String
    public let releaseDate: String
}

extension Movie {
    static let deadpool = Self(
        popularity: 1,
        voteCount: 1,
        posterPath: "",
        genreIds: [1],
        title: "Deadpool",
        overview: "",
        releaseDate: ""
    )
}

extension Movie {
    public var posterURL: String { Constants.posterPath + self.posterPath }
}

private enum Constants {
    static let posterPath: String = "https://image.tmdb.org/t/p/w500"
}
