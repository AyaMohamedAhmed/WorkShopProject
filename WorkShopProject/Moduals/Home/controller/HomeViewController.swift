//
//  HomeViewController.swift
//  WorkShopProject
//
//  Created by Aya Mohamed Ahmed on 26/05/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
       @IBOutlet weak var cardCollectionView: UICollectionView!
  //  var recipeResponse:[]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        let categoriesFlowLayout = UICollectionViewFlowLayout()
        categoriesFlowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        categoriesCollectionView.collectionViewLayout=categoriesFlowLayout
        
        let cardflowLayout = UICollectionViewFlowLayout()
        cardflowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        cardCollectionView.collectionViewLayout=cardflowLayout
        registerCells()
     
    }
    private func registerCells(){
        categoriesCollectionView.register(UINib(nibName: "FoodCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FoodCategoriesCollectionViewCell")
        
        cardCollectionView.register(UINib(nibName: "DetailsCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DetailsCategoriesCollectionViewCell")
    
    }
  
}


extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
            case categoriesCollectionView:
                 return categories.count
        case cardCollectionView:
            return 0 //recipeResponse.count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case categoriesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCategoriesCollectionViewCell", for: indexPath) as? FoodCategoriesCollectionViewCell
            cell?.setUp(categories: categories[indexPath.row])
            return cell ?? FoodCategoriesCollectionViewCell()
            
        case cardCollectionView:
            let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCategoriesCollectionViewCell", for: indexPath) as? DetailsCategoriesCollectionViewCell
            cardCell?.layer.borderWidth = 1
            cardCell?.layer.cornerRadius=25
            cardCell?.setUp(categories: categories[indexPath.row])
            return cardCell ?? DetailsCategoriesCollectionViewCell()
       
        default:
            return UICollectionViewCell()

        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:80, height: 100)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //Todo add when press
        
        
     
    }
    
}
      
      
    

