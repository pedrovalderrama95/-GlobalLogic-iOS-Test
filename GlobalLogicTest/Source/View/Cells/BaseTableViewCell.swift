//
//  BaseTableViewCell.swift
//  GlobalLogicTest
//
//  Created by Pedro Valderrama on 01/06/2022.
//

import UIKit
import Kingfisher

class BaseTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setData(item: ItemList) {
        titleLabel.text = item.title ?? "Missing Title"
        titleLabel.font = CustomFont.setFontMedium(fontSize: 15)
        
        descriptionLabel.font = CustomFont.setFontMedium(fontSize: 13)
        descriptionLabel.text = item.description ?? "Missing Description"
        iconImageView.kf.setImage(with: item.image)
    }
    
}
