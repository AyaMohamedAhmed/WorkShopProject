//
//  NetworkService.swift
//  WorkShopProject
//
//  Created by marina on 26/05/2023.
//

import Foundation
import Alamofire
protocol NetworkServicesProtocol {
     func getDataFromApi<T: Decodable>(apiUrl: String,headers: HTTPHeaders?, val: T.Type,completion: @escaping (T?)->())
}
class NetworkingService:NetworkServicesProtocol{
    
    
     func getDataFromApi<T: Decodable>(apiUrl: String,headers: HTTPHeaders? ,val: T.Type,completion: @escaping (T?)->()) {
        let url = URL(string: apiUrl)
        
        guard let newURL = url else{
            return
        }
        AF.request(newURL,headers: headers)
            .responseJSON { (response) in
                switch response.result {
                case .success(_):
                    guard let data = response.data else { return }
                    do {
                        let jsonData = try JSONDecoder().decode(T.self, from: data)
                        completion(jsonData)
                    } catch let jsonError {
                        print(jsonError)
                    }
                    
                case .failure(let error):
                    print("error here \n \n \(String(describing:error)) \n\n ")
                    completion(nil)
                }
            }
    }
}


