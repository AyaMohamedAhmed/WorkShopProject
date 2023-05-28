//
//  MockNetworkService.swift
//  WorkShopProjectTests
//
//  Created by Huda kamal  on 27/05/2023.
//

import Foundation
import Alamofire
@testable import WorkShopProject
class MockNetworkService {
    static let mockMoviesResponse = "{\"results\":[{\"name\":\"pizza\"}, {\"name\":\"alfredo\"},{\"name\":\"pasta\"}]}"
}

extension MockNetworkService : NetworkServicesProtocol{
    func getDataFromApi<T>(apiUrl: String, headers: Alamofire.HTTPHeaders?, val: T.Type, completion: @escaping (T?) -> ()) where T : Decodable {
        
        let data = Data(MockNetworkService.mockMoviesResponse.utf8)
        do {
            let jsonData = try JSONDecoder().decode(T.self, from: data)
            completion(jsonData)
        } catch let decodingError {
            
        }
    } 
}

