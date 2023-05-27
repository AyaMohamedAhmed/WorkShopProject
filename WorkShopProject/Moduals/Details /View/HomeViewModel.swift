//
//  ViewModel.swift
//  WorkShopProject
//
//  Created by marina on 27/05/2023.
//

import Foundation
class HomeViewModel{
let repo:RepoProtocol
    init(repo:RepoProtocol) {
        self.repo = repo
    }
//    var bindResultToViewController : (()->()) = {}
//
//       var viewModelResult:[Result]!{
//           didSet{
//              bindResultToViewController()
//           }
//       }
       func getMeals(endPoint : String,completion: @escaping ([Result]?)->()){
           
            repo.getDataFromApi(endPoint:endPoint){res in
                
               completion(res)
           }
//           }  else {
//               completion(nil)
//               return
//               }
           
          // self.viewModelResult = newRes
           
       }
    
}
