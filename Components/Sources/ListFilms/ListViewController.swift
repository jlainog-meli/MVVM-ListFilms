import Foundation
import UIKit
import FilmsModels

public final class ListViewController: UIViewController {
        
    // MARK: - Constants

    private enum Constants {
        static let title: String = "Lista de filmes"
    }
    
    // MARK: - Private Attributes

    let viewModel: ListViewModel
    let listView: ListView

    // MARK: - Public Attributes

//    public var flowProtocol: ListViewFlowProtocol?
    
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
        title = Constants.title
        
        // MARK: Bindings
        viewModel.stateDidChange = { [weak self] in
            self?.listView.setupUI(state: $0)
        }
        
        listView.didTapReload = { [weak self] in self?.viewModel.fetchMovies() }
        listView.didTapMovie = { [weak self] _ in /* flowProtocol?.goToDetail(with: data) */ }
        
        // MARK: -
        viewModel.fetchMovies()
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
