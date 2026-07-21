//
//  BrowseView.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 16/7/2026.
//

import SwiftUI

struct BrowseView: View {
    
    @State private var searchText = "" // Stores what user types into bar 
    @State private var selectedTags: [Tag] = []
    
    @Binding var recipeData: RecipeData
    @Binding var tagData: TagData
    
    private let columns = [
        GridItem(.adaptive(minimum: 140), spacing: 16)
    ]

    // Search suggestions
    var tagSuggestion: [Tag] {
        guard !searchText.isEmpty else { return [] }

        return tagData.Tags.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    // Creates a list of recipe indexes that match the search text.
    // Instead of returning recipes directly, it returns their positions
    var filteredRecipeIndices: [Int] {
        // Removes extra spaces before and after the search text.
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

        // Search through every recipe index
        return recipeData.recipes.indices.filter { index in
            // Gets the recipe at the current index.
            let recipe = recipeData.recipes[index]

            // Search bar filter
            // Return true if:
            // 1. The recipe name contains the search text
            // OR
            // 2. Any ingredient contains the search text
            //
            // - ignores uppercase/lowercase differences
            let matchesSearch =
                trimmedSearchText.isEmpty ||
                recipe.name.localizedCaseInsensitiveContains(trimmedSearchText) ||
                recipe.ingredients.contains { ingredient in
                    ingredient.localizedCaseInsensitiveContains(trimmedSearchText)
                }

            // Tag filter
            //
            let matchesTags = selectedTags.allSatisfy { selectedTag in
                recipe.tags.contains { recipeTag in
                    recipeTag.id == selectedTag.id
                }
            }

            return matchesSearch && matchesTags
        }
    }
    
    // View
    var body: some View {
        NavigationStack {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(tagSuggestion) { tag in
                            Button(tag.name) {
                                if !selectedTags.contains(where: { $0.id == tag.id }) {
                                    selectedTags.append(tag)
                                    
                                    searchText = ""
                                }
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                    .padding(.horizontal)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(selectedTags) { tag in
                            Button {
                                selectedTags.removeAll { $0.id == tag.id }
                            } label: {
                                Text("\(tag.name) ✕")
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                    .padding(.horizontal)
                }
                
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
    @Previewable @State var tagData = myTagData

    BrowseView(recipeData: $recipeData, tagData: $tagData)
}
