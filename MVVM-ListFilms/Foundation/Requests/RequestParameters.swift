//
//  RequestParameters.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 27/03/22.
//

import Foundation

public enum RequestParameters {
    
    // MARK: - Case

    case body(_: [String: Any]?)
    case queryItems(items: [String: AnyObject])
    case json(model: Encodable)

    // MARK: - Properties

    var rawData: Data? {
        switch self {
        case .json(let encodableModel):
            return encodableModel.convertToData()
        case .body(let body):
            guard let body = body else { return nil }
            return try? JSONSerialization.data(withJSONObject: body, options: [])
        default:
            return nil
        }
    }

    var contentType: String? {
        switch self {
        case .json:
            return "application/json"
        default:
            return nil
        }
    }
}
