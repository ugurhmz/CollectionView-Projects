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
        view.backgroundColor = .white
        setMyCollectionViewConstraints()
        
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
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



//MARK: - Delegate, DataSource
extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // kaç hücre olcak
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    // hücrelerin datası
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: MyCustomCell.identifier, for: indexPath)
        
        cell.backgroundColor = indexPath.row % 2 == 0 ? .green: .red
        return cell
    }
    
    // her bir hücre boyutu
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: myCollectionView.frame.width / 2.5,
                      height: myCollectionView.frame.width / 2 )
        
    }
    
}



//MARK: - ViewDelegateFlowLayout
extension MainVC: UICollectionViewDelegateFlowLayout {
    
}
