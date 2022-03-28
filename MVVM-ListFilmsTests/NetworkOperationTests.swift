//
//  NetworkOperationTests.swift
//  MVVM-ListFilmsTests
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation
import XCTest
@testable import MVVM_ListFilms

class NetworkOperationTests: XCTestCase {

    // MARK: - LifeCycle

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    // MARK: - Tests

    func testNetworkParseObjectSuccessfully() throws {
        let network: NetworkOperationProtocol = NetworkMockOperation(resourceName: "cardsMock")
        var resultRecived: Bool?

        network.fetchNetwork(request: ListRequests.getGenreMovie) { (result: Result<CardsVIPExampleReponse, NetworkOperationError>) in
            switch result {
            case .success:
                resultRecived = true
            case.failure:
                resultRecived = false
            }
        }

        
        let hasResult = try XCTUnwrap(resultRecived)
        XCTAssertTrue(hasResult)
    }
}
