//
//  ListViewProtocols.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation

// MARK: - ViewController

protocol ListViewControllerProtocol: AnyObject {
    func setupUI(state: ListState)
}

// MARK: - ViewModel

protocol ListViewModelProtocol {
    func viewDidLoad()
}

// MARK: - FlowController

protocol ListViewFlowProtocol: AnyObject {
    func goToDetail(with data: TopRatedMovieList)
}
