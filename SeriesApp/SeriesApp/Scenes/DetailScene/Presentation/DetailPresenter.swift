//
//  DetailPresenter.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 01/03/2021.
//

import Foundation

internal class DetailPresenter: DetailPresenterProtocol {
    let interactor: DetailInteractorProtocol
    let mapper: DetailViewModelMapperProtocol
    let coordinator: DetailCoordinatorProtocol
    public weak var view: DetailViewProtocol?
    
    init(interactor: DetailInteractorProtocol, mapper: DetailViewModelMapperProtocol, coordinator: DetailCoordinatorProtocol) {
        self.interactor = interactor
        self.mapper = mapper
        self.coordinator = coordinator
    }
    
    func viewIsReady() {
        interactor.getSerieDetail(completion: { detail in
            if let detail = detail {
                let viewModel = mapper.map(detail)
                
                view?.displaySerieDetail(viewModel: viewModel)
            } else {
                //TODO: View should display error message.
            }
        })
    }
    
    func backButtonPressed() {
        coordinator.navigateToPreviousScene()
    }
}
