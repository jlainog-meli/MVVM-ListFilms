//
//  DetailViewController.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation
import UIKit

final class DetailViewController: UIViewController {
        
    // MARK: - Constants

    private enum Constants {
        static let title: String = "Detalhe do filme"
    }
    
    // MARK: - Private Attributes

    private let viewProtocol: DetailViewProtocol
    private let viewModelProtocol: DetailViewModelProtocol

    // MARK: - Public Attributes

    public weak var flowProtocol: DetailViewFlowProtocol?
    
    // MARK: - Setup

    init(
        viewProtocol: DetailViewProtocol,
        viewModelProtocol: DetailViewModelProtocol
    ) {
        self.viewProtocol = viewProtocol
        self.viewModelProtocol = viewModelProtocol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = viewProtocol
        view.delegate = self
        self.view = view
    }
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.title
        loadData()
    }
    
    // MARK: - Private Functions

    private func loadData() {
        viewModelProtocol.viewDidLoad()
    }
}

// MARK: - Extensions

extension DetailViewController: DetailViewControllerProtocol {
    func setupUI(state: DetailState) {
        viewProtocol.setupUI(state: state)
    }
}

extension DetailViewController: DetailViewViewControllerProtocol { }
