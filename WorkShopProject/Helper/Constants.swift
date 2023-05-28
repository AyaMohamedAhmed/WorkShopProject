//
//  Constants.swift
//  WorkShopProject
//
//  Created by marina on 26/05/2023.
//

import Foundation
import Alamofire
class Constants{
    static let HEADERS = [
        "X-RapidAPI-Key": "d67902112amshdb94118d744b893p18293bjsn4d056e614259",
        "X-RapidAPI-Host": "tasty.p.rapidapi.com"
    ]
    //static let HEADERKEY : HTTPHeader = HTTPHeader(name:"X-RapidAPI-Key" , value: "d67902112amshdb94118d744b893p18293bjsn4d056e614259")
    static let HEADERKEY : HTTPHeader = HTTPHeader(name:"X-RapidAPI-Key" , value: "ff32b8d793mshb09e41e6e65fe21p1825e6jsn5c550b70cb30")
    
    static let HEADERHOST : HTTPHeader = HTTPHeader(name:"X-RapidAPI-Host",value: "tasty.p.rapidapi.com")
    
    static let BASE_URL = "https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&tags="
    static let BREAKFAST = "breakfast"
    static let POPULAR = "popular"
    static let LUNCH = "lunch"
    static let DINNER = "dinner"
    static let DESSERT = "dessert"
   
}
