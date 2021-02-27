//
//  SerieDTO.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 26/02/2021.
//

import Foundation

struct SerieModel: Decodable {
    let id: Int
    let backdropPath: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case backdropPath = "backdrop_path"
        case name
    }
}
