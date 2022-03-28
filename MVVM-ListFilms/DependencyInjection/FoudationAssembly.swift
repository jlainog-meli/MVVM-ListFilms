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
        
        container.register(ListFactory.self) { resolver in
            return ListFactoryImplementation(resolver: resolver)
        }
        
        // MARK: - NetworkOperation
        
        container.register(NetworkOperationProtocol.self) { _ in
            return NetworkOperation()
        }
        
    }
}
