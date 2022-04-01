import UIKit
import ListFilms

public func buildInitialViewController(
    state: ListState = .idle,
    route: ListRoute? = nil
) -> UIViewController {
    UINavigationController(
        rootViewController: ListViewController(
            viewModel: ListViewModel(
                state: state,
                route: route
            )
        )
    )
}
