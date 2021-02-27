//
//  PopularSerieTableViewCell.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 27/02/2021.
//

import UIKit

class PopularSerieTableViewCell: UITableViewCell, ProgramaticalLayout {
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
    
    var viewModel: SerieViewModel? {
        didSet {
            titleLabel.text = viewModel?.title
            titleLabel.textColor = viewModel?.titleColor
            backgroundImage.downloaded(from: viewModel?.backgroundImageUrl ?? "",
                                                 contentMode: .scaleToFill)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  

    func buildViewHierarchy() {
        contentView.addSubview(backgroundImage)
        backgroundImage.addSubview(titleLabel)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.heightAnchor.constraint(equalToConstant: 150),
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -15),
        ])
    }
    
    func setUpAdditionalConfigs() {
        contentView.backgroundColor = .backgroundColor
    }
}
