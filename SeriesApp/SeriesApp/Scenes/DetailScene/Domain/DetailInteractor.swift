//
//  DetailInteractor.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 01/03/2021.
//

import Foundation

internal class DetailInteractor: DetailInteractorProtocol {
    let selectedSerie: SerieDetailModel?
    
    init(selectedSerie: SerieDetailModel?) {
        self.selectedSerie = selectedSerie
    }
    
    func getSerieDetail(completion: (SerieDetailModel?) -> Void) {
        if let selectedSerie = self.selectedSerie {
            completion(selectedSerie)
        } else {
            completion(nil)
        }
    }
}
