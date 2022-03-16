//
//  CustomCell.swift
//  01-CollectionView Example
//
//  Created by ugur-pc on 16.03.2022.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    static var identifier = "CustomCell"
    
    
     let imageView: UIImageView = {
       let iv = UIImageView()
        //iv.image = UIImage(named:"spider")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 20
        iv.clipsToBounds = true
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        setImageViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not imp")
    }
    
    
}

extension CustomCell {
    
    private func setImageViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
