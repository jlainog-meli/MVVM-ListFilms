//
//  MainFactory.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 27/03/22.
//

protocol ListFactoryProtocol {
    func makeListViewController() -> ListViewController
    func makeDetailViewController(data: TopRatedMovieList) -> DetailViewController
}

