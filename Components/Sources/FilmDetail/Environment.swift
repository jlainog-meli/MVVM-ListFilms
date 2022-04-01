import CombineSchedulers
import FilmsModels

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
    var genre: (_ genreIds: [Int], _ callback: @escaping (Result<[Genre], MovieError>) -> Void) -> Void
    
    public init(
        mainQueue: AnySchedulerOf<DispatchQueue> = .main,
        genre: @escaping (_ genreIds: [Int], _ callback: @escaping (Result<[Genre], MovieError>) -> Void) -> Void
    ) {
        self.mainQueue = mainQueue
        self.genre = genre
    }
}

import XCTestDynamicOverlay
extension Environment {
    static var noop = Self(
        mainQueue: .immediate,
        genre: { _,_ in }
    )
    static var failing = Self(
        mainQueue: .failing,
        genre: { _,_ in XCTFail(#function) }
    )
}
