//
//  ListViewViewModel.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import UIKit

class ListViewModel {

    // MARK: - Public Attributes

    weak var viewController: ListViewControllerProtocol?
    
    // MARK: - Private Attributes
    
    private let topRatedMoviesUseCase: TopRatedMoviesUseCaseProtocol
    
    // MARK: - Setup

    init(viewController: ListViewControllerProtocol,
         topRatedMoviesUseCase: TopRatedMoviesUseCaseProtocol) {
        self.viewController = viewController
        self.topRatedMoviesUseCase = topRatedMoviesUseCase
    }
    
    
    // MARK: Private Functions
    
    private func callService() {
        topRatedMoviesUseCase.getTopRatedMovies { [weak self] result in
            switch result {
            case let .success(response):
                self?.createCustomModel(response: response)
            case let .failure(error):
                self?.viewController?.setupUI(state: .hasError(message: error.text))
            }
        }
    }
    
    private func createCustomModel(response: TopRatedMoviesResponse) {
        self.viewController?.setupUI(state: .hasError(message: "error.text"))
    }
}

// MARK: - Extensions

extension ListViewModel: ListViewModelProtocol {
    func viewDidLoad() {
        callService()
    }
}


