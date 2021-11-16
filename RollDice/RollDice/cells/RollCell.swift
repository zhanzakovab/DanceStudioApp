//
//  RollCell.swift
//  RollDice
//
//  Created by Zhanzakova Botakoz on 15.04.2021.
//

import UIKit

class RollCell: UITableViewCell {

    public static let identifier: String = "RollCell"
    
    @IBOutlet weak private var firstLabel: UILabel!
    @IBOutlet weak private var secondLabel: UILabel!
    
    public var roll: (first:Int, second:Int)? {
        didSet{
            if let roll = roll {
                firstLabel.text = "first \(roll.first)"
                secondLabel.text = "second \(roll.second)"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }

}
