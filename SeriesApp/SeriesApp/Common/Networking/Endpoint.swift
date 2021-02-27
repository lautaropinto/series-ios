//
//  Endpoint.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 26/02/2021.
//

import Foundation

let apiKey = "208ca80d1e219453796a7f9792d16776"
let baseURL = "https://api.themoviedb.org/3/tv"


internal enum Endpoint: RequestProviding {
    case getPopular
    case getGenres
    
    var urlRequest: URLRequest {
        switch self {
        case .getPopular:
            guard let url = URL(string: "\(baseURL)/popular?api_key=\(apiKey)&language=en-US&page=1") else {
                preconditionFailure("Invalid URL used to create URL instance")
            }
            
            return URLRequest(url: url)
        case .getGenres:
            guard let url = URL(string: "https://api.themoviedb.org/3/genre/tv/list?api_key=\(apiKey)&language=en-US") else {
                preconditionFailure("Invalid URL used to create URL instance")
            }
            
            return URLRequest(url: url)
        }
    }
}
