//
//  ViewController.swift
//  CompositionLayout
//
//  Created by Daniil Kulikovskiy on 3/18/24.
//

import UIKit

final class MainCollectionView: UIViewController {
    
    private var sections = MockData.shared.pageData
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstrains()
        setupsViews()
        setDelegates()
    }
    
    private func setupsViews() {
        collectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        collectionView.register(SaleCollectionViewCell.self, forCellWithReuseIdentifier: SaleCollectionViewCell.identifier)
        collectionView.register(ExampleCollectionViewCell.self, forCellWithReuseIdentifier: ExampleCollectionViewCell.identifier)
        collectionView.register(HeaderSupplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderSupplementaryView.identifier)
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - GreateLayout
extension MainCollectionView {
    
    private func setConstrains() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
            case .sales(_):
                return self.createSalesSection()
            case .categories(_):
                return self.createCategorySection()
            case .example(_):
                return self.createExampleSection()
            }
        }
    }
    
    private func createLayoutSection(group: NSCollectionLayoutGroup, behavor: UICollectionLayoutSectionOrthogonalScrollingBehavior, interGroupSpaceing: CGFloat, supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem], contentInsets: Bool) -> NSCollectionLayoutSection {
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavor
        section.interGroupSpacing = interGroupSpaceing
        section.boundarySupplementaryItems = supplementaryItems
        section.supplementariesFollowContentInsets = contentInsets
        return section
    }
    
    private func createSalesSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.2)), subitems: [item])
        
        let section = createLayoutSection(
            group: group,
            behavor: .groupPaging,
            interGroupSpaceing: 5,
            supplementaryItems: [],
            contentInsets: false
        )
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 0)
        return section
    }
    
    private func createCategorySection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.3),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.1)), subitems: [item])
        
        let section = createLayoutSection(
            group: group,
            behavor: .none,
            interGroupSpaceing: 10,
            supplementaryItems: [supplementaryHederItems()],
            contentInsets: true
        )
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    private func createExampleSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.45)), subitems: [item])
        
        let section = createLayoutSection(
            group: group,
            behavor: .continuous,
            interGroupSpaceing: 10,
            supplementaryItems: [supplementaryHederItems()],
            contentInsets: false
        )
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 0)
        return section
    }
    
    func supplementaryHederItems() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(30)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
}

// MARK: - UICollectionViewDelegate
extension MainCollectionView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension MainCollectionView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch self.sections[indexPath.section] {
        case .sales(let sales):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleCollectionViewCell.identifier, for: indexPath) as? SaleCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: sales[indexPath.row].image)
            return cell
        case .categories(let categories):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as? CategoriesCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: categories[indexPath.row].image, categoryText: categories[indexPath.row].name)
            return cell
        case .example(let example):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExampleCollectionViewCell.identifier, for: indexPath) as? ExampleCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: example[indexPath.row].image)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderSupplementaryView.identifier, for: indexPath) as! HeaderSupplementaryView
            header.configureHeader(categoryName: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}
