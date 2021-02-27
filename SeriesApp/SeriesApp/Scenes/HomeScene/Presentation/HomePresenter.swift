//
//  HomePresenter.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 27/02/2021.
//

import Foundation

internal class HomePresenter: HomePresenterProtocol {
    let interactor: HomeInteractorProtocol
    let mapper: HomeViewModelMapperProtocol
    public weak var view: HomeViewProtocol?
    
    init(interactor: HomeInteractorProtocol, mapper: HomeViewModelMapperProtocol) {
        self.interactor = interactor
        self.mapper = mapper
    }
    
    func viewIsReady() {
        interactor.getPopularSeries { [weak self] result in
            guard let self = self else { return }
            
            if let popularSeries = result {
                let viewModel = self.mapper.map(popularSeries)
                self.view?.displayPopularSeries(viewModel: viewModel)
            } else {
                //TODO: View should display error message.
            }
        }
    }
}
