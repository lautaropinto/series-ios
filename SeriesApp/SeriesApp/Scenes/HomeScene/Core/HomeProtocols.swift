//
//  HomeProtocols.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 26/02/2021.
//

import Foundation

internal protocol HomeInteractorProtocol {
    func getPopularSeries(_ completion: @escaping ([SerieModel]?) -> Void)
    func getSerieDetail(from id: Int, completion: (SerieModel?) -> Void)
}

internal protocol HomeViewModelMapperProtocol {
    func map(_ popularSeries: [SerieModel]) -> [SerieViewModel]
}

internal protocol HomePresenterProtocol: PresenterProtocol {
    var view: HomeViewProtocol? { get set }
    
    func didTapSerie(viewModel: SerieViewModel)
}

internal protocol HomeViewProtocol: AnyObject {
    func displayPopularSeries(viewModel: [SerieViewModel])
}

internal protocol HomeMainViewDelegate: AnyObject {
    func didTap(viewModel: SerieViewModel?)
}

internal protocol HomeCoordinatorProtocol: CoordinatorProtocol, AnyObject {
    func navigateToDetail(_ serie: SerieModel)
}

