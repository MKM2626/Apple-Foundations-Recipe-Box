//
//  ContentView.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 16/7/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView { // Allows tabs at the bottom to switch screens without switching 
                // Tab uses a NavigationStack for screen switching
            NavigationStack {
                BrowseView()
            }
            .tabItem {
                Label("Browse", systemImage: "network")
            }

            NavigationStack {
                MyRecipesView()
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
