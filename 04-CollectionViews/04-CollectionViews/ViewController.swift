//
//  ViewController.swift
//  04-CollectionViews
//
//  Created by ugur-pc on 7.04.2022.
//

import UIKit

class ViewController: UIViewController {

    
    let otherImgList = ["v1","v2","v3","v4","v5","v6"]
    
    
    private let generalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: ViewController.createCompositionalLayout())
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        // register
        cv.register(UICollectionViewCell.self,
                    forCellWithReuseIdentifier: "cellId")
       
        cv.register(HeaderReusableView.self, forSupplementaryViewOfKind: "header", withReuseIdentifier:   HeaderReusableView.identifier)
        
        cv.register(ZeroCustomCell.self, forCellWithReuseIdentifier: ZeroCustomCell.identifier)
        cv.register(OneCustomCell.self, forCellWithReuseIdentifier: OneCustomCell.identifier)
        return cv
    }()
    
    
    
    
    //MARK: - createCompositionalLayout
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
            return createSecondSection()
        case 2:
            return createThirdSection()
        default:
            return  createFirstSection()
        }
    }
    
    
    //MARK: - FIRST SECTION
    static func createFirstSection() -> NSCollectionLayoutSection {
        
        let inset: CGFloat = 2.5
    
        
        
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        
        
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
       
        
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        
        return section
    }
    
    
    
       //MARK: - SECOND SECTION
       static func createSecondSection() -> NSCollectionLayoutSection {
           
           let inset: CGFloat = 3
           
           // item
           let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4),
                                                 heightDimension: .fractionalHeight(1))
           
           let item = NSCollectionLayoutItem(layoutSize: itemSize)
           item.contentInsets = NSDirectionalEdgeInsets(top: inset,
                                                        leading: inset,
                                                        bottom: inset,
                                                        trailing: inset)
           
           // group
           let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                                  heightDimension: .fractionalHeight(0.25))
           let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                          subitem:  item, count: 2)
           
           // section
           let section = NSCollectionLayoutSection(group: group)
           section.orthogonalScrollingBehavior = .continuous
           
           
           // suplementary
           let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .absolute(45))
           
           let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                    elementKind: "header",
                                                                    alignment: .top)
           section.boundarySupplementaryItems = [header]
           return section
       }
       
    
    
    //MARK: - THIRD SECTION
    static func createThirdSection() -> NSCollectionLayoutSection {
        let inset: CGFloat = 2.5
        
        // items
        let smallItemSize  = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .fractionalHeight(0.5))
        let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
        smallItem.contentInsets = NSDirectionalEdgeInsets(top: inset,
                                                          leading: inset,
                                                          bottom: inset,
                                                          trailing: inset)
        let largeItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                   heightDimension: .fractionalHeight(1))
        let largeItem = NSCollectionLayoutItem(layoutSize: largeItemSize)
        largeItem.contentInsets = NSDirectionalEdgeInsets(top: inset,
                                                          leading: inset,
                                                          bottom: inset,
                                                          trailing: inset)
        
        // group
        let verticalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25),
                                                       heightDimension: .fractionalHeight(1))
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize,
                                                             subitems: [smallItem])
        
        let horizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                         heightDimension: .fractionalHeight(0.4))
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, subitems: [largeItem, verticalGroup, verticalGroup])
        
        
        // section
        let section = NSCollectionLayoutSection(group: horizontalGroup)
        section.orthogonalScrollingBehavior = .groupPaging
        
        // suplementary
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: "header",
                                                                 alignment: .top)
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
        generalCollectionView.delegate = self
        
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
            generalCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
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
        
        if section == 0 {
            return otherImgList.count
        }
        
        if section == 1 {
            return otherImgList.count
        }
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
        
        if indexPath.section == 0 {
            let cell = generalCollectionView.dequeueReusableCell(withReuseIdentifier: ZeroCustomCell.identifier, for: indexPath) as! ZeroCustomCell
            
            otherImgList.forEach({ item in
                cell.imgView.image = UIImage(named: "\(otherImgList[indexPath.row])")
                
            })
            
            
            return cell
        }
        
        if indexPath.section == 1 {
            let cell = generalCollectionView.dequeueReusableCell(withReuseIdentifier: OneCustomCell.identifier, for: indexPath) as! OneCustomCell
            
            
            otherImgList.forEach({ item in
                cell.imgView.image = UIImage(named: "\(otherImgList[indexPath.row])")
                
            })
            
            return cell
        }
        
        return cell
    }
    
    
    // viewForSupplementaryElementOfKind
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: HeaderReusableView.identifier, for: indexPath) as! HeaderReusableView
        
        
        if indexPath.section == 0 {
            view.titleLabel.text = "Zero Category"
        }
        if indexPath.section == 1{
            view.titleLabel.text = "First Category"
        }
        if indexPath.section == 2 {
            view.titleLabel.text = "Second Category"
        }
        
        
        
        return view
    }
     
}


extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            print(indexPath.row)
        }
    }
}
