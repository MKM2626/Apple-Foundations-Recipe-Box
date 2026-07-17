//
//  BrowseView.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 16/7/2026.
//

import SwiftUI

struct BrowseView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var recipeData = myRecipeData
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                
                
                ForEach(recipeData.recipes) {
                    recipe in
                    
                    VStack(spacing: 8) {
                        VStack(spacing: 12) {
                           
                            
                            Image(systemName: "photo")
                                .font(.system(size: 60))
                                .foregroundColor(.gray)

                            HStack {
                                Text(recipe.name)
                                    .font(.title2)
                                    .bold()
                                
                                Button("Action Button") {
                                    // Action will be added later
                                }
                                .buttonStyle(.borderedProminent)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 4)
                    }
                }
                
                ForEach(1...20, id: \.self) { number in
                    VStack(spacing: 8) {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.blue.opacity(0.2))
                            .frame(height: 120)
                            .overlay(
                                Image(systemName: "photo")
                                    .font(.largeTitle)
                                    .foregroundStyle(.blue.opacity(0.5))
                            )

                        Text("Photo \(number)")
                            .font(.caption)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    BrowseView()
}
