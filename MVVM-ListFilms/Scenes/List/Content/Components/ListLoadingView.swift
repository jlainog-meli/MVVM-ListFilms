//
//  ListViewLoading.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import Foundation
import Lottie
import UIKit

final class ListLoadingView: UIView {
    
    // MARK: - Constants

    private struct Metrics {
        static let lottieViewAnimationSpeed: CGFloat = 2.0
        static let lottieViewCornerRadius: CGFloat = 8.0
        static let contentTopSpace: CGFloat = 8.0
        static let contentSpace: CGFloat = 16.0
        static let lottieHeight: CGFloat = 100.0
    }
    
    // MARK: - Life Cyle

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraintUI()
        setupConstraints()
    }
    
    // MARK: - UI
    
    private lazy var firstItemLottie: AnimationView = {
        let lotView = LottieFactory.grayShimmer()
        lotView.translatesAutoresizingMaskIntoConstraints = false
        lotView.clipsToBounds = true
        lotView.contentMode = .scaleAspectFill
        lotView.layer.cornerRadius = Metrics.lottieViewCornerRadius
        lotView.animationSpeed = Metrics.lottieViewAnimationSpeed
        lotView.play()
        return lotView
    }()
    
    private lazy var seccondItemLottie: AnimationView = {
        let lotView = LottieFactory.grayShimmer()
        lotView.translatesAutoresizingMaskIntoConstraints = false
        lotView.contentMode = .scaleAspectFill
        lotView.clipsToBounds = true
        lotView.layer.cornerRadius = Metrics.lottieViewCornerRadius
        lotView.animationSpeed = Metrics.lottieViewAnimationSpeed
        lotView.play()
        return lotView
    }()
    
    private lazy var thirtyItemLottie: AnimationView = {
        let lotView = LottieFactory.grayShimmer()
        lotView.translatesAutoresizingMaskIntoConstraints = false
        lotView.contentMode = .scaleAspectFill
        lotView.clipsToBounds = true
        lotView.layer.cornerRadius = Metrics.lottieViewCornerRadius
        lotView.animationSpeed = Metrics.lottieViewAnimationSpeed
        lotView.play()
        return lotView
    }()
    
    private lazy var fourthItemLottie: AnimationView = {
        let lotView = LottieFactory.grayShimmer()
        lotView.translatesAutoresizingMaskIntoConstraints = false
        lotView.contentMode = .scaleAspectFill
        lotView.clipsToBounds = true
        lotView.layer.cornerRadius = Metrics.lottieViewCornerRadius
        lotView.animationSpeed = Metrics.lottieViewAnimationSpeed
        lotView.play()
        return lotView
    }()
    
    private lazy var fifthItemLottie: AnimationView = {
        let lotView = LottieFactory.grayShimmer()
        lotView.translatesAutoresizingMaskIntoConstraints = false
        lotView.contentMode = .scaleAspectFill
        lotView.clipsToBounds = true
        lotView.layer.cornerRadius = Metrics.lottieViewCornerRadius
        lotView.animationSpeed = Metrics.lottieViewAnimationSpeed
        lotView.play()
        return lotView
    }()
    
    private lazy var sixthItemLottie: AnimationView = {
        let lotView = LottieFactory.grayShimmer()
        lotView.translatesAutoresizingMaskIntoConstraints = false
        lotView.contentMode = .scaleAspectFill
        lotView.clipsToBounds = true
        lotView.layer.cornerRadius = Metrics.lottieViewCornerRadius
        lotView.animationSpeed = Metrics.lottieViewAnimationSpeed
        lotView.play()
        return lotView
    }()
    
    // MARK: - Setup

    private func constraintUI() {
        addSubview(firstItemLottie)
        addSubview(seccondItemLottie)
        addSubview(thirtyItemLottie)
        addSubview(fourthItemLottie)
        addSubview(fifthItemLottie)
        addSubview(sixthItemLottie)

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            firstItemLottie.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.contentSpace),
            firstItemLottie.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.contentSpace),
            firstItemLottie.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.contentSpace),
            firstItemLottie.heightAnchor.constraint(equalToConstant: Metrics.lottieHeight),
            
            seccondItemLottie.topAnchor.constraint(equalTo: firstItemLottie.bottomAnchor, constant: Metrics.contentTopSpace),
            seccondItemLottie.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.contentSpace),
            seccondItemLottie.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.contentSpace),
            seccondItemLottie.heightAnchor.constraint(equalToConstant: Metrics.lottieHeight),
        
            thirtyItemLottie.topAnchor.constraint(equalTo: seccondItemLottie.bottomAnchor, constant: Metrics.contentTopSpace),
            thirtyItemLottie.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.contentSpace),
            thirtyItemLottie.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.contentSpace),
            thirtyItemLottie.heightAnchor.constraint(equalToConstant: Metrics.lottieHeight),
            
            fourthItemLottie.topAnchor.constraint(equalTo: thirtyItemLottie.bottomAnchor, constant: Metrics.contentTopSpace),
            fourthItemLottie.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.contentSpace),
            fourthItemLottie.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.contentSpace),
            fourthItemLottie.heightAnchor.constraint(equalToConstant: Metrics.lottieHeight),
            
            fifthItemLottie.topAnchor.constraint(equalTo: fourthItemLottie.bottomAnchor, constant: Metrics.contentTopSpace),
            fifthItemLottie.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.contentSpace),
            fifthItemLottie.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.contentSpace),
            fifthItemLottie.heightAnchor.constraint(equalToConstant: Metrics.lottieHeight),
            
            sixthItemLottie.topAnchor.constraint(equalTo: fifthItemLottie.bottomAnchor, constant: Metrics.contentTopSpace),
            sixthItemLottie.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.contentSpace),
            sixthItemLottie.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.contentSpace),
            sixthItemLottie.heightAnchor.constraint(equalToConstant: Metrics.lottieHeight)
            ])
    }
}
