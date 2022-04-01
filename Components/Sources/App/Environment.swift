import CombineSchedulers
import FilmsModels
import ListFilms
import FilmDetail

#if DEBUG
var environment = Environment.failing

public func setEnvironment(_ env: Environment) {
    environment = env
    ListFilms.setEnvironment(env.listFilms)
    FilmDetail.setEnvironment(env.filmsDetail)
}
#else
private var _environment: Environment = Environment.failing
var environment: Environment { _environment }

public func setEnvironment(_ env: Environment) {
    _environment = env
    ListFilms.setEnvironment(env.listFilms)
    FilmDetail.setEnvironment(env.filmsDetail)
}
#endif

public struct Environment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var getTopRatedMovies: (_ completion: @escaping (Result<MoviesList, MovieError>) -> Void) -> Void
    var genre: (_ genreIds: [Int], _ callback: @escaping (Result<[Genre], MovieError>) -> Void) -> Void
    
    public init(
        mainQueue: AnySchedulerOf<DispatchQueue> = .main,
        getTopRatedMovies: @escaping (_ completion: @escaping (Result<MoviesList, MovieError>) -> Void) -> Void,
        genre: @escaping (_ genreIds: [Int], _ callback: @escaping (Result<[Genre], MovieError>) -> Void) -> Void
    ) {
        self.mainQueue = mainQueue
        self.getTopRatedMovies = getTopRatedMovies
        self.genre = genre
    }
}

import XCTestDynamicOverlay
extension Environment {
    #if DEBUG
    public static var noop = Self(
        mainQueue: .immediate,
        getTopRatedMovies: { _ in },
        genre: { _,_ in }
    )
    #endif
    static var failing = Self(
        mainQueue: .failing,
        getTopRatedMovies: { _ in XCTFail(#function) },
        genre: { _,_ in XCTFail(#function) }
    )
}

extension Environment {
    var listFilms: ListFilms.Environment {
        var env = ListFilms.Environment(
            mainQueue: self.mainQueue,
            getTopRatedMovies: self.getTopRatedMovies
        )
        
        // Optional according to design
        env.buildMovieDetail = {
            DetailViewController(viewModel: .init(movie: $0))
        }
        return env
    }
    var filmsDetail: FilmDetail.Environment {
        .init(
            mainQueue: self.mainQueue,
            genre: self.genre
        )
    }
}
