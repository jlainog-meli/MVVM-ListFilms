import Foundation
import XCTest
@testable import ListFilms

final class ListViewModelTests: XCTestCase {

    // MARK: - Tests

    func testListViewModelStartLoading() throws {
        environment = .noop
        
        // Given
        let sut = ListViewModel(state: .idle)
        // When
        sut.viewDidLoad()
        // Then
        XCTAssertEqual(sut.state, .isLoading(isLoading: true))
    }
    
    func testListViewModelHasData() throws {
        environment = .noop
        environment.getTopRatedMovies = { $0(.success(.mock)) }
        
        // Given
        let sut = ListViewModel(state: .idle)
        // When
        sut.viewDidLoad()
        // Then
        XCTAssertEqual(sut.state, .hasData(data: .mock))
    }
    
    func testListViewModelHasError() throws {
        struct MockedError: Error {}
        environment = .noop
        environment.getTopRatedMovies = { $0(.failure(.init(MockedError()))) }
        
        // Given
        let sut = ListViewModel(state: .idle)
        // When
        sut.viewDidLoad()
        // Then
        XCTAssertEqual(sut.state, .hasError(message: "MockedError()"))
    }
}
