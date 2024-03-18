//
//  HeaderSupplementaryView.swift
//  CompositionLayout
//
//  Created by Daniil Kulikovskiy on 3/18/24.
//

import UIKit

final class HeaderSupplementaryView: UICollectionReusableView {
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Arial", size: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
    }
    
    func configureHeader(categoryName: String) {
        headerLabel.text = categoryName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
}
