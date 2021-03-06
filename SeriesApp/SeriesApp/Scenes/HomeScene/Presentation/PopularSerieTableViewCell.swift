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
    
    var viewModel: SerieViewModel? {
        didSet {
            titleLabel.text = viewModel?.title
            titleLabel.textColor = viewModel?.titleColor
            backgroundImage.downloaded(from: viewModel?.backgroundImageUrl ?? "",
                                       contentMode: .scaleToFill) {
                guard let image = self.backgroundImage.image, let currentCGImage = image.cgImage else { return }
                let currentCIImage = CIImage(cgImage: currentCGImage)

                let filter = CIFilter(name: "CIColorMonochrome")
                filter?.setValue(currentCIImage, forKey: "inputImage")

                filter?.setValue(CIColor(red: 60.0/255.0, green: 86.0/255.0, blue: 99.0/255.0), forKey: "inputColor")

                filter?.setValue(0.9, forKey: "inputIntensity")
                guard let outputImage = filter?.outputImage else { return }

                let context = CIContext()

                if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                    let processedImage = UIImage(cgImage: cgimg)
                    self.backgroundImage.image = processedImage
                }
            }
        }
    }
    
    public weak var delegate: PopularSerieTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        containerView.addSubview(backgroundImage)
        backgroundImage.addSubview(titleLabel)
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
        ])
    }
    
    func setUpAdditionalConfigs() {
        contentView.backgroundColor = .backgroundColor
        let longPressRecognizer = UILongPressGestureRecognizer(target: self,
                                                               action: #selector(onHover))
        longPressRecognizer.minimumPressDuration = 0

        containerView.addGestureRecognizer(longPressRecognizer)
    }
    
    @objc func onHover(gesture:UILongPressGestureRecognizer) {
        if gesture.state == UIGestureRecognizer.State.began {
            containerView.alpha = 0.6
        }
        if gesture.state == UIGestureRecognizer.State.ended {
            containerView.alpha = 1
            delegate?.didTap(viewModel: viewModel)
        }
    }
}

extension UIView {
    func addoverlay(color: UIColor = .black,alpha : CGFloat = 0.6) {
        let overlay = UIView()
        overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlay.frame = bounds
        overlay.backgroundColor = color
        overlay.alpha = alpha
        addSubview(overlay)
    }
}
