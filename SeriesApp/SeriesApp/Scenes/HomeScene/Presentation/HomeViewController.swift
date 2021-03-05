//
//  HomeViewController.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 26/02/2021.
//

import UIKit

class HomeViewController: UIViewController, ProgramaticalLayout {
    lazy var mainView: HomeMainView = {
        let view = HomeMainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpAdditionalConfigs()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func setUpAdditionalConfigs() {
        navigationController?.navigationBar.barTintColor = .navigationColor
        navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = .backgroundColor
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

extension HomeViewController: HomeMainViewDelegate {
    func didTap(viewModel: SerieViewModel?) {
        if let viewModel = viewModel {
            presenter.didTapSerie(viewModel: viewModel)            
        }
    }
}
