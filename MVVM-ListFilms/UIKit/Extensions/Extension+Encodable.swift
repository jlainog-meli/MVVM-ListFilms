//
//  Extension+Encodable.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import UIKit

public extension Encodable {
    func convertToData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
