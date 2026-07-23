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
            imageName: "blueberry_pancakes",
            name: "Blueberry Pancakes",
            prepTime: 10,
            cookTime: 10,
            servingSize: 5,
            ingredients: ["Blueberries", "Flour", "Milk"],
            instructions: ["Mix ingredients", "Cook on a hot griddle", "Serve with syrup"],
            nutrition: ["320 calories"],
            isSaved: true,
            tags: [myTagData.Tags[0], myTagData.Tags[8], myTagData.Tags[15]]
        ),
         
        Recipe(
            imageName: "mapo_tofu",
            name: "Mapo Tofu",
            prepTime: 15,
            cookTime: 20,
            servingSize: 4,
            ingredients: ["Tofu", "Ground Pork", "Doubanjiang", "Garlic", "Broth"],
            instructions: ["Cook pork", "Add sauce", "Simmer with tofu"],
            nutrition: ["410 calories"],
            tags: [myTagData.Tags[2], myTagData.Tags[6], myTagData.Tags[9]]
        ),
         
        Recipe(
            imageName: "spaghetti_carbonara",
            name: "Spaghetti Carbonara",
            prepTime: 10,
            cookTime: 15,
            servingSize: 4,
            ingredients: ["Spaghetti", "Eggs", "Parmesan", "Bacon", "Black Pepper"],
            instructions: ["Cook pasta", "Fry bacon", "Mix with eggs and cheese"],
            nutrition: ["620 calories"],
            tags: [myTagData.Tags[2], myTagData.Tags[5], myTagData.Tags[9], myTagData.Tags[16]]
        ),
         
        Recipe(
            imageName: "chicken_caesar_salad",
            name: "Chicken Caesar Salad",
            prepTime: 15,
            cookTime: 10,
            servingSize: 2,
            ingredients: ["Chicken Breast", "Romaine Lettuce", "Croutons", "Parmesan", "Caesar Dressing"],
            instructions: ["Grill chicken", "Toss salad", "Top with cheese"],
            nutrition: ["450 calories"],
            tags: [myTagData.Tags[1], myTagData.Tags[9], myTagData.Tags[12], myTagData.Tags[15]]
        ),
         
        Recipe(
            imageName: "beef_tacos",
            name: "Beef Tacos",
            prepTime: 15,
            cookTime: 15,
            servingSize: 4,
            ingredients: ["Ground Beef", "Taco Shells", "Lettuce", "Cheddar", "Tomatoes"],
            instructions: ["Cook beef", "Fill taco shells", "Add toppings"],
            nutrition: ["540 calories"],
            tags: [myTagData.Tags[2], myTagData.Tags[7], myTagData.Tags[15]]
        ),
         
        Recipe(
            imageName: "margherita_pizza",
            name: "Margherita Pizza",
            prepTime: 20,
            cookTime: 15,
            servingSize: 4,
            ingredients: ["Pizza Dough", "Tomato Sauce", "Mozzarella", "Basil"], instructions: ["Spread sauce", "Add cheese", "Bake until golden"], nutrition: ["680 calories"],
            tags: [myTagData.Tags[2], myTagData.Tags[5], myTagData.Tags[8], myTagData.Tags[11], myTagData.Tags[16]]
        ),
         
        Recipe(
            imageName: "vegetable_stir_fry",
            name: "Vegetable Stir Fry",
            prepTime: 15,
            cookTime: 10,
            servingSize: 3,
            ingredients: ["Broccoli", "Carrots", "Bell Peppers", "Soy Sauce", "Garlic"],
            instructions: ["Chop vegetables", "Stir fry", "Add sauce"],
            nutrition: ["290 calories"],
            tags: [myTagData.Tags[2], myTagData.Tags[8], myTagData.Tags[13], myTagData.Tags[15]]
        ),
         
        Recipe(
            imageName: "tomato_soup",
            name: "Tomato Soup",
            prepTime: 10,
            cookTime: 25,
            servingSize: 4,
            ingredients: ["Tomatoes", "Onion", "Garlic", "Vegetable Broth", "Cream"],
            instructions: ["Cook vegetables", "Blend soup", "Stir in cream"],
            nutrition: ["220 calories"],
            tags: [myTagData.Tags[1], myTagData.Tags[8], myTagData.Tags[16]]
        ),
         
        Recipe(
            imageName: "chocolate_chip_cookies",
            name: "Chocolate Chip Cookies",
            prepTime: 15,
            cookTime: 12,
            servingSize: 24,
            ingredients: ["Flour", "Butter", "Sugar", "Eggs", "Chocolate Chips"],
            instructions: ["Mix dough", "Scoop onto tray", "Bake"],
            nutrition: ["180 calories each"],
            tags: [myTagData.Tags[4], myTagData.Tags[11]]
        ),
         
        Recipe(
            imageName: "banana_smoothie",
            name: "Banana Smoothie",
            prepTime: 5,
            cookTime: 0,
            servingSize: 2,
            ingredients: ["Banana", "Milk", "Greek Yogurt", "Honey"],
            instructions: ["Add ingredients to blender", "Blend until smooth"],
            nutrition: ["260 calories"],
            tags: [myTagData.Tags[0], myTagData.Tags[8], myTagData.Tags[15]]
        ),
         
        Recipe(
            imageName: "grilled_cheese_sandwich",
            name: "Grilled Cheese Sandwich",
            prepTime: 5,
            cookTime: 8,
            servingSize: 1,
            ingredients: ["Bread", "Cheddar Cheese", "Butter"],
            instructions: ["Butter bread", "Add cheese", "Grill until golden"],
            nutrition: ["390 calories"],
            tags: [myTagData.Tags[1], myTagData.Tags[8], myTagData.Tags[12], myTagData.Tags[15], myTagData.Tags[16]]
        ),
         
        Recipe(
            imageName: "avocado_toast",
            name: "Avocado Toast",
            prepTime: 5,
            cookTime: 3,
            servingSize: 1,
            ingredients: ["Bread", "Avocado", "Salt", "Pepper", "Lemon Juice"],
            instructions: ["Toast bread", "Mash avocado", "Spread and season"],
            nutrition: ["310 calories"],
            tags: [myTagData.Tags[0], myTagData.Tags[8], myTagData.Tags[15]]
        ),
         
        Recipe(
            imageName: "chicken_fried_rice",
            name: "Chicken Fried Rice",
            prepTime: 15,
            cookTime: 15,
            servingSize: 4,
            ingredients: ["Rice", "Chicken", "Eggs", "Peas", "Soy Sauce"],
            instructions: ["Cook chicken", "Scramble eggs", "Stir fry with rice"],
            nutrition: ["510 calories"],
            tags: [myTagData.Tags[2], myTagData.Tags[9], myTagData.Tags[13], myTagData.Tags[14]]
        ),
         
        Recipe(
            imageName: "mushroom_risotto",
            name: "Mushroom Risotto",
            prepTime: 15,
            cookTime: 30,
            servingSize: 4,
            ingredients: ["Arborio Rice", "Mushrooms", "Parmesan", "Butter", "Vegetable Broth"],
            instructions: ["Cook mushrooms", "Gradually add broth", "Stir in cheese"],
            nutrition: ["470 calories"],
            tags: [myTagData.Tags[2], myTagData.Tags[5], myTagData.Tags[8], myTagData.Tags[16]]
        ),
         
        Recipe(
            imageName: "greek_yogurt_parfait",
            name: "Greek Yogurt Parfait",
            prepTime: 5,
            cookTime: 0,
            servingSize: 2,
            ingredients: ["Greek Yogurt", "Granola", "Strawberries", "Honey"],
            instructions: ["Layer yogurt", "Add fruit", "Top with granola"],
            nutrition: ["240 calories"],
            tags: [myTagData.Tags[0], myTagData.Tags[9], myTagData.Tags[15]]
        ),
         
        Recipe(
            imageName: "french_toast",
            name: "French Toast",
            prepTime: 10,
            cookTime: 10,
            servingSize: 2,
            ingredients: ["Bread", "Eggs", "Milk", "Cinnamon", "Maple Syrup"],
            instructions: ["Dip bread in egg mixture", "Cook on skillet", "Serve with syrup"],
            nutrition: ["430 calories"],
            tags: [myTagData.Tags[0], myTagData.Tags[8], myTagData.Tags[16]]
        ),
         
        Recipe(
            imageName: "baked_salmon",
            name: "Baked Salmon",
            prepTime: 10,
            cookTime: 20,
            servingSize: 2,
            ingredients: ["Salmon Fillets", "Lemon", "Garlic", "Olive Oil"],
            instructions: ["Season salmon", "Bake until flaky", "Serve with lemon"],
            nutrition: ["480 calories"],
            tags: [myTagData.Tags[2], myTagData.Tags[10], myTagData.Tags[9], myTagData.Tags[11]]
        ),
         
        Recipe(
            imageName: "shrimp_alfredo",
            name: "Shrimp Alfredo",
            prepTime: 15,
            cookTime: 20,
            servingSize: 4,
            ingredients: ["Fettuccine", "Shrimp", "Heavy Cream", "Parmesan", "Garlic"],
            instructions: ["Cook pasta", "Make Alfredo sauce", "Add shrimp"],
            nutrition: ["720 calories"],
            tags: [myTagData.Tags[2], myTagData.Tags[5], myTagData.Tags[10], myTagData.Tags[9], myTagData.Tags[16]]
        ),
         
        Recipe(
            imageName: "apple_pie",
            name: "Apple Pie",
            prepTime: 25,
            cookTime: 50,
            servingSize: 8,
            ingredients: ["Apples", "Pie Crust", "Sugar", "Cinnamon", "Butter"],
            instructions: ["Prepare filling", "Assemble pie", "Bake until golden"],
            nutrition: ["390 calories"],
            tags: [myTagData.Tags[4], myTagData.Tags[11]]
        ),
         
        Recipe(
            imageName: "berry_oatmeal",
            name: "Berry Oatmeal",
            prepTime: 5,
            cookTime: 8,
            servingSize: 2,
            ingredients: ["Oats", "Milk", "Blueberries", "Strawberries", "Honey"],
            instructions: ["Cook oats", "Top with berries", "Drizzle honey"],
            nutrition: ["280 calories"],
            tags: [myTagData.Tags[0], myTagData.Tags[8], myTagData.Tags[15]]
        ),
    ]
}

var myRecipeData = RecipeData()

@Observable
class TagData {
    var Tags = [
        Tag(name: "Breakfast"),
        Tag(name: "Lunch"),
        Tag(name: "Dinner"),
        Tag(name: "Snack"),
        Tag(name: "Dessert"),
        Tag(name: "Italian"),
        Tag(name: "Chinese"),
        Tag(name: "Mexican"),
        Tag(name: "Vegetarian"),
        Tag(name: "High Protein"),
        Tag(name: "Seafood"),
        Tag(name: "Baked"),
        Tag(name: "Grilled"),
        Tag(name: "Stir Fry"),
        Tag(name: "One Pan"),
        Tag(name: "Quick"),
        Tag(name: "Comfort Food"),
    ]
}

var myTagData = TagData()
