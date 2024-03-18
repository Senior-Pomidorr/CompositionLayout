//
//  CollectionViewCell.swift
//  CompositionLayout
//
//  Created by Daniil Kulikovskiy on 3/18/24.
//

import UIKit

final class SaleCollectionViewCell: UICollectionViewCell {
    
    private let saleImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .white
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        
        NSLayoutConstraint.activate([
            saleImage.topAnchor.constraint(equalTo: topAnchor),
            saleImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            saleImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            saleImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
