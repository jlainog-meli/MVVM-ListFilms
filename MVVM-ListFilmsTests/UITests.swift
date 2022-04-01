import XCTest
@testable import App
@testable import ListFilms
import SnapshotTesting
import MVVM_ListFilms

// Using Iphone 12 Simulator
final class IntergrationTests: XCTestCase {
    func testFullFlowUI() {
        var environment = App.Environment.noop
        App.setEnvironment(environment)

        // Given
        let viewModel = ListViewModel()
        let sut = App.buildInitialViewController(viewModel: viewModel)
        
        // When
        sut.loadViewIfNeeded()
        
        // Then
        assertSnapshot(matching: sut, as: .image)
        
        // When
        struct MockedError: Error {}
        environment.getTopRatedMovies = { $0(.failure(.init(MockedError()))) }
        App.setEnvironment(environment)
        // we could even introspect the view to get to the button to simulate a tap gesture in the button
        // this will only work when testing with a hosting app
        // NOTE: - in this package this will not trigger the reload
        (sut as? UINavigationController)?
             .viewControllers.first
             .flatMap { $0.view as? ListView }?
             .subviews.first?
             .subviews.first(where: { $0 is ListErrorView })?
             .tapFirstAvailableButton()
//        viewModel.fetchMovies()
        
        // Then
        assertSnapshot(matching: sut, as: .image)
        
        // When
        environment.getTopRatedMovies = { $0(.success(.mock)) }
        App.setEnvironment(environment)
        viewModel.fetchMovies()
        
        // Then
        assertSnapshot(matching: sut, as: .image)
      
        // When
        environment.genre = { ids, callback in
            callback(.success(ids.map { .init(id: $0, name: "Action") }))
        }
        App.setEnvironment(environment)
        viewModel.goToDetail(with: .deadpool)
        
        // Then
        assertSnapshot(matching: sut, as: .image)
        
        // When
        viewModel.dismissDetail()
        
        // Then
        assertSnapshot(matching: sut, as: .image)
    }
}

extension UIView {
    func tapFirstAvailableButton() {
        self.subviews
            .first { $0 is UIButton }
            .flatMap { $0 as? UIButton }?
            .sendActions(for: .touchUpInside)
    }
}
