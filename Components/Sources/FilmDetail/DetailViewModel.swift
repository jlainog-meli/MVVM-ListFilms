import UIKit
import FilmsModels

public final class DetailViewModel {

    private(set) var movie: Movie
    
    // MARK: - Setup

    public init(movie: Movie) {
        self.movie = movie
    }
}
