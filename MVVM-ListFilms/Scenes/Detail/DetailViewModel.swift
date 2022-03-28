//
//  DetailViewModel.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import UIKit

final class DetailViewModel {

    // MARK: - Public Attributes

    public weak var viewController: DetailViewControllerProtocol?
    
    // MARK: - Private Attributes
    
    private let data: TopRatedMovieList
    
    // MARK: - Setup

    init(data: TopRatedMovieList) {
        self.data = data
    }
    
    // MARK: - Private Functions
    
    private func loadScreen() {
        self.viewController?.setupUI(state: .hasData(data: data))
    }
}

// MARK: - Extensions

extension DetailViewModel: DetailViewModelProtocol {
    func viewDidLoad() {
        loadScreen()
    }
}


