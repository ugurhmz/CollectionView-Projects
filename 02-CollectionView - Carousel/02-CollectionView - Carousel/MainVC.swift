//
//  ViewController.swift
//  02-CollectionView - Carousel
//
//  Created by ugur-pc on 16.03.2022.
//

import UIKit

class MainVC: UIViewController {

    
    let myData = [
        CarModel(name: "Car One", carImage: UIImage(named: "car1")!),
        CarModel(name: "Car Two", carImage: UIImage(named: "car2")!),
        CarModel(name: "Car Three", carImage: UIImage(named:"car3")!)
    ]
    
    
    private let myCollectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        cv.register(MyCustomCell.self,
                    forCellWithReuseIdentifier: MyCustomCell.identifier)
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    func setupViews() {
        view.addSubview(myCollectionView)
        view.backgroundColor = .white
        setMyCollectionViewConstraints()
        myCollectionView.backgroundColor = .red
    }


}


//MARK: - Constraints
extension MainVC {
    
    private func  setMyCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            myCollectionView.topAnchor.constraint(equalTo: view.topAnchor , constant: 100),
            myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            myCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 2)
        ])
    }
}

