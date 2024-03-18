//
//  CategoriesCollectionViewCell.swift
//  CompositionLayout
//
//  Created by Daniil Kulikovskiy on 3/18/24.
//

import UIKit

final class CategoriesCollectionViewCell: UICollectionViewCell {
    
    private let saleImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .white
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let categoryLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Label text"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(imageName: String, categoryText: String) {
        categoryLabel.text = categoryText
        saleImage.image = UIImage(named: imageName)
    }
    
    func setupLayout() {
        addSubview(saleImage)
        addSubview(categoryLabel)
        
        NSLayoutConstraint.activate([
            
            saleImage.topAnchor.constraint(equalTo: topAnchor),
            saleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            saleImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            saleImage.bottomAnchor.constraint(equalTo: categoryLabel.topAnchor),
            saleImage.heightAnchor.constraint(equalToConstant: 40),
            
            
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            categoryLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}

