//
//  PopularSerieTableViewCell.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 27/02/2021.
//

import UIKit

internal class PopularSerieTableViewCell: UITableViewCell, ProgramaticalLayout {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 3
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(with: "#1e2b31").withAlphaComponent(0.8)
        label.textColor = .white
        label.layer.cornerRadius = 3
        label.font = UIFont.systemFont(ofSize: 12)
        
        return label
    }()
    
    private var backgroundLayer = GradientColors().layer
    
    var viewModel: SerieViewModel? {
        didSet {
            titleLabel.text = viewModel?.title
            titleLabel.textColor = viewModel?.titleColor
            genreLabel.text = viewModel?.genre
            backgroundImage.downloaded(from: viewModel?.backgroundImageUrl ?? "",
                                       contentMode: .scaleToFill) {
                guard self.backgroundImage.image != nil else { return }
                    self.backgroundImage.untint()
                    self.backgroundLayer!.frame = self.backgroundImage.frame
                    self.backgroundLayer!.removeFromSuperlayer()
                    self.backgroundImage.layer.insertSublayer(self.backgroundLayer!, at: 0)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        containerView.addSubview(backgroundImage)
        backgroundImage.addSubview(titleLabel)
        backgroundImage.addSubview(genreLabel)
        contentView.addSubview(containerView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalToConstant: 150),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            backgroundImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -15),
            genreLabel.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 12),
            genreLabel.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -12),
        ])
    }
    
    func setUpAdditionalConfigs() {
        contentView.backgroundColor = .backgroundColor
    }
}
