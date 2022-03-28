//
//  ListView.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation
import UIKit

class ListView: UIView {
    
    // MARK: - Private Attributes


    // MARK: - Delegates
    
    weak var delegate: ListViewViewControllerProtocol?

    // MARK: - UI
    
    private lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    // MARK: - Life Cyle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraintUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup

    private func constraintUI() {
        self.addSubview(view)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }
    
    // MARK: - Private Functions

}

// MARK: - Extensions

extension ListView: ListViewProtocol {
    func setupUI(state: ListState) {
        
    }
}
