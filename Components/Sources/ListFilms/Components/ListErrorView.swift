//
//  ListErrorView.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation
import UIKit

final class ListErrorView: UIView {
    
    // MARK: - Constants
    
    private struct Metrics {
        static let borderWidth: CGFloat = 1.0
        static let contentSpace: CGFloat = 16.0
        static let componentesSpace: CGFloat = 24.0
        static let buttonTopSpace: CGFloat = 32.0
        static let bottonWidth: CGFloat = 130.0
        static let imageHeight: CGFloat = 200.0
    }
    
    private struct Constants {
        static let titleText: String = "Recarregar informações"
        static let contentText: String = "No momento não foi possível mostrar as informações. Que tal tentar novamente?"
        static let buttonText: String = "RECARREGAR"
    }
    
    // MARK: - Actions
    
    var didTapReload: (() -> Void)? 
    
    // MARK: - Life Cyle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraintUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private lazy var alertImage: UIImageView = {
        let image = UIImageView()
        image.image = .imageAlert
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = Constants.titleText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cotentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = Constants.contentText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var reloadButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.buttonText, for: .normal)
        button.setTitleColor(.prussianBlue ,for: .normal)
        button.layer.borderColor = UIColor.primary.cgColor
        button.layer.borderWidth = Metrics.borderWidth
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(reloadTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Actions
    
    @objc private func reloadTapped() {
        didTapReload?()
    }
    
    // MARK: - Setup
    
    private func constraintUI() {
        addSubview(alertImage)
        addSubview(titleLabel)
        addSubview(cotentLabel)
        addSubview(reloadButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            alertImage.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.componentesSpace),
            alertImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            alertImage.heightAnchor.constraint(equalToConstant: Metrics.imageHeight),

            titleLabel.topAnchor.constraint(equalTo: alertImage.bottomAnchor, constant: Metrics.componentesSpace),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.contentSpace),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.contentSpace),
            
            cotentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.contentSpace),
            cotentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.contentSpace),
            cotentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.contentSpace),
            
            reloadButton.topAnchor.constraint(equalTo: cotentLabel.bottomAnchor, constant: Metrics.componentesSpace),
            reloadButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            reloadButton.widthAnchor.constraint(equalToConstant: Metrics.bottonWidth)
            ])
    }
    
    // MARK: - Public Functions
    
    public func setupUI(message: String) {
        cotentLabel.text = message
    }
}
