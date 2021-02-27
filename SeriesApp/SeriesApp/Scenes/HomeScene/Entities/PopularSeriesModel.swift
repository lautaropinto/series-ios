//
//  PopularSeriesModel.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 26/02/2021.
//

import Foundation

struct PopularSeries: Decodable {
    let page: Int
    let results: [SerieModel]
}
