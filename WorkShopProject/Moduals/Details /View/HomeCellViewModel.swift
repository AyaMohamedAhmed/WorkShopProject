//
//  h.swift
//  WorkShopProject
//
//  Created by marina on 27/05/2023.
//

import Foundation

class HomeCellViewModel{
    
    let repo : RepoProtocol
    init(repo: RepoProtocol) {
        self.repo = repo
    }
    
    func deleteMealFromDB(meal : Meal){
        repo.deleteMealFromDB(meal: meal)
    }
}
