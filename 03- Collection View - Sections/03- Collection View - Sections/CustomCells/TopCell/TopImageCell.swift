//
//  CustomCell.swift
//  03- Collection View - Sections
//
//  Created by ugur-pc on 23.03.2022.
//

import UIKit

class TopImageCell: UICollectionViewCell {
    
    var myImages: [String]? {
        didSet {
            myCollectionView.reloadData()
        }
        
    }
    
    static var identifier =  "TopImageCell"
    
    private let myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        
        // register iconCell
        cv.register(IconCell.self,
                    forCellWithReuseIdentifier: IconCell.identifier)
        
        return cv
    }()
   
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("qweqw")
    }
    
    
    func setupViews() {
        contentView.addSubview(myCollectionView)
        
        setCollectionViewConstraints()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        
        
    }
    
}





//MARK: -  Delegate, DataSource
extension TopImageCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    // Kaç tane hücre
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return MainVC.bottomImageArr.count
    }
    
    
    // Cellerin datası
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: IconCell.identifier, for: indexPath) as! IconCell
        
        if let img = myImages?[indexPath.item] {
            cell.imageView.image = UIImage(named: img)
        }
        
        return cell
    }
    
    
    
    // Her bir item w,h
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 200, height: contentView.frame.height - 10)
    }
    
    // Kenar boşluk
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    
    
    
}

//MARK: -  Constraints
extension  TopImageCell {
    
    private func setCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            myCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            myCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            myCollectionView.bottomAnchor.constraint(equalTo:  contentView.bottomAnchor)
        
        ])
    }
}

