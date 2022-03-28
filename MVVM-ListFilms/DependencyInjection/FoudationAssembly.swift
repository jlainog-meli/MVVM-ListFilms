//
//  MainAssembly.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 27/03/22.
//

import Swinject

class FoudationAssembly: Assembly {
    func assemble(container: Container) {
        
        // MARK: - Factory
        
        container.register(ListFactoryProtocol.self) { resolver in
            return ListFactory(resolver: resolver)
        }
        
        // MARK: - NetworkOperation
        
        container.register(NetworkOperationProtocol.self) { _ in
            return NetworkOperation()
        }
        
        // MARK: - FlowController
        
        container.register(FlowController.self) { (resolver: Resolver, navigationController: UINavigationController) in
            let listFactory = resolver.resolve(ListFactoryProtocol.self)!
            return FlowController(navigationController: navigationController, factory: listFactory)
        }
    }
}
