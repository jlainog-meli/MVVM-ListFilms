import Foundation

public struct MovieError: Error {
    public var wrapedError: Error
    
    public init(_ error: Error) {
        self.wrapedError = error
    }
}

public struct MoviesList: Codable, Equatable {
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

#if DEBUG
extension MoviesList {
    public static var mock = Self(
        page: 0,
        totalResults: 1,
        totalPages: 1,
        results: [.deadpool]
    )
}
#endif

public struct Movie: Codable, Equatable {
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

#if DEBUG
extension Movie {
    public static let deadpool = Self(
        popularity: 1,
        voteCount: 1,
        posterPath: "/yGSxMiF0cYuAiyuve5DA6bnWEOI.jpg",
        genreIds: [28],
        title: "Deadpool",
        overview: """
Armed with his new abilities and a dark, twisted sense of humor, Deadpool hunts down the man who nearly destroyed his life. Wade Wilson is a small-time mercenary. He meets Vanessa and falls in love. Life is idyllic until one day he is diagnosed with terminal cancer.
""",
        releaseDate: "2016/Mocked"
    )
}
#endif

extension Movie {
    // FIXME: ideally the models should not know anything of this base URL
    public var posterURL: String { "https://image.tmdb.org/t/p/w500" + self.posterPath }
}

public struct Genre: Codable, Equatable {
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    public let id: Int
    public let name: String
}
