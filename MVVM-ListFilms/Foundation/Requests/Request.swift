//
//  Request.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation

protocol RequestProtocol {
    var path: String { get }
    var method: NetworkingRequestsMethods { get }
    var parameters: [String: AnyObject]? { get }
    var headers: [String: Any]? { get }
}
