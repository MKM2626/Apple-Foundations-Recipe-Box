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
        TabView { // Allows tabs at the bottom to switch screens without switching 
                // Tab 1 uses a NavigationStack for screen switching
            NavigationStack {
                BrowseView(recipeData: $recipeData, tagData: $tagData)
            }
            .tabItem {
                Label("Browse", systemImage: "network")
            }

            NavigationStack {
                MyRecipesView(recipeData: $recipeData)
            }
            .tabItem {
                Label("My Recipes", systemImage: "menucard.fill")
            }
        }
    }
}

#Preview {
    ContentView()
}
