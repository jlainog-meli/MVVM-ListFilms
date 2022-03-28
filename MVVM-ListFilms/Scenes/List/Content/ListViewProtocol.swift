//
//  ListViewProtocol.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation
import UIKit

// MARK: - EnumState

enum ListState {
    case hasData(data: TopRatedMovies)
    case hasError(message: String)
}

// MARK: - ViewController

protocol ListViewViewControllerProtocol: AnyObject {

}

// MARK: - View

protocol ListViewProtocol: UIView {
    var delegate: ListViewViewControllerProtocol? { get set }
    func setupUI(state: ListState)
}
