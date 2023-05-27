//
//  DetailsCategoriesCollectionViewCell.swift
//  WorkShopProject
//
//  Created by Aya Mohamed Ahmed on 27/05/2023.
//

import UIKit
import Kingfisher
class DetailsCategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageRecipe: UIImageView!
    @IBOutlet weak var numberOfServing: UILabel!
    @IBOutlet weak var typeOfFood: UILabel!
    @IBOutlet weak var namePersonRecipe: UILabel!
    @IBOutlet weak var reciepeName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(recipe:Result){
        reciepeName.text = recipe.name
        typeOfFood.text = recipe.brand?.name
        namePersonRecipe.text = "\(recipe.numServings)"
        imageRecipe.kf.setImage(with: URL(string:recipe.thumbnailURL ?? ""), placeholder: UIImage(named: ""))
    }
    
}
