//
//  FavoriteCell.swift
//  WorkShopProject
//
//  Created by Huda kamal  on 26/05/2023.
//

import UIKit
import Kingfisher

class FavoriteCell: UITableViewCell {

   
 
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealMaker: UILabel!
    
    @IBOutlet weak var numOfServices: UILabel!

    @IBOutlet weak var mealCountry: UILabel!
  
    @IBOutlet weak var mealImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(localMeals : [Meal]?, indexPath : IndexPath){
        mealName.text = localMeals?[indexPath.row].mealName ?? "MealName"
        mealMaker.text = localMeals?[indexPath.row].mealMaker ?? "MealMaker"
        mealCountry.text = localMeals?[indexPath.row].mealCountry ?? "MealCountry"
        mealImage.kf.setImage(with: URL(string: localMeals?[indexPath.row].mealImage ?? "") ,placeholder: UIImage(named: "RecipePlaceholder" ))
       
        numOfServices.text = "Sevings : \(String(describing: localMeals?[indexPath.row].numOfSurving))"
    }
 
}
