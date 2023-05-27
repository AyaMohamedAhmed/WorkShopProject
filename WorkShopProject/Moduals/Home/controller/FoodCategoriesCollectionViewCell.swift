//
//  FoodCategoriesCollectionViewCell.swift
//  WorkShopProject
//
//  Created by Aya Mohamed Ahmed on 27/05/2023.
//

import UIKit

class FoodCategoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoriesImg: UIImageView!
    @IBOutlet weak var categoriesLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
     }
    
    func SetUp(categories:Categories){
        categoriesLbl.text = categories.title
        categoriesImg.image = UIImage(named: categories.img)
    
    }

}
