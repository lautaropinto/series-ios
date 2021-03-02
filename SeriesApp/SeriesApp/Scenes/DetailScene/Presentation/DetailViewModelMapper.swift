//
//  DetailViewModelMapper.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 01/03/2021.
//

import UIKit

internal class DetailViewModelMapper: DetailViewModelMapperProtocol {
    func map(_ serieDetail: SerieDetailModel) -> SerieDetailViewModel {        
        return SerieDetailViewModel(title: serieDetail.title,
                                    year: serieDetail.date,
                                    image: serieDetail.posterPath,
                                    overview: serieDetail.overview,
                                    overviewColor: .white,
                                    backgroundGradient: .backgroundColor)
    }
}
