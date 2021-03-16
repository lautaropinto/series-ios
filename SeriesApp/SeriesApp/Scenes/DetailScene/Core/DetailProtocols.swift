//
//  DetailProtocols.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 27/02/2021.
//

import UIKit

internal protocol DetailCoordinatorProtocol: CoordinatorProtocol {
    func navigateToPreviousScene()
}

internal protocol DetailInteractorProtocol {
    func getSerieDetail(completion: (SerieDetailModel?) -> Void)
}

internal protocol DetailPresenterProtocol: PresenterProtocol {
    var view: DetailViewProtocol? { get set }
    
    func backButtonPressed()
}

internal protocol DetailViewProtocol: AnyObject {
    func displaySerieDetail(viewModel: SerieDetailViewModel)
}

internal protocol DetailMainViewDelegate: AnyObject {
    func tintNavBar(with color: UIColor)
    func backButtonPressed()
}

internal protocol DetailViewModelMapperProtocol {
    func map(_ serieDetail: SerieDetailModel) -> SerieDetailViewModel
}
