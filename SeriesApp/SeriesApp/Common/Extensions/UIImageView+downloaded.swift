//
//  UIImageView+downloaded.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 26/02/2021.
//

import UIKit

internal extension UIImageView {
    func downloaded(from url: URL,
                    contentMode mode: UIView.ContentMode = .scaleAspectFit,
                    completion: (() -> Void)? = nil) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
                completion?()
            }
        }.resume()
    }
    
    func downloaded(from link: String,
                    contentMode mode: UIView.ContentMode = .scaleAspectFit,
                    completion: (() -> Void)? = nil) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode, completion: completion)
    }
}
