//
//  HomeInteractor.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 26/02/2021.
//

import Foundation

internal class HomeInteractor: HomeInteractorProtocol {
    let service: SeriesServiceProtocol
    var popularSeries: [SerieModel] = []
    
    init(service: SeriesServiceProtocol) {
        self.service = service
    }
    
    func getPopularSeries(_ completion: @escaping ([SerieModel]?) -> Void) {
        self.service.getPopularSeries { [weak self] result in
            guard let self = self else { return }
            
            do {
                let result = try result.get()
                self.popularSeries = result.results
                completion(self.popularSeries)
            } catch {
                print("result:", result)
                completion(nil)
            }
        }
    }
    
    func getSerieDetail(from id: Int, completion: (SerieModel?) -> Void) {
        if let serie = popularSeries.first(where: { $0.id == id }) {
            completion(serie)
        } else {
            completion(nil)
        }
        
    }
}
