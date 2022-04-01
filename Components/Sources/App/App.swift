import UIKit
import ListFilms

public func buildInitialViewController() -> UIViewController {
    buildInitialViewController(state: .idle, route: nil)
}

#if DEBUG
public func buildInitialViewController(
    state: ListState,
    route: ListRoute?
) -> UIViewController {
    buildInitialViewController(
        viewModel: ListViewModel(
            state: state,
            route: route
        )
    )
}
#endif

internal func buildInitialViewController(
    viewModel: ListViewModel
) -> UIViewController {
    applyNavigationAppearances()
    return UINavigationController(
        rootViewController: ListViewController(
            viewModel: viewModel
        )
    )
}

private func applyNavigationAppearances() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = .prussianBlue
    appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]

    let navBarAppearance = UINavigationBar.appearance()
    navBarAppearance.standardAppearance = appearance;
    navBarAppearance.scrollEdgeAppearance = navBarAppearance.standardAppearance
    navBarAppearance.tintColor = .white
    navBarAppearance.barTintColor = .white
    navBarAppearance.isTranslucent = true
}
