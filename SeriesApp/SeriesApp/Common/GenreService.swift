//
//  GenreService.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 16/03/2021.
//

import Foundation

class GenreService {
    static let shared = GenreService()
    public var genres: [GenreModel] = []
}
