//
//  SerieDTO.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 26/02/2021.
//

import Foundation

struct SerieModel: Decodable {
    let id: Int
    let backdropPath: String?
    let name: String
    let genreIds: [Int]
    let posterPath: String?
    let overview: String
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case name
        case genreIds = "genre_ids"
        case posterPath = "poster_path"
        case overview
        case date = "first_air_date"
    }
}
