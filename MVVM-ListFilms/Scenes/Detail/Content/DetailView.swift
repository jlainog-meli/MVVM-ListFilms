//
//  DetailView.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation
import UIKit

final class DetailView: UIView {

    // MARK: - Constants
    
    private struct Metrics {
        static let nameSpacing: CGFloat = 4.0
        static let contentSpacing: CGFloat = 16.0
        static let widthImage: CGFloat = 150.0
        static let heightImage: CGFloat = 220.0
    }
    
    private struct Constants {
        static let nameText: String = "Nome"
        static let genreText: String = "Gênero"
        static let dateText: String = "Data de Lançamento"
        static let overViewText: String = "Visão Geral"
    }
    
    // MARK: - Delegates
    
    weak var delegate: DetailViewViewControllerProtocol?

    // MARK: - UI
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .white
        return scrollView
    }()

    private lazy var imageFilm: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = Constants.nameText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = Constants.genreText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dataLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = Constants.dateText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = Constants.overViewText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentTitleNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentGenreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentDataLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentOverviewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(scrollView)
        scrollView.addSubview(imageFilm)
        scrollView.addSubview(titleNameLabel)
        scrollView.addSubview(genreLabel)
        scrollView.addSubview(dataLabel)
        scrollView.addSubview(overviewLabel)
        scrollView.addSubview(contentTitleNameLabel)
        scrollView.addSubview(contentGenreLabel)
        scrollView.addSubview(contentDataLabel)
        scrollView.addSubview(contentOverviewLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            imageFilm.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Metrics.contentSpacing),
            imageFilm.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            imageFilm.heightAnchor.constraint(equalToConstant: Metrics.heightImage),
            imageFilm.widthAnchor.constraint(equalToConstant: Metrics.widthImage),
            
            titleNameLabel.topAnchor.constraint(equalTo: imageFilm.bottomAnchor, constant: Metrics.contentSpacing),
            titleNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.contentSpacing),
            titleNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.contentSpacing),
            
            contentTitleNameLabel.topAnchor.constraint(equalTo: titleNameLabel.bottomAnchor, constant: Metrics.nameSpacing),
            contentTitleNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.contentSpacing),
            contentTitleNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.contentSpacing),
            
            genreLabel.topAnchor.constraint(equalTo: contentTitleNameLabel.bottomAnchor, constant: Metrics.contentSpacing),
            genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.contentSpacing),
            genreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.nameSpacing),
            
            contentGenreLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: Metrics.nameSpacing),
            contentGenreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.contentSpacing),
            contentGenreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Metrics.contentSpacing),
            
            dataLabel.topAnchor.constraint(equalTo: contentGenreLabel.bottomAnchor, constant: Metrics.contentSpacing),
            dataLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.contentSpacing),
            dataLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.contentSpacing),
            
            contentDataLabel.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: Metrics.nameSpacing),
            contentDataLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.contentSpacing),
            contentDataLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.contentSpacing),
            
            overviewLabel.topAnchor.constraint(equalTo: contentDataLabel.bottomAnchor, constant: Metrics.contentSpacing),
            overviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.contentSpacing),
            overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.contentSpacing),
            
            contentOverviewLabel.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: Metrics.nameSpacing),
            contentOverviewLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -Metrics.contentSpacing),
            contentOverviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.contentSpacing),
            contentOverviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.contentSpacing)
        ])
    }
    
    // MARK: - Private Functions
    
    private func setDataView(data: TopRatedMovieList) {
        contentTitleNameLabel.text = data.title
        contentGenreLabel.text = data.genreIds.description
        contentDataLabel.text = data.releaseDate
        contentOverviewLabel.text = data.overview
        setImage(data: data)
    }
    
    private func setImage(data: TopRatedMovieList) {
        if let urlPhoto = URL(string: data.posterPath) {
            let session = URLSession.shared
            let task = session.dataTask(with: urlPhoto) { [weak imageFilm] data, response, error in
                guard let data = data else {
                    return
                }
                
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    imageFilm?.image = image
                }
            }
        
            task.resume()
        }
    }
}

// MARK: - Extensions

extension DetailView: DetailViewProtocol {
    func setupUI(state: DetailState) {
        switch state {
        case let .hasData(data):
            setDataView(data: data)
        }
    }
}
