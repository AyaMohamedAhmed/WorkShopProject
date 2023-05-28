//
//  RecipeResponce.swift
//  WorkShopProject
//
//  Created by marina on 26/05/2023.
//

import Foundation
struct RecipeResponce:Codable{
    
    var count: Int
    var results: [Result]
    
}

struct Result: Codable {
    var name : String?
    var brand: Brand?
    
    var thumbnailURL: String?
    var id :Int?
    var numServings: Int?
    
    var instructions: [Instruction]?
    var sections: [Section]?
    
    var originalVideoURL: String?
    

    enum CodingKeys: String, CodingKey {
       
        case name
        case sections
        case brand
        case thumbnailURL = "thumbnail_url"
        case id
        case numServings = "num_servings"
        
        case instructions
       
        case originalVideoURL = "original_video_url"
        
    }
}
struct Instruction: Codable {
   
    var displayText: String?

    enum CodingKeys: String, CodingKey {
       
        case displayText = "display_text"
    }
}
struct Section: Codable {
    var components: [Component]?
    var name: String?
    var position: Int?
}




struct Component: Codable {
    var id, position: Int?
    
    var rawText, extraComment: String?
    var ingredient: Ingredient?

    enum CodingKeys: String, CodingKey {
        case id, position
        case rawText = "raw_text"
        case extraComment = "extra_comment"
        case ingredient
    }
}
struct Brand: Codable {
    
    var name: String?
    enum CodingKeys: String, CodingKey {       
        case name
    }
}
struct Ingredient: Codable {
   
    var displayPlural: String?
   
    var displaySingular: String?
    
    var name: String?

    enum CodingKeys: String, CodingKey {
        
        case displayPlural = "display_plural"
        
        case displaySingular = "display_singular"
        
        case name
    }
}

// MARK: - Compilation
struct Compilation: Codable {
    
    var show: [Show]?
    
    enum CodingKeys: String, CodingKey {
        
        case show
    }
}

struct Show: Codable {
    var name: String
    var id: Int?
}


