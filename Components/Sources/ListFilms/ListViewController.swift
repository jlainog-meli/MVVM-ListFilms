import Foundation
import UIKit
import FilmsModels

import FilmDetail // Optional according to design

public final class ListViewController: UIViewController {
        
    // MARK: - Constants

    private enum Constants {
        static let title: String = "Lista de filmes"
    }
    
    // MARK: - Private Attributes

    let viewModel: ListViewModel
    let listView: ListView

    // MARK: - Setup

    public init(viewModel: ListViewModel) {
        self.viewModel = viewModel
        self.listView = .init(frame: .zero)
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        self.view = listView
    }
    
    // MARK: - LifeCycle

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: View creation + Configuration
        title = Constants.title
        self.navigationController?.delegate = self
        
        // MARK: View model bindings
        viewModel.stateDidChange = { [weak self] in
            self?.listView.setupUI(state: $0)
        }
        listView.setupUI(state: viewModel.state)
        
        let navigateToRoute = self.navigateToRoute()
        viewModel.routeDidChange = navigateToRoute
        viewModel.route.flatMap(navigateToRoute)
        
        // MARK: UI actions
        listView.didTapReload = { [weak self] in self?.viewModel.fetchMovies() }
        listView.didTapMovie = { [weak self] in self?.viewModel.goToDetail(with: $0) }
        
        // MARK: -
        viewModel.viewDidLoad()
    }
}

extension ListViewController {
    private func navigateToRoute() -> ((ListRoute?) -> Void) {
        var presentedViewController: UIViewController?
        return { [weak self] in
            switch $0 {
            case .none:
                guard let vc = presentedViewController
                else { return }
                
                if self?.navigationController?.viewControllers.contains(vc) == true {
                    self?.navigationController?.popToViewController(vc, animated: true)
                    self?.navigationController?.popViewController(animated: true)
                } else {
                    vc.dismiss(animated: true)
                }
                presentedViewController = nil
            case .detail(let movie):
                // Optional according to design
//                let vc = environment.buildMovieDetail!(movie)
                let vc = DetailViewController(viewModel: .init(movie: movie))
                self?.navigationController?.pushViewController(vc, animated: true)
                presentedViewController = vc
            }
        }
    }
}

extension ListViewController: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if viewController === self {
            viewModel.dismissDetail()
        }
    }
}

/// NOTE: Great Idea it just doesn't work with assest for the moment
/// https://developer.apple.com/forums/thread/672944
//#if DEBUG
//import SwiftUI
//import Helpers
//
//struct ListViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        environment = .noop
//        return UIViewToSwiftUI { _ in
//            let vc = ListViewController(
//                viewModel: .init(
//                    state: .isLoading(isLoading: true)
//                )
//            )
//
//            vc.viewDidLayoutSubviews()
//            return vc.view
//        }
//    }
//}
//#endif
