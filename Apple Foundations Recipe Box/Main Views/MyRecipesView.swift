//
//  MyRecipesView.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 16/7/2026.
//

import SwiftUI

struct MyRecipesView: View {
    
    @State private var searchText = "" // Stores what user types into bar
    
    @Binding var recipeData: RecipeData
    
    private let columns = [
        GridItem(.adaptive(minimum: 140), spacing: 16)
    ]

    // Search Function
    // Creates a list of recipe indexes that match the search text.
    // Instead of returning recipes directly, it returns their positions
    var filteredRecipeIndices: [Int] {
        // Removes extra spaces before and after the search text.
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

        /*
        // Show every recipe if the bar is empty
        if trimmedSearchText.isEmpty {
            return Array(recipeData.recipes.indices)
        }*/
        
        if trimmedSearchText.isEmpty {
            return recipeData.recipes.indices.filter { index in
                let recipe = recipeData.recipes[index]
                
                return recipe.isSaved == true
            }
        }

        
        /// MAKE IT ONLY RETURN IS SAVED
        // Search through every recipe index
        return recipeData.recipes.indices.filter { index in
            // Gets the recipe at the current index.
            let recipe = recipeData.recipes[index]

            // Return true if:
            // 1. The recipe name contains the search text & isSaved is true
            // OR
            // 2. Any ingredient contains the search text & isSaved is true
            //
            // - ignores uppercase/lowercase differences
            return recipe.name.localizedCaseInsensitiveContains(trimmedSearchText) && recipe.isSaved == true ||
            recipe.ingredients.contains { ingredient in
                ingredient.localizedCaseInsensitiveContains(trimmedSearchText)
            } && recipe.isSaved == true
        }
    }
    
    // View
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(filteredRecipeIndices, id: \.self) { index in
                        NavigationLink(destination: RecipeDetailView(recipe: $recipeData.recipes[index])) {
                            RecipeCard(recipe: $recipeData.recipes[index])
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("My Recipes")
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search Recipes"
            )
        }
    }
}

#Preview {
    
    @Previewable @State var recipeData = myRecipeData

    MyRecipesView(recipeData: $recipeData)
}
