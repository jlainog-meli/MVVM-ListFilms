import FilmsModels

public enum ListState {
    case hasData(data: MoviesList)
    case hasError(message: String)
    case isLoading(isLoading: Bool)
    case idle
}

public final class ListViewModel {
    // MARK: - Public Attributes
    var state: ListState = .idle {
        didSet { stateDidChange?(state) }
    }
    var stateDidChange: ((ListState) -> Void)?
    
    public init(state: ListState) {
        self.state = state
    }
    
    func fetchMovies() {
        state = .isLoading(isLoading: true)
        environment.getTopRatedMovies { [weak self] result in
            environment.mainQueue.schedule {
                switch result {
                case let .success(response):
                    self?.state = .hasData(data: response)
                case let .failure(error):
                    self?.state = .hasError(message: error.localizedDescription)
                }
            }
        }
    }
}

// MARK: - Constants

private enum Constants {
    static let posterPath: String = "https://image.tmdb.org/t/p/w500"
}
