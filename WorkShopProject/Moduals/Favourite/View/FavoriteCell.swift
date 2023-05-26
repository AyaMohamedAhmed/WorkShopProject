//
//  FavoriteCell.swift
//  WorkShopProject
//
//  Created by Huda kamal  on 26/05/2023.
//

import UIKit

class FavoriteCell: UITableViewCell {

    @IBOutlet weak var foodRecipe: UILabel!
    
    @IBOutlet weak var foodMaker: UILabel!
    
    @IBOutlet weak var category: UILabel!
    
    @IBOutlet weak var numberOfServings: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   

    
}
