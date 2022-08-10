//
//  TableViewCell.swift
//  Roulette
//
//  Created by Alex on 06.08.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var viewInCell: UIView!
    
    var randomColor = [UIColor.black.cgColor, UIColor.green.cgColor, UIColor.red.cgColor]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewInCell.layer.borderColor = randomColor.randomElement()
        viewInCell.layer.borderWidth = 2
        viewInCell.clipsToBounds = true
        viewInCell.layer.cornerRadius = 10
    }
}
