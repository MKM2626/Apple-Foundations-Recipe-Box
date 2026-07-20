//
//  BrowseView.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 16/7/2026.
//

import SwiftUI

struct BrowseView: View {
    
    @State private var searchText = ""
    
    @Binding var recipeData: RecipeData
    
    private let columns = [
        GridItem(.adaptive(minimum: 140), spacing: 16)
    ]

    // Search Function
    var filteredRecipeIndices: [Int] {
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

        if trimmedSearchText.isEmpty {
            return Array(recipeData.recipes.indices)
        }

        return recipeData.recipes.indices.filter { index in
            let recipe = recipeData.recipes[index]

            return recipe.name.localizedCaseInsensitiveContains(trimmedSearchText) ||
            recipe.ingredients.contains { ingredient in
                ingredient.localizedCaseInsensitiveContains(trimmedSearchText)
            }
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
            .navigationTitle("Browse Recipes")
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

    BrowseView(recipeData: $recipeData)
}
