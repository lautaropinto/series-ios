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
    public weak var view: DetailViewProtocol?
    
    init(interactor: DetailInteractorProtocol, mapper: DetailViewModelMapperProtocol) {
        self.interactor = interactor
        self.mapper = mapper
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
}
