//
//  MainFactoryImplementation.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 27/03/22.
//

import Swinject

class ListFactory: ListFactoryProtocol {
    
    // MARK: - PRIVATE PROPERTIES
    private let resolver: Resolver
    
    // MARK: - PUBLIC API
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
//    func makeDashboardViewController() -> DashboardViewController {
//        return resolver.resolve(DashboardViewController.self)!
//    }
//    
//    func makeDetailViewController() -> DetailViewController {
//        return resolver.resolve(DetailViewController.self)!
//    }
}
