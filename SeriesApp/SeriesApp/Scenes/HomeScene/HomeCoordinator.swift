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
        let controller = HomeViewController()
        
        navigator.setRoot(controller)
    }
}
