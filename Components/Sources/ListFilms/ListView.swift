import Foundation
import UIKit
import FilmsModels

final class ListView: UIView {

    // MARK: - Actions
    var didTapReload: (() -> Void)?
    var didTapMovie: ((Movie) -> Void)?

    // MARK: - UI
    
    private lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var viewLoading: ListLoadingView = {
        let view = ListLoadingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
        
    private lazy var viewError: ListErrorView = {
        let view = ListErrorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.didTapReload = { [weak self] in self?.didTapReload?() }
        view.isHidden = true
        return view
    }()
    
    private lazy var viewData: ListDataView = {
        let view = ListDataView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.didTapMovie = { [weak self] in self?.didTapMovie?($0) }
        view.isHidden = true
        return view
    }()
    
    // MARK: - Life Cyle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraintUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(state: ListState) {
        switch state {
        case let .isLoading(isLoading):
            setLoadingView(isLoading: isLoading)
        case let .hasData(data):
            setDataView(data: data)
        case let .hasError(message):
            setErrorView(message: message)
        case .idle:
            setDataView(data: .init(page: 0, totalResults: 0, totalPages: 0, results: []))
        }
    }
    
    // MARK: - Setup

    private func constraintUI() {
        addSubview(view)
        view.addSubview(viewLoading)
        view.addSubview(viewError)
        view.addSubview(viewData)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            viewLoading.topAnchor.constraint(equalTo: view.topAnchor),
            viewLoading.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewLoading.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewLoading.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            viewError.topAnchor.constraint(equalTo: view.topAnchor),
            viewError.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewError.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewError.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            viewData.topAnchor.constraint(equalTo: view.topAnchor),
            viewData.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewData.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewData.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    // MARK: - Private Functions
    
    private func setLoadingView(isLoading: Bool) {
//        DispatchQueue.main.async { [weak self] in
            self.viewLoading.isHidden = !isLoading
            self.viewError.isHidden = true
            self.viewData.isHidden = true
//        }
    }
    
    private func setDataView(data: MoviesList) {
//        DispatchQueue.main.async { [weak self] in
            self.viewError.isHidden = true
            self.viewLoading.isHidden = true
            self.viewData.isHidden = false
            self.viewData.setupUI(data: data)
//        }
    }

    private func setErrorView(message: String) {
//        DispatchQueue.main.async { [weak self] in
            self.viewError.isHidden = false
            self.viewLoading.isHidden = true
            self.viewData.isHidden = true
            self.viewError.setupUI(message: message)
//        }
    }
}
