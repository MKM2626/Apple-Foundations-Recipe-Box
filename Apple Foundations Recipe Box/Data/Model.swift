//
//  recipe.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 17/7/2026.
//

import Foundation

struct Recipe: Identifiable {
    var id = UUID()
    var imageName: String
    var name: String
    var prepTime: Int
    var cookTime: Int
    var servingSize: Int
    var ingredients: [String]
    var instructions: [String]
    var nutrition: [String]
    
    var isSaved: Bool = false
}

struct Tag: Identifiable {
    var id = UUID()
    var name: String
    var taggedRecipes: [Recipe]
}
