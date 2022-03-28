//
//  CardsMockResponse.swift
//  MVVM-ListFilmsTests
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation

struct CardsMockResponse: Codable {
    let cards: [CardsMockListResponse]
}

struct CardsMockListResponse: Codable {
    let id: Int
    let productId: Int
    let type: String
    let title: String?
    let number: String?
}
