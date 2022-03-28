//
//  ListView.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation
import UIKit

class ListView: UIView {
    
    // MARK: - Private Attributes


    // MARK: - Delegates
    
    weak var delegate: ListViewViewControllerProtocol?

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
        
    // MARK: - Life Cyle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraintUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup

    private func constraintUI() {
        self.addSubview(view)
        view.addSubview(viewLoading)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            viewLoading.topAnchor.constraint(equalTo: view.topAnchor),
            viewLoading.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewLoading.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewLoading.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    // MARK: - Private Functions
    
    private func setLoadingView(isLoading: Bool) {
        viewLoading.isHidden = !isLoading
    }
    
    private func setDataView(data: TopRatedMovies) {
        
    }

    private func setErrorView(message: String) {
        
    }
    
}

// MARK: - Extensions

extension ListView: ListViewProtocol {
    func setupUI(state: ListState) {
        switch state {
        case let .isLoading(isLoading):
            setLoadingView(isLoading: isLoading)
        case let .hasData(data):
            setDataView(data: data)
        case let .hasError(message):
            setErrorView(message: message)
        }
    }
}
