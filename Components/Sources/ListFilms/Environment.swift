import CombineSchedulers
import FilmsModels
import XCTest

#if DEBUG
var environment = Environment.noop

public func setEnvironment(_ env: Environment) {
    environment = env
}
#else
private var _environment: Environment
var environment: Environment { _environment }

public func setEnvironment(_ env: Environment) {
    _environment = env
}
#endif

public struct Environment {
    var mainQueue: AnySchedulerOf<DispatchQueue> = .main
    var getTopRatedMovies: (_ completion: @escaping (Result<MoviesList, MovieError>) -> Void) -> Void
    
    public init(
        mainQueue: AnySchedulerOf<DispatchQueue> = .main,
        getTopRatedMovies: @escaping (_ completion: @escaping (Result<MoviesList, MovieError>) -> Void) -> Void
    ) {
        self.mainQueue = mainQueue
        self.getTopRatedMovies = getTopRatedMovies
    }
}

//import XCTestDynamicOverlay
extension Environment {
    static var noop = Self(
        mainQueue: .immediate,
        getTopRatedMovies: { _ in }
    )
//    static var failing = Self(
//        mainQueue: .failing,
//        getTopRatedMovies: { _ in XCTFail(#function) }
//    )
}
