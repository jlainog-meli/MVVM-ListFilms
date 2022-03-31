import UIKit
import FilmsModels

final class DetailViewModel {

    private(set) var movie: Movie
    
    // MARK: - Setup

    init(movie: Movie) {
        self.movie = movie
    }
}
