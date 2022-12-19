//
//  APITableViewCell.swift
//  apiJsonParsingTask1
//
//  Created by Mac on 21/11/22.
//

import UIKit

class APITableViewCell: UITableViewCell {
    
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var idLabel1: UILabel!
    @IBOutlet var titleLabel2: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
