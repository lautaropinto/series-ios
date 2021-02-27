//
//  ViewController.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 26/02/2021.
//

import UIKit

class HomeViewController: UIViewController, ProgramaticalLayout {
    lazy var mainView: HomeMainView = {
        let view = HomeMainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var presenter: HomePresenterProtocol
    
    public init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        presenter.viewIsReady()
        setUpView()
    }
    
    func buildViewHierarchy() {
        view.addSubview(mainView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.safeTopAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension HomeViewController: HomeViewProtocol {
    func displayPopularSeries(viewModel: [SerieViewModel]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            self.mainView.displayPopularSeries(viewModel: viewModel)
        }
    }
}
