//
//  ViewController.swift
//  03- Collection View - Sections
//
//  Created by ugur-pc on 22.03.2022.
//

import UIKit

class MainVC: UIViewController {

   
    //image
    private let myView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "mybg")
        iv.contentMode = .scaleAspectFill
        
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    
    // Collection view ekle
    private let myCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        // collectionview özelleştirme
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupViews()
    }


    func setupViews(){
        view.addSubview(myView)
        view.addSubview(myCollectionView)
        setCollectionViewConstraints()
        setImageConstraint()
    }
    
}



//MARK: - Constraints.
extension MainVC {
    
    // image constraint
    func setImageConstraint(){
        NSLayoutConstraint.activate([
            myView.topAnchor.constraint(equalTo: view.topAnchor),
            myView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    
   // collectionView
    func setCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            myCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }
    
    
    
}
