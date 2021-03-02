//
//  HomeViewModelMapper.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 27/02/2021.
//

import UIKit

internal class HomeViewModelMapper: HomeViewModelMapperProtocol {
    func map(_ popularSeries: [SerieModel]) -> [SerieViewModel] {
        return popularSeries.compactMap({ popularSerie in
            return SerieViewModel(id: popularSerie.id,
                                  title: popularSerie.name,
                                  titleColor: .white,
                                  backgroundImageUrl: ImageURLBuilder.buildURL(from: popularSerie.backdropPath),
                                  genre: "",
                                  genreColor: .white)
        })
    }
}
