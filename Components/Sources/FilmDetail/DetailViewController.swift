import Foundation
import UIKit

final class DetailViewController: UIViewController {
        
    // MARK: - Constants

    private enum Constants {
        static let title: String = "Detalhe do filme"
    }
    
    // MARK: - Private Attributes

    private let detailView: DetailView
    private let viewModel: DetailViewModel

    // MARK: - Public Attributes

//    public weak var flowProtocol: DetailViewFlowProtocol?
    
    // MARK: - Setup

    init(viewModel: DetailViewModel) {
        self.detailView = .init(frame: .zero)
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = detailView
    }
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.title
        detailView.setupUI(state: viewModel.movie)
    }
}
