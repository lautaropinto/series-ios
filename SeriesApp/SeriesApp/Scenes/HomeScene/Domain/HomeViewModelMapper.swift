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
                                  titleColor: UIColor(with: "#e1f5ff"),
                                  backgroundImageUrl: ImageURLBuilder.buildURL(from: popularSerie.backdropPath ?? ""),
                                  genre: mapGenre(from: popularSerie.genreIds.first),
                                  genreColor: UIColor.white.withAlphaComponent(0.67))
        })
    }
    
    func mapGenre(from id: Int?) -> String {
        if let id = id {
            let genres = GenreService.shared.genres
            
            return genres.first(where: { $0.id == id })?.name.uppercased() ?? ""
        }
        return ""
    }
}
