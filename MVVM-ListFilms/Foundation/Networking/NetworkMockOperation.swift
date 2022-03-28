//
//  NetworkMockOperation.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 27/03/22.
//

import Foundation

class NetworkMockOperation {

    // MARK: - Private Attributes

    private let data: Data?
    
    // MARK: - Setup

    init(data: Data?) {
        self.data = data
    }
    
    // MARK: - Private Functions

    private func callNetwork<T: Decodable>(request: RequestProtocol, completion: @escaping (Result<T, NetworkOperationError>) -> Void) {
        guard let jsonData = data else {
            completion(.failure(.noData))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(T.self, from: jsonData)
            completion(.success(decoded))
        } catch {
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


