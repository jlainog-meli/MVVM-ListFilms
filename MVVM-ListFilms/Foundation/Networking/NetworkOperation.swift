//
//  Network.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 27/03/22.
//

import Foundation

class NetworkOperation {
    
    // MARK: - Private Attributes

    private let baseURL: String = "https://api.themoviedb.org/3/"
    private let privateKey: String = "api_key"
    private let privateKeyValue: String = "c5850ed73901b8d268d0898a8a9d8bff"

    // MARK: - Private Functions

    private func callNetwork<T: Decodable>(request: RequestProtocol, completion: @escaping (Result<T, NetworkOperationError>) -> Void) {
        guard let apiURL = URL(string: baseURL + request.path) else {
            completion(.failure(.noURL))
            return
        }
        
        var requisicao = URLRequest(url: apiURL)

        if let parameters = request.parameters {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                requisicao.httpBody = jsonData
            } catch {
                completion(.failure(.erroParameters))
            }
        }
        
        requisicao.httpMethod = request.method.rawValue
        requisicao.addValue(privateKey, forHTTPHeaderField: privateKeyValue)
        
        let session = URLSession.shared
        let task = session.dataTask(with: requisicao) { (data, response, error) in
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
        
        task.resume()
    }
}

// MARK: - Extensions

extension NetworkOperation: NetworkOperationProtocol {
    func fetchNetwork<T: Decodable>(request: RequestProtocol, completion: @escaping (Result<T, NetworkOperationError>) -> Void) {
        callNetwork(request: request, completion: completion)
    }
}
