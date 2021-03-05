//
//  HomeCoordinator.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 26/02/2021.
//

import Foundation

internal class HomeCoordinator: HomeCoordinatorProtocol {
    var navigator: NavigatorProtocol
   
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
    
    func start() {
        let network = NetworkingClient()
        let service = SeriesService(network: network)
        let interactor = HomeInteractor(service: service)
        let mapper = HomeViewModelMapper()
        let presenter = HomePresenter(interactor: interactor, mapper: mapper, coordinator: self)
        let controller = HomeViewController(presenter: presenter)
        
        navigator.setRoot(controller)
    }
    
    func navigateToDetail(_ serie: SerieModel) {
        let selectedSerie = SerieDetailModel(id: serie.id,
                                             title: serie.name,
                                             date: serie.date,
                                             overview: serie.overview,
                                             posterPath: serie.posterPath ?? "")
        
        let detailCoordinator = DetailCoordinator(navigator: navigator, selectedSerie: selectedSerie)
        detailCoordinator.start()
    }
}
