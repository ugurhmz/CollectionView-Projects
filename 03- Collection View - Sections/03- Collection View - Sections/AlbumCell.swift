//
//  AlbumCell.swift
//  03- Collection View - Sections
//
//  Created by ugur-pc on 23.03.2022.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    
    static var identifier = "AlbumCell"
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    required init?(coder: NSCoder) {
        fatalError("qweqw")
    }
    
    
}
