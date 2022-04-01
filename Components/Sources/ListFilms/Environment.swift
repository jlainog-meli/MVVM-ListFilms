import CombineSchedulers
import FilmsModels
import UIKit // Optional according to design

#if DEBUG
var environment: Environment = .failing

public func setEnvironment(_ env: Environment) {
    environment = env
}
#else
private var _environment: Environment = .failing
var environment: Environment { _environment }

public func setEnvironment(_ env: Environment) {
    _environment = env
}
#endif

public struct Environment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var getTopRatedMovies: (_ completion: @escaping (Result<MoviesList, MovieError>) -> Void) -> Void
    
    public init(
        mainQueue: AnySchedulerOf<DispatchQueue> = .main,
        getTopRatedMovies: @escaping (_ completion: @escaping (Result<MoviesList, MovieError>) -> Void) -> Void
    ) {
        self.mainQueue = mainQueue
        self.getTopRatedMovies = getTopRatedMovies
    }
    
    public var buildMovieDetail: ((Movie) -> UIViewController)? // Optional according to design
}

import XCTestDynamicOverlay
extension Environment {
    static var noop = Self(
        mainQueue: .immediate,
        getTopRatedMovies: { _ in }
    )
    static var failing = Self(
        mainQueue: .failing,
        getTopRatedMovies: { _ in XCTFail("Unimplemented getTopRatedMovies") }
    )
}
