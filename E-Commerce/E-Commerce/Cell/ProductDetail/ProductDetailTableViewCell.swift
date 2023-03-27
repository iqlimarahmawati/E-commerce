//
//  ProductDetailTableViewCell.swift
//  E-Commerce
//
//  Created by Iqlima Rahmawati on 24/03/23.

import UIKit

class ProductDetailTableViewCell: UITableViewCell {

    static let identifier = "ProductDetailTableViewCell"
   
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var Description: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
