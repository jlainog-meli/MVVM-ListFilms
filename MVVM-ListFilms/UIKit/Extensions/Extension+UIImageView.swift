//
//  Extension+UIImageView.swift
//  MVVM-ListFilms
//
//  Created by Lucas De Castro Carvalho on 28/03/22.
//

import UIKit

extension UIImageView {
    private func setImage(url: String) {
        if let urlPhoto = URL(string: url) {
            let session = URLSession.shared
            let task = session.dataTask(with: urlPhoto) { [weak self] data, _, _ in
                guard let data = data else {
                    return
                }
                
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        
            task.resume()
        }
    }
}
