import XCTest
import SnapshotTesting
import FilmsModels
@testable import FilmDetail


class UITests: XCTestCase {

    func testUI() {
        environment = .noop
        environment.genre = { ids, callback in
            callback(.success(ids.map { Genre(id: $0, name: "Mocked") }))
        }
        
        // Given
        let sut = DetailViewController(viewModel: .init(movie: .deadpool))
        // When
        sut.loadViewIfNeeded()
        // Then
        assertSnapshot(matching: sut, as: .image(on: .iPhoneX))
    }

}
