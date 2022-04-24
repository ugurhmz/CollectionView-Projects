//
//  HeaderReusableView.swift
//  05- CompositionalLayout-Foody
//
//  Created by ugur-pc on 25.04.2022.
//

import UIKit

class HeaderTitleReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderReusableView"
    
     let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.text = "Categories"
        label.font = .systemFont(ofSize: 24, weight: .bold)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("not imp")
    }
}
