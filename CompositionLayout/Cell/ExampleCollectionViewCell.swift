//
//  ExampleCollectionViewCell.swift
//  CompositionLayout
//
//  Created by Daniil Kulikovskiy on 3/18/24.
//

import UIKit

final class ExampleCollectionViewCell: UICollectionViewCell {
    
    private let saleImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .white
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let backgroundTitleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Egg top burger"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial", size: 16)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.textAlignment = .center
        label.text = "7.42$"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial", size: 24)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(imageName: String) {
        saleImage.image = UIImage(named: imageName)
    }
    
    func setupLayout() {
        self.addSubview(saleImage)
        saleImage.addSubview(backgroundTitleView)
        backgroundTitleView.addSubview(nameLabel)
        backgroundTitleView.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            saleImage.topAnchor.constraint(equalTo: topAnchor),
            saleImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            saleImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            saleImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backgroundTitleView.leadingAnchor.constraint(equalTo: saleImage.leadingAnchor),
            backgroundTitleView.trailingAnchor.constraint(equalTo: saleImage.trailingAnchor),
            backgroundTitleView.bottomAnchor.constraint(equalTo: saleImage.bottomAnchor),
            backgroundTitleView.heightAnchor.constraint(equalToConstant: 26),
            
            nameLabel.leadingAnchor.constraint(equalTo: backgroundTitleView.leadingAnchor, constant: 8),
            nameLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: backgroundTitleView.trailingAnchor, constant: -8),
            priceLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor)
        ])
    }
}

