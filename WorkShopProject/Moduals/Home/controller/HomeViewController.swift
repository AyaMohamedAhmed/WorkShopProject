//
//  HomeViewController.swift
//  WorkShopProject
//
//  Created by Aya Mohamed Ahmed on 26/05/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        categoriesCollectionView.collectionViewLayout=flowLayout
        registerCells()
        
        
        
    }
    private func registerCells(){
        categoriesCollectionView.register(UINib(nibName: "FoodCategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FoodCategoriesCollectionViewCell")
    
    }
    


}


extension HomeViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCategoriesCollectionViewCell", for: indexPath) as! FoodCategoriesCollectionViewCell
        //cell.layer.borderWidth = 1
        //cell.layer.cornerRadius=25
        cell.SetUp(categories: categories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:80, height: 100)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //Todo add when press
        
        
        
        
    }
    
}
      
      
    

