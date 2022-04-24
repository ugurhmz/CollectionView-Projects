//
//  ViewController.swift
//  05- CompositionalLayout-Foody
//
//  Created by ugur-pc on 25.04.2022.
//

import UIKit

class MainVC: UIViewController {

    
    private let generalCollectionView: UICollectionView = {
        let  layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(generalCollectionView)
        generalCollectionView.backgroundColor = .blue
        generalCollectionView.fillSuperview()
    }

}

