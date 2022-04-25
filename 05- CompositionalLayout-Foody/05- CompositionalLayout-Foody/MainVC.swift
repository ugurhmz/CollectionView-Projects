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
        cv.register(GeneralCustomCell.self,
                    forCellWithReuseIdentifier: GeneralCustomCell.identifier)
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
                
                    
            } else if sectionNumber == 1 {    // Section 1
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
            } else  if sectionNumber == 2 {
                let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 32
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(125)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                return section
            } else {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(300)))
                item.contentInsets.bottom = 16
                item.contentInsets.trailing = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 32, leading: 16, bottom: 0, trailing: 0)
                
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
        
        
        generalCollectionView.register(HeaderTitleReusableView.self, forSupplementaryViewOfKind: MainVC.categoryHeaderId, withReuseIdentifier: HeaderTitleReusableView.identifier)
    }

}


//MARK: -
extension MainVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderTitleReusableView.identifier, for: indexPath)
        
        return header
    }
}


//MARK: -
extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if section == 0 {
            return 3
        }
        
        if section == 1 {
            return 8
        }
        return 8
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GeneralCustomCell.identifier, for: indexPath) as! GeneralCustomCell
        
        cell.backgroundColor = UIColor(hue: drand48(),
                                       saturation: 1,
                                       brightness: 1,
                                       alpha: 1)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = UIViewController()
        
        switch indexPath.section {
        case 0:
            vc.view.backgroundColor = .yellow
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            vc.view.backgroundColor = .blue
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            vc.view.backgroundColor = .systemOrange
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            vc.view.backgroundColor = .purple
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
        
        
    }
}

