//
//  Repo.swift
//  WorkShopProject
//
//  Created by Huda kamal  on 27/05/2023.
//

import Foundation
import Alamofire

protocol RepoProtocol {
    func saveMealToDB (meal : Meal)
    func deleteMealFromDB(meal :Meal)
    func getMealsFromDB() -> [Meal]
    func checkIfDBIsEmpty() -> Bool
    func getDataFromApi(endPoint : String,completion: @escaping ([Result]?)->())
    
}

class Repo : RepoProtocol{
    
    let databaseManager : DataBaseManagerProtocol
    let networkManger : NetworkServicesProtocol
    init(dataBaseManager: DataBaseManagerProtocol,networkManger : NetworkServicesProtocol) {
        self.databaseManager = dataBaseManager
        self.networkManger = networkManger
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
    
    func getDataFromApi(endPoint : String,completion: @escaping ([Result]?)->()){
        var url = Constants.BASE_URL + endPoint
        networkManger.getDataFromApi(apiUrl: url, headers: HTTPHeaders([Constants.HEADERKEY,Constants.HEADERHOST]), val: RecipeResponce.self) { res in
            completion(res?.results)
        }
    }
}
