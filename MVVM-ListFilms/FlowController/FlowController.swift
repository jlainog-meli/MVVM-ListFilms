//
//  FlowController.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import UIKit

class FlowController {
    
    // MARK: - Private Attributes

    private let factory: ListFactoryProtocol
    
    // MARK: - Public Attributes

    public weak var navigationController: UINavigationController?

    // MARK: - Setup

    public init(navigationController: UINavigationController,
                factory: ListFactoryProtocol) {
        self.navigationController = navigationController
        self.factory = factory
    }
        
    // MARK: - Public Functions

    public func start() {
        var viewController = factory.makeListViewController()
        viewController.flowProtocol = self
        navigationController?.setViewControllers([viewController], animated: true)
    }
}

// MARK: - Extension

extension FlowController: ListViewFlowProtocol {
    func goToDetail(with data: TopRatedMovieList) {
        let viewController = factory.makeDetailViewController()
        viewController.flowProtocol = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension FlowController: DetailViewFlowProtocol { }
