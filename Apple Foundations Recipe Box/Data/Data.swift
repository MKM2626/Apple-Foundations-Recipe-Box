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
        Recipe(
            imageName: "prawn",
            name: "Blueberry Pancakes",
            prepTime: 10,
            cookTime: 10,
            servingSize: 5,
            ingredients: ["blueberry", "flour", "milk"],
            instructions: ["mix stuff"],
            nutrition: ["10 cals"],
        ),
        
        Recipe(
            imageName: "prawn",
            name: "Mapo Tofu",
            prepTime: 10,
            cookTime: 10,
            servingSize: 5,
            ingredients: ["blueberry", "flour", "milk"],
            instructions: ["mix stuff"],
            nutrition: ["10 cals"]
        ),
    ]
}

var myRecipeData = RecipeData()

@Observable
class TagData {
    var Tags = [
        Tag(name: "Vegan"),
        Tag(name: "Vegetarian"),
        Tag(name: "Celiac"),
        Tag(name: "Halal"),
        Tag(name: "Keto"),
        Tag(name: "Paleo"),
        Tag(name: "Mediterranean"),
        Tag(name: "High Protein")
    ]
}

var myTagData = TagData()
