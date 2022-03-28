//
//  DetailViewProtocol.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation
import UIKit

// MARK: - EnumState

enum DetailState {
    case hasData(data: TopRatedMovieList)
}

// MARK: - ViewController

protocol DetailViewViewControllerProtocol: AnyObject { }

// MARK: - View

protocol DetailViewProtocol: UIView {
    var delegate: DetailViewViewControllerProtocol? { get set }
    func setupUI(state: DetailState)
}
