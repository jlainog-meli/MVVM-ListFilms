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

//    public weak var delegate: DashboardViewControllerDelegate?
    public weak var navigationController: UINavigationController?

    // MARK: - Setup

    public init(navigationController: UINavigationController,
                factory: ListFactoryProtocol) {
        self.navigationController = navigationController
        self.factory = factory
    }
        
    // MARK: - Public Functions

    public func start() {
//        let dashboardContainer = mainFactory.makeDashboardViewController()
//        dashboardContainer.delegate = self
//        navigationController?.setViewControllers([dashboardContainer], animated: true)
    }
}

//extension MainFlowController : DashboardViewControllerDelegate {
//    public func didTapContinue(_ viewController: DashboardViewController) {
//        let detailViewController = mainFactory.makeDetailViewController()
//        navigationController?.setNavigationBarHidden(false, animated: true)
//        navigationController?.pushViewController(detailViewController, animated: true)
//    }
//}
