//
//  DetailCoordinator.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 27/02/2021.
//

import Foundation

internal class DetailCoordinator: DetailCoordinatorProtocol {
    var navigator: NavigatorProtocol
    let selectedSerie: SerieDetailModel
    
    init(navigator: NavigatorProtocol, selectedSerie: SerieDetailModel) {
        self.navigator = navigator
        self.selectedSerie = selectedSerie
    }
    
    func start() {
        
        
        
        DispatchQueue.main.async {
            let interactor = DetailInteractor(selectedSerie: self.selectedSerie)
            let mapper = DetailViewModelMapper()
            let presenter = DetailPresenter(interactor: interactor, mapper: mapper)
            let controller = DetailViewController(presenter: presenter)
            self.navigator.push(controller, animated: true)            
        }
    }
}
