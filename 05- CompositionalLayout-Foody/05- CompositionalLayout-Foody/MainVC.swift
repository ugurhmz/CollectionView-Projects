//
//  ViewController.swift
//  05- CompositionalLayout-Foody
//
//  Created by ugur-pc on 25.04.2022.
//

import UIKit

class MainVC: UIViewController {

    static let categoryHeaderId = "categoryHeaderId"
    
    private let generalCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: MainVC.createLayout())
        cv.register(CustomCell.self,
                    forCellWithReuseIdentifier: CustomCell.identifier)
        return cv
    }()
    
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        return  UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
           
            
            // Section 0
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 2
                item.contentInsets.bottom = 5
                item.contentInsets.leading = 2
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(230)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.orthogonalScrollingBehavior = .paging
           
                return section
                
                    
            } else {    // Section 1
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(150)))
                
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                
                
                section.boundarySupplementaryItems = [
                
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: categoryHeaderId, alignment: .topLeading)
                ]
                
                
                
                return section
            }
            
        }
    }
    
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Food Delivery"
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(generalCollectionView)
        generalCollectionView.backgroundColor = .white
        generalCollectionView.fillSuperview()
        
        generalCollectionView.delegate = self
        generalCollectionView.dataSource = self
        
        
        generalCollectionView.register(HeaderReusableView.self, forSupplementaryViewOfKind: MainVC.categoryHeaderId, withReuseIdentifier: HeaderReusableView.identifier)
    }

}


//MARK: -
extension MainVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderReusableView.identifier, for: indexPath)
        
        return header
    }
}


//MARK: -
extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if section == 0 {
            return 3
        }
        
        return 8
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        
        cell.backgroundColor = UIColor(hue: drand48(),
                                       saturation: 1,
                                       brightness: 1,
                                       alpha: 1)
        
        return cell
    }
    
}

