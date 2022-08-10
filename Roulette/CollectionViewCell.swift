//
//  CollectionViewCell.swift
//  Roulette
//
//  Created by Alex on 04.08.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    override func layoutSubviews() {
        propElem()
    }
    
    func propElem() {
        numberLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)

    }
}
