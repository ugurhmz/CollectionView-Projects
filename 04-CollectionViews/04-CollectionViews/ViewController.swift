//
//  ViewController.swift
//  04-CollectionViews
//
//  Created by ugur-pc on 7.04.2022.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    private let generalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: ViewController.createCompositionalLayout())
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        // register
        cv.register(UICollectionViewCell.self,
                    forCellWithReuseIdentifier: "cellId")
       
        cv.register(HeaderReusableView.self, forSupplementaryViewOfKind: "header", withReuseIdentifier:   HeaderReusableView.identifier)
        return cv
    }()
    
    
    
    
   static func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
       let mylayout = UICollectionViewCompositionalLayout {  (index, environment) -> NSCollectionLayoutSection? in
          
           return  ViewController.createSectionFor(index: index, environment: environment)
        }
        
        return mylayout
    }
    
    
    static func createSectionFor(index: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        
        switch index {
        case 0:
            return createFirstSection()
        case 1:
            return createFirstSection()
        case 2:
            return createFirstSection()
        default:
            return  createFirstSection()
        }
    }
    
    
    
    
    static func createFirstSection() -> NSCollectionLayoutSection {
        
        let inset: CGFloat = 2.5
    
        
        
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
       
        
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        
        // suplemantary
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header", alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    

    
    private func setupViews(){
        [generalCollectionView].forEach{ view.addSubview($0)}
        generalCollectionView.dataSource = self
        //generalCollectionView.delegate = self
        
        generalCollectionView.collectionViewLayout =  ViewController.createCompositionalLayout()
        
        
        setConstraints()
    }
}


//MARK: - Constraints
extension ViewController {
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            generalCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            generalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            generalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            generalCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}



//MARK: - DataSource
extension ViewController: UICollectionViewDataSource {
    
    // numberOfSections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return section == 2 ?  15 : 5
    }
    
    
    // cellForItemAt
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = generalCollectionView.dequeueReusableCell(withReuseIdentifier: "cellId",
                                                             for: indexPath)
        
        // RANDOM COLORS
        cell.backgroundColor =   UIColor(hue: CGFloat(drand48()),
                                         saturation: 1,
                                         brightness: 1,
                                         alpha: 1)
        
        return cell
    }
    
    
    // viewForSupplementaryElementOfKind
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: HeaderReusableView.identifier, for: indexPath) as! HeaderReusableView
        
        view.titleLabel.text =  indexPath.section == 1 ?  "Recently Viewed" : "Browse  by category"
        
        return view
    }
    
    
}
