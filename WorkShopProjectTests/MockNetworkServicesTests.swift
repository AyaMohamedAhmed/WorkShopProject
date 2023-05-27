//
//  MockNetworkServicesTests.swift
//  WorkShopProjectTests
//
//  Created by Huda kamal  on 27/05/2023.
//

import XCTest
import Alamofire
@testable import WorkShopProject

final class MockNetworkServiceTests: XCTestCase {
    
    var mockNetworkService  = MockNetworkService()
    
    func testDataDecoding() {
        var url = Constants.BASE_URL + Constants.BREAKFAST
        let HEADERKEY : HTTPHeader = HTTPHeader(name:"X-RapidAPI-Key" , value: "ff32b8d793mshb09e41e6e65fe21p1825e6jsn5c550b70cb30")
        let HEADERHOST : HTTPHeader = HTTPHeader(name:"X-RapidAPI-Host",value: "tasty.p.rapidapi.com")
        mockNetworkService.getDataFromApi(apiUrl: url, headers: HTTPHeaders([HEADERKEY,HEADERHOST]), val: RecipeResponce.self){res in
            guard let result = res else {
                XCTFail()
                return
            }
            XCTAssertNotEqual(result.results.count , 0, "Fail")
        }
    }
    
}
