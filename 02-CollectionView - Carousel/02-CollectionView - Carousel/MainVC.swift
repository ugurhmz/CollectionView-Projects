//
//  ViewController.swift
//  02-CollectionView - Carousel
//
//  Created by ugur-pc on 16.03.2022.
//

import UIKit

class MainVC: UIViewController {

    
    let carData = [
        CarModel(name: "Car One", carImage: UIImage(named: "car1")!),
        CarModel(name: "Car Two", carImage: UIImage(named: "car2")!),
        CarModel(name: "Car Three", carImage: UIImage(named:"car3")!),
        CarModel(name: "Car 4", carImage: UIImage(named:"car4")!),
        CarModel(name: "Car 5", carImage: UIImage(named:"car5")!),
        CarModel(name: "Car 6", carImage: UIImage(named:"car6")!)
    ]
    
    
    private let myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
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
        myCollectionView.backgroundColor = .clear
        setMyCollectionViewConstraints()
        view.backgroundColor = .lightGray
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }


}


//MARK: - Constraints
extension MainVC {
    
    private func  setMyCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            myCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor ),
            myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myCollectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 1.2)
        ])
    }
    
   
}



//MARK: - Delegate, DataSource
extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // kaç hücre olcak
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return  carData.count
    }
    
    
    // hücrelerin datası
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: MyCustomCell.identifier, for: indexPath) as! MyCustomCell
        
        cell.data = self.carData[indexPath.item]
        return cell
    }
    
    
    
    
    
}



//MARK: - ViewDelegateFlowLayout
extension MainVC: UICollectionViewDelegateFlowLayout {
    
    // her bir hücre boyutu
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: myCollectionView.frame.width / 2.5,
                      height: myCollectionView.frame.width / 1.2 )
    }
}
