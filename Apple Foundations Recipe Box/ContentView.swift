//
//  ContentView.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 16/7/2026.
//

import SwiftUI

struct ContentView: View {
    @State var recipeData = myRecipeData
    @State var tagData = myTagData
    
    var body: some View {
        TabView {
            // Browse
            NavigationStack {
                BrowseView(recipeData: $recipeData, tagData: $tagData)
            }
            .tabItem {
                Label("Browse", systemImage: "network")
            }
            
            // My Recipe
            NavigationStack {
                MyRecipesView(recipeData: $recipeData, tagData: $tagData)
            }
            .tabItem {
                Label("My Recipes", systemImage: "menucard.fill")
            }
            
            // Add Recipe
            NavigationStack {
                AddRecipeViewTest(recipeData: $recipeData, tagData: $tagData)
            }
            .tabItem {
                Label("Create", systemImage: "plus.app")
            }
            
            // Meal Plan
            NavigationStack {
                MealPlanPreviewView()
            }
            .tabItem {
                Label("Meal Plan", systemImage: "calendar")
            }
            
            // Grocery List
            NavigationStack {
                GroceryListPreview()
            }
            .tabItem {
                Label("Groceries", systemImage: "list.bullet")
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}
