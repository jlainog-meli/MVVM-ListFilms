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
    
    public init(
        mainQueue: AnySchedulerOf<DispatchQueue> = .main
    ) {
        self.mainQueue = mainQueue
    }
}

import XCTestDynamicOverlay
extension Environment {
    static var noop = Self(
        mainQueue: .immediate
    )
    static var failing = Self(
        mainQueue: .failing
    )
}
