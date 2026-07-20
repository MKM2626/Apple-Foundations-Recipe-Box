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
    
    var filteredRecipeIndices: [Recipe.ID] {
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

        if trimmedSearchText.isEmpty {
            return recipeData.recipes.map(\.id)
        }

        return recipeData.recipes
            .filter { recipe in
                recipe.name.localizedCaseInsensitiveContains(trimmedSearchText) ||
                recipe.ingredients.contains { ingredient in
                    ingredient.localizedCaseInsensitiveContains(trimmedSearchText)
                }
            }
            .map(\.id)
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(filteredRecipeIndices, id: \.self) { id in
                    
                    if let index = recipeData.recipes.firstIndex(where: { $0.id == id }) {
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
 
#Preview {
    /*NavigationStack{
        BrowseView()
    }*/
    
    @Previewable @State var recipeData = myRecipeData

       BrowseView(recipeData: $recipeData)
}
