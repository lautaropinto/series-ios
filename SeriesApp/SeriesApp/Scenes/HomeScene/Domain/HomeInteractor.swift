//
//  HomeInteractor.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 26/02/2021.
//

import Foundation

internal class HomeInteractor: HomeInteractorProtocol {
    let service: SeriesServiceProtocol
    
    init(service: SeriesServiceProtocol, mapper: HomeViewModelMapperProtocol) {
        self.service = service
    }
    
    func getPopularSeries(_ completion: @escaping ([SerieModel]?) -> Void) {
        self.service.getPopularSeries { result in
            do {
                let result = try result.get()
                completion(result.results)
            } catch {
                completion(nil)
            }
        }
    }
}
