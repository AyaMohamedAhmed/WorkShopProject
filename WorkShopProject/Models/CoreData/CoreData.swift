//
//  CoreData.swift
//  WorkShopProject
//
//  Created by marina on 26/05/2023.
//

import Foundation
import CoreData

protocol InsertedMeal{
    func insertMeal()
}

class CoreDataManager  {
    static let dataBase = CoreDataManager()
    
    var context:NSManagedObjectContext!
    var mealsObjects:[NSManagedObject]!
    
    var insertDelegate: InsertedMeal?
    
    
    func SaveTeamToDB(context : NSManagedObjectContext , meal : Meal){
        
        let entity = NSEntityDescription.entity(forEntityName: "RecipeDB", in: context)!
        let mealObj = NSManagedObject(entity: entity, insertInto: context)
        
        mealObj.setValue(meal.mealName, forKey: "mealName")
        mealObj.setValue(meal.mealID, forKey: "mealID")
        mealObj.setValue(meal.mealCountry, forKey: "mealCountry")
        mealObj.setValue(meal.mealMaker, forKey: "mealMaker")
        mealObj.setValue(meal.mealImage, forKey: "mealImage")
  
        do{
            try context.save()
            print("Successful insert")
            insertDelegate?.insertMeal()
        } catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
    func getTeamsFromDB(context:NSManagedObjectContext) ->[Meal]{
        
        var meals = [Meal]()
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "RecipeDB")
        do{
            mealsObjects = try context.fetch(fetchReq)
            for meal in mealsObjects{
          
                let mealName = meal.value(forKey: "mealName") as! String
                let mealCountry = meal.value(forKey: "mealCountry") as! String
                let numOfServing = meal.value(forKey: "leagueI") as! Int
                let mealId   = meal.value(forKey: "mealID")  as! Int
                let mealMaker = meal.value(forKey: "mealMaker") as! String
                let mealImage = meal.value(forKey: "mealImage") as! String
                meals.append(Meal(mealID: mealId, mealName: mealName, mealMaker: mealMaker, mealCountry: mealCountry, numOfSurving: numOfServing , mealImage: mealImage))
            }
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        return meals
    }
    
    func checkIfDBIsEmpty(context : NSManagedObjectContext)-> Bool{
        var isEmpty = true
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "FavDB")
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
    
    func deleteTeamFromDB(context:NSManagedObjectContext , meal : Meal){
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "RecipeDB")
        
        let predicate = NSPredicate(format: "mealName == %@", meal.mealName)
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


