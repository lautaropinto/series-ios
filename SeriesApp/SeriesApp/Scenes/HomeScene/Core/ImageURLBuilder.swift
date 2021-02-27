//
//  ImageURLBuilder.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 27/02/2021.
//

import Foundation

class ImageURLBuilder {
    static func buildURL(from url: String) -> String {
        return "https://image.tmdb.org/t/p/w500\(url)"
    }
}
