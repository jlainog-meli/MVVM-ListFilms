import XCTest
import SnapshotTesting
@testable import ListFilms

class UITests: XCTestCase {

    func testUI() {
        environment = .noop

        // Given
        let viewModel = ListViewModel()
        let sut = ListViewController(viewModel: viewModel)
        
        // When
        sut.loadViewIfNeeded()
        
        // Then
        assertSnapshot(matching: sut, as: .image(on: .iPhoneX))
        
        // When
        struct MockedError: Error {}
        environment.getTopRatedMovies = { $0(.failure(.init(MockedError()))) }
        viewModel.fetchMovies()
        
        // Then
        assertSnapshot(matching: sut, as: .image(on: .iPhoneX))
        
        // When
        environment.getTopRatedMovies = { $0(.success(.mock)) }
        viewModel.fetchMovies()

        // Then
        assertSnapshot(matching: sut, as: .image(on: .iPhoneX))
    }

}
