//
//  ViewController.swift
//  03- Collection View - Sections
//
//  Created by ugur-pc on 22.03.2022.
//

import UIKit

class MainVC: UIViewController {
    
    static var bottomImageArr = ["a5","a3","v1","v2","v3", "v4"]
    static var albumArr = ["v1","v2","a3","a4","a5","a6","a7","a8","v3","v1","a2","v3", "v4"
    
    ]
    
    
   
    //Background Image, All views
    private let myView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "bl2")
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
        layout.minimumLineSpacing = 5
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        // Custom Cell için register
        cv.register(TopImageCell.self,
                                  forCellWithReuseIdentifier: TopImageCell.identifier)
        cv.register(BottomCell.self,
                                  forCellWithReuseIdentifier: BottomCell.identifier)
        
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
        
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
    
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


//MARK: - Delegate, DataSource
extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //  2 tane bölümüm olsun
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    // Kaçtane Hücre oluşturulacağı
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return MainVC.albumArr.count
        }
        
        return 1
    }
    
    
    // Hücrelerin verisini buraya yazıyoruz
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        // bttmCell Section
        if indexPath.section == 1 {
            
            let bttmCell = myCollectionView.dequeueReusableCell(withReuseIdentifier: BottomCell.identifier, for: indexPath) as! BottomCell
            
            bttmCell.bottomImages = MainVC.albumArr[indexPath.item]
            
            
            return bttmCell
        }
        
        
        
        // topCell ALBUM Section
        let topCell = myCollectionView.dequeueReusableCell(withReuseIdentifier: TopImageCell.identifier, for: indexPath) as! TopImageCell
        topCell.myImages = MainVC.bottomImageArr
        
        return topCell
    }
    
    
    
    
}


//MARK: -  UICollectionViewFlowLayoutDelegate
extension MainVC: UICollectionViewDelegateFlowLayout {
    
    // Her hücre boyutu, width, height
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Section 1 için
        if indexPath.section == 1 {
            return CGSize(width: (view.frame.width / 3) - 16 ,
                          height: 100)
        }
        // Üst section için
        return CGSize(width: view.frame.width, height: 400)
    }
    
    
    
    
    // Hücreler arası boşluk
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
