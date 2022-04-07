//
//  AlbumCell.swift
//  03- Collection View - Sections
//
//  Created by ugur-pc on 23.03.2022.
//

import UIKit

class BottomCell: UICollectionViewCell {
    static var identifier = "BottomCell"
    
    var bottomImages: String? {
        didSet {
            if let img = bottomImages {
                bottomCellImageView.image = UIImage(named: img)
            }
        }
    }
    
    
    let bottomCellImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 15
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("qweqw")
    }
    
    
    func setupViews() {
        contentView.addSubview(bottomCellImageView)
        setBottomCelImageViewConstraints()
    }
    
}



//MARK: - Constraints
extension BottomCell {
    
    private func setBottomCelImageViewConstraints(){
        NSLayoutConstraint.activate([
            bottomCellImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bottomCellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bottomCellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomCellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
}
