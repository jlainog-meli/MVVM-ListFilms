//
//  NetworkOperationError.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 27/03/22.
//

enum NetworkOperationError: Error {
    
    // MARK: - Case

    case noData
    case erroParsable
    case noURL
    case erroParameters

    // MARK: - Properties

    var text: String {
        switch self {
        case .noData:
            return "Texto customizado para noData"
        case .erroParsable:
            return "Texto customizado para erroParsable"
        case .noURL:
            return "Texto customizado para noURL"
        case .erroParameters:
            return "Texto customizado para erroParameters"
        }
    }
    
    var errorCode: Int {
        switch self {
        case .noData:
            return 01
        case .erroParsable:
            return 02
        case .noURL:
            return 03
        case .erroParameters:
            return 04
        }
    }
}
