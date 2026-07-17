//
//  Scroll.swift
//  Apple Foundations Recipe Box
//
//  Created by Michael Miller on 17/7/2026.
//

import SwiftUI

struct Scroll: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    let recipeData: RecipeData

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {

                ForEach(recipeData.recipes) { recipe in

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
                                    // Action
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
            }
            .padding()
        }
    }
}

#Preview {
    Scroll(recipeData: myRecipeData)
}
