//
//  ListRequest.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation

enum ListRequests: RequestProtocol {
    
    // MARK: - Case

    case getTopRatedMovies
    case getGenreMovie

    // MARK: - Properties

    var path: String {
        switch self {
        case .getTopRatedMovies:
            return "movie/top_rated"
        case .getGenreMovie:
            return "genre/movie/list"
        }
    }

    var method: NetworkingRequestsMethods {
        switch self {
        case .getTopRatedMovies:
            return .GET
        case .getGenreMovie:
            return .GET
        }
    }
    
    var parameters: [String: AnyObject]? {
        return nil
    }

    var headers: [String: Any]? {
        return nil
    }
}
