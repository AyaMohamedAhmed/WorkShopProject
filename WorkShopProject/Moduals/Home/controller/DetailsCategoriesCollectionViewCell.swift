//
//  DetailsCategoriesCollectionViewCell.swift
//  WorkShopProject
//
//  Created by Aya Mohamed Ahmed on 27/05/2023.
//

import UIKit

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
    
    func setUp(categories:Categories){
//        reciepeName.text = categories.title
//        numberOfServing.text =
//        typeOfFood.text =
//        namePersonRecipe.text =
        
        
//
//        imageRecipe.kf.setImage(with: URL(string: ?? ""), placeholder: UIImage(named: ""), options: nil, progressBlock: nil, completionHandler: nil)
    }

}
