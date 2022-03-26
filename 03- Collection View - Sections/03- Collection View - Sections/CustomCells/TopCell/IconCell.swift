//
//  IconCell.swift
//  03- Collection View - Sections
//
//  Created by ugur-pc on 23.03.2022.
//

import UIKit

class IconCell: UICollectionViewCell {
    
    
    static var identifier = "IconCell"
    
    
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 15
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "spider")
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    
    func setupViews() {
        contentView.addSubview(imageView)
        setImageConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}


//MARK: -  Constraints
extension IconCell {
    
    private func setImageConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
