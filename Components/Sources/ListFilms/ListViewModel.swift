import FilmsModels

public enum ListState: Equatable {
    case hasData(data: MoviesList)
    case hasError(message: String)
    case isLoading(isLoading: Bool)
    case idle
}

public enum ListRoute {
    case detail(Movie)
}

public final class ListViewModel {
    // MARK: - Public Attributes
    private(set) var state: ListState {
        didSet { stateDidChange?(state) }
    }
    var stateDidChange: ((ListState) -> Void)?
    
    private(set) var route: ListRoute? {
        didSet { routeDidChange?(route) }
    }
    var routeDidChange: ((ListRoute?) -> Void)?
    
    public init(state: ListState = .idle, route: ListRoute? = nil) {
        self.state = state
        self.route = route
    }
    
    func viewDidLoad() {
        guard state == .idle else { return }
        fetchMovies()
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
    
    func goToDetail(with movie: Movie) {
        route = .detail(movie)
    }
    
    func dismissDetail() {
        route = nil
    }
}
