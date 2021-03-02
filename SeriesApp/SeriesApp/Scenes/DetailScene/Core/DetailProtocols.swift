//
//  DetailProtocols.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 27/02/2021.
//

import Foundation

internal protocol DetailCoordinatorProtocol: CoordinatorProtocol { }

internal protocol DetailInteractorProtocol {
    func getSerieDetail(completion: (SerieDetailModel?) -> Void)
}

internal protocol DetailPresenterProtocol: PresenterProtocol {
    var view: DetailViewProtocol? { get set }
}

internal protocol DetailViewProtocol: AnyObject {
    func displaySerieDetail(viewModel: SerieDetailViewModel)
}

internal protocol DetailViewModelMapperProtocol {
    func map(_ serieDetail: SerieDetailModel) -> SerieDetailViewModel
}
