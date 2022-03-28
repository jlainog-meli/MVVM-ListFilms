//
//  CardsMockResponse.swift
//  MVVM-ListFilmsTests
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation

struct CardsVIPExampleReponse: Decodable {
    var cards: [CardsVIPExampleListReponse]
}

struct CardsVIPExampleListReponse: Decodable {
    var id: Int
    var productId: Int
    var type: String
    var title: String?
    var number: String?
}
