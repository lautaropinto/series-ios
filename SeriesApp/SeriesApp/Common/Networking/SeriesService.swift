//
//  SeriesService.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 26/02/2021.
//

import Foundation

internal protocol SeriesServiceProtocol {
    var network: NetworkingProtocol { get }
    
    func getPopularSeries(_ completion: @escaping (Result<PopularSeries, Error>) -> Void)
    func getGenres(_ completion: @escaping (Result<GenreResult, Error>) -> Void)
}

internal class SeriesService: SeriesServiceProtocol {
    let network: NetworkingProtocol
    
    init(network: NetworkingProtocol) {
        self.network = network
    }
    
    func getPopularSeries(_ completion: @escaping (Result<PopularSeries, Error>) -> Void) {
        network.execute(Endpoint.getPopular, completion: completion)
    }
    
    func getGenres(_ completion: @escaping (Result<GenreResult, Error>) -> Void) {
        network.execute(Endpoint.getGenres, completion: completion)
    }
}
