import Foundation
import XCTest
import FilmsModels
@testable import FilmDetail

final class DetailViewModelTests: XCTestCase {
    func testLoadGenres() throws {
        environment = .noop
        environment.genre = { ids, callback in
            callback(.success(ids.map { Genre(id: $0, name: "Mocked") }))
        }
        
        // Given
        let movie = Movie.deadpool
        let sut = DetailViewModel(movie: movie)
        // When
        sut.viewDidLoad()
        // Then
        XCTAssertEqual(sut.genres, [Genre(id: movie.genreIds.first!, name: "Mocked")])
    }
}
