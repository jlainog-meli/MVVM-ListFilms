//
//  TopRatedMoviesUseCaseTests.swift
//  MVVM-ListFilmsTests
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation
import XCTest
@testable import MVVM_ListFilms

class TopRatedMoviesUseCaseTests: XCTestCase {

    // MARK: - LifeCycle

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    // MARK: - Private Functions

    private func getData(name: String, withExtension: String = "json") -> Data? {
        let bundle = Bundle(for: type(of: self))
        guard let fileUrl = bundle.url(forResource: name, withExtension: withExtension) else {
            return nil
        }
        do {
            let data = try Data(contentsOf: fileUrl)
            return data
        } catch {
            return nil
        }
    }
    
    // MARK: - Tests

    func testTopRatedUseCaseSuccessfully() throws {
        guard let data = getData(name: "topRatedUseCaseSuccessfullyMock") else {
            XCTAssertTrue(false,"No data")
            return
        }
        
        let network: NetworkOperationProtocol = NetworkMockOperation(mockData: data)
        let useCase: TopRatedMoviesUseCaseProtocol = TopRatedMoviesUseCase(network: network)
        var resultRecived: Bool?

        useCase.getTopRatedMovies { result in
            switch result {
            case .success:
                resultRecived = true
            case .failure:
                resultRecived = false
            }
        }

        let hasResult = try XCTUnwrap(resultRecived)
        XCTAssertTrue(hasResult)
    }
    
    func testTopRatedUseCaseError() throws {
        guard let data = getData(name: "topRatedUseCaseErrorMock") else {
            XCTAssertTrue(false,"No data")
            return
        }
        
        let network: NetworkOperationProtocol = NetworkMockOperation(mockData: data)
        let useCase: TopRatedMoviesUseCaseProtocol = TopRatedMoviesUseCase(network: network)
        var resultRecived: Bool?

        useCase.getTopRatedMovies { result in
            switch result {
            case .success:
                resultRecived = false
            case .failure:
                resultRecived = true
            }
        }

        let hasResult = try XCTUnwrap(resultRecived)
        XCTAssertTrue(hasResult)
    }
}
