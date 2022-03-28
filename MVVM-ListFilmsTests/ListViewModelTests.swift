//
//  ListViewModelTests.swift
//  MVVM-ListFilmsTests
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation
import XCTest
@testable import MVVM_ListFilms

class ListViewModelTests: XCTestCase {

    // MARK: - LifeCycle

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

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

    func testListViewModelStartLoading() throws {
        guard let data = getData(name: "topRatedUseCaseSuccessfullyMock") else {
            XCTAssertTrue(false,"No data")
            return
        }
        
        let network: NetworkOperationProtocol = NetworkMockOperation(mockData: data)
        let useCase: TopRatedMoviesUseCaseProtocol = TopRatedMoviesUseCase(network: network)
        var viewModel: ListViewModelProtocol = ListViewModel(topRatedMoviesUseCase: useCase)
        let viewControllerMock: ListViewControllerProtocol = ListViewModelLoadingTests()
        viewModel.viewController = viewControllerMock
        viewModel.viewDidLoad()
    }
    
    func testListViewModelHasData() throws {
        guard let data = getData(name: "topRatedUseCaseSuccessfullyMock") else {
            XCTAssertTrue(false,"No data")
            return
        }
        
        let network: NetworkOperationProtocol = NetworkMockOperation(mockData: data)
        let useCase: TopRatedMoviesUseCaseProtocol = TopRatedMoviesUseCase(network: network)
        var viewModel: ListViewModelProtocol = ListViewModel(topRatedMoviesUseCase: useCase)
        let viewControllerMock: ListViewControllerProtocol = ListViewModelHasDataTests()
        viewModel.viewController = viewControllerMock
        viewModel.viewDidLoad()
    }
    
    func testListViewModelHasError() throws {
        guard let data = getData(name: "topRatedUseCaseErrorMock") else {
            XCTAssertTrue(false,"No data")
            return
        }
        
        let network: NetworkOperationProtocol = NetworkMockOperation(mockData: data)
        let useCase: TopRatedMoviesUseCaseProtocol = TopRatedMoviesUseCase(network: network)
        var viewModel: ListViewModelProtocol = ListViewModel(topRatedMoviesUseCase: useCase)
        let viewControllerMock: ListViewControllerProtocol = ListViewModelHasErrorTests()
        viewModel.viewController = viewControllerMock
        viewModel.viewDidLoad()
    }
}

class ListViewModelLoadingTests: ListViewControllerProtocol {
    func setupUI(state: ListState) {
        switch state {
        case .isLoading:
            XCTAssertTrue(true)
        default:
            return
        }
    }
}


class ListViewModelHasDataTests: ListViewControllerProtocol {
    func setupUI(state: ListState) {
        switch state {
        case .hasData:
            XCTAssertTrue(true)
        default:
            return
        }
    }
}

class ListViewModelHasErrorTests: ListViewControllerProtocol {
    func setupUI(state: ListState) {
        switch state {
        case .hasError:
            XCTAssertTrue(true)
        default:
            return
        }
    }
}
