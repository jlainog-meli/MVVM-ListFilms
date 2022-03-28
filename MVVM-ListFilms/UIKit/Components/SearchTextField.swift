//
//  SearchTextField.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import UIKit

public class SearchTextField: UITextField {
    
    // MARK: - Constants
    
    private struct Constants {
        static let defaultPlaceholder: String = "Pesquisar"
    }
    
    public struct Metrics {
        static let borderWidth: CGFloat = 1.0
        static let cornerRadius: CGFloat = 6.0
        static let imageSize: CGFloat = 24.0
    }
    
    // MARK: - Public Attributes

    public override var placeholder: String? {
        didSet {
            guard let placeholder = placeholder else { return }
            let placeHolderColorAttr = [NSAttributedString.Key.foregroundColor : UIColor.lightGrey]
            attributedPlaceholder = NSAttributedString(string: placeholder, attributes: placeHolderColorAttr)
        }
    }
    // MARK: - Initializers

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup

    private func setup() {
        clearButtonMode = .always
        backgroundColor = .solitude
        textColor = .darkGray
        placeholder = Constants.defaultPlaceholder
        layer.borderWidth = Metrics.borderWidth
        layer.borderColor = UIColor.lightGrey.cgColor
            
        layer.masksToBounds = true
        layer.cornerRadius = Metrics.cornerRadius
        
        setLeftView(image: .magnifyingGlassIcon)
    }
}
