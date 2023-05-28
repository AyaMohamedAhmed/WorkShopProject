//
//  ViewModel.swift
//  WorkShopProject
//
//  Created by marina on 27/05/2023.
//

import Foundation
class HomeViewModel{
let repo:RepoProtocol
    var recipeResponse:[Result]=[]
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
       func getMeals(endPoint : String, completion: @escaping ()->()){
           
            repo.getDataFromApi(endPoint:endPoint){res in
                print(res?.count)
                self.recipeResponse.append(contentsOf: res ?? [])
                completion()
            }
//           }  else {?
//               completion(nil)
//               return
//               }
           
          // self.viewModelResult = newRes
           
       }
    
}
