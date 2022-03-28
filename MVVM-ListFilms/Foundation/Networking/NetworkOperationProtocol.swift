//
//  NetworkOperationProtocol.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 27/03/22.
//

import Foundation

protocol NetworkOperationProtocol {
    func fetchNetwork<T: Decodable>(request: RequestProtocol, completion: @escaping (Result<T, NetworkOperationError>) -> Void)
}
