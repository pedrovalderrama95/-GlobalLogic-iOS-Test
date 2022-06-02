//
//  SingleLabelTableViewCell.swift
//  GlobalLogicTest
//
//  Created by Pedro Valderrama on 01/06/2022.
//

import UIKit

class SingleLabelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setData(item: ItemList) {
        descriptionLabel.font = CustomFont.setFontMedium(fontSize: 15)
        descriptionLabel.text = item.description
    }
}
