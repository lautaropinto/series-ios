//
//  HomeProtocols.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 26/02/2021.
//

import Foundation

internal protocol HomeInteractorProtocol {
    func getPopularSeries(_ completion: @escaping ([SerieModel]?) -> Void)
}

internal protocol HomeViewModelMapperProtocol {
    func map(_ popularSeries: [SerieModel]) -> [SerieViewModel]
}

internal protocol HomePresenterProtocol {
    func viewIsReady()
}

internal protocol HomeViewProtocol: AnyObject {
    func displayPopularSeries(viewModel: [SerieViewModel])
}
