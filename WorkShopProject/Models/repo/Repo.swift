//
//  Repo.swift
//  WorkShopProject
//
//  Created by Huda kamal  on 27/05/2023.
//

import Foundation

protocol RepoProtocol {

    func saveMealToDB (meal : Meal)
    func deleteMealFromDB(meal :Meal)
    func getMealsFromDB() -> [Meal]
    func checkIfDBIsEmpty() -> Bool
}

class Repo : RepoProtocol{
    
    let databaseManager : DataBaseManagerProtocol
    init(dataBaseManager: DataBaseManagerProtocol) {
        self.databaseManager = dataBaseManager
    }
    
    func saveMealToDB(meal: Meal) {
        databaseManager.saveMealToDB(meal: meal)
    }
    
    func deleteMealFromDB(meal: Meal) {
        databaseManager.deleteMealFromDB(meal: meal)
    }
    
    func getMealsFromDB() -> [Meal] {
        
        let localMeals = databaseManager.getMealsFromDB()
        return localMeals
    }
    
    func checkIfDBIsEmpty() -> Bool {
        let checkIfDBIsEmpty = databaseManager.checkIfDBIsEmpty()
        return checkIfDBIsEmpty
    }
}
