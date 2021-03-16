//
//  DetailViewController.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 27/02/2021.
//

import UIKit

class DetailViewController: UIViewController, ProgramaticalLayout {
    lazy var mainView: DetailMainView = {
        let view = DetailMainView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        
        return view
    }()
    
    var presenter: DetailPresenterProtocol
    
    init(presenter: DetailPresenterProtocol) {
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
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
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
            mainView.bottomAnchor.constraint(equalTo: view.safeBottomAnchor),
        ])
    }
}

extension DetailViewController: DetailViewProtocol {
    func displaySerieDetail(viewModel: SerieDetailViewModel) {
        mainView.displayDetail(from: viewModel)
        
    }
}

extension DetailViewController: DetailMainViewDelegate {
    func tintNavBar(with color: UIColor) {
        navigationController?.navigationBar.barTintColor = color
        navigationController?.navigationBar.backgroundColor = color
        navigationController?.navigationBar.isTranslucent = false
    }
    
    func backButtonPressed() {
        presenter.backButtonPressed()
    }
}
