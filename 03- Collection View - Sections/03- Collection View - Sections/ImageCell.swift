//
//  CustomCell.swift
//  03- Collection View - Sections
//
//  Created by ugur-pc on 23.03.2022.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    static var identifier =  "CustomCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
    }
    required init?(coder: NSCoder) {
        fatalError("qweqw")
    }
    
    
}
