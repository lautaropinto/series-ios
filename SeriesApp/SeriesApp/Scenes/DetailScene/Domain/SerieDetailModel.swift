//
//  SerieDetailModel.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 01/03/2021.
//

import Foundation

internal struct SerieDetailModel: Decodable {
    let id: Int
    let title: String
    let date: String
    let overview: String
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case date
        case overview
        case posterPath = "poster_path"
    }
}
