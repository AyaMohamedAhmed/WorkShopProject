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
    var meal: Meal?
    let cellViewModel = FavCellViewModel(repo: Repo(dataBaseManager: DataBaseManager(), networkManger: NetworkingService()))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(meal:Meal){
        self.meal = meal
        mealName.text = meal.mealName ?? "MealName"
        mealMaker.text = meal.mealMaker ?? "MealMaker"
        mealCountry.text = meal.mealCountry ?? "MealCountry"
        mealImage.kf.setImage(with: URL(string: meal.mealImage ?? "") ,placeholder: UIImage(named: "RecipePlaceholder"))
        numOfServices.text = "Sevings : \(String(describing: meal.numOfSurving))"
    }
    @IBAction func deleteBtn(_ sender: Any) {
        cellViewModel.deleteMealFromDB(meal: meal ?? Meal())
        print("Meal Deleted")
    }
 
 
}
