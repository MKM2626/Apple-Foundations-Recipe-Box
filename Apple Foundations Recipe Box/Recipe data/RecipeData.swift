//
//  RecipeData.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 17/7/2026.
//

import Foundation
import SwiftUI

@Observable
class RecipeData {
    var recipes = [
        Recipe(name: "Blueberry Pancakes", prepTime: 10, cookTime: 10, servingSize: 5, ingredients: ["blueberry", "flour", "milk"], instructions: ["mix stuff"], nutrition: ["10 cals"]),
        
        Recipe(name: "Mapo Tofu", prepTime: 10, cookTime: 10, servingSize: 5, ingredients: ["blueberry", "flour", "milk"], instructions: ["mix stuff"], nutrition: ["10 cals"]),
    ]
}

var myRecipeData = RecipeData()
