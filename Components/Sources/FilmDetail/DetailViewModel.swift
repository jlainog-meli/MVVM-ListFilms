import UIKit
import FilmsModels

public final class DetailViewModel {

    private(set) var movie: Movie
    
    private(set) var genres: [Genre] {
        didSet { genresDidChange?(genres) }
    }
    var genresDidChange: (([Genre]) -> Void)?
    
    // MARK: - Setup

    public init(
        movie: Movie,
        genres: [Genre] = []
    ) {
        self.movie = movie
        self.genres = genres
    }
    
    func viewDidLoad() {
        guard genres.isEmpty else { return }
        environment.genre(movie.genreIds) { [weak self] result in
            environment.mainQueue.schedule {
                switch result {
                case let .success(response):
                    self?.genres = response
                case let .failure(error):
                    print(error)
                    // Do nothing
                }
            }
        }
    }
}
