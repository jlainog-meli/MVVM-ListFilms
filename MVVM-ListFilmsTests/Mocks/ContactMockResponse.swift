//
//  contactMockResponse.swift
//  MVVM-ListFilmsTests
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation

struct ContactMockResponse: Decodable {
    let id: Int
    let name: String
    let photoURL: String
}
