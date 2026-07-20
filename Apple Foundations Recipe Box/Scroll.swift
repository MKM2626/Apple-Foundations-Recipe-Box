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

    @Binding var recipeData: RecipeData

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {

                ForEach($recipeData.recipes) { $recipe in

                    GabrielRecipeCard(recipe: $recipe)
                }
            }
            .padding()
        }
    }
}

#Preview {
    @Previewable @State var recipeData = myRecipeData

       Scroll(recipeData: $recipeData)
}
