//
//  DetailProtocol.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation

// MARK: - ViewController

protocol DetailViewControllerProtocol: AnyObject {
    func setupUI(state: DetailState)
}

// MARK: - ViewModel

protocol DetailViewModelProtocol {
    var viewController: DetailViewControllerProtocol? { get set }
    func viewDidLoad()
}

// MARK: - FlowController

protocol DetailViewFlowProtocol: AnyObject { }
