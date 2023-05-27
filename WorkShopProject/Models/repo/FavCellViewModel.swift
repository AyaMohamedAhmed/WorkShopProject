//
//  FavCellViewModel.swift
//  WorkShopProject
//
//  Created by Huda kamal  on 27/05/2023.
//

import Foundation

class FavCellViewModel{
    
    let repo : RepoProtocol
    
    init(repo: RepoProtocol) {
        self.repo = repo
    }
    func deleteMealFromDB(meal : Meal){
        repo.deleteMealFromDB(meal: meal)
    }
}
