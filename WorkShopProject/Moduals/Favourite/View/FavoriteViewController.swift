//
//  FavoriteViewController.swift
//  WorkShopProject
//
//  Created by Huda kamal  on 26/05/2023.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var favTable: UITableView!
    
    @IBOutlet weak var checkEmptyLabel: UILabel!
    var meals : [Meal]?
    var isDataReturned  = false
    var isDBEmpty = true
    var favViewModel : FavViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       activeView()
        favViewModel = FavViewModel(repo: Repo(dataBaseManager: DataBaseManager()))
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {

        isDBEmpty = ((favViewModel?.checkIfDBIsEmpty()) != nil)
        if(isDBEmpty){
            DispatchQueue.main.async {
               // self.favTable.isHidden = true
               // self.emptyFavImage()
            }
        }else{
            let mealsFromDB = favViewModel?.getMealsFromDB()
            meals = mealsFromDB
            isDataReturned = true
            DispatchQueue.main.async {
                self.favTable.isHidden = false
                self.favTable.reloadData()
            }

        }
    }

    func activeView(){
        favTable.delegate = self
        favTable.dataSource = self
        favTable.register(UINib(nibName: "FavoriteCell", bundle: nil), forCellReuseIdentifier: "FavoriteCell")
    }

}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals?.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
  
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCell else {
            return UITableViewCell()
        }
        cell.configureCell(localMeals: meals, indexPath: indexPath)
     return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        var meal = meals?[indexPath.row] ?? Meal()
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this item?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { action in
           
                self.favViewModel?.deleteMealFromDB(meal: meal)
                self.meals?.remove(at: indexPath.row)
                if(self.meals?.count == 0){
                    self.favTable.isHidden = true
                    
                }else{
                    self.favTable.reloadData()
                }
            }
        ))
            self.present(alert, animated: true)
                self.favTable.reloadData()
            
        }
       }
    func emptyFavImage(){
        let imageView = UIImageView(image: UIImage(named: "emptyFav"))
        imageView.contentMode = .center
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.center = self.view.center
        self.view.addSubview(imageView)
    }

}
