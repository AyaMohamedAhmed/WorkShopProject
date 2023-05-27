//
//  NetworkAPITest.swift
//  WorkShopProjectTests
//
//  Created by Huda kamal  on 27/05/2023.
//

import XCTest
import Alamofire
@testable import WorkShopProject


class NetworkServiceTest: XCTestCase {
    func testNetworkApi() {
        let expectation = self.expectation(description: "Request should succeed")
        let url = Constants.BASE_URL + Constants.BREAKFAST
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success:
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Request failed with error: \(error)")
            }
        }

        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("Expectation failed with error: \(error)")
            }
        }
    }
}

