//
//  Protocols.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 26/02/2021.
//

import UIKit

internal protocol RequestProviding {
    var urlRequest: URLRequest { get }
}

internal protocol NetworkingProtocol {
    func execute<T: Decodable>(_ requestProvider: RequestProviding,
                               completion: @escaping (Result<T, Error>) -> Void)
}

internal protocol NavigatorProtocol {
    func push(_ viewController: UIViewController, animated: Bool)
    func popToRoot(animated: Bool)
    func pop(animated: Bool)
    func setRoot(_ viewController: UIViewController)
}

internal protocol CoordinatorProtocol {
    var navigator: NavigatorProtocol { get }
    
    func start()
}

internal protocol ProgramaticalLayout {
    func setUpView()
    func buildViewHierarchy()
    func setUpConstraints()
    func setUpAdditionalConfigs()
}

internal extension ProgramaticalLayout {
    
    func setUpView() {
        buildViewHierarchy()
        setUpConstraints()
        setUpAdditionalConfigs()
    }
    
    func setUpAdditionalConfigs() {}
}

internal protocol PresenterProtocol {
    func viewIsReady()
}
