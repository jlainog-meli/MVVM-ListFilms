//
//  ListViewViewModel.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import UIKit

class ListViewModel {

    // MARK: - Constants

    private enum Constants {
        static let posterPath: String = "https://image.tmdb.org/t/p/w500"
    }
    
    // MARK: - Public Attributes

    public weak var viewController: ListViewControllerProtocol?
    
    // MARK: - Private Attributes
    
    private let topRatedMoviesUseCase: TopRatedMoviesUseCaseProtocol
    
    // MARK: - Setup

    init(topRatedMoviesUseCase: TopRatedMoviesUseCaseProtocol) {
        self.topRatedMoviesUseCase = topRatedMoviesUseCase
    }
    
    // MARK: Private Functions
    
    private func callService() {
        viewController?.setupUI(state: .isLoading(isLoading: true))
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
        let data = TopRatedMovies(
            page: response.page,
            totalResults: response.totalPages,
            totalPages: response.totalPages,
            results: makeTopRatedMovieList(results: response.results))
        self.viewController?.setupUI(state: .hasData(data: data))
    }
                                     
    private func makeTopRatedMovieList(results: [TopRatedListResults]) -> [TopRatedMovieList] {
        var list: [TopRatedMovieList] = []
        results.forEach { item in
            list.append(TopRatedMovieList(
                popularity: item.popularity,
                voteCount: item.voteCount,
                posterPath: Constants.posterPath + item.posterPath,
                genreIds: item.genreIds,
                title: item.title,
                overview: item.overview,
                releaseDate: item.releaseDate))
        }
        return list
    }
}

// MARK: - Extensions

extension ListViewModel: ListViewModelProtocol {
    func viewDidLoad() {
        callService()
    }
}


