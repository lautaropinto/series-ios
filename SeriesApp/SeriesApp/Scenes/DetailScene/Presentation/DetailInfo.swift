//
//  DetailInfo.swift
//  SeriesApp
//
//  Created by Lautaro Pinto on 02/03/2021.
//

import UIKit

class DetailInfo: UIView, ProgramaticalLayout {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lautaro Pinto"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        
        return label
    }()
    
    lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1995"
        label.textAlignment = .center
        
        return label
    }()
    
    public var serieTitle: String = "" {
        didSet {
            titleLabel.text = serieTitle
        }
    }
    
    public var serieYear: String = "" {
        didSet {
            yearLabel.text = serieYear
        }
    }

    init() {
        super.init(frame: .zero)
        setUpView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(yearLabel)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            yearLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
//            yearLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    func setUpAdditionalConfigs() {
        backgroundColor = .clear
    }
}
