import Foundation
import UIKit

public final class DetailViewController: UIViewController {
        
    // MARK: - Constants

    private enum Constants {
        static let title: String = "Detalhe do filme"
    }
    
    // MARK: - Private Attributes

    private let detailView: DetailView
    private let viewModel: DetailViewModel

    // MARK: - Setup

    public init(viewModel: DetailViewModel) {
        self.detailView = .init(frame: .zero)
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        self.view = detailView
    }
    
    // MARK: - LifeCycle

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: View creation + Configuration
        title = Constants.title
        
        // MARK: View model bindings
        viewModel.genresDidChange = { [weak self] in
            guard let self = self else { return }
            self.detailView.setupUI(self.viewModel.movie, $0)
        }
        detailView.setupUI(viewModel.movie, viewModel.genres)
        
        viewModel.viewDidLoad()
    }
}
