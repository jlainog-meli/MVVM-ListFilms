//
//  Extension+UITextField.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import UIKit

extension UITextField {
  func setLeftView(image: UIImage) {
    let iconView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 25))
    iconView.image = image
      iconView.contentMode = .scaleAspectFit
    let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
    iconContainerView.addSubview(iconView)
    leftView = iconContainerView
    leftViewMode = .always
    self.tintColor = .lightGray
  }
}
