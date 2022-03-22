//
//  CustomCell.swift
//  03- Collection View - Sections
//
//  Created by ugur-pc on 23.03.2022.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    static var identifier =  "CustomCell"
    
    
    private let myImage: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "spider")
        return iv
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .green
        
        // Hücre içinde, contetView
        contentView.addSubview(myImage)
        
        myImage.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    required init?(coder: NSCoder) {
        fatalError("qweqw")
    }
    
    
}
