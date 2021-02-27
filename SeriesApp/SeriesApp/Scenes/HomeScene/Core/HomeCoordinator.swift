//
//  HomeCoordinator.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 26/02/2021.
//

import Foundation

internal class HomeCoordinator: CoordinatorProtocol {
    var navigator: NavigatorProtocol
   
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
    
    func start() {
        let network = NetworkingClient()
        let service = SeriesService(network: network)
        let interactor = HomeInteractor(service: service)
        let mapper = HomeViewModelMapper()
        let presenter = HomePresenter(interactor: interactor, mapper: mapper)
        let controller = HomeViewController(presenter: presenter)
        
        navigator.setRoot(controller)
    }
}
