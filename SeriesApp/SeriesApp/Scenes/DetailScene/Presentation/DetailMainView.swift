//
//  DetailMainView.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 01/03/2021.
//

import UIKit

class DetailMainView: UIView, ProgramaticalLayout {
    lazy var topWrapper: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var topView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 22
        view.alignment = .fill
        view.distribution = .fill
        
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    lazy var serieInfo: DetailInfo = {
        let info = DetailInfo()
        info.translatesAutoresizingMaskIntoConstraints = false
        
        return info
    }()
    
    lazy var suscriptionButton: SuscriptionButton = {
        let button = SuscriptionButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SUSCRIBIRME", for: .normal)
        
        return button
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        
        return view
    }()
    
    lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    var topHeight: NSLayoutConstraint!
    public weak var delegate: DetailMainViewDelegate?
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        topView.addArrangedSubview(imageView)
        topView.addArrangedSubview(serieInfo)
        topWrapper.addSubview(topView)
        topWrapper.addSubview(suscriptionButton)
        scrollView.addSubview(overviewLabel)
        addSubview(topWrapper)
        addSubview(scrollView)
    }
    
    func setUpConstraints() {
        topHeight = topWrapper.heightAnchor.constraint(equalToConstant: 450)
        
        NSLayoutConstraint.activate([
            topWrapper.topAnchor.constraint(equalTo: self.topAnchor),
            topWrapper.widthAnchor.constraint(equalTo: self.widthAnchor),
            topWrapper.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            topView.topAnchor.constraint(equalTo: topWrapper.topAnchor),
            topView.leadingAnchor.constraint(equalTo: topWrapper.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: topWrapper.trailingAnchor),
            topView.bottomAnchor.constraint(equalTo: suscriptionButton.topAnchor, constant: -22),
            topHeight,
            imageView.heightAnchor.constraint(equalTo: topWrapper.heightAnchor, multiplier: 0.6),
            imageView.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.5),
            imageView.topAnchor.constraint(equalTo: topView.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: topWrapper.centerXAnchor),
            serieInfo.centerXAnchor.constraint(equalTo: topWrapper.centerXAnchor),
            suscriptionButton.centerXAnchor.constraint(equalTo: topWrapper.centerXAnchor),
            suscriptionButton.heightAnchor.constraint(equalToConstant: 45),
            suscriptionButton.widthAnchor.constraint(equalTo: topWrapper.widthAnchor, multiplier: 0.52),
            suscriptionButton.bottomAnchor.constraint(equalTo: topWrapper.bottomAnchor, constant: -40),
            scrollView.topAnchor.constraint(equalTo: topWrapper.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            overviewLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            overviewLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8),
            overviewLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            overviewLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
    
    func setUpAdditionalConfigs() {
        backgroundColor = .backgroundColor
    }
    
    func displayDetail(from viewModel: SerieDetailViewModel) {
        serieInfo.serieTitle = viewModel.title
        serieInfo.serieYear = viewModel.year
        imageView.downloaded(from: ImageURLBuilder.buildURL(from: viewModel.image)) {
            self.backgroundColor = self.imageView.image?.averageColor
            self.delegate?.tintNavBar(with: self.imageView.image?.averageColor ?? .navigationColor)
        }
        
        overviewLabel.text = viewModel.overview
    }
    
    let headerViewMaxHeight: CGFloat = 450
    let headerViewMinHeight: CGFloat = 135
}

extension DetailMainView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yPos = scrollView.contentOffset.y
        let newHeaderViewHeight: CGFloat = topHeight.constant - yPos
        if newHeaderViewHeight > headerViewMaxHeight {
            topHeight.constant = headerViewMaxHeight
        } else if newHeaderViewHeight < headerViewMinHeight {
            topHeight.constant = headerViewMinHeight
        } else {
            topHeight.constant = newHeaderViewHeight
            scrollView.contentOffset.y = 0
        }
    }
}
