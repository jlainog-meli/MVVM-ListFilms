//
//  NetworkMockOperation.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 27/03/22.
//

import Foundation

class NetworkMockOperation {

    // MARK: - Private Attributes

    private let resourceName: String
    
    // MARK: - Setup

    init(resourceName: String) {
        self.resourceName = resourceName
    }
    
    // MARK: - Private Functions

    private func callNetwork<T: Decodable>(request: RequestProtocol, completion: @escaping (Result<T, NetworkOperationError>) -> Void) {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "json") else {
            completion(.failure(.noData))
            return
        }
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .secondsSince1970
            let serializedResponse = try decoder.decode(T.self, from: jsonData)
            completion(.success(serializedResponse))
        } catch {
            print(error)
            completion(.failure(.erroParsable))
        }

    }
}

// MARK: - Extensions

extension NetworkMockOperation: NetworkOperationProtocol {
    func fetchNetwork<T: Decodable>(request: RequestProtocol, completion: @escaping (Result<T, NetworkOperationError>) -> Void) {
        callNetwork(request: request, completion: completion)
    }
}


