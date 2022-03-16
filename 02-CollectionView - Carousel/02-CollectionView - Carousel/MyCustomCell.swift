//
//  MyCustomCell.swift
//  02-CollectionView - Carousel
//
//  Created by ugur-pc on 16.03.2022.
//

import UIKit

class MyCustomCell: UICollectionViewCell {
    
    static var identifier = "MyCustomCell"
    
    // Modelimdeki property'i alıyor, Cellin UI componentine setliyor.
    var data: CarModel? {
        didSet {
            guard let data = data else { return }
            carImageView.image = data.carImage
        }
    }
    
    
    private let carImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 15
        iv.clipsToBounds = true
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(carImageView)
        
        NSLayoutConstraint.activate([
            carImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            carImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            carImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            carImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("not imp")
    }
}
