//
//  CoreData.swift
//  WorkShopProject
//
//  Created by marina on 26/05/2023.
//

import Foundation
import CoreData
import UIKit

protocol DataBaseManagerProtocol{
    func saveMealToDB(meal : Meal)
    func getMealsFromDB() ->[Meal]
    func checkIfDBIsEmpty()-> Bool
    func deleteMealFromDB(meal : Meal)
}

class DataBaseManager : DataBaseManagerProtocol {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var mealsObjects:[NSManagedObject]!
    
    func saveMealToDB( meal : Meal){
        
        let context:NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Recipe", in: context)!
        let mealObj = NSManagedObject(entity: entity, insertInto: context)
        
        mealObj.setValue(meal.mealName, forKey: "mealName")
        mealObj.setValue(meal.mealID, forKey: "mealID")
        mealObj.setValue(meal.mealCountry, forKey: "mealCountry")
        mealObj.setValue(meal.mealMaker, forKey: "mealMaker")
        mealObj.setValue(meal.mealImage, forKey: "mealImage")
  
        do{
            try context.save()
            print("Successful insert")

        } catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
    func getMealsFromDB() ->[Meal]{
        let context:NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        var meals = [Meal]()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Recipe")
        do{
            mealsObjects = try context.fetch(fetchReq)
            for meal in mealsObjects{
          
                let mealName = meal.value(forKey: "mealName") as? String
                let mealCountry = meal.value(forKey: "mealCountry") as? String
                let mealId   = meal.value(forKey: "mealID")  as? Int
                let mealMaker = meal.value(forKey: "mealMaker") as? String
                let mealImage = meal.value(forKey: "mealImage") as? String
                let numOfServing = meal.value(forKey: "numOfServing") as? Int
                meals.append(Meal(mealID: mealId ?? 0 , mealName: mealName ?? "MealName", mealMaker: mealMaker ?? "MealMaker" , mealCountry: mealCountry ?? "MealCountry" , numOfSurving: numOfServing  ?? 0 , mealImage: mealImage ?? ""))
            }
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        return meals
    }
    
    func checkIfDBIsEmpty()-> Bool{
        let context:NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        var isEmpty = true
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Recipe")
        do{
            mealsObjects = try context.fetch(fetchReq)
            
            if(mealsObjects.count > 0){
                isEmpty = false
            }
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        return isEmpty
    }
    
    func deleteMealFromDB(meal : Meal){
        let context:NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Recipe")
        let predicate = NSPredicate(format: "mealName == %@", meal.mealName ?? "")
        fetchReq.predicate = predicate
        
        do{
            mealsObjects = try context.fetch(fetchReq)
            context.delete(mealsObjects[0])
            try context.save()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
}
