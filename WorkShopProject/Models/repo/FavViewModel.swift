//
//  FavViewModel.swift
//  WorkShopProject
//
//  Created by Huda kamal  on 27/05/2023.
//

import Foundation

class FavViewModel {
    
    let repo : RepoProtocol
    
    init(repo: RepoProtocol) {
        self.repo = repo
    }

    func saveMealToDB(meal : Meal){
        repo.saveMealToDB(meal: meal)
    }
    func deleteMealFromDB(meal : Meal){
        repo.deleteMealFromDB(meal: meal)
    }
    func getMealsFromDB() -> [Meal]{
        let localMeals = repo.getMealsFromDB()
        return localMeals
    }
    func checkIfDBIsEmpty () -> Bool {
        let checkIfDBIsEmpty = repo.checkIfDBIsEmpty()
        print(checkIfDBIsEmpty)
        return checkIfDBIsEmpty
    }
}
